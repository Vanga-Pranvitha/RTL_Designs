# RTL Design, Synthesis & ASIC Implementation Workshop

**A practical collection of RTL design experiments, simulation results, synthesis techniques, timing analysis, and open-source ASIC implementation workflows.**

This repository showcases my hands-on learning and technical work completed during the **RTL Design and Synthesis Workshop**. It includes Verilog RTL coding, functional verification, waveform analysis, logic synthesis, optimization techniques, and physical design studies using the SKY130 open-source technology platform.

---

## Quick Links

- [Workshop Overview](#rtl-design-and-synthesis)
- [Module 0 – Workshop Fundamentals](#module-0--workshop-fundamentals)
- [Module 1 – Verilog RTL Design and Synthesis](#module-1--verilog-rtl-design-and-synthesis)
- [Module 2.1 – Timing Libraries and Hierarchical Synthesis](#module-21--timing-libraries-and-hierarchical-synthesis)
- [Module 2.2 – Flip-Flop Design and SKY130 Mapping](#module-22--flip-flop-design-and-sky130-mapping)
- [Module 3 – RTL Optimization Techniques](#module-3--rtl-optimization-techniques)
- [Module 4 – Gate-Level Simulation and RTL Mismatches](#module-4--gate-level-simulation-and-rtl-mismatches)
- [Module 5 – Synthesis Optimization Methods](#module-5--synthesis-optimization-methods)
- [Mid-Term Practical Sessions](#mid-term-practical-sessions)
- [Sequence Detector Assignment](#sequence-detector-assignment)
- [SKY130 Physical Design Modules](#sky130-physical-design-modules)
- [Tools and Technologies](#tools-and-technologies)
- [Author Information](#author-information)

---

## Repository Overview

| Section | Description |
|---|---|
| **RTL Design and Synthesis** | Verilog coding, simulation, synthesis, and logic optimization |
| **Mid-Term Practical Work** | RISC-V experiments, RTL verification, GLS, and OpenROAD exploration |
| **Sequence Detector** | FSM implementation, testbench verification, and synthesis |
| **SKY130 Physical Design** | Open-source ASIC design, floorplanning, placement, CTS, routing, and timing analysis |
| **Tools and Technologies** | EDA tools, design libraries, and implementation workflows |

---

# RTL Design and Synthesis

| Module | Main Topic | Documentation |
|---|---|---|
| **Module 0** | Workshop Fundamentals | [Open README](./Module%200/README.md) |
| **Module 1** | Verilog RTL Design and Synthesis | [Open README](./Module%201/README.md) |
| **Module 2.1** | Timing Libraries, Hierarchical Design, and Flop Coding | [Open README](./Module%202.1/README.md) |
| **Module 2.2** | Flip-Flop Implementation and SKY130 Mapping | [Open README](./Module%202.2/README.md) |
| **Module 3** | Combinational and Sequential Optimization | [Open README](./Module%203/README.md) |
| **Module 4** | GLS and RTL-Synthesis Behavior Differences | [Open README](./Module%204/README.md) |
| **Module 5** | RTL Coding and Synthesis Optimization | [Open README](./Module%205/README.md) |

---

## Module 0 – Workshop Fundamentals

### Topics Explored

- Introduction to the workshop environment
- Cloud-based laboratory setup
- Local installation and configuration of tools

**Documentation:** [Module 0 README](./Module%200/README.md)

---

## Module 1 – Verilog RTL Design and Synthesis

### Topics Explored

- Fundamentals of digital and RTL design
- RTL design flow and Verilog programming
- Testbench development and functional verification
- Simulation with Icarus Verilog and GTKWave
- Implementation of a 2:1 multiplexer
- Introduction to Yosys synthesis
- Standard-cell libraries and technology mapping
- Analysis of synthesized gate-level netlists
- Practical implementation and result verification

**Documentation:** [Module 1 README](./Module%201/README.md)

---

## Module 2.1 – Timing Libraries and Hierarchical Synthesis

### Topics Explored

- RTL design principles and coding practices
- Multi-module Verilog implementation
- Hierarchical and flat design structures
- RTL simulation and verification
- Logic synthesis using Yosys
- Gate-level netlist generation
- Technology mapping and synthesis analysis

**Documentation:** [Module 2.1 README](./Module%202.1/README.md)

---

## Module 2.2 – Flip-Flop Design and SKY130 Mapping

### Topics Explored

- Asynchronous-reset D flip-flop
- Asynchronous-set D flip-flop
- Synchronous-reset D flip-flop
- Simulation and synthesis of sequential circuits
- Mapping RTL designs to SKY130 standard cells
- Analysis of synthesis optimization techniques

**Documentation:** [Module 2.2 README](./Module%202.2/README.md)

---

## Module 3 – RTL Optimization Techniques

### Topics Explored

- Constant propagation
- State optimization
- Logic cloning
- Retiming techniques
- Practical combinational and sequential optimization experiments

**Documentation:** [Module 3 README](./Module%203/README.md)

---

## Module 4 – Gate-Level Simulation and RTL Mismatches

### Topics Explored

- Gate-Level Simulation (GLS)
- Differences between RTL and synthesized behavior
- Blocking and non-blocking assignments
- Multiplexer implementation using the ternary operator
- Yosys synthesis and gate-level netlist generation
- Post-synthesis MUX simulation
- Common RTL coding mistakes
- Correcting blocking-assignment issues
- Verification of corrected RTL designs

**Documentation:** [Module 4 README](./Module%204/README.md)

---

## Module 5 – Synthesis Optimization Methods

### Topics Explored

- If-else and nested if-else constructs
- Latch inference and incomplete assignments
- Case statements and partial-case handling
- Loop-based RTL implementation
- Generate blocks
- Ripple Carry Adder (RCA) design
- 4-to-1 multiplexer using a for loop
- 8-to-1 demultiplexer using case statements and loops
- 8-bit Ripple Carry Adder using generate blocks
- Synthesis results and optimization analysis

**Documentation:** [Module 5 README](./Module%205/README.md)

---

# Mid-Term Practical Sessions

## Session 1 – RISC-V and OpenROAD Exploration

### Topics Explored

- Setting up the RISC-V development environment with GitHub Codespaces
- Compiling C programs for RISC-V
- Inspecting assembly output using `objdump`
- Executing programs with the Spike simulator
- RTL simulation using Icarus Verilog
- Waveform inspection using GTKWave
- Introduction to the OpenROAD RTL-to-GDS flow
- Exploring repository structure and design configuration

**Documentation:** [Session 1 README](./Session%201/README.md)

---

## Session 2 – RTL Verification and Logic Synthesis

### Topics Explored

- Introduction to the Yosys synthesis process
- Verilog simulation and waveform debugging
- Comparison of good and bad MUX implementations
- Writing and running Verilog testbenches
- Logic synthesis and netlist inspection
- Viewing synthesized circuit schematics
- Gate-Level Simulation (GLS)
- Comparing RTL simulation with synthesized circuit behavior

**Documentation:** [Session 2 README](./Session%202/README.md)

---

## Session 3 – Synthesis and Post-Synthesis Verification

### Topics Explored

- RTL functional simulation
- Logic synthesis using Yosys
- Generation of gate-level netlists
- Gate-Level Simulation
- Waveform analysis using GTKWave
- Verification of synthesized circuit functionality

**Documentation:** [Session 3 README](./Session%203/README.md)

---

## Sequence Detector Assignment

### Topics Explored

- Finite State Machine (FSM) design
- Detection of the bit sequence `1111001`
- Verilog testbench development
- RTL simulation and functional verification
- Logic synthesis and gate-level netlist generation
- Gate-Level Simulation (GLS)

**Documentation:** [Assignment README](./Assignment/README.md)

---

# SKY130 Physical Design Modules

## SKY130 Module 1 – Open-Source EDA, OpenLANE and SKY130 PDK

### SKY130_D1_SK1 – Computer Architecture Fundamentals

1. **SKY_L1** — QFN-48 Package, Chip, Pads, Core, Die, and IP Overview
2. **SKY_L2** — Introduction to RISC-V Architecture
3. **SKY_L3** — Transition from Software Applications to Hardware

### SKY130_D1_SK2 – SoC Design and OpenLANE

1. **SKY_L1** — Components of Open-Source Digital ASIC Design
2. **SKY_L2** — Overview of the RTL-to-GDS Flow
3. **SKY_L3** — OpenLANE and STRIVE Chipsets
4. **SKY_L4** — OpenLANE ASIC Design Workflow

### SKY130_D1_SK3 – Open-Source EDA Tools

1. **SKY_L1** — OpenLANE Directory Structure
2. **SKY_L2** — Design Preparation
3. **SKY_L3** — Design Preparation Review and Synthesis
4. **SKY_L4** — OpenLANE Project Repository
5. **SKY_L5** — Analysis of Synthesis Results

**Documentation:** [SKY130 Module 1 README](./Sky130%20Module%201/README.md)

---

## SKY130 Module 2 – Floorplanning and Standard-Cell Libraries

### Part 1 – Floorplanning Fundamentals

1. Chip floorplanning principles
2. Utilization factor and aspect ratio
3. Pre-placed cells
4. Decoupling capacitors
5. Power distribution planning
6. Pin placement and placement blockages
7. Floorplan generation using OpenLANE
8. Inspection of floorplan output files
9. Layout visualization using Magic

### Part 2 – Cell Placement and Library Binding

10. Netlist binding and initial placement
11. Wire-length and capacitance optimization
12. Placement optimization
13. Standard-cell libraries and characterization
14. Congestion-aware placement using RePlAce

### Part 3 – Standard-Cell Design

15. Cell design and characterization workflow
16. Inputs required for cell design
17. Transistor-level circuit design
18. Physical layout design
19. Standard-cell characterization

### Part 4 – Timing Characterization

20. Timing characterization parameters
21. Timing threshold definitions
22. Propagation delay and transition time

**Documentation:** [SKY130 Module 2 README](./Sky130%20Module%202/README.md)

---

## SKY130 Module 3 – Standard-Cell Layout and Characterization

### SKY130_D3_SK1 – CMOS Inverter Simulation with ngspice

1. **SKY_L0** — IO Placer Revision
2. **SKY_L1** — Creating a SPICE Deck for a CMOS Inverter
3. **SKY_L2** — CMOS Inverter Simulation
4. **SKY_L3** — Switching Threshold Voltage (\(V_m\))
5. **SKY_L4** — Static and Dynamic Inverter Analysis
6. **SKY_L5** — Cloning the `vsdstdcelldesign` Repository

### SKY130_D3_SK2 – CMOS Fabrication and Layout

1. **SKY_L1** — Active Region Formation
2. **SKY_L2** — N-Well and P-Well Formation
3. **SKY_L3** — Gate Terminal Formation
4. **SKY_L4** — Lightly Doped Drain Formation
5. **SKY_L5** — Source and Drain Formation
6. **SKY_L6** — Local Interconnect Formation
7. **SKY_L7** — Higher-Level Metal Formation
8. **SKY_L8** — SKY130 Layout Layers and LEF Generation
9. **SKY_L9** — Standard-Cell Layout and SPICE Netlist Extraction

### Additional Layout and Characterization Exercises

1. **SKY_L9** — Standard-Cell Layout and SPICE Extraction
2. **SKY_L2** — Inverter Characterization with SKY130 Models
3. **SKY_L3** — Magic Options and Design Rule Checking
4. **SKY_L4** — SKY130 PDK Setup and Lab Installation
5. **SKY_L5** — Loading SKY130 Technology Rules in Magic
6. **SKY_L6** — Resolving the `poly.9` Design Rule Violation
7. **SKY_L7** — Poly Resistor Spacing to Diffusion and Tap
8. **SKY_L8** — Representing DRC Errors as Geometrical Constructs
9. **SKY_L9** — Identifying and Correcting Missing or Incorrect Rules

**Documentation:** [SKY130 Module 3 README](./Sky130%20Module%203/README.md)

---

## SKY130 Module 4 – Timing Analysis and Clock Tree Design

### SKY130_D4_SK1 – Timing Models and Delay Tables

1. **SKY_L1** — Converting Grid Information into Track Information
2. **SKY_L2** — Converting Magic Layouts into Standard-Cell LEF
3. **SKY_L3** — Timing Libraries and Adding Cells to Synthesis
4. **SKY_L4** — Understanding Delay Tables
5. **SKY_L5** — Delay Table Analysis: Part 1
6. **SKY_L6** — Delay Table Analysis: Part 2
7. **SKY_L7** — Synthesis Configuration for Slack Improvement and `vsdinv` Integration

### SKY130_D4_SK2 – Static Timing Analysis with Ideal Clocks

1. **SKY_L1** — Setup Timing and Flip-Flop Setup Time
2. **SKY_L2** — Clock Jitter and Clock Uncertainty
3. **SKY_L3** — Configuring OpenSTA for Post-Synthesis Analysis
4. **SKY_L4** — Reducing Setup Violations through Synthesis Optimization
5. **SKY_L5** — Basic Timing Engineering Change Order (ECO)

### SKY130_D4_SK3 – Clock Tree Synthesis

1. **SKY_L1** — Clock Tree Buffering with the H-Tree Algorithm
2. **SKY_L2** — Crosstalk and Clock-Net Shielding
3. **SKY_L3** — Running Clock Tree Synthesis with TritonCTS
4. **SKY_L4** — Verifying Clock Tree Synthesis Results

### SKY130_D4_SK4 – Timing Analysis with Real Clocks

1. **SKY_L1** — Setup Timing Analysis with Real Clocks
2. **SKY_L2** — Hold Timing Analysis with Real Clocks
3. **SKY_L3** — Real-Clock Timing Analysis Using OpenSTA
4. **SKY_L4** — Configuring Timing Libraries and CTS Assignments
5. **SKY_L5** — Effects of Larger CTS Buffers on Setup and Hold Timing

**Documentation:** [SKY130 Module 4 README](./Sky130%20Module%204/README.md)

---

## SKY130 Module 5 – Routing, Timing Closure and RTL-to-GDS

### SKY130_D5_SK1 – Routing and Design Rule Checking

1. **SKY_L1** — Introduction to Maze Routing and Lee's Algorithm
2. **SKY_L2** — Further Exploration of Lee's Routing Algorithm
3. **SKY_L3** — Design Rule Checking (DRC)

### SKY130_D5_SK2 – Power Distribution and Routing

1. **SKY_L1** — Building the Power Distribution Network
2. **SKY_L2** — Connecting Power Straps to Standard Cells
3. **SKY_L3** — Global Routing, Detailed Routing, and TritonRoute Configuration

### SKY130_D5_SK3 – TritonRoute Capabilities

1. **SKY_L1** — Routing with Pre-Processed Route Guides
2. **SKY_L2** — Inter-Guide Connectivity and Multi-Layer Routing
3. **SKY_L3** — Routing Connectivity Management
4. **SKY_L4** — Routing Topology and Post-Route Output Files

**Documentation:** [SKY130 Module 5 README](./Sky130%20Module%205/README.md)

---

# Tools and Technologies

| Tool / Technology | Application |
|---|---|
| **Verilog HDL** | RTL design and hardware description |
| **Icarus Verilog** | RTL and gate-level simulation |
| **GTKWave** | Waveform visualization and debugging |
| **Yosys** | Logic synthesis and technology mapping |
| **SKY130 PDK** | Open-source semiconductor process design kit |
| **OpenLANE** | RTL-to-GDSII implementation flow |
| **OpenROAD** | Physical design and implementation |
| **RePlAce** | Placement optimization |
| **TritonCTS** | Clock tree synthesis |
| **TritonRoute** | Detailed routing |
| **OpenSTA** | Static timing analysis |
| **Magic** | IC layout, extraction, and DRC |
| **ngspice** | Circuit simulation and characterization |
| **LEF** | Standard-cell physical information |
| **DEF** | Physical design and placement information |
| **Liberty (`.lib`)** | Cell timing and electrical characteristics |
| **SDC** | Timing constraints and clock definitions |
| **Git** | Source-code version control |
| **GitHub** | Repository hosting and documentation |
| **Linux Terminal** | Command-line execution and workflow automation |

---

# Author Information

**Vanga Pranvitha**

- **College:** Anurag University
- **Branch:** Electronics and Communication Engineering (ECE)

This repository represents my practical learning, experimentation, and documentation in RTL design, digital verification, logic synthesis, timing analysis, and open-source ASIC implementation.
