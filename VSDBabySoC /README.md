# RTL Design, Synthesis & Physical Design Workshop

**A collection of practical experiments in Verilog RTL design, functional simulation, logic synthesis, optimization, timing analysis, and open-source ASIC implementation.**

This repository documents my hands-on learning and practical work in RTL design and VLSI implementation. It covers Verilog coding, testbench development, waveform analysis, synthesis using Yosys, gate-level simulation, RISC-V experiments, and physical design using open-source EDA tools and the SKY130 PDK.

---

## Quick Navigation

- [Repository Overview](#repository-overview)
- [RTL Design and Synthesis](#rtl-design-and-synthesis)
- [Module 0 – Workshop Setup](#module-0--workshop-setup)
- [Module 1 – RTL Design Fundamentals](#module-1--rtl-design-fundamentals)
- [Module 2 – RTL Design and Synthesis](#module-2--rtl-design-and-synthesis)
- [Module 3 – RTL Optimization](#module-3--rtl-optimization)
- [Module 4 – Simulation and Synthesis Verification](#module-4--simulation-and-synthesis-verification)
- [Module 5 – Synthesis Optimization](#module-5--synthesis-optimization)
- [Physical Design Modules](#physical-design-modules)
- [Mid-Term Practical Work](#mid-term-practical-work)
- [Sequence Detector Assignment](#sequence-detector-assignment)
- [Tools and Technologies](#tools-and-technologies)
- [Author](#author)

---

## Repository Overview

| Section | Description |
|---|---|
| **RTL Design and Synthesis** | Verilog design, simulation, synthesis, and optimization |
| **Physical Design Modules** | ASIC floorplanning, placement, clock tree synthesis, routing, and timing analysis |
| **Mid-Term Practical Work** | RISC-V programming, RTL verification, and OpenROAD exploration |
| **Sequence Detector** | FSM design, sequence detection, and functional verification |
| **Tools and Technologies** | Open-source EDA tools and the SKY130 technology platform |

---

# RTL Design and Synthesis

This section contains practical exercises related to RTL coding, digital design, simulation, and logic synthesis.

| Module | Focus Area | Documentation |
|---|---|---|
| Module 0 | Workshop Setup and Introduction | [View README](./module-0/README.md) |
| Module 1 | Verilog RTL Design | [View README](./module-1/README.md) |
| Module 2 | RTL Design and Synthesis | [View README](./module-2/README.md) |
| Module 3 | RTL Optimization | [View README](./module-3/README.md) |
| Module 4 | Simulation and Synthesis Verification | [View README](./module-4/README.md) |
| Module 5 | Synthesis Optimization | [View README](./module-5/README.md) |

## Module 0 – Workshop Setup

### Topics Covered

- Introduction to the workshop
- Cloud laboratory environment
- Local tool installation and configuration
- Basic development environment setup

**Documentation:** [Module 0 README](./module-0/README.md)

---

## Module 1 – RTL Design Fundamentals

### Topics Covered

- Introduction to digital design and RTL
- Verilog HDL fundamentals
- Combinational circuit design
- Testbench development
- RTL simulation using Icarus Verilog
- Waveform analysis using GTKWave
- Introduction to logic synthesis

**Documentation:** [Module 1 README](./module-1/README.md)

---

## Module 2 – RTL Design and Synthesis

### Topics Covered

- Verilog module development
- Hierarchical design concepts
- Multiple-module implementation
- RTL simulation and verification
- Logic synthesis using Yosys
- Gate-level netlist generation
- Technology mapping
- Synthesis result analysis

**Documentation:** [Module 2 README](./module-2/README.md)

---

## Module 3 – RTL Optimization

### Topics Covered

- Combinational logic optimization
- Sequential logic optimization
- Constant propagation
- State optimization
- Logic sharing and cloning
- Retiming concepts
- Synthesis optimization experiments

**Documentation:** [Module 3 README](./module-3/README.md)

---

## Module 4 – Simulation and Synthesis Verification

### Topics Covered

- RTL functional simulation
- Gate-Level Simulation (GLS)
- Blocking and non-blocking assignments
- Synthesis-simulation mismatches
- Multiplexer implementation and verification
- Testbench-based validation
- Gate-level netlist analysis
- Debugging common RTL coding issues

**Documentation:** [Module 4 README](./module-4/README.md)

---

## Module 5 – Synthesis Optimization

### Topics Covered

- If-else and case statements
- Nested conditional logic
- Latch inference
- Loop-based RTL coding
- Generate constructs
- Multiplexer and demultiplexer design
- Ripple Carry Adder implementation
- Synthesis analysis and optimization

**Documentation:** [Module 5 README](./module-5/README.md)

---

# Physical Design Modules

The physical design section contains experiments involving ASIC implementation, standard-cell libraries, floorplanning, placement, timing analysis, clock tree synthesis, and routing.

| Module | Focus Area | Documentation |
|---|---|---|
| Module 1 – PD | Open-Source EDA and SKY130 Introduction | [View README](./module-1-pd/README.md) |
| Module 2 – PD | Floorplanning and Standard Cells | [View README](./module-2-pd/README.md) |
| Module 3 – PD | Layout Design and Characterization | [View README](./module-3-pd/README.md) |
| Module 4 – PD | Timing Analysis and Clock Tree Synthesis | [View README](./module-4-pd/README.md) |
| Module 5 – PD | Routing and Timing Closure | [View README](./module-5-pd/README.md) |

---

## Module 1 – Open-Source EDA and SKY130 Introduction

**Folder:** `module-1-pd`

### Topics Covered

- Introduction to open-source EDA tools
- Overview of the SKY130 PDK
- Introduction to RISC-V architecture
- SoC design fundamentals
- OpenLANE design flow
- RTL-to-GDSII implementation overview
- Design preparation and synthesis
- Examination of synthesis results

**Documentation:** [Module 1 – Physical Design](./module-1-pd/README.md)

---

## Module 2 – Floorplanning and Standard-Cell Design

**Folder:** `module-2-pd`

### Topics Covered

- Chip floorplanning
- Core utilization and aspect ratio
- Pre-placed cells and placement blockages
- Power distribution planning
- Pin placement
- Standard-cell libraries
- Initial and optimized placement
- Placement congestion analysis
- Cell characterization fundamentals

**Documentation:** [Module 2 – Physical Design](./module-2-pd/README.md)

---

## Module 3 – Layout Design and Characterization

**Folder:** `module-3-pd`

### Topics Covered

- CMOS inverter circuit design
- SPICE deck preparation
- Circuit simulation using ngspice
- CMOS fabrication process
- Standard-cell layout development
- Layout extraction
- SKY130 technology files
- Magic layout editor
- Design Rule Checking (DRC)
- Standard-cell characterization

**Documentation:** [Module 3 – Physical Design](./module-3-pd/README.md)

---

## Module 4 – Timing Analysis and Clock Tree Synthesis

**Folder:** `module-4-pd`

### Topics Covered

- Standard-cell timing libraries
- Delay models and timing tables
- Setup and hold timing analysis
- Clock uncertainty and jitter
- Static Timing Analysis using OpenSTA
- Timing optimization
- Clock Tree Synthesis using TritonCTS
- Ideal-clock and real-clock analysis
- Clock buffering and timing verification

**Documentation:** [Module 4 – Physical Design](./module-4-pd/README.md)

---

## Module 5 – Routing and Timing Closure

**Folder:** `module-5-pd`

### Topics Covered

- Maze routing algorithms
- Design Rule Checking
- Power Distribution Network construction
- Global routing and detailed routing
- TritonRoute features
- Routing connectivity
- Route topology analysis
- Post-route verification
- Final stages of the RTL-to-GDSII flow

**Documentation:** [Module 5 – Physical Design](./module-5-pd/README.md)

---

# Mid-Term Practical Work

The mid-term section contains additional experiments involving processor development, RTL verification, synthesis, and physical design tools.

## Session 1 – RISC-V and OpenROAD

### Topics Covered

- RISC-V development environment setup
- GitHub Codespaces
- C program compilation
- Assembly inspection using `objdump`
- Program execution with Spike
- RTL simulation
- GTKWave waveform analysis
- Introduction to OpenROAD
- RTL-to-GDSII workflow exploration

---

## Session 2 – RTL Simulation and Synthesis

### Topics Covered

- Yosys synthesis flow
- Good and bad multiplexer implementations
- Verilog testbench development
- Functional simulation
- Synthesized netlist inspection
- Gate-Level Simulation
- RTL and gate-level behavior comparison

---

## Session 3 – Gate-Level Verification

### Topics Covered

- RTL simulation
- Logic synthesis
- Gate-level netlist generation
- Post-synthesis simulation
- Waveform inspection
- Functional verification

---

# Sequence Detector Assignment

### Project Overview

This assignment focuses on designing and verifying a sequence detector using Verilog and finite state machine techniques.

### Topics Covered

- FSM architecture
- Sequence detection for `1111001`
- Verilog RTL implementation
- Testbench creation
- Simulation and waveform analysis
- Logic synthesis
- Gate-Level Simulation

**Documentation:** [Sequence Detector Assignment](./Assignment/README.md)

---

# Tools and Technologies

| Tool / Technology | Purpose |
|---|---|
| **Verilog HDL** | RTL design and hardware description |
| **Icarus Verilog** | RTL and gate-level simulation |
| **GTKWave** | Waveform visualization |
| **Yosys** | Logic synthesis and technology mapping |
| **SKY130 PDK** | Open-source process design kit |
| **OpenLANE** | ASIC implementation workflow |
| **OpenROAD** | Physical design and routing |
| **RePlAce** | Placement optimization |
| **TritonCTS** | Clock tree synthesis |
| **TritonRoute** | Detailed routing |
| **OpenSTA** | Static timing analysis |
| **Magic** | Layout editing and DRC |
| **ngspice** | Circuit simulation |
| **Git** | Version control |
| **GitHub** | Repository hosting and documentation |
| **Linux Terminal** | EDA tool execution and automation |

---

# Learning Outcomes

Through these practical exercises, I have worked on:

- Writing and verifying Verilog RTL designs.
- Developing testbenches and debugging simulation results.
- Understanding logic synthesis and technology mapping.
- Examining gate-level netlists and simulation behavior.
- Exploring open-source ASIC design tools.
- Learning floorplanning, placement, and routing concepts.
- Performing timing analysis and studying clock tree synthesis.
- Understanding the overall RTL-to-GDSII implementation process.

---

# Author

**Vanga Pranvitha**

- **College:** Anurag University
- **Branch:** Electronics and Communication Engineering (ECE)

This repository documents my practical learning and experiments in RTL design, digital verification, synthesis optimization, timing analysis, and open-source VLSI design.

---

*Maintained as part of my RTL Design and VLSI learning journey.*
