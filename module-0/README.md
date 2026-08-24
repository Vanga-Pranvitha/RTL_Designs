# 🔧 Module 0 — RTL Design Workshop Introduction

*Part of my RTL Design and Synthesis Workshop series.*

## 📖 Overview

This module introduces the basic environment required for RTL design and synthesis. The main objective is to understand the workshop workflow and prepare the software environment needed for Verilog simulation, waveform analysis, and RTL synthesis.

The module covers the basic workshop flow, Linux environment setup, installation of required open-source EDA tools, and verification of the installed tools.

The main tools used in this module are **Icarus Verilog, GTKWave, and Yosys**.

| Tool           | Purpose                            | Environment    |
| -------------- | ---------------------------------- | -------------- |
| Icarus Verilog | Verilog compilation and simulation | Ubuntu / Linux |
| GTKWave        | Simulation waveform visualization  | Ubuntu / Linux |
| Yosys          | RTL synthesis and analysis         | Ubuntu / Linux |

This setup provides the foundation for the RTL design and synthesis experiments covered in the following modules.
# 1️⃣ Workshop Environment

## 1.1 Workshop Workflow

The RTL design process followed in this workshop begins with writing the design using **Verilog HDL**. The RTL code is then compiled and simulated to check whether the design behaves as expected.

The simulation output can be examined using **GTKWave**, which helps in understanding signal transitions and verifying the functionality of the design.

After functional verification, **Yosys** is used to synthesize the RTL design and analyze its hardware representation.

The basic workflow is:

**Verilog RTL → Compilation → Simulation → Waveform Analysis → Synthesis**

## 1.2 Required Tools

The following open-source tools are used throughout the workshop:

* **Icarus Verilog** – Compiles and simulates Verilog HDL designs.
* **GTKWave** – Displays and analyzes simulation waveforms.
* **Yosys** – Performs RTL synthesis and provides information about the synthesized design.
* **Git** – Used to obtain and manage workshop source files.

These tools provide the basic software environment required to perform the RTL design, simulation, and synthesis experiments.
# 2️⃣ Local Tool Setup

## 2.1 System Requirements

For the workshop, I used a **Linux-based environment** through **Oracle VM VirtualBox**. An Ubuntu virtual machine was configured to provide the environment required for running the RTL simulation and synthesis tools.

The virtual machine used for the workshop has the following configuration:

* **Operating System:** Ubuntu 64-bit
* **Memory:** 4096 MB
* **Processors:** 2
* **Storage:** 25 GB
* **Virtualization Platform:** Oracle VM VirtualBox
* **Network:** NAT

### Virtual Machine Setup

*Figure 1: <img width="1366" height="768" alt="Screenshot (89)" src="https://github.com/user-attachments/assets/dcabebb0-d5d1-4f11-8983-ca91e05ad21d" />
*
## 2.2 Installing Icarus Verilog and GTKWave

After setting up the Ubuntu environment, I installed **Icarus Verilog** and **GTKWave** for RTL simulation and waveform analysis.

**Icarus Verilog** is used to compile and simulate Verilog HDL programs, while **GTKWave** is used to view and analyze the waveform generated during simulation.

The required packages were installed using the following commands:

```bash
sudo apt update
sudo apt install iverilog
sudo apt install gtkwave
```

After installation, both tools were ready to be used for the Verilog simulation exercises in the upcoming modules.

## 2.3 Installing Yosys

After installing the simulation tools, I installed **Yosys**, an open-source RTL synthesis tool. Yosys is used to process Verilog RTL designs and convert them into a synthesized hardware representation.

The installation was performed using the Ubuntu package manager:

```bash
sudo apt update
sudo apt install yosys
```

Once the installation was completed, Yosys was available from the terminal and ready for use in the RTL synthesis experiments.

### Workshop Repository

The workshop files can be obtained using Git:

```bash
git clone https://github.com/kunalg123/sky130RTLDesignAndSynthesisWorkshop.git
```

The repository contains the files and examples required for the subsequent RTL design and synthesis exercises.
## 2.4 Checking the Installation

After installing the required tools, I verified their availability from the Ubuntu terminal. Checking the installed versions helps confirm that the tools are correctly installed and can be accessed from the command line.

The following commands were used:

```bash
iverilog -V
gtkwave --version
yosys -V
```

The terminal output displayed the version information for each tool, confirming that the simulation, waveform visualization, and synthesis tools were successfully installed.

# 3️⃣ Module Summary

This module provided the initial setup required for the RTL Design and Synthesis workshop. I configured an Ubuntu-based environment using VirtualBox and installed the essential open-source tools needed for the upcoming experiments.

### Key Takeaways

* Set up an Ubuntu environment for RTL development.
* Installed **Icarus Verilog** for Verilog compilation and simulation.
* Installed **GTKWave** for viewing simulation waveforms.
* Installed **Yosys** for RTL synthesis and analysis.
* Verified that the installed tools are accessible through the terminal.
* Understood the basic flow from RTL coding to simulation and synthesis.

With the required environment successfully configured, the setup is ready for the RTL design and synthesis exercises in the next modules.

---

## 👤 Author

**Vanga Pranvitha**

B.Tech – Electronics & Communication Engineering

Anurag University

🔗 [RTL Design & Synthesis Repository](https://github.com/Vanga-Pranvitha/RTL_Designs)
