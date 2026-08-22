# 🔧 Module 0 — Workshop Introduction

«Part of the RTL Design Workshop series.»

## 📖 Overview

Module 0 introduces the RTL Design Workshop environment and prepares the required tools before starting the RTL design exercises. It covers the workshop structure, available lab environment, local tool installation, and verification of the RTL simulation and synthesis toolchain.

| Tools | Lab Environment | Prerequisites |
|---|---|---|
| Icarus Verilog, GTKWave, Yosys | Cloud Lab / Ubuntu Linux | Linux-based environment or virtual machine |


## 📑 Table of Contents

1. "Workshop Introduction" (#1-workshop-introduction)
   - "1.1 Workshop Structure" (#11-workshop-structure)
   - "1.2 Cloud Lab" (#12-cloud-lab)
2. "Local Tool Setup" (#2-local-tool-setup)
   - "2.1 System Requirements" (#21-system-requirements)
   - "2.2 Installing Icarus Verilog and GTKWave" (#22-installing-icarus-verilog-and-gtkwave)
   - "2.3 Installing Yosys" (#23-installing-yosys)
   - "2.4 Checking the Installation" (#24-checking-the-installation)
3. "Takeaways" (#3-takeaways)

---

## 1️⃣ Workshop Introduction

1.1 Workshop Structure

The RTL Design Workshop is organized into multiple modules that gradually introduce the RTL-to-synthesis flow. The modules combine theoretical concepts with practical exercises, progressing from RTL coding and simulation towards synthesis, timing concepts, standard-cell libraries, and sequential logic design.

Module 0 focuses mainly on understanding the workshop environment and preparing the tools required for the upcoming modules.

1.2 Cloud Lab

A pre-configured cloud-based laboratory environment can be used to perform the workshop exercises without setting up all the tools locally.

The cloud environment provides the required software and can be accessed through a browser after signing in with the credentials provided for the workshop.

---

## 2️⃣ Local Tool Setup

### 2.1 System Requirements

The local setup uses a Linux-based environment such as Ubuntu. Ubuntu may be installed directly or used through a virtual machine such as Oracle VM VirtualBox.
<img width="1080" height="968" alt="WhatsApp Image 2026-08-21 at 5 52 55 PM" src="https://github.com/user-attachments/assets/330181ef-7359-4093-a0ac-213cd228a37d" />


### 2.2 Installing Icarus Verilog and GTKWave

Icarus Verilog is used for compiling and simulating Verilog designs, while GTKWave is used to view simulation waveforms.
```bash
sudo apt install iverilog
sudo apt install gtkwave
```

### 2.3 Installing Yosys

Yosys is an open-source synthesis tool used to synthesize RTL designs and analyze the resulting hardware representation.
```bash
sudo apt install yosys
```
The workshop repository can also be cloned using:
```bash
git clone https://github.com/kunalg123/sky130RTLDesignAndSynthesisWorkshop.git
```
### 2.4 Checking the Installation

After installation, the tools can be checked using their version commands:
```bash
iverilog -V
gtkwave --version
yosys -V
```
These commands confirm that the required tools are installed and accessible from the terminal.
<img width="919" height="656" alt="image" src="https://github.com/user-attachments/assets/b9111243-4f15-4ea0-973a-0268dc17a4b0" />


## 3️⃣ Takeaways

- ✅ Understood the overall structure of the RTL Design Workshop.
- ✅ Learned about the cloud-based lab environment.
- ✅ Set up the required RTL simulation and synthesis tools.
- ✅ Installed Icarus Verilog, GTKWave, and Yosys.
- ✅ Verified the installed tools before beginning the RTL design modules.

## 👤 Author

**Amrutha Madapa**  
B.Tech – Electronics & Communication Engineering  
Anurag University  
[RTL Workshop Repository](https://github.com/madapaamrutha-svg/RTL_Workshop)
