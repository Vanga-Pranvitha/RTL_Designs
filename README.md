
# RTL Designs | Digital Design & VLSI Implementation

**A Practical Portfolio of RTL Design, Functional Verification, Logic Synthesis, Timing Analysis, and ASIC Physical Design**

This repository showcases my hands-on work and technical learning in digital design and VLSI implementation. It brings together Verilog RTL experiments, simulation and waveform analysis, synthesis workflows, RISC-V studies, timing analysis, and open-source ASIC physical design using the SKY130 process design kit.

The repository is organized into individual learning modules, physical design exercises, practical sessions, and BabySoC-related experiments, with dedicated documentation for each section.

---

## Table of Contents

- [Repository Overview](#repository-overview)
- [RTL Design and Synthesis Modules](#rtl-design-and-synthesis-modules)
- [ASIC Physical Design Modules](#asic-physical-design-modules)
- [Practical Sessions](#practical-sessions)
- [VSDBabySoC](#vsdbabysoc)
- [Tools and Technologies](#tools-and-technologies)
- [Key Learning Outcomes](#key-learning-outcomes)
- [Author](#author)

---

## Repository Overview

| Category | Focus |
|---|---|
| RTL Design and Synthesis | Verilog coding, simulation, testbench development, synthesis, and optimization |
| ASIC Physical Design | Floorplanning, placement, layout, timing analysis, clock tree synthesis, and routing |
| Practical Sessions | RISC-V programming, RTL verification, synthesis, and waveform analysis |
| VSDBabySoC | BabySoC-related design, simulation, synthesis, and verification documentation |

---

# RTL Design and Synthesis Modules

This section contains practical exercises covering RTL development, digital circuit implementation, functional verification, and logic synthesis.

| Module | Focus Area | Documentation |
|---|---|---|
| Module 0 | Workshop Introduction and Setup | [View Module 0](./module-0/) |
| Module 1 | Verilog RTL Design and Synthesis | [View Module 1](./module-1/) |
| Module 2 | Timing Libraries and RTL Design | [View Module 2](./module-2/) |
| Module 3 | Combinational and Sequential Optimization | [View Module 3](./module-3/) |
| Module 4 | Simulation and Synthesis Verification | [View Module 4](./module-4/) |
| Module 5 | RTL Coding Constructs and Synthesis Optimization | [View Module 5](./module-5/) |

## Module 0 – Workshop Introduction

**Directory:** [`module-0`](./module-0/)

Introduces the workshop environment, laboratory setup, and development tools required for RTL design and VLSI experiments.

## Module 1 – Verilog RTL Design and Synthesis

**Directory:** [`module-1`](./module-1/)

Focuses on Verilog HDL, digital circuit implementation, testbench development, functional simulation, waveform inspection, and logic synthesis.

## Module 2 – Timing Libraries and RTL Design

**Directory:** [`module-2`](./module-2/)

Explores RTL design practices, timing libraries, hierarchical design concepts, synthesis, and technology mapping.

## Module 3 – RTL Optimization Techniques

**Directory:** [`module-3`](./module-3/)

Covers combinational and sequential optimization, logic simplification, state optimization, and synthesis-related improvements.

## Module 4 – Gate-Level Simulation and Verification

**Directory:** [`module-4`](./module-4/)

Examines Gate-Level Simulation (GLS), blocking and non-blocking assignments, RTL and synthesis behavior, and functional verification.

## Module 5 – Synthesis Optimization

**Directory:** [`module-5`](./module-5/)

Explores conditional statements, loops, generate constructs, arithmetic circuits, and RTL coding techniques that influence synthesis results.

---

# ASIC Physical Design Modules

This section documents practical exploration of the ASIC implementation flow using open-source EDA tools and the SKY130 PDK.

| Module | Focus Area | Documentation |
|---|---|---|
| Module 1 – PD | Open-Source EDA, OpenLANE, and SKY130 PDK | [View Module 1 – PD](./module-1-pd/) |
| Module 2 – PD | Floorplanning and Standard-Cell Libraries | [View Module 2 – PD](./module-2-pd/) |
| Module 3 – PD | Layout Design and Cell Characterization | [View Module 3 – PD](./module-3-pd/) |
| Module 4 – PD | Timing Analysis and Clock Tree Synthesis | [View Module 4 – PD](./module-4-pd/) |
| Module 5 – PD | Routing and Timing Closure | [View Module 5 – PD](./module-5-pd/) |

## Module 1 – Open-Source EDA and SKY130 PDK

**Directory:** [`module-1-pd`](./module-1-pd/)

Introduces open-source EDA tools, the SKY130 process design kit, OpenLANE, and the RTL-to-GDSII design flow.

## Module 2 – Floorplanning and Standard-Cell Libraries

**Directory:** [`module-2-pd`](./module-2-pd/)

Covers chip floorplanning, utilization, aspect ratio, power planning, cell placement, placement optimization, and standard-cell library concepts.

## Module 3 – Layout Design and Characterization

**Directory:** [`module-3-pd`](./module-3-pd/)

Explores CMOS inverter design, circuit simulation, standard-cell layout, Magic, ngspice, layout extraction, and design rule checking.

## Module 4 – Timing Analysis and Clock Tree Synthesis

**Directory:** [`module-4-pd`](./module-4-pd/)

Focuses on timing libraries, setup and hold analysis, clock uncertainty, Static Timing Analysis (STA), and clock tree synthesis using TritonCTS.

## Module 5 – Routing and Timing Closure

**Directory:** [`module-5-pd`](./module-5-pd/)

Explores power distribution, global and detailed routing, TritonRoute, design rule checking, and backend implementation stages.

---

# Practical Sessions

The practical sessions contain additional experiments in processor development, RTL verification, logic synthesis, and open-source hardware design.

## Session 1 – RISC-V and RTL Verification

**Directory:** [`Session-1`](./Session-1/)

### Areas Covered

- RISC-V development environment setup
- C program compilation and assembly inspection
- Spike instruction-set simulation
- RTL simulation using Icarus Verilog
- Waveform analysis using GTKWave
- Introduction to the OpenROAD design flow

[**Explore Session 1 →**](./Session-1/)

## Session 2 – RTL Design and Verification

**Directory:** [`Session-2`](./Session-2/)

### Areas Covered

- Verilog RTL implementation
- Testbench development and functional simulation
- Good and bad multiplexer comparisons
- Logic synthesis using Yosys
- Synthesized netlist inspection
- Gate-Level Simulation and design verification

[**Explore Session 2 →**](./Session-2/)

## Session 3 – RTL Simulation and Synthesis

**Directory:** [`Session-3`](./Session-3/)

### Areas Covered

- RTL simulation and functional verification
- Logic synthesis and netlist generation
- Gate-Level Simulation
- Waveform inspection using GTKWave
- Post-synthesis behavior analysis

[**Explore Session 3 →**](./Session-3/)

---

# VSDBabySoC

**Directory:** [`VSDBabySoC`](./VSDBabySoC/)

This section contains documentation and practical work related to the BabySoC design and its digital implementation workflow.

### Areas Covered

- RTL design and simulation
- Logic synthesis using Yosys
- SKY130 standard-cell technology mapping
- Gate-level netlist analysis
- Gate-Level Simulation (GLS)
- Functional comparison of RTL and synthesized designs
- Synthesis and timing report analysis, where included in the documented experiments

[**Explore VSDBabySoC →**](./VSDBabySoC/)

---

# Tools and Technologies

The following tools and technologies are used across the repository's RTL and physical design workflows.

| Tool / Technology | Application |
|---|---|
| **Verilog HDL** | RTL design and hardware description |
| **Icarus Verilog** | RTL and gate-level simulation |
| **GTKWave** | Waveform visualization and debugging |
| **Yosys** | Logic synthesis and technology mapping |
| **SKY130 PDK** | Open-source semiconductor process design kit |
| **OpenLANE** | RTL-to-GDSII implementation flow |
| **OpenROAD** | ASIC physical design and implementation |
| **OpenSTA** | Static Timing Analysis |
| **RePlAce** | Placement optimization |
| **TritonCTS** | Clock tree synthesis |
| **TritonRoute** | Detailed routing |
| **Magic** | IC layout editing and design rule checking |
| **ngspice** | Circuit simulation and characterization |
| **Spike** | RISC-V instruction-set simulation |
| **Git** | Version control |
| **GitHub** | Repository hosting and documentation |
| **Linux** | EDA tool execution and workflow automation |

---

# Key Learning Outcomes

Through these practical exercises, I have gained experience in the following areas:

- Designing digital circuits using Verilog HDL.
- Developing testbenches and verifying RTL functionality.
- Simulating circuits and analyzing timing waveforms.
- Performing logic synthesis and technology mapping.
- Examining gate-level netlists and post-synthesis behavior.
- Exploring RISC-V and SoC development workflows.
- Understanding ASIC floorplanning, placement, and routing.
- Studying setup and hold timing analysis.
- Exploring clock tree synthesis and physical verification.
- Working with open-source EDA tools and the SKY130 PDK.

---

# Author

**Vanga Pranvitha**

**College:** Anurag University  
**Branch:** Electronics and Communication Engineering (ECE)

This repository represents my practical learning, experiments, and documentation in RTL design, digital verification, synthesis optimization, timing analysis, and VLSI physical design.

---

*From RTL implementation to ASIC physical design — documenting my VLSI learning journey.*
