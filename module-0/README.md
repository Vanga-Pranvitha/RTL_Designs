```md
# Module 0 – RTL Workshop Setup

## 1. Introduction

This module introduces the basic environment and tools required for RTL design and synthesis. The objective is to understand the general RTL workflow and prepare the required software environment before starting the design exercises.

The RTL design process generally involves writing Verilog code, compiling the design, performing simulation, analyzing the output waveforms, and synthesizing the RTL description.

---

## 2. Objectives

The objectives of this module are:

- Understand the RTL design workflow.
- Become familiar with the workshop environment.
- Identify the tools used for simulation and synthesis.
- Learn the purpose of Icarus Verilog, GTKWave, and Yosys.
- Verify that the required tools are available in the Linux environment.

---

## 3. RTL Design Environment

RTL development can be performed in a Linux-based environment such as Ubuntu. The required software tools can be installed locally or accessed through a preconfigured laboratory environment.

The main tools used in this workshop are shown below.

| Tool | Purpose |
|------|---------|
| Icarus Verilog | Verilog compilation and simulation |
| GTKWave | Viewing simulation waveforms |
| Yosys | RTL synthesis and hardware analysis |

---

## 4. Installing the Required Tools

### 4.1 Installing Icarus Verilog

Icarus Verilog is used to compile and simulate Verilog HDL designs.

```bash
sudo apt install iverilog
4.2 Installing GTKWave

GTKWave is used to visualize the waveform generated during simulation.

sudo apt install gtkwave
4.3 Installing Yosys

Yosys is an open-source synthesis tool used to process RTL designs and generate a hardware representation.

sudo apt install yosys
5. Checking the Installation

After installation, the tools can be verified using the following commands.

iverilog -V
gtkwave --version
yosys -V

If the installation is successful, the terminal will display version information for the corresponding tool.

6. Basic RTL Design Flow

The basic RTL development process can be represented as:

RTL Design
    ↓
Compilation
    ↓
Simulation
    ↓
Waveform Analysis
    ↓
Synthesis
    ↓
Hardware Representation

Simulation helps verify whether the written Verilog code behaves according to the expected digital logic.

GTKWave can be used to observe and analyze the generated signal waveforms.

Yosys is used to synthesize the RTL description into a hardware-oriented representation.

7. Key Learning Points

After completing this module, the following concepts were understood:

Basic RTL design workflow.
Difference between simulation and synthesis.
Purpose of a Verilog simulator.
Waveform visualization using GTKWave.
RTL synthesis using Yosys.
Importance of verifying the development environment before starting the design process.
