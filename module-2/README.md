# 🛠️ Module 2 — Timing Libraries, Synthesis & Flip-Flop RTL

## 🎯 What This Module Covers

This module introduces the practical steps involved in understanding timing libraries, writing sequential RTL, verifying designs through simulation, and converting RTL into synthesized hardware.

The work mainly focuses on the SKY130 technology library, different synthesis structures, D flip-flop implementations, RTL verification, Yosys synthesis, and logic optimization.

### Learning Outcomes

* Explore the SKY130 standard-cell timing library
* Understand the information available in Liberty files
* Study hierarchical and flattened design representations
* Implement multiple D flip-flop RTL styles
* Verify RTL functionality using Icarus Verilog
* Analyze simulation results with GTKWave
* Perform synthesis using Yosys
* Understand technology mapping to SKY130 cells
* Observe optimization of constant arithmetic operations

---

## 🧰 Software and Technology Used

| Purpose                  | Tool / Technology |
| ------------------------ | ----------------- |
| Hardware Description     | Verilog HDL       |
| Simulation               | Icarus Verilog    |
| Waveform Analysis        | GTKWave           |
| RTL Synthesis            | Yosys             |
| Standard-Cell Technology | SKY130 PDK        |

---

## 📑 Module Contents

1. [Working with the SKY130 Library](#1--working-with-the-sky130-library)
2. [Understanding Design Hierarchy](#2--understanding-design-hierarchy)
3. [D Flip-Flop Implementations](#3--d-flip-flop-implementations)
4. [Verification and Synthesis Flow](#4--verification-and-synthesis-flow)
5. [Studying Synthesis Optimization](#5--studying-synthesis-optimization)
6. [Module Summary](#6--module-summary)
7. [Conclusion](#7--conclusion)

---

# 1. 📚 Working with the SKY130 Library

## 1.1 🏭 SKY130 Technology Files

The SKY130 PDK contains the technology-related files needed for digital circuit design and implementation using a 130 nm CMOS process.

For the timing and synthesis exercises, the following Liberty library was used:

```bash
sky130_fd_sc_hd__tt_025C_1v80.lib
```

This library contains characterization information for the standard cells used during the synthesis process.

---

## 1.2 🌡️ Process and Operating Conditions

The naming convention of a SKY130 Liberty file gives useful information about the library configuration.

The selected file is:

```bash
sky130_fd_sc_hd__tt_025C_1v80.lib
```

It represents a particular process corner along with the specified temperature and supply-voltage conditions used for cell characterization.

Understanding these conditions is important because timing and electrical characteristics of standard cells depend on the operating environment.

---

## 1.3 🔎 Inspecting the Liberty Description

A Liberty file stores information that allows synthesis and timing tools to understand the behavior of available standard cells.

The file includes details such as:

* Cell names and definitions
* Input and output pins
* Logical functions
* Timing characteristics
* Power-related information
* Operating conditions

The file was examined to understand how standard-cell characteristics are described in a technology library.

<img width="1366" height="655" alt="VirtualBox_vsdworkshop_24_08_2026_15_42_19" src="https://github.com/user-attachments/assets/2937c979-4190-4d1a-81e0-56bd3af355ae" />

### ✅ Observation

The library examination provided an understanding of how standard-cell functionality and timing information are represented for use during digital synthesis.

---

# 2. 🏗️ Understanding Design Hierarchy

RTL designs can contain multiple modules connected together. During synthesis, the relationship between these modules can either be retained or combined.

Two approaches were explored:

* Hierarchical synthesis
* Flattened synthesis

---

## 2.1 📂 Preserving Module Structure

In hierarchical synthesis, the original module organization of the RTL is maintained.

The separate blocks continue to exist as individual modules, which makes the design structure easier to follow and inspect.

This approach is useful when the designer wants to preserve the organization of the original RTL during synthesis.

<img width="1366" height="655" alt="VirtualBox_vsdworkshop_24_08_2026_16_01_44" src="https://github.com/user-attachments/assets/95d6c958-eb6a-42d2-9614-d3da4ec6ac54" />

### ✅ Observation

The synthesized design retained the original module hierarchy, making the relationship between the different design blocks visible.

---

## 2.2 🌐 Combining the RTL Structure

Flattening removes the boundaries between individual RTL modules and creates a combined representation of the design.

The following Yosys command was used:

```bash
flatten
```

Flattening can allow the synthesis tool to analyze logic across module boundaries and perform additional optimization.

<img width="1366" height="655" alt="VirtualBox_vsdworkshop_24_08_2026_16_41_25" src="https://github.com/user-attachments/assets/088074be-4bbf-4728-ae59-811c084697db" />

### ✅ Observation

The module boundaries were removed during flattening, resulting in a unified representation of the RTL design.

---

## 2.3 ⚖️ Design Structure Comparison

The two synthesis approaches provide different views of the same RTL design.

| Hierarchical Approach             | Flattened Approach                   |
| --------------------------------- | ------------------------------------ |
| Keeps module boundaries           | Removes module boundaries            |
| Maintains design organization     | Produces one combined representation |
| Easier to trace individual blocks | Allows broader logic analysis        |
| Useful for structured designs     | Useful for cross-module optimization |

The comparison helped demonstrate how synthesis can change the internal representation of an RTL design without changing its intended functionality.

---

# 3. 🔄 D Flip-Flop Implementations

D flip-flops are sequential elements that store data according to a clock signal.

Three RTL versions were implemented in this module:

* D flip-flop with asynchronous reset
* D flip-flop with asynchronous set
* D flip-flop with synchronous reset

Each implementation was simulated to verify its behavior.

---

## 3.1 🔴 Asynchronous Reset Implementation

An asynchronous reset can clear the flip-flop output as soon as the reset signal is activated. The clock does not need to transition for the reset operation to occur.

### Verilog Code

```verilog
module dff_asyncres (
    input clk,
    input async_reset,
    input d,
    output reg q
);

always @(posedge clk, posedge async_reset)
    if (async_reset)
        q <= 1'b0;
    else
        q <= d;

endmodule
```

### How It Works

When `async_reset` is asserted, the output `q` is immediately driven to logic `0`.

When the reset is inactive, the input `d` is captured at the rising edge of the clock.

### Simulation

```bash
iverilog dff_asyncres.v tb_dff_asyncres.v
./a.out
gtkwave tb_dff_asyncres.vcd
```

<img width="1366" height="655" alt="VirtualBox_vsdworkshop_24_08_2026_17_02_51" src="https://github.com/user-attachments/assets/5e706d09-6a00-42f9-8b13-e0523d326a06" />


### ✅ Result

The waveform confirmed that the output responds immediately to the asynchronous reset and follows the input data on the active clock edge when reset is inactive.

---

## 3.2 🟢 Asynchronous Set Implementation

An asynchronous set performs the opposite control operation by forcing the flip-flop output to logic `1`.

The output changes when the set signal is activated without waiting for a clock transition.

### Verilog Code

```verilog
module dff_async_set (
    input clk,
    input async_set,
    input d,
    output reg q
);

always @(posedge clk, posedge async_set)
    if (async_set)
        q <= 1'b1;
    else
        q <= d;

endmodule
```

### How It Works

When `async_set` becomes high, `q` is set to `1`.

When the set input is inactive, the value of `d` is transferred to the output at the rising clock edge.

### Simulation

```bash
iverilog dff_async_set.v tb_dff_async_set.v
./a.out
gtkwave tb_dff_async_set.vcd
```

<img width="1366" height="655" alt="VirtualBox_vsdworkshop_24_08_2026_17_07_39" src="https://github.com/user-attachments/assets/3c16e086-d5ab-41e6-9c58-ae7373f6668d" />

### ✅ Result

The simulation waveform verified the expected response of the flip-flop to both the asynchronous set signal and the clocked data input.

---

## 3.3 🔵 Synchronous Reset Implementation

A synchronous reset is different from an asynchronous reset because the reset condition is checked only when the active clock edge occurs.

Therefore, changing the reset input between clock edges does not directly modify the output.

### Verilog Code

```verilog
module dff_syncres (
    input clk,
    input sync_reset,
    input d,
    output reg q
);

always @(posedge clk)
    if (sync_reset)
        q <= 1'b0;
    else
        q <= d;

endmodule
```

### How It Works

At every rising edge of `clk`:

* If `sync_reset` is high, `q` becomes `0`.
* If `sync_reset` is low, `d` is stored in `q`.
* A change in the reset signal alone does not immediately change the output.

### Simulation

```bash
iverilog dff_syncres.v tb_dff_syncres.v
./a.out
gtkwave tb_dff_syncres.vcd
```

<img width="1366" height="655" alt="VirtualBox_vsdworkshop_24_08_2026_17_12_58" src="https://github.com/user-attachments/assets/970f7a3a-2f40-42de-a302-7332f7a5e60c" />


### ✅ Result

The waveform demonstrated that the reset operation takes effect only at the active clock edge, confirming synchronous-reset behavior.

---

# 4. 🧪 Verification and Synthesis Flow

After creating the RTL designs, the next stage was to verify their functionality and then synthesize the verified designs.

The complete flow can be represented as:

```text
Verilog RTL
     ↓
Icarus Verilog
     ↓
Functional Simulation
     ↓
VCD File
     ↓
GTKWave
     ↓
Yosys
     ↓
Gate-Level Representation
     ↓
SKY130 Technology Mapping
```

Simulation was performed before synthesis so that the RTL functionality could be checked before converting it into hardware-level logic.

---

## 4.1 🔬 RTL Simulation

Icarus Verilog was used to compile the RTL design and its corresponding testbench.

### Compile

```bash
iverilog dff_asyncres.v tb_dff_asyncres.v
```

### Execute

```bash
./a.out
```

The simulation generates a VCD file containing the signal transitions.

### Open the Waveform

```bash
gtkwave tb_dff_asyncres.vcd
```

The waveform was used to inspect:

* Clock
* Reset or set input
* Data input
* Flip-flop output

<img width="1366" height="655" alt="VirtualBox_vsdworkshop_24_08_2026_16_41_25" src="https://github.com/user-attachments/assets/f525c76e-b3e4-4599-b3fd-b27441d87ef0" />

<img width="1366" height="655" alt="VirtualBox_vsdworkshop_24_08_2026_16_45_25" src="https://github.com/user-attachments/assets/9ada128c-22f9-4cb3-b258-0b570dd4364d" />


### ✅ Verification Result

The RTL simulation completed successfully, and the waveform provided visual confirmation of the expected flip-flop operation.

---

## 4.2 ⚡ Processing the RTL with Yosys

Yosys was used to convert the Verilog RTL into a synthesized hardware representation.

### Launch Yosys

```bash
yosys
```

### Import the RTL

```bash
read_verilog dff_asyncres.v
```

### Define the Top-Level Module

```bash
hierarchy -top dff_asyncres
```

### Convert RTL Processes

```bash
proc
```

### Optimize the Logic

```bash
opt
```

### Technology Mapping

```bash
techmap
opt
```

These operations transform the RTL into a more hardware-oriented representation and apply optimization steps before further mapping.


<img width="1366" height="655" alt="VirtualBox_vsdworkshop_24_08_2026_17_20_59" src="https://github.com/user-attachments/assets/0506bff6-1f4c-4697-9fba-08bfa8d441ca" />


### ✅ Synthesis Result

The RTL design was successfully processed using Yosys and converted into a synthesized gate-level representation.

---

# 5. 🔍 Studying Synthesis Optimization

Synthesis tools can simplify RTL expressions when an equivalent and more efficient hardware structure can be produced.

Two constant-multiplication examples were examined to observe this behavior.

---

## 5.1 ✖️ Multiplication by 2

### RTL Description

```verilog
module mul2 (
    input [2:0] a,
    output [3:0] y
);

assign y = a * 2;

endmodule
```

Here, the input `a` is multiplied by a constant value of `2`.

### Yosys Processing

```text
yosys
read_verilog mul2.v
prep -top mul2
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_5v.lib
show
write_verilog -noattr mul2_net.v
gvim mul2_net.v
```

Multiplication by two can be represented as a binary left shift. Because of this, the synthesis tool can implement the operation using a simpler hardware structure instead of a general multiplier.

<img width="1366" height="655" alt="VirtualBox_vsdworkshop_24_08_2026_17_36_05" src="https://github.com/user-attachments/assets/25cd0c58-625b-43fa-8a3a-16cbfb435124" />


### ✅ Result

The `mul2` design was synthesized successfully, and the constant multiplication was simplified into an efficient hardware representation.

---

## 5.2 ✖️ Multiplication by 8

The second example uses a different constant to demonstrate how synthesis handles another arithmetic expression.

### RTL Description

```verilog
module mult8 (
    input [2:0] a,
    output [5:0] y
);

assign y = a * 8;

endmodule
```

The input `a` is multiplied by `8`, and the result is assigned to `y`.

### Yosys Processing

```text
yosys
read_verilog mult8.v
prep -top mult8
abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_5v.lib
show
write_verilog -noattr mult8_net.v
gvim mult8_net.v
```

The synthesis process examines the constant arithmetic operation and generates an optimized hardware representation.

<img width="1366" height="655" alt="VirtualBox_vsdworkshop_24_08_2026_17_43_01" src="https://github.com/user-attachments/assets/29c5e5ae-702d-4c94-9d18-a5fbebbe691e" />


### ✅ Result

The `mult8` circuit was successfully synthesized, and its generated representation showed the optimized implementation selected by the synthesis flow.

---

## 5.3 📄 Examining the Generated Netlists

The synthesized Verilog files were generated using:

```text
write_verilog -noattr mul2_net.v
write_verilog -noattr mult8_net.v
gvim mul2_net.v
gvim mult8_net.v
```

These files provide a lower-level representation of the circuits after synthesis and optimization.


### 🔎 Observation

Comparing the synthesized netlists with the original RTL helps demonstrate how synthesis transforms high-level Verilog expressions into hardware-oriented logic.

---

# 6. 🏁 Module Summary

The following tasks were successfully covered in this module:

* ✅ Studied the SKY130 timing library.
* ✅ Examined Liberty-file information and operating conditions.
* ✅ Compared hierarchical and flattened synthesis.
* ✅ Implemented an asynchronous-reset D flip-flop.
* ✅ Implemented an asynchronous-set D flip-flop.
* ✅ Implemented a synchronous-reset D flip-flop.
* ✅ Simulated RTL using Icarus Verilog.
* ✅ Verified signal behavior using GTKWave.
* ✅ Processed RTL through Yosys.
* ✅ Studied gate-level synthesis and technology mapping.
* ✅ Observed optimization of constant multiplication.
* ✅ Generated and inspected synthesized Verilog netlists.

---

# 7. 📌 Conclusion

This module provided practical experience with several important stages of the RTL design flow.

The exercises demonstrated how a timing library describes standard-cell characteristics, how synthesis can preserve or remove RTL hierarchy, and how different reset mechanisms can be implemented using Verilog.

The designs were functionally checked using Icarus Verilog and GTKWave before being processed with Yosys. The optimization examples further demonstrated how synthesis tools can simplify RTL expressions and produce more efficient hardware structures.

Overall, the module helped build a better understanding of the path from **Verilog RTL to optimized gate-level hardware using the SKY130 standard-cell library**.

---

## 👤 Author

**Vanga Pranvitha**

B.Tech – Electronics & Communication Engineering

Anurag University

### 🔗 RTL Workshop Repository

