# Module 4 – GLS,blocking vs non-blocking and Synthesis Simulation mismatch

## Overview

This document covers Gate-Level Simulation (GLS), the importance of correct sensitivity lists, blocking vs. non-blocking assignments, and a lab demonstrating a common blocking-assignment caveat.

---

# 1. Gate-Level Simulation

Gate-Level Simulation (GLS) is a verification technique in which the synthesized gate-level netlist is simulated instead of the original RTL description.

At RTL level, the design is described using behavioral or structural Verilog. During synthesis, this description is converted into gates and other standard-cell elements. GLS helps verify whether the synthesized implementation still behaves as expected.

### Objectives of GLS

Gate-Level Simulation is useful for:

- Checking whether synthesis preserves the intended functionality.
- Verifying the synthesized gate-level netlist.
- Identifying timing-related problems when timing information is available.
- Checking the behavior of standard-cell implementations.
- Detecting issues that may not be visible during RTL simulation.
- Increasing confidence before moving to later stages of the VLSI design flow.

### Types of Gate-Level Simulation

#### Functional GLS

Functional GLS mainly checks the logical behavior of the synthesized netlist. Timing delays may be ignored or represented using simplified values.

#### Timing GLS

Timing GLS includes timing information, generally through SDF annotation. It can be used to observe delays and identify timing violations such as setup and hold problems.

### Position of GLS in the Design Flow

A simplified design flow is:

```text
RTL Design
    ↓
RTL Simulation
    ↓
Synthesis
    ↓
Gate-Level Netlist
    ↓
Gate-Level Simulation
    ↓
Physical Design
```

---

# 2. Synthesis-Simulation Mismatch

A synthesis-simulation mismatch occurs when the behavior observed during RTL simulation differs from the behavior of the synthesized circuit.

Such differences can arise from coding mistakes, incomplete descriptions, or constructs that are interpreted differently by simulation and synthesis tools.

### Common Causes

Some common causes include:

- Incomplete sensitivity lists.
- Incorrect use of blocking and non-blocking assignments.
- Incomplete conditional statements.
- Unintended latch inference.
- Use of constructs that are not synthesizable.
- Incorrect assumptions about simulation event ordering.
- Ambiguous RTL coding.
- Differences between simulation semantics and synthesized hardware behavior.

### How to Avoid Mismatches

Good RTL coding practices help reduce these problems:

1. Use synthesizable Verilog constructs.
2. Use complete sensitivity lists or `always @(*)` for combinational logic.
3. Use blocking assignments for combinational logic.
4. Use non-blocking assignments for sequential logic.
5. Ensure all outputs of combinational blocks are assigned for every possible condition.
6. Check synthesis warnings carefully.
7. Compare RTL simulation and gate-level simulation results.

---

# 3. Blocking and Non-Blocking Assignments

Verilog provides two important procedural assignment operators:

- Blocking assignment: `=`
- Non-blocking assignment: `<=`

The choice between them is important because they have different simulation behaviors.

---

## 3.1 Blocking Assignment

A blocking assignment uses the `=` operator.

```verilog
=
```

The assignment takes effect immediately when the statement is executed. Therefore, statements inside the same procedural block are evaluated in sequence.

### Example

```verilog
always @(*) begin
  y = a & b;
end
```

Here, the output `y` is updated immediately after the expression `a & b` is evaluated.

### Typical Use

Blocking assignments are generally preferred for:

- Combinational logic.
- Temporary variables.
- Intermediate calculations inside combinational blocks.

---

## 3.2 Non-Blocking Assignment

A non-blocking assignment uses the `<=` operator.

```verilog
<=
```

The right-hand side is evaluated when the statement executes, but the actual update is scheduled for the end of the current simulation time step.

### Example

```verilog
always @(posedge clk) begin
  q <= d;
end
```

This style is commonly used to describe sequential logic such as registers and flip-flops.

### Typical Use

Non-blocking assignments are generally preferred for:

- Sequential logic.
- Flip-flops.
- Registers.
- Clocked `always` blocks.

---

## 3.3 Comparison

| Feature | Blocking Assignment (`=`) | Non-Blocking Assignment (`<=`) |
|---|---|---|
| Execution | Immediate | Scheduled |
| Typical usage | Combinational logic | Sequential logic |
| Update behavior | Follows statement order | Updates at the end of the time step |
| Common block | `always @(*)` | `always @(posedge clk)` |
| Hardware commonly inferred | Combinational logic | Registers / flip-flops |
| Main advantage | Useful for step-by-step calculations | Models simultaneous register updates |

### General Coding Rule

```text
Combinational Logic → Blocking (=)
Sequential Logic    → Non-Blocking (<=)
```

---

# 4. Experiments

The following experiments demonstrate the practical concepts discussed above.

---

# Experiment 1: Ternary Operator MUX

## Objective

To implement a simple 2:1 multiplexer using the Verilog conditional or ternary operator.

## Verilog Code

```verilog
module ternary_operator_mux (input i0, input i1, input sel, output y);
  assign y = sel ? i1 : i0;
endmodule
```

## Working

The multiplexer selects one of the two input signals based on the select signal.

- When `sel = 0`, `i0` is connected to `y`.
- When `sel = 1`, `i1` is connected to `y`.

The Boolean relationship can be represented as:

```text
y = sel ? i1 : i0
```

This is a compact way of describing a 2:1 multiplexer.

## Result

The 2:1 multiplexer was successfully described using the ternary operator.

<img width="1920" height="1060" alt="image" src="https://github.com/user-attachments/assets/0aa6bdbc-f51e-4495-98db-9c4d4bff55da" />

---

# Experiment 2: Synthesis Using Yosys

## Objective

To synthesize the 2:1 multiplexer RTL design using Yosys and observe its synthesized representation.

## Design Used

The RTL module from Experiment 1 is used as the synthesis input.

```verilog
module ternary_operator_mux (input i0, input i1, input sel, output y);
  assign y = sel ? i1 : i0;
endmodule
```

## Yosys Synthesis

The RTL design is processed through the Yosys synthesis flow. During synthesis, the behavioral RTL description is transformed into a gate-level representation.

A typical synthesis flow consists of:

```text
Read RTL
   ↓
Elaborate Design
   ↓
Process Logic
   ↓
Optimize
   ↓
Map to Gates / Standard Cells
   ↓
Generate Netlist
```

## Observation

The synthesized design represents the same logical function as the original RTL multiplexer.

## Result

The multiplexer was successfully synthesized using Yosys.

<img width="1920" height="1060" alt="image" src="https://github.com/user-attachments/assets/da822a2a-bc3e-4731-b682-3e0e20b22d5e" />

---

# Experiment 3: Gate-Level Simulation of MUX

## Objective

To perform Gate-Level Simulation of the synthesized multiplexer and verify its functionality.

After synthesis, the generated gate-level representation can be simulated using the required standard-cell library files and the testbench.

## Simulation Command

```bash
iverilog /path/to/primitives.v /path/to/sky130_fd_sc_hd.v ternary_operator_mux.v testbench.v
```

The paths should be modified according to the location of the files in the working environment.

## Purpose

The simulation checks whether the synthesized implementation produces the expected output for different combinations of:

- `i0`
- `i1`
- `sel`

## Expected Behavior

| `sel` | Output `y` |
|---|---|
| `0` | `i0` |
| `1` | `i1` |

## Result

The synthesized multiplexer was simulated at gate level and its logical operation was verified.

<img width="1920" height="1060" alt="image" src="https://github.com/user-attachments/assets/d32a58e8-1d83-46f3-87d3-84209a26e929" />

---

# Experiment 4: Incorrect MUX Coding Example

## Objective

To understand how an incomplete sensitivity list and inappropriate assignment type can affect combinational RTL.

## Verilog Code

The following example intentionally contains coding issues:

```verilog
module bad_mux (input i0, input i1, input sel, output reg y);
  always @ (sel) begin
    if (sel)
      y <= i1;
    else 
      y <= i0;
  end
endmodule
```

## Problems in the Code

### 1. Incomplete Sensitivity List

The sensitivity list contains only:

```verilog
sel
```

However, the output also depends on:

```verilog
i0
i1
```

Therefore, changes in `i0` or `i1` may not trigger the `always` block during simulation.

A better approach for combinational logic is:

```verilog
always @(*)
```

This automatically includes the signals read by the block.

### 2. Non-Blocking Assignment in Combinational Logic

The example uses:

```verilog
y <= i1;
```

and

```verilog
y <= i0;
```

For combinational logic, blocking assignment is generally preferred:

```verilog
y = i1;
```

and

```verilog
y = i0;
```

## Corrected Version

```verilog
always @(*) begin
  if (sel)
    y = i1;
  else
    y = i0;
end
```

## Result

The experiment demonstrates how coding style can influence simulation behavior and why complete combinational descriptions are important.

<img width="1920" height="1060" alt="image" src="https://github.com/user-attachments/assets/f11d2c20-6684-4937-8211-386625bcd95a" />


---

# Experiment 5: GLS of Incorrect MUX

## Objective

To perform Gate-Level Simulation on the incorrectly coded MUX and observe the effects of the coding issues.

The `bad_mux` module from the previous experiment is used for the simulation.

## Expected Observation

Because the original RTL contains an incomplete sensitivity list and uses a non-blocking assignment in a combinational block, simulation behavior may not always correspond to the intended combinational operation.

Warnings or unexpected simulation behavior may be observed depending on the simulator and synthesis flow.

## Important Point

This experiment demonstrates why RTL code should be written carefully before synthesis.

A design that appears to work for some input transitions may still contain coding problems that become visible during more complete verification.

## Result

The experiment highlights the importance of proper sensitivity lists and appropriate assignment types when writing combinational RTL.

<img width="1920" height="1060" alt="image" src="https://github.com/user-attachments/assets/7256e123-ccfe-4efa-bcda-4c17bfb5ced8" />

---

# Experiment 6: Blocking Assignment Example

## Objective

To understand how the order of blocking assignments can affect the values used by subsequent statements in the same procedural block.

## Verilog Code

The following module demonstrates the issue:

```verilog
module blocking_caveat (input a, input b, input c, output reg d);
  reg x;
  always @ (*) begin
    d = x & c;
    x = a | b;
  end
endmodule
```

## Explanation

The statements are executed sequentially because blocking assignments are being used.

The first statement:

```verilog
d = x & c;
```

uses the current value of `x`.

Only after this statement is executed does:

```verilog
x = a | b;
```

update `x`.

Therefore, `d` does not use the newly calculated value of `x` within that same execution of the block.

This illustrates why the order of blocking assignments matters in combinational logic.

## Corrected Order

The intermediate value should be calculated before it is used:

```verilog
always @ (*) begin
  x = a | b;
  d = x & c;
end
```

Now the newly calculated value of `x` is used when evaluating `d`.

## Result

The experiment demonstrates the importance of arranging blocking assignments in the correct logical order.

<img width="1920" height="1060" alt="image" src="https://github.com/user-attachments/assets/5ae12197-109b-4026-80fb-473b01b80e32" />

---

# Experiment 7: Synthesis of Blocking Assignment Module

## Objective

To synthesize the corrected blocking-assignment module and observe the synthesized result.

## Corrected Verilog Code

```verilog
module blocking_caveat (input a, input b, input c, output reg d);
  reg x;
  always @ (*) begin
    x = a | b;
    d = x & c;
  end
endmodule
```

## Logic Representation

The intermediate signal is:

```text
x = a OR b
```

The output is then:

```text
d = x AND c
```

Therefore, the overall logic can be expressed as:

```text
d = (a OR b) AND c
```

## Observation

After synthesis, the RTL is converted into equivalent combinational logic.

The experiment confirms that proper ordering of blocking assignments produces the intended combinational behavior.

## Result

The corrected module was successfully synthesized, demonstrating the importance of proper coding order in combinational RTL.

<img width="1920" height="1060" alt="image" src="https://github.com/user-attachments/assets/24671dda-3e8b-4467-ba89-5aba20b08c8f" />

---

# 5. Key Learnings

The experiments in this module provide practical understanding of the following concepts:

### Gate-Level Simulation

GLS is used to verify the synthesized gate-level implementation and helps identify issues that may not be obvious at the RTL level.

### Synthesis

Synthesis converts RTL descriptions into a hardware-oriented gate-level representation while attempting to preserve the intended functionality.

### Blocking Assignment

Blocking assignments use the `=` operator and are generally suitable for combinational logic.

### Non-Blocking Assignment

Non-blocking assignments use the `<=` operator and are generally preferred for sequential, clock-driven logic.

### Sensitivity Lists

Combinational blocks should respond whenever any signal used in the block changes. Using:

```verilog
always @(*)
```

is a convenient way to describe this behavior.

### Assignment Ordering

When blocking assignments are used, statements execute in order. Intermediate signals should therefore be calculated before they are used.

### Synthesis-Simulation Mismatch

Poor RTL coding practices can result in differences between simulation behavior and synthesized hardware. Careful RTL coding and verification help prevent such problems.

---

# 6. Conclusion

Module 4 provided practical exposure to Gate-Level Simulation, synthesis, and Verilog coding practices. The experiments demonstrated the transition from RTL to synthesized logic and showed how coding decisions can influence simulation and synthesis behavior.

The comparison between correct and incorrect MUX implementations highlighted the importance of complete sensitivity lists and suitable assignment types. The blocking-assignment experiment further demonstrated why the order of statements matters when describing combinational logic.

Overall, these experiments strengthen the understanding of RTL verification and provide a foundation for writing reliable and synthesizable Verilog designs.
