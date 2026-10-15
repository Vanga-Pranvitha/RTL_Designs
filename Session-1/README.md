# Practical Study of RISC-V, RTL Verification, and OpenROAD Physical Design

**Author: Vanga Pranvitha**

## Introduction

This document summarizes my practical work with open-source tools used for RISC-V software development, RTL simulation, waveform inspection, and digital physical design.

The activities completed and explored include:

- RISC-V development using GitHub Codespaces
- Cross-compiling a C program for RISC-V
- Binary disassembly using `objdump`
- Program execution using Spike
- RTL simulation using Icarus Verilog
- Waveform analysis using GTKWave
- OpenROAD RTL-to-GDS flow exploration
- Makefile-based design configuration
- Final GDS layout visualization using KLayout

---

# Section 1: Setting Up the RISC-V Workspace

## Step 1: Access the RISC-V Project Repository

I opened the RISC-V project on GitHub and reviewed its source files, sample programs, and environment setup for software development.

I used GitHub Codespaces to prepare a cloud-based workspace for the practical tasks.

### Repository Interface

<img width="1536" height="691" alt="WhatsApp Image 2026-08-31 at 12 50 51 AM" src="https://github.com/user-attachments/assets/9c2ac25c-8e4b-4fc7-a92e-795bb8113d5e" />

---

## Step 2: Launch a GitHub Codespace

A new GitHub Codespace was created from the repository.

### Steps Followed

1. Open the RISC-V repository.
2. Click the green **Code** button.
3. Select **Codespaces**.
4. Create a new Codespace.
5. Wait for the development environment to initialize.

GitHub Codespaces provides a browser-based VS Code environment with terminal access.

<img width="1536" height="691" alt="WhatsApp Image 2026-08-30 at 11 16 20 PM" src="https://github.com/user-attachments/assets/bc37547c-3bcd-4e26-93c4-180a61179de0" />

---

## Step 3: Check the Workspace

After the Codespace was initialized, the terminal was used to access the project files and execute the required commands.

The development environment provides access to the sample programs and required RISC-V tools.

<img width="1536" height="691" alt="WhatsApp Image 2026-08-30 at 11 16 23 PM" src="https://github.com/user-attachments/assets/8330d74b-a1c0-4e37-904d-c6850aa7ddfd" />

---

# Section 2: Compiling a RISC-V Application

## Step 4: Open the Sample Programs Folder

The sample programs are available inside the `samples` directory.

```bash
cd samples/
```

The directory contains example C programs that can be compiled and executed for the RISC-V architecture.

---

## Step 5: Build the C Program for RISC-V

The RISC-V cross compiler was used to compile the C program.

```bash
riscv64-unknown-elf-gcc -o sum1ton.o sum1ton.c
```

### Understanding the Command

- `riscv64-unknown-elf-gcc` – RISC-V cross compiler
- `-o sum1ton.o` – Specifies the output file
- `sum1ton.c` – Input C source file

The successful compilation generates an executable that can be analyzed and executed using RISC-V tools.

<img width="1536" height="691" alt="WhatsApp Image 2026-08-30 at 11 16 22 PM" src="https://github.com/user-attachments/assets/3b069b2b-0f76-4aed-bcc3-f6e1903ed50b" />

---

# Section 3: Inspecting the Compiled Instructions

## Step 6: Disassemble the Executable

The compiled program was analyzed using the `objdump` utility.

```bash
objdump -d sum1ton.o
```

The `objdump` command displays the machine instructions and their corresponding assembly representation.

This helps in understanding:

- Generated assembly instructions
- Register operations
- Function execution
- Machine-level program flow

### Output from Disassembly

<img width="1536" height="691" alt="WhatsApp Image 2026-08-30 at 11 16 23 PM" src="https://github.com/user-attachments/assets/aae59e3e-3a3b-496f-82e5-a059554161ea" />

---

# Section 4: Executing the Program in Spike

## Step 7: Run the Compiled Program

The compiled RISC-V executable was executed using the Spike RISC-V simulator.

```bash
spike pk sum1ton.o
```

The expected output of the program is:

```text
Sum from 1 to 9 is 45
```

The successful execution confirms that the program was correctly compiled for the RISC-V architecture.

<img width="1536" height="691" alt="WhatsApp Image 2026-08-30 at 11 16 20 PM (1)" src="https://github.com/user-attachments/assets/df37322c-fa10-4a87-92d4-42b6f37dff57" />


<img width="1536" height="691" alt="WhatsApp Image 2026-08-31 at 12 50 53 AM" src="https://github.com/user-attachments/assets/9261f031-e13a-472b-9ad0-ce68ddaba431" />

---

# Section 5: Verifying RTL Functionality

## Introduction

I used RTL simulation to check whether the Verilog design behaved as expected.

The RTL verification flow includes:

1. Writing the RTL design
2. Creating a testbench
3. Compiling the Verilog files
4. Running the simulation
5. Generating waveform output
6. Analyzing the waveform

---

## Step 8: Compile the RTL and Testbench

The Verilog design and testbench were compiled using Icarus Verilog.

```bash
iverilog -o gmux verilog_files/good_mux.v verilog_files/tb_good_mux.v
```

### What the Command Does

- `iverilog` compiles the Verilog source files.
- `good_mux.v` contains the RTL design.
- `tb_good_mux.v` contains the testbench.
- The generated simulation output is used for functional verification.

<img width="1408" height="460" alt="WhatsApp Image 2026-08-30 at 11 28 05 PM" src="https://github.com/user-attachments/assets/646e882e-11c7-49d2-b927-d56cfd37d7d3" />

---

# Section 6: Inspecting Signals with GTKWave

## Step 9: Review the Simulation Waveforms

The generated waveform was opened using GTKWave.

GTKWave provides a graphical representation of signal transitions during simulation.

The waveform allows verification of:

- Input signal behavior
- Select signal transitions
- Output response
- Timing relationships

The observed waveform confirms the functional behavior of the RTL design.

<img width="1536" height="1156" alt="WhatsApp Image 2026-08-31 at 12 50 55 AM (1)" src="https://github.com/user-attachments/assets/eba8326a-bfce-479d-a545-4e261e0de256" />

---

# Section 7: Exploring the RTL-to-GDS Process

## Introduction

I explored the OpenROAD project to understand the stages involved in converting RTL into a GDS layout.

The OpenROAD flow automates multiple stages of digital IC physical design.

### Main Physical Design Stages

```text
RTL Design
    ↓
Logic Synthesis
    ↓
Floorplanning
    ↓
Placement
    ↓
Clock Tree Synthesis
    ↓
Routing
    ↓
GDS Generation
```

---

## Step 10: Examine the OpenROAD Flow Repository

The OpenROAD RTL-to-GDS repository was opened in GitHub Codespaces.

The repository contains the OpenROAD-flow-scripts infrastructure and configuration files required for executing physical design flows.

Important directories include:

```text
images/
orfs/
designs/
scripts/
tools/
```

The repository provides support for multiple technologies and design configurations.

<img width="1536" height="691" alt="WhatsApp Image 2026-08-30 at 11 16 23 PM (1)" src="https://github.com/user-attachments/assets/8bc54af3-5001-4011-b9e9-940245a3dc2a" />

---

# Section 8: Configuring the Design Flow

## Step 11: Review Makefile Settings

The Makefile contains configuration paths for different technology libraries and design implementations.

Example configuration entries include:

```text
DESIGN_CONFIG=./designs/gf12/aes/config.mk
DESIGN_CONFIG=./designs/sky130hd/aes/config.mk
DESIGN_CONFIG=./designs/scl180/fs120/config.mk
```

### What the Command Does of the Configuration

The configuration files are used to:

- Select the target design
- Define technology parameters
- Specify design configuration files
- Automate the RTL-to-GDS flow
- Control different physical design stages

<img width="1536" height="691" alt="WhatsApp Image 2026-08-31 at 12 50 55 AM (2)" src="https://github.com/user-attachments/assets/0520f858-34c8-4b8a-8a4d-798de9f73535" />

---

# Section 9: Viewing the Final GDS Layout

## Step 12: Inspect the Layout in KLayout

The final physical layout was visualized using KLayout.

KLayout is used to inspect the GDS layout generated after the physical design flow.

The layout contains multiple technology layers representing different physical components of the integrated circuit.

### Layers Visible in the Layout

- Metal layers
- Poly layers
- Diffusion layers
- Well layers
- Contact layers
- Routing layers

The final layout visualization demonstrates the physical implementation result of the RTL-to-GDS flow.

<img width="1536" height="864" alt="WhatsApp Image 2026-08-31 at 12 50 55 AM" src="https://github.com/user-attachments/assets/a106ac83-e7c4-4a8c-adee-1df9b950706e" />

---

# Skills and Concepts Practiced

Through these hands-on experiments, the following concepts were explored:

- Setting up a RISC-V development environment
- Using GitHub Codespaces
- Compiling C programs for RISC-V
- Understanding executable disassembly
- Executing programs using Spike
- Performing RTL simulation
- Using testbenches for functional verification
- Analyzing waveforms using GTKWave
- Understanding the OpenROAD RTL-to-GDS flow
- Exploring technology and design configuration files
- Understanding Makefile-based automation
- Visualizing final GDS layouts using KLayout

---

# Final Summary

These exercises gave me practical exposure to several stages of digital design and the VLSI implementation process.

The experiments covered the complete learning path from RISC-V software development and RTL simulation to physical design and GDS layout visualization.

Using open-source tools such as RISC-V GCC, Spike, Icarus Verilog, GTKWave, OpenROAD, and KLayout helped me develop an understanding of:

- Software compilation for RISC-V
- Instruction-level analysis
- RTL functional verification
- Digital waveform analysis
- Physical design automation
- RTL-to-GDS implementation
- Final layout visualization

This workflow demonstrates how different open-source tools can be integrated to understand the broader semiconductor design ecosystem.
