# 🔬 Module 4: Gate-Level Simulation and Verilog Assignment Behavior

## 📌 Introduction

This module explores two important aspects of digital design verification:

- **Gate-Level Simulation (GLS)**
- **Blocking and Non-Blocking Assignments in Verilog**

Gate-Level Simulation is used after synthesis to verify that the generated gate-level implementation continues to perform the intended function of the original RTL design. The synthesized netlist is simulated together with the appropriate standard-cell library models.

The module also investigates the behavioral difference between blocking (`=`) and non-blocking (`<=`) assignments. Their update mechanisms can significantly influence simulation results and therefore must be selected appropriately when describing combinational and sequential hardware. :contentReference[oaicite:0]{index=0}

---

## 🎯 Objectives

The objectives of this module are:

- To understand the difference between blocking and non-blocking assignments in Verilog.
- To observe their behavior through simulation.
- To understand the appropriate use of assignment types in combinational and sequential circuits.
- To study the purpose and workflow of Gate-Level Simulation.
- To synthesize an RTL design and generate a gate-level netlist.
- To perform simulation using the synthesized netlist and the SKY130 standard-cell library.
- To compare RTL-level behavior with gate-level behavior.
- To analyze simulation results using GTKWave.

---

## 🛠️ Tools and Technologies

| Tool / Technology | Purpose |
|---|---|
| **Verilog HDL** | Hardware description language |
| **Yosys** | RTL synthesis and netlist generation |
| **Icarus Verilog** | RTL and gate-level simulation |
| **GTKWave** | Waveform visualization |
| **SKY130** | Standard-cell technology library |
| **Ubuntu Linux** | Development environment |

---

# 📚 Table of Contents

1. Introduction to Gate-Level Simulation
2. Blocking vs Non-Blocking Assignments
3. Analysis of Blocking and Non-Blocking Behavior
4. RTL Simulation and Waveform Analysis
5. Synthesis and Netlist Generation
6. Gate-Level Simulation Using the Synthesized Netlist
7. Overall Result
8. Conclusion

---

# 1. Introduction to Gate-Level Simulation

## Overview

Gate-Level Simulation, commonly referred to as **GLS**, is performed after the RTL design has been synthesized.

During RTL simulation, the design is evaluated according to the behavioral Verilog description. After synthesis, however, the RTL is converted into a gate-level representation composed of logic cells from the selected technology library.

GLS uses this synthesized netlist together with standard-cell simulation models to verify that the synthesized hardware maintains the required functional behavior.

<img width="1357" height="742" alt="what is gls" src="https://github.com/user-attachments/assets/54ecddd1-9bb0-43bb-8e69-d3b6515ff368" />

<img width="1362" height="736" alt="image" src="https://github.com/user-attachments/assets/8f359545-bc86-4d29-9a9a-3189250cd014" />

---

## GLS Design Flow

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
Waveform Analysis
```

---

## Why Gate-Level Simulation is Important

Gate-Level Simulation can be used to:

- Verify the synthesized gate-level implementation.
- Confirm that the intended RTL functionality is preserved.
- Compare the behavior of RTL and synthesized logic.
- Simulate the design using standard-cell library models.
- Identify potential differences introduced during the synthesis process.
- Validate the design before progressing to later implementation stages.

### Result

The GLS workflow was studied to understand how an RTL design is transformed into a gate-level implementation and subsequently verified through simulation.

---

# 2. Blocking vs Non-Blocking Assignments

## Overview

Verilog provides two commonly used procedural assignment operators:

- **Blocking Assignment (`=`)**
- **Non-Blocking Assignment (`<=`)**

Although both operators assign values to signals, they behave differently during simulation.

A blocking assignment updates the target immediately when the statement is executed. A non-blocking assignment evaluates the right-hand side at the current simulation event and schedules the update of the target for the appropriate non-blocking update region.

Understanding this difference is essential for writing predictable and synthesizable RTL.

<img width="1327" height="706" alt="blocking and non blocking" src="https://github.com/user-attachments/assets/4aa33099-0430-457c-a8e2-994bbffc32d8" />
---

## Comparison Between Assignment Types

| Feature | Blocking (`=`) | Non-Blocking (`<=`) |
|---|---|---|
| **Update behavior** | Updates immediately | Update is scheduled |
| **Execution order** | Statements execute sequentially | Assignments are evaluated before scheduled updates occur |
| **Effect on later statements** | Later statements can observe the new value | Later statements can observe the previous value |
| **Typical application** | Combinational logic | Sequential logic |
| **Common procedural style** | `always_comb` or combinational `always` blocks | `always_ff` or clock-triggered `always` blocks |
| **Main purpose** | Immediate procedural evaluation | Modeling simultaneous register updates |

### Result

The comparison shows that the choice between `=` and `<=` directly affects simulation behavior and should be consistent with the type of hardware being modeled.

---

# 3. Analysis of Blocking and Non-Blocking Behavior

## Blocking Assignment

Blocking assignments use the `=` operator.

```verilog
variable = expression;
```

When this statement is executed, the assigned value becomes available immediately. Therefore, a subsequent statement in the same procedural flow can use the updated value.

Blocking assignments are commonly used when describing combinational behavior.

---

## Non-Blocking Assignment

Non-blocking assignments use the `<=` operator.

```verilog
variable <= expression;
```

The right-hand side is evaluated when the statement executes, but the update to the left-hand side is scheduled rather than applied immediately.

This behavior is useful when modeling sequential logic because multiple registers triggered by the same clock edge can update in a manner that reflects simultaneous state transitions.

---

## Key Observation

The differences between blocking and non-blocking assignments can be clearly observed through simulation.

By examining the resulting waveforms, it is possible to understand how assignment type affects signal propagation and the values observed by subsequent statements.

---

# 4. RTL Simulation and Waveform Analysis

RTL simulation is performed before synthesis to verify whether the Verilog description behaves according to the intended design.

A testbench applies different input combinations to the circuit, and the output is examined using GTKWave.

This section includes the simulation of a 2:1 multiplexer and an analysis of an incorrectly coded multiplexer.

---

## RTL Simulation of a 2:1 Multiplexer

A 2:1 multiplexer was implemented using the Verilog conditional operator.

The select signal determines which input is transferred to the output. RTL simulation was performed to verify the operation of the multiplexer for the applied input conditions.

### Simulation Commands

```bash
iverilog -o mux ternary_operator_mux.v tb_ternary_operator_mux.v

gtkwave ternary_operator_mux.vcd
```

### Output Waveform

<img width="1366" height="655" alt="VirtualBox_vsdworkshop_24_08_2026_20_55_29" src="https://github.com/user-attachments/assets/f02b32c9-ae48-447e-bb01-d72e47ec51a1" />


### Observation

The waveform confirmed the expected operation of the multiplexer as the select signal switched between the available input paths.

---

## Analysis of an Incorrect Multiplexer Design

An incorrectly coded multiplexer was also analyzed to observe the effect of incomplete signal assignments.

When an output is not assigned for every possible input condition inside a combinational procedural block, the simulator may retain the previous output value.

During synthesis, such incomplete assignment behavior can result in unintended latch inference rather than a purely combinational implementation.

### Simulation Commands

```bash
iverilog -o bad_mux bad_mux.v tb_bad_mux.v

gtkwave bad_mux.vcd
```

### Output Waveform

<img width="1366" height="655" alt="VirtualBox_vsdworkshop_24_08_2026_21_26_23" src="https://github.com/user-attachments/assets/10b596ef-b1b3-41d0-a46a-7b45f5e6f500" />


---

## Functional Verification

The correctly implemented multiplexer was also examined after synthesis to verify the resulting circuit representation.

<img width="1366" height="655" alt="VirtualBox_vsdworkshop_24_08_2026_21_09_42" src="https://github.com/user-attachments/assets/e5e63aa1-fec2-4cda-ad02-2c5bd56c5674" />


### Observation

The experiment demonstrates the importance of assigning outputs for all possible conditions when implementing combinational logic.

Incomplete procedural assignments can cause the synthesized hardware to differ from the intended combinational circuit.

---

# 5. Synthesis and Netlist Generation

## Synthesis of the Blocking Assignment Circuit

The blocking-assignment circuit was synthesized using Yosys to examine how the RTL description is converted into a hardware implementation.

During synthesis, the Verilog design is analyzed, optimized, and mapped to cells from the selected technology library.

### Yosys Commands

```bash
yosys

read_verilog blocking_caveat.v

synth -top blocking_caveat

abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib

show
```
<img width="1366" height="655" alt="VirtualBox_vsdworkshop_24_08_2026_21_46_12" src="https://github.com/user-attachments/assets/7cf6eb2e-61b8-4a6f-b136-7b1c351feace" />

### Result

The synthesis process generated a gate-level representation of the RTL design, allowing the circuit structure to be examined after technology mapping.

---
<img width="1366" height="655" alt="VirtualBox_vsdworkshop_24_08_2026_22_09_32" src="https://github.com/user-attachments/assets/6e10379f-582a-4af5-a473-45f24a932357" />

# 6. Gate-Level Simulation Using the Synthesized Netlist

After synthesis, the generated netlist can be used for Gate-Level Simulation.

Instead of simulating the original RTL description, the simulator uses the synthesized gate-level implementation along with the required standard-cell library models.

This step helps verify that the synthesized circuit continues to exhibit the expected behavior.

---

## Technology-Mapped Circuit

The synthesized design was mapped using the SKY130 standard-cell library.



---

## Gate-Level Simulation Waveform

The synthesized blocking-assignment design was simulated, and the resulting waveform was analyzed using GTKWave.

<img width="1366" height="655" alt="VirtualBox_vsdworkshop_24_08_2026_22_09_32" src="https://github.com/user-attachments/assets/99bf8c77-0b41-4940-913a-69163d09e1ef" />


### Observation

The resulting circuit represents the RTL functionality after synthesis and technology mapping.

The gate-level simulation waveform allows the behavior of the synthesized implementation to be examined and compared with the expected RTL behavior.

---

# 🎯 Overall Result

The experiments in this module demonstrated several important stages of the digital design and verification process.

A 2:1 multiplexer was simulated at the RTL level, and waveform analysis was used to verify its functionality. The effect of incomplete assignments was also examined using an incorrectly coded multiplexer.

Blocking and non-blocking assignment behavior was studied to understand how different procedural assignment styles affect simulation results.

The designs were synthesized using Yosys, and the resulting logic was mapped using the SKY130 standard-cell library. The synthesized implementation was then examined through Gate-Level Simulation and waveform analysis.

---

# 📝 Conclusion

This module provided practical exposure to RTL simulation, Verilog assignment behavior, synthesis, and Gate-Level Simulation.

The experiments demonstrated the difference between blocking and non-blocking assignments and highlighted the importance of selecting the correct assignment style when describing combinational and sequential circuits.

The multiplexer experiments also showed how incomplete assignments can lead to unintended behavior and potentially result in inferred storage elements during synthesis.

RTL simulation and GTKWave were used to verify functional behavior before synthesis. Yosys was then used to synthesize the RTL design and generate a gate-level representation mapped to the SKY130 standard-cell library.

Finally, Gate-Level Simulation provided an additional verification stage by allowing the synthesized implementation to be analyzed using waveform results.

Overall, the module demonstrated the complete progression from RTL design and simulation to synthesis, technology mapping, gate-level verification, and waveform analysis.

---

## 👤 Author

**Pranvitha Vanga**  
B.Tech – Electronics and Communication Engineering  
Anurag University
