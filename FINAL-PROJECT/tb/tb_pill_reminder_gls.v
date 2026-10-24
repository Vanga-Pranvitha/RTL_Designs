`timescale 1ns/1ps
module tb_pill_reminder;

    parameter INT0 = 4;
    parameter INT1 = 6;
    parameter INT2 = 8;
    parameter INT3 = 12;
    parameter WIN  = 3;      // must be >= 2

    localparam S_WAIT   = 2'b00;
    localparam S_ALERT  = 2'b01;
    localparam S_MISSED = 2'b10;

    reg        clk   = 1'b0;
    reg        rst_n = 1'b0;
    reg        tick  = 1'b0;
    reg        ack   = 1'b0;
    reg  [1:0] sel   = 2'b00;
    wire       led, buzzer, missed;

    pill_reminder dut (
        .clk(clk), .rst_n(rst_n), .tick_1min(tick), .ack_btn(ack),
        .interval_sel(sel),
        .led(led), .buzzer(buzzer), .missed_dose_flag(missed)
    );

    always #5 clk = ~clk;

    integer errors = 0;
    integer checks = 0;
    integer ack_events = 0;
    integer i, k, n, c;
    reg saw0, saw1;

    task check(input cond, input [8*60-1:0] msg);
        begin
            checks = checks + 1;
            if (!cond) begin
                errors = errors + 1;
                $display("FAIL @%0t : %0s", $time, msg);
            end
        end
    endtask

    function integer n_of(input [1:0] s);
        begin
            case (s)
                2'd0: n_of = INT0;
                2'd1: n_of = INT1;
                2'd2: n_of = INT2;
                default: n_of = INT3;
            endcase
        end
    endfunction

    task do_tick;
        begin
            tick = 1'b1; @(negedge clk);
            tick = 1'b0; @(negedge clk);
        end
    endtask

    task do_ticks(input integer cnt);
        integer j;
        begin
            for (j = 0; j < cnt; j = j + 1) do_tick;
        end
    endtask

    task press_ack(input integer cycles);
        begin
            ack = 1'b1;
            repeat (cycles) @(negedge clk);
            ack = 1'b0;
            repeat (5) @(negedge clk);
        end
    endtask

    task do_reset(input [1:0] s);
        begin
            sel   = s;
            rst_n = 1'b0;
            repeat (3) @(negedge clk);
            rst_n = 1'b1;
            @(negedge clk);
        end
    endtask

    task go_alert(input [1:0] s);
        begin
            do_reset(s);
            do_ticks(n_of(s));
        end
    endtask

    task go_missed(input [1:0] s);
        begin
            go_alert(s);
            do_ticks(WIN);
        end
    endtask

    always @(posedge clk)
        if (rst_n && dut.ack_pulse) ack_events = ack_events + 1;

    always @(posedge clk)
        if (rst_n && dut.interval_cnt == 10'd0) begin
            errors = errors + 1;
            $display("FAIL @%0t : interval counter underflow/zero", $time);
        end

    initial begin
        #50_000_000;
        $display("FAIL : watchdog timeout");
        $finish;
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_pill_reminder);

        @(negedge clk);

        // T1: reset behaviour
        do_reset(2'd0);
        check(dut.state == S_WAIT,        "T1 state WAIT after reset");
        check(dut.interval_cnt == INT0,   "T1 counter loaded after reset");
        check(!led && !buzzer && !missed, "T1 outputs inactive after reset");

        // T2: every interval fires on exactly the Nth tick
        for (i = 0; i < 4; i = i + 1) begin
            do_reset(i[1:0]);
            n = n_of(i[1:0]);
            do_ticks(n - 1);
            check(dut.state == S_WAIT,    "T2 still WAIT at N-1 ticks");
            check(dut.interval_cnt == 1,  "T2 counter at 1 after N-1 ticks");
            do_tick;
            check(dut.state == S_ALERT,   "T2 ALERT at exactly N ticks");
            check(led == 1'b1,            "T2 LED on in ALERT");
        end

        // T3: ack in ALERT returns to WAIT
        go_alert(2'd0);
        saw0 = 0; saw1 = 0;
        for (k = 0; k < 16; k = k + 1) begin
            @(negedge clk);
            if (buzzer) saw1 = 1; else saw0 = 1;
        end
        check(saw0 && saw1,               "T3 buzzer beeps in ALERT");
        press_ack(1);
        check(dut.state == S_WAIT,        "T3 ack in ALERT -> WAIT");
        check(dut.interval_cnt == INT0,   "T3 counter reloaded");
        check(!led && !buzzer && !missed, "T3 outputs off after ack");

        // T4a: ack after first window tick
        go_alert(2'd0);
        do_tick;
        check(dut.state == S_ALERT,       "T4a still ALERT after 1 window tick");
        press_ack(1);
        check(dut.state == S_WAIT,        "T4a ack -> WAIT");
        check(!missed,                    "T4a no missed flag");

        // T4b: ack on last window tick
        go_alert(2'd0);
        do_ticks(WIN - 1);
        check(dut.state == S_ALERT,       "T4b ALERT with 1 window tick left");
        press_ack(1);
        check(dut.state == S_WAIT,        "T4b ack at last tick -> WAIT");
        check(!missed,                    "T4b no missed flag");

        // T5: no ack -> MISSED exactly at expiry
        go_alert(2'd0);
        do_ticks(WIN - 1);
        check(dut.state == S_ALERT,       "T5 ALERT before expiry");
        do_tick;
        check(dut.state == S_MISSED,      "T5 MISSED exactly at expiry");
        check(missed == 1'b1,             "T5 missed flag set");
        check(buzzer == 1'b0,             "T5 buzzer off in MISSED");
        saw0 = 0; saw1 = 0;
        for (k = 0; k < 16; k = k + 1) begin
            @(negedge clk);
            if (led) saw1 = 1; else saw0 = 1;
        end
        check(saw0 && saw1,               "T5 LED blinks in MISSED");

        // T6: ack in MISSED clears flag and restarts countdown
        press_ack(1);
        check(dut.state == S_WAIT,        "T6 ack in MISSED -> WAIT");
        check(missed == 1'b0,             "T6 flag cleared");
        check(dut.interval_cnt == INT0,   "T6 counter reloaded");
        check(!led,                       "T6 LED off");

        // T7: ack in WAIT is ignored
        do_reset(2'd0);
        do_ticks(2);
        press_ack(3);
        check(dut.state == S_WAIT,        "T7 ack in WAIT ignored (state)");
        check(dut.interval_cnt == INT0-2, "T7 ack in WAIT ignored (counter)");

        // T8: ack simultaneous with expiry tick -> ack wins
        go_alert(2'd0);
        do_ticks(WIN - 1);
        ack = 1'b1;
        @(negedge clk);
        @(negedge clk);
        tick = 1'b1;
        @(negedge clk);
        tick = 1'b0;
        ack  = 1'b0;
        repeat (5) @(negedge clk);
        check(dut.state == S_WAIT,        "T8 ack beats simultaneous expiry");
        check(!missed,                    "T8 no missed flag");
        check(dut.interval_cnt == INT0,   "T8 counter reloaded");

        // T9: interval_sel change mid-countdown
        do_reset(2'd0);
        do_ticks(2);
        sel = 2'd1;
        do_ticks(INT0 - 2);
        check(dut.state == S_ALERT,       "T9 old count continues, ALERT at INT0");
        press_ack(1);
        check(dut.state == S_WAIT,        "T9 ack -> WAIT");
        check(dut.interval_cnt == INT1,   "T9 new interval used after reload");

        // T10: ack held 100 cycles gives exactly one event
        go_alert(2'd0);
        ack_events = 0;
        press_ack(100);
        check(ack_events == 1,            "T10 held ack = one event");
        check(dut.state == S_WAIT,        "T10 state WAIT");

        // T11: bouncing ack
        go_alert(2'd0);
        ack = 1'b1; @(negedge clk);
        ack = 1'b0; @(negedge clk);
        ack = 1'b1; @(negedge clk);
        ack = 1'b0; repeat (2) @(negedge clk);
        ack = 1'b1; repeat (3) @(negedge clk);
        ack = 1'b0; repeat (5) @(negedge clk);
        check(dut.state == S_WAIT,        "T11 bounce -> WAIT");
        check(dut.interval_cnt == INT0,   "T11 counter intact after bounce");

        // T12: reset mid-ALERT and mid-MISSED
        go_alert(2'd1);
        do_reset(2'd1);
        check(dut.state == S_WAIT,        "T12a reset in ALERT -> WAIT");
        check(dut.interval_cnt == INT1,   "T12a counter reloaded");
        check(!led && !buzzer && !missed, "T12a outputs off");
        go_missed(2'd1);
        check(dut.state == S_MISSED,      "T12b reached MISSED");
        do_reset(2'd2);
        check(dut.state == S_WAIT,        "T12b reset in MISSED -> WAIT");
        check(dut.interval_cnt == INT2,   "T12b counter uses new sel");
        check(!led && !buzzer && !missed, "T12b outputs off");

        // T13: no tick -> no change
        do_reset(2'd0);
        do_tick;
        c = dut.interval_cnt;
        repeat (30) @(negedge clk);
        check(dut.interval_cnt == c,      "T13 counter stable without tick");
        check(dut.state == S_WAIT,        "T13 state stable without tick");

        // T14: many dose cycles
        do_reset(2'd0);
        for (k = 0; k < 5; k = k + 1) begin
            do_ticks(INT0);
            check(dut.state == S_ALERT,   "T14a ALERT each cycle");
            do_ticks(WIN);
            check(dut.state == S_MISSED,  "T14a MISSED each cycle");
            press_ack(1);
            check(dut.state == S_WAIT,    "T14a WAIT after ack");
            check(dut.interval_cnt == INT0, "T14a counter reloaded");
        end
        for (k = 0; k < 5; k = k + 1) begin
            do_ticks(INT0);
            check(dut.state == S_ALERT,   "T14b ALERT each cycle");
            press_ack(1);
            check(dut.state == S_WAIT,    "T14b WAIT after ack");
            check(dut.interval_cnt == INT0, "T14b counter reloaded");
        end


        $display("----------------------------------------");
        $display("Checks run: %0d   Errors: %0d", checks, errors);
        if (errors == 0) $display("TEST PASSED");
        else             $display("TEST FAILED");
        $display("----------------------------------------");
        $finish;
    end

endmodule`timescale 1ns/1ps
