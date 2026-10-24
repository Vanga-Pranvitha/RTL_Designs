// Pill Reminder Timer Controller
// WAIT -> ALERT -> (ack) WAIT, or ALERT -> MISSED -> (ack) WAIT
// Reset is synchronous, active low.
module pill_reminder #(
    parameter INT_SEL0 = 240,   // 4 h  (minutes)
    parameter INT_SEL1 = 360,   // 6 h
    parameter INT_SEL2 = 480,   // 8 h
    parameter INT_SEL3 = 720,   // 12 h
    parameter WINDOW   = 30     // alert window (minutes)
) (
    input  wire       clk,
    input  wire       rst_n,
    input  wire       tick_1min,
    input  wire       ack_btn,
    input  wire [1:0] interval_sel,
    output wire       led,
    output wire       buzzer,
    output wire       missed_dose_flag
);

    localparam [1:0] S_WAIT   = 2'b00;
    localparam [1:0] S_ALERT  = 2'b01;
    localparam [1:0] S_MISSED = 2'b10;

    reg [1:0] state;
    reg [9:0] interval_cnt;
    reg [5:0] window_cnt;
    reg [2:0] blink_div;

    reg ack_s1, ack_s2, ack_prev;
    wire ack_pulse = ack_s2 & ~ack_prev;

    reg [9:0] interval_val;
    always @(*) begin
        case (interval_sel)
            2'b00:   interval_val = INT_SEL0;
            2'b01:   interval_val = INT_SEL1;
            2'b10:   interval_val = INT_SEL2;
            default: interval_val = INT_SEL3;
        endcase
    end

    always @(posedge clk) begin
        if (!rst_n) begin
            state        <= S_WAIT;
            interval_cnt <= interval_val;
            window_cnt   <= 6'd0;
            blink_div    <= 3'd0;
            ack_s1       <= 1'b0;
            ack_s2       <= 1'b0;
            ack_prev     <= 1'b0;
        end else begin
            ack_s1    <= ack_btn;
            ack_s2    <= ack_s1;
            ack_prev  <= ack_s2;
            blink_div <= blink_div + 3'd1;

            case (state)
                S_WAIT: begin
                    if (tick_1min) begin
                        if (interval_cnt == 10'd1) begin
                            state      <= S_ALERT;
                            window_cnt <= WINDOW;
                        end else begin
                            interval_cnt <= interval_cnt - 10'd1;
                        end
                    end
                end

                S_ALERT: begin
                    if (ack_pulse) begin
                        state        <= S_WAIT;
                        interval_cnt <= interval_val;
                    end else if (tick_1min) begin
                        if (window_cnt == 6'd1)
                            state <= S_MISSED;
                        else
                            window_cnt <= window_cnt - 6'd1;
                    end
                end

                S_MISSED: begin
                    if (ack_pulse) begin
                        state        <= S_WAIT;
                        interval_cnt <= interval_val;
                    end
                end

                default: begin
                    state        <= S_WAIT;
                    interval_cnt <= interval_val;
                end
            endcase
        end
    end

    assign led              = (state == S_ALERT) |
                              ((state == S_MISSED) & blink_div[2]);
    assign buzzer           = (state == S_ALERT) & blink_div[2];
    assign missed_dose_flag = (state == S_MISSED);

endmodule
