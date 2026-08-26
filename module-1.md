# Verilog RTL Design and Synthesis – Module 1

## Workshop Introduction

Day 1 of the RTL Design Workshop focused on understanding the basic flow of digital hardware design using Verilog. I explored how an RTL design is verified through simulation and how the same design can be converted into a gate-level implementation using synthesis tools.

The main tools used during this session were **Icarus Verilog for simulation, GTKWave for waveform observation, and Yosys for synthesis**.

## Contents

1. Digital Design Verification Basics
2. Simulation Environment with Iverilog
3. 2:1 Multiplexer Simulation
4. Understanding the Verilog Design
5. RTL Synthesis Using Yosys
6. Key Learning Outcomes

# 1. Digital Design Verification Basics

## Role of Simulation

Before implementing a digital circuit on hardware, its behavior can be checked using simulation. A simulator executes the Verilog description and allows the designer to verify whether the circuit produces the expected results for different inputs.

## RTL Design Description

The RTL design describes the intended hardware behavior using Verilog constructs. In this module, a simple multiplexer was used to understand the relationship between inputs, selection signals, and output.

<img width="706" height="408" alt="Screenshot 2026-08-26 205947" src="https://github.com/user-attachments/assets/640577fe-2f83-4fc3-8c38-114d4bd1053a" />


## Testbench-Based Verification

A testbench is an additional Verilog program used to provide test inputs to the design under verification. By applying different combinations of inputs and observing the output, the functionality of the RTL design can be confirmed.

<img width="1366" height="768" alt="Screenshot (76)" src="https://github.com/user-attachments/assets/61079fc7-1b57-457c-920d-05e7e3151487" />


# 2. Simulation Environment with Iverilog

## Verilog Simulation Process

**Icarus Verilog (iverilog)** is an open-source tool used to compile and simulate Verilog programs. The RTL source and its testbench are compiled together, after which the simulation generates waveform information.

The overall process used in the workshop was:

**RTL Design + Testbench → Compilation → Simulation → VCD Waveform → GTKWave**

<img width="1366" height="768" alt="Screenshot (77)" src="https://github.com/user-attachments/assets/333118ab-fc2f-4d01-96a6-ff64961cbde4" />


# 3. 2:1 Multiplexer Simulation

## Preparing the Simulation Tools

The required simulation and waveform-viewing tools were installed using:

```bash
sudo apt install iverilog
sudo apt install gtkwave
```

## Compiling the RTL and Testbench

The multiplexer design and its testbench were compiled using:

```bash
iverilog good_mux.v tb_good_mux.v
```

## Executing the Simulation

The compiled simulation file was executed with:

```bash
./a.out
```

## Observing the Generated Waveform

The simulation waveform was opened in GTKWave using:

```bash
gtkwave tb_good_mux.vcd
```

GTKWave was used to examine the changes in the input, select, and output signals with respect to simulation time.

<img width="1366" height="655" alt="2" src="https://github.com/user-attachments/assets/03651cd1-1904-48b8-a02a-44e26db28a46" />


# 4. Understanding the Verilog Design

## Multiplexer Functionality

The Verilog module implements a **2-to-1 multiplexer**, where one of two input signals is selected and passed to the output according to the select signal.

<img width="1366" height="655" alt="3" src="https://github.com/user-attachments/assets/5cae1f32-eb3e-4785-a819-2f5118d59581" />


### Signal Description

* `i0` and `i1` are the two data inputs.
* `sel` determines which input is selected.
* `y` is the output signal.
* For `sel = 0`, `i0` is connected to the output.
* For `sel = 1`, `i1` is connected to the output.

The simulation helped in verifying that the output changes according to the selected input.

# 5. RTL Synthesis Using Yosys

## From RTL to Hardware Representation

Simulation confirms the logical behavior of an RTL design, but it does not create the hardware implementation. **Synthesis** converts the RTL description into a representation consisting of logic cells that can be implemented in a target technology.

**Yosys** was used as the synthesis tool in this workshop, together with the **SKY130 standard-cell library**.

The synthesis process can be represented as:

**Verilog RTL → Yosys Processing → Technology Mapping → Gate-Level Design**

<img width="1366" height="768" alt="Screenshot (79)" src="https://github.com/user-attachments/assets/23e568ef-4a54-4c14-85b4-dbc5c40f7a8a" />


## Performing Synthesis

Yosys was started from the terminal using:

```bash
yosys
```

The SKY130 Liberty file was loaded so that the synthesis process could use the available standard cells.

```bash
read_liberty -lib my_lib/lib/sky130_fd_sc_hd__*.lib
```

The multiplexer RTL source was then imported:

```bash
read_verilog good_mux.v
```

The RTL design was synthesized with `good_mux` as the top-level module:

```bash
synth -top good_mux
```

Technology mapping was performed using the SKY130 library:

```bash
abc -liberty my_lib/lib/sky130_fd_sc_hd__*.lib
```

The synthesized circuit was then displayed as a schematic:

```bash
show
```

<img width="1366" height="655" alt="4" src="https://github.com/user-attachments/assets/191c5b86-3d3c-44ee-962d-6cced8693fbe" />


The schematic gives a visual representation of the logic obtained after synthesis and technology mapping.

## Creating the Synthesized Netlist

The final gate-level representation was exported as a Verilog file using:

```bash
write_verilog -noattr good_mux_netlist.v
```

This generated netlist contains the synthesized hardware representation using cells from the selected technology library.

## Complete Design Transformation

The complete process followed during the session was:

**RTL Coding → Simulation → Waveform Verification → Synthesis → Technology Mapping → Gate-Level Schematic → Netlist Generation**

This demonstrated the transition from a behavioral RTL description to a technology-mapped hardware representation.

# 6. Key Learning Outcomes

* Learned the basic concepts of RTL-based digital design.
* Understood how a testbench is used to verify a design.
* Performed Verilog simulation using Icarus Verilog.
* Analyzed simulation results using GTKWave.
* Implemented and verified a 2-to-1 multiplexer.
* Explored the purpose of RTL synthesis.
* Used Yosys for synthesizing the Verilog design.
* Worked with the SKY130 standard-cell library.
* Observed the synthesized circuit as a gate-level schematic.
* Generated the corresponding gate-level Verilog netlist.

## 👤 Author

**Vanga Pranvitha**

B.Tech – Electronics & Communication Engineering

Anurag University

**RTL Workshop Repository**
