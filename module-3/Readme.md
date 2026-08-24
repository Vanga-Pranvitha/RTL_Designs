# 🔍 Module 3: Combinational and Sequential Logic Optimization

## 🎯 Objectives

This module focuses on understanding how digital circuits can be optimized during synthesis while preserving their intended functionality.

The main objectives are:

- To understand the purpose of logic optimization in digital design.
- To explore optimization techniques for both combinational and sequential circuits.
- To synthesize Verilog RTL designs using Yosys.
- To observe technology mapping using the SKY130 standard-cell library.
- To simulate selected designs using Icarus Verilog.
- To inspect simulation waveforms using GTKWave.
- To analyze how synthesis removes redundant logic and generates optimized gate-level implementations.

---

## 🛠️ Tools and Technologies

| Tool / Technology | Purpose |
|---|---|
| **Verilog HDL** | Hardware description |
| **Yosys** | RTL synthesis and optimization |
| **Icarus Verilog** | Verilog simulation |
| **GTKWave** | Waveform visualization |
| **SKY130** | Standard-cell technology library |
| **Ubuntu Linux** | Development environment |

---

# 📚 Table of Contents

1. [Introduction to Logic Optimization](#1-introduction-to-logic-optimization)
2. [Sequential Logic Optimization](#2-sequential-logic-optimization)
3. [Two-Input AND Gate Synthesis](#3-two-input-and-gate-synthesis)
4. [Two-Input OR Gate Synthesis](#4-two-input-or-gate-synthesis)
5. [Three-Input AND Gate Synthesis](#5-three-input-and-gate-synthesis)
6. [D Flip-Flop Constant Propagation](#6-d-flip-flop-constant-propagation)
7. [Simulation of dff_const1](#7-simulation-of-dff_const1)
8. [Simulation of dff_const2](#8-simulation-of-dff_const2)
9. [D Flip-Flop Synthesis – dff_const1](#9-d-flip-flop-synthesis--dff_const1)
10. [Sequential Constant Optimization – dff_const2](#10-sequential-constant-optimization--dff_const2)
11. [D Flip-Flop Constraint Experiment](#11-d-flip-flop-constraint-experiment)
12. [Synthesized D Flip-Flop](#12-synthesized-d-flip-flop)
13. [Counter Logic Optimization](#13-counter-logic-optimization)
14. [Counter Optimization Result](#14-counter-optimization-result)
15. [Optimized Counter Implementation](#15-optimized-counter-implementation)
16. [Optimized Counter Netlist](#16-optimized-counter-netlist)
17. [Overall Result](#-overall-result)
18. [Conclusion](#-conclusion)

---

# 1. Introduction to Logic Optimization

Logic optimization is an important stage in digital circuit design. The purpose is to simplify the hardware implementation while maintaining the required functionality.

During synthesis, the design tool can identify redundant expressions, constant signals, unused logic, and unnecessary hardware. Removing or simplifying these elements can reduce the overall circuit complexity and potentially improve area, power consumption, and timing performance.

In this module, different examples are implemented to observe how combinational and sequential circuits are simplified using Yosys and the SKY130 standard-cell library.

<img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/e307a6b8-09d7-40fa-be16-755a9e0637d5" />


### Result

The basic concept of logic optimization was examined, with particular attention to how synthesis tools can simplify a design when constant values or redundant logic are present.

---

# 2. Sequential Logic Optimization

Sequential optimization deals with circuits that contain memory elements such as flip-flops and registers.

Unlike purely combinational logic, sequential circuits depend not only on the current input values but also on the previous state of the circuit. During synthesis, optimization techniques can identify registers or states that do not contribute meaningful functionality and simplify the resulting hardware.

Examples such as sequential constant propagation and optimization of unnecessary sequential elements are explored in this experiment.

<img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/63459bd9-d036-45d1-862f-cde24b34dee0" />


### Result

The experiment provided an understanding of how sequential logic can be simplified without altering the intended behavior of the circuit.

---

# 3. Two-Input AND Gate Synthesis

A simple two-input AND gate is implemented in Verilog and synthesized using Yosys.

## Verilog Code

```verilog
module opt_check (
    input a,
    input b,
    output y
);

assign y = a & b;

endmodule

### Yosys Commands

```bash
yosys

read_verilog opt_check.v
synth -top opt_check
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show
```

<img width="1366" height="655" alt="VirtualBox_vsdworkshop_24_08_2026_18_00_16" src="https://github.com/user-attachments/assets/9089120c-0bdb-4ad5-b130-1b7bd1d841a9" />


### Result

The RTL design was synthesized successfully, and the resulting implementation was mapped to the corresponding two-input AND logic in the target standard-cell library.

---

# 4. Two-Input OR Gate Synthesis

The next experiment implements a two-input OR gate and processes the design through the same synthesis flow.

### Verilog Code

```verilog
module opt_check2 (
    input a,
    input b,
    output y
);

assign y = a | b;

endmodule
```

### Yosys Commands

```bash
yosys

read_verilog opt_check2.v
synth -top opt_check2
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show
```

<img width="1366" height="655" alt="VirtualBox_vsdworkshop_24_08_2026_18_02_09" src="https://github.com/user-attachments/assets/bf52912d-5df8-40ee-93a9-c58fef625ad3" />


### Result

The OR gate was synthesized successfully, and the design was mapped to the appropriate implementation from the selected technology library.

---

# 5. Three-Input AND Gate Synthesis

This experiment extends the combinational logic example by implementing an AND operation with three input signals.

### Verilog Code

```verilog
module opt_check3 (
    input a,
    input b,
    input c,
    output y
);

assign y = a & b & c;

endmodule
```

### Yosys Commands

```bash
yosys

read_verilog opt_check3.v
synth -top opt_check3
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib
show
```

<img width="1366" height="655" alt="VirtualBox_vsdworkshop_24_08_2026_18_05_21" src="https://github.com/user-attachments/assets/6ddfe9af-fa28-473a-b282-7d5d2b37da16" />


### Result

The three-input AND circuit was synthesized successfully and mapped to the corresponding logic implementation supported by the target library.

---

# 6. D Flip-Flop Constant Propagation

This experiment examines how constant assignments in sequential logic can affect the synthesized hardware.

Two D flip-flop designs are considered. In the first circuit, the output changes according to the reset condition. In the second circuit, both possible conditions assign the same value to the output.

This allows the synthesis process to identify cases where sequential logic can potentially be simplified through constant propagation.

### dff_const1.v

```verilog
module dff_const1(
    input clk,
    input reset,
    output reg q
);

always @(posedge clk, posedge reset)
begin
    if (reset)
        q <= 1'b0;
    else
        q <= 1'b1;
end

endmodule
```

### dff_const2.v

```verilog
module dff_const2(
    input clk,
    input reset,
    output reg q
);

always @(posedge clk, posedge reset)
begin
    if (reset)
        q <= 1'b1;
    else
        q <= 1'b1;
end

endmodule
```

### File Creation Commands

```bash
vim dff_const1.v
vim dff_const2.v
```
<img width="1366" height="655" alt="image" src="https://github.com/user-attachments/assets/eab33e61-4472-498a-9e3e-faea6e70b226" />


### Observation

The two circuits demonstrate the difference between a state-dependent output and an output that can be resolved to a constant value.

---

# 7. Simulation of dff_const1

The `dff_const1` circuit is simulated to observe the response of the output to reset and clock transitions.

When reset is asserted, the output is cleared. Once reset is inactive, the output changes on the appropriate clock event.

### Verilog Code

```verilog
module dff_const1(
    input clk,
    input reset,
    output reg q
);

always @(posedge clk, posedge reset)
begin
    if (reset)
        q <= 1'b0;
    else
        q <= 1'b1;
end

endmodule
```

### Simulation Commands

```bash
iverilog -o dff_const1.out dff_const1.v tb_dff_const1.v

gtkwave tb_dff_const1.vcd
```

<img width="1366" height="655" alt="image" src="https://github.com/user-attachments/assets/3899f188-83cf-4ee9-9885-67d93bbf5354" />


### Result

The waveform verifies the expected response of the flip-flop to the applied reset and clock signals.

---

# 8. Simulation of dff_const2

The second D flip-flop configuration is simulated to examine its output behavior.

Since both branches of the conditional statement assign the same logical value, the output is driven toward the same state regardless of the reset condition.

### Verilog Code

```verilog
module dff_const2(
    input clk,
    input reset,
    output reg q
);

always @(posedge clk, posedge reset)
begin
    if (reset)
        q <= 1'b1;
    else
        q <= 1'b1;
end

endmodule
```

### Simulation Commands

```bash
iverilog -o dff_const2.out dff_const2.v tb_dff_const2_.v

gtkwave tb_dff_const2_.vcd
```

<img width="1366" height="655" alt="image" src="https://github.com/user-attachments/assets/19b06845-43ba-4f14-8bff-bfe54999119e" />


### Result

The simulation confirms that both possible reset conditions result in the same output value.

---

# 9. D Flip-Flop Synthesis – dff_const1

The `dff_const1` design is synthesized to examine the sequential hardware generated from the Verilog description.

### Yosys Commands

```bash
yosys

read_liberty -lib sky130_fd_sc_hd__tt_025C_1v80.lib

read_verilog dff_const1.v

synth -top dff_const1

abc -liberty sky130_fd_sc_hd__tt_025C_1v80.lib

show
```

<img width="1366" height="655" alt="WhatsApp Image 2026-08-24 at 11 32 12 PM" src="https://github.com/user-attachments/assets/2735abf8-7050-438e-9148-2ffb7affc83c" />



### Result

The generated circuit represents the sequential hardware required to implement the functionality described in `dff_const1`.

---

# 10. Sequential Constant Optimization – dff_const2

The `dff_const2` circuit is synthesized to observe how the tool handles a design in which every conditional path assigns the same value.

Because the final output does not depend on which branch is selected, the synthesis process can identify redundant sequential behavior.

### Yosys Commands

```bash
yosys

read_liberty -lib sky130_fd_sc_hd__tt_025C_1v80.lib

read_verilog dff_const2.v

synth -top dff_const2

abc -liberty sky130_fd_sc_hd__tt_025C_1v80.lib

show
```

<img width="1366" height="655" alt="WhatsApp Image 2026-08-24 at 11 33 13 PM" src="https://github.com/user-attachments/assets/1d304c00-5b8f-4a47-bb51-b551dbdeaf01" />



### Result

The synthesis result illustrates how constant propagation can reduce unnecessary logic when all relevant conditions lead to the same output state.

---

# 11. D Flip-Flop Constraint Experiment

A third D flip-flop example is simulated to study its behavior when the reset condition is evaluated within a clock-triggered process.

### Verilog Code

```verilog
module dff_const3(
    input clk,
    input reset,
    output reg q
);

always @(posedge clk)
begin
    if (reset)
        q <= 1'b0;
    else
        q <= 1'b1;
end

endmodule
```

### Simulation Commands

```bash
iverilog -o dff_const3.out dff_const3.v dff_const3_tb.v

gtkwave dff_const3.vcd
```

<img width="1366" height="655" alt="image" src="https://github.com/user-attachments/assets/2258bff8-46c8-4104-a82a-d4a409a90217" />


### Result

The waveform demonstrates the response of the flip-flop as the reset condition and clock transitions are applied during simulation.

---

# 12. Synthesized D Flip-Flop

The `dff_const3` circuit is synthesized using Yosys to generate the corresponding hardware representation.

### Yosys Commands

```bash
yosys

read_verilog dff_const3.v

synth -top dff_const3

show
```

<img width="1366" height="655" alt="image" src="https://github.com/user-attachments/assets/5de77f25-3fc0-4a29-ae83-f3b4c41b88a3" />



### Result

The synthesis process generated a circuit representation corresponding to the sequential behavior described by the RTL design.

---

# 13. Counter Logic Optimization

This experiment demonstrates how synthesis can remove internal hardware that does not contribute to the observable output.

The design contains a three-bit counter, while only the least significant bit is connected to the output.

### Verilog Code

```verilog
module counter_opt(
    input clk,
    input reset,
    output q
);

reg [2:0] count;

assign q = count[0];

always @(posedge clk, posedge reset)
begin
    if (reset)
        count <= 3'b000;
    else
        count <= count + 1;
end

endmodule
```

### Yosys Commands

```bash
yosys

read_verilog counter_opt.v

synth -top counter_opt

show
```

### Observation

Although the RTL description defines a three-bit counter, only `count[0]` is required at the output. This allows the synthesis process to identify internal logic that does not influence the externally visible behavior.

---

# 14. Counter Optimization Result

The synthesized counter is examined to observe how the original circuit is simplified during optimization.

### Yosys Commands

```bash
yosys

read_verilog counter_opt.v

synth -top counter_opt

show
```



### Result

The optimized circuit retains the hardware required to generate the output while removing logic that does not affect the final observable behavior.

---

# 15. Optimized Counter Implementation

After synthesis, the optimized design can be exported as a Verilog netlist for further inspection.

### Commands

```bash
write_verilog -noattr counter_opt_net.v

gvim counter_opt_net.v
```

<img width="1366" height="655" alt="image" src="https://github.com/user-attachments/assets/5d6b51f0-f8fd-4bf9-9d85-7d0e39a9df22" />


### Result

The resulting implementation contains the sequential and combinational elements necessary to preserve the required circuit functionality.

---

# 16. Optimized Counter Netlist

The generated Verilog netlist is inspected to understand the final hardware representation after optimization.

### Commands

```bash
write_verilog -noattr counter_opt_net.v

gvim counter_opt_net.v
```


### Result

The generated netlist provides a direct representation of the optimized hardware produced by the synthesis process.

---

# 🎯 Overall Result

The experiments in this module demonstrated the optimization of both combinational and sequential Verilog circuits.

Basic logic gates were synthesized and mapped using the SKY130 technology library. The D flip-flop examples demonstrated the effect of constant propagation in sequential designs, while the counter experiment showed how synthesis can remove internal hardware that has no influence on the required output.

Icarus Verilog and GTKWave were used to observe and verify circuit behavior, while Yosys was used to perform synthesis and inspect the resulting optimized hardware.

---

# 📝 Conclusion

This module provided practical exposure to RTL optimization and the digital synthesis workflow using open-source tools.

Through combinational logic synthesis, sequential constant propagation, and counter optimization, the experiments demonstrated how a synthesis tool can simplify a design by recognizing constant values, redundant operations, and unused logic.

The complete workflow included RTL design using Verilog, functional simulation, waveform verification, synthesis, technology mapping, and examination of the optimized circuit and netlist.

Overall, the module demonstrated how optimization at the RTL and synthesis stages can reduce unnecessary hardware while preserving the intended functionality of the design.

---

## 👤 Author

**Pranvitha Vanga**  
B.Tech – Electronics & Communication Engineering  
Anurag University
