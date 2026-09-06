# 🔧 Module 1 — Open-Source EDA, OpenLANE & SKY130 PDK


> Part of the Chip Design Program — Physical Design series.

## 📖 Overview

This module introduces the basics of an open-source ASIC design flow. It explains how software instructions are eventually implemented as hardware, the role of RTL and EDA tools, the purpose of a PDK, the SKY130 technology, and how OpenLANE connects these stages to generate a final GDSII layout.

| | |
|---|---|
| 🛠️ **Tools** | OpenLANE, OpenROAD, Yosys, OpenSTA, Magic, Netgen, Fault |
| 🧩 **PDK** | SKY130 — open-source 130nm technology |
| 📋 **Prerequisites** | Basic digital logic and Linux commands |

## 📑 Table of Contents

1. From Software to Hardware
2. Open-Source ASIC Design
3. Process Design Kit (PDK)
4. SKY130 PDK
5. EDA Toolchain
6. RTL to GDSII Flow
7. OpenLANE Flow
   - 7.1 Detailed Flow
   - 7.2 Design for Test
   - 7.3 OpenROAD
   - 7.4 Antenna Violations
   - 7.5 Design Space Exploration
8. Exploring the SKY130 PDK
9. OpenLANE Setup
10. Running picorv32a
11. Key Learnings
12. Author

---

## 1️⃣ From Software to Hardware

A computer program eventually becomes a sequence of machine instructions. Compilers and assemblers convert software into binary instructions, and those instructions are executed by hardware designed to understand the corresponding instruction set.

<img width="1366" height="768" alt="Screenshot (108)" src="https://github.com/user-attachments/assets/c2425e9d-4f8f-4acd-be2e-16f88760a393" />


RISC-V follows the same concept. A program can be compiled into RISC-V machine code, which is executed by a processor RTL implementation such as `picorv32`. The RTL is later synthesized and physically implemented on silicon.

<img width="1366" height="768" alt="Screenshot (107)" src="https://github.com/user-attachments/assets/ff123f53-ce93-45a7-9838-9d1807eafb8c" />

For example, `add x6, x10, x6` is an instruction defined by the RISC-V ISA. It becomes binary code and is eventually represented by logic gates and physical layout structures that perform the required operation.

<img width="1366" height="768" alt="Screenshot (113)" src="https://github.com/user-attachments/assets/16b98920-990b-48f5-96fe-67a8d791b6ee" />


---

## 2️⃣ Open-Source ASIC Design

An open-source ASIC flow mainly depends on three elements:

- **RTL design** — describes the digital logic.
- **EDA tools** — transform RTL into a physical implementation.
- **PDK** — provides technology-specific information required for fabrication.

Open-source RTL can be obtained from repositories such as GitHub, OpenCores, and LibreCores, while tools such as Yosys, OpenROAD, and OpenLANE perform different implementation tasks.

<img width="1366" height="768" alt="Screenshot (115)" src="https://github.com/user-attachments/assets/4ff3ab91-3539-45b4-80f7-846448120275" />


---

## 3️⃣ Process Design Kit (PDK)

Early IC design was strongly connected to the fabrication process. The work of Lynn Conway and Carver Mead introduced structured design methods and helped separate chip design from manufacturing technology.

<img width="1366" height="768" alt="Screenshot (143)" src="https://github.com/user-attachments/assets/1dfba3c0-b11f-40a3-bba5-bc7ca89aa5b1" />

A **Process Design Kit (PDK)** contains the technology information required by EDA tools to design and verify a chip. Important contents include:

- DRC, LVS and PEX rules
- Semiconductor device models
- Standard-cell libraries
- I/O libraries

---

## 4️⃣ SKY130 PDK

SKY130 is an open-source 130nm PDK developed through the collaboration of **Google and SkyWater Technology**. It provides the technology files required for designing and verifying circuits using the SKY130 fabrication process.

<img width="1366" height="768" alt="Screenshot (116)" src="https://github.com/user-attachments/assets/91bb85a6-7851-45d5-a50b-0ab537f623a3" />

The availability of the PDK as open-source data makes it possible to study and practice ASIC design without depending entirely on proprietary technology files.

---

## 5️⃣ EDA Toolchain

Converting RTL into a physical chip requires many specialized operations. These include simulation, synthesis, floorplanning, power planning, placement, CTS, routing, extraction, timing analysis and physical verification.

<img width="1366" height="768" alt="Screenshot (144)" src="https://github.com/user-attachments/assets/6fe73d3a-b898-4f96-a763-f7ca237c79c7" />



Other important activities include DRC, LVS, DFM, DFT, IR-drop analysis and logic-equivalence checking. Different EDA tools are used to handle these individual stages.

---

## 6️⃣ RTL to GDSII Flow

The complete process can be viewed as a sequence that starts with RTL and technology data and ends with a manufacturable **GDSII** layout.

<img width="1366" height="768" alt="Screenshot (120)" src="https://github.com/user-attachments/assets/cc067b93-994e-4d90-8b14-6cf60583538c" />

### Synthesis

Converts RTL into a gate-level netlist using cells from the target standard-cell library. It changes the functional RTL description into actual hardware logic.

### Floorplanning and Power Planning

Determines die dimensions, macro locations and the power distribution network. This creates the physical area required for the remaining implementation stages.

### Placement

Assigns physical coordinates to standard cells. Global placement first finds suitable approximate positions, followed by detailed placement to make the cells legal on the placement rows.

### Clock Tree Synthesis

Creates a clock distribution network using buffers and inverters so that the clock reaches sequential elements with controlled skew.

### Routing

Creates the actual metal connections between cells. Global routing determines approximate paths and detailed routing generates the final metal and via geometry while following technology rules.

### Sign-Off

Final verification includes DRC, LVS, STA and parasitic extraction. These checks confirm that the design is manufacturable and meets functional and timing requirements.

---

## 7️⃣ OpenLANE Flow

OpenLANE is an automated open-source RTL-to-GDSII flow that combines multiple open-source EDA tools with the target PDK.

### 7.1 Detailed OpenLANE Flow

OpenLANE connects tools such as **Yosys + ABC** for synthesis, **OpenSTA** for timing analysis, **Fault** for DFT, **OpenROAD** for physical implementation, **TritonRoute** for routing, and **Magic + Netgen** for physical verification.

<img width="1366" height="768" alt="Screenshot (130)" src="https://github.com/user-attachments/assets/13afe70c-9b79-4d15-939e-b115edd49b98" />

### 7.2 Design for Test (DFT)

DFT adds test structures that help identify manufacturing defects. Fault can be used for scan insertion, ATPG, test-pattern compaction, fault coverage and fault simulation.

<img width="1366" height="768" alt="Screenshot (133)" src="https://github.com/user-attachments/assets/ea4cf58e-700a-433c-a564-11510e65622f" />

### 7.3 OpenROAD

OpenROAD performs major physical-design operations such as floorplanning, power planning, tap and decap insertion, placement, optimization, CTS and routing.


### 7.4 Antenna Rule Violations

During fabrication, long metal sections can accumulate charge during reactive-ion etching. This charge may damage transistor gates, creating an antenna violation.

<img width="1366" height="768" alt="Screenshot (134)" src="https://github.com/user-attachments/assets/7d5efd50-4826-46a6-b39e-6f5d74241d38" />

One possible solution is bridging the connection through another metal layer. OpenLANE also uses a preventive method by placing temporary antenna diodes and replacing them with real diodes only when the checker detects a violation.

### 7.5 Design Space Exploration

OpenLANE provides Design Space Exploration to evaluate different flow parameters and find configurations that provide better results for a particular design. It also contains reference configurations for several example designs.

---
## 8️⃣ Lab: Exploring the SKY130 PDK

The PDK directory was explored from the OpenLANE working directory using Linux commands.

```bash
cd ~/Desktop/work/tools/openlane_working_dir
ls
cd pdks
ls
cd sky130A
ls
cd libs.ref
ls -ltr
```

<img width="1917" height="1028" alt="SKY130 Library Structure" src="https://github.com/user-attachments/assets/f8aa8506-55c3-4f05-9385-4e6fcd50d734" />
The `libs.ref` directory contains the reference libraries required by the SKY130 PDK. It includes different standard-cell libraries designed for different performance and power requirements.

Some commonly used libraries are:

- `sky130_fd_sc_hd` — High-density standard cells
- `sky130_fd_sc_hs` — High-speed standard cells
- `sky130_fd_sc_ms` — Medium-speed standard cells
- `sky130_fd_sc_ls` — Low-speed standard cells
- `sky130_fd_sc_hdll` — High-density low-leakage cells
- `sky130_fd_sc_hvl` — High-voltage cells
- `sky130_fd_sc_lp` — Low-power cells
- `sky130_fd_io` — I/O cell library
- `sky130_sram_macros` — SRAM macro libraries
- `sky130_fd_pr` — Primitive device library

The `libs.tech` directory contains technology-related files and configurations used by tools such as Magic, Netgen, KLayout, ngspice, OpenLANE, Xschem and other EDA utilities.

---
## 9️⃣ Lab: OpenLANE Environment Setup

The OpenLANE environment was started using Docker. The working directory and PDK path were mounted into the container so that the required design and technology files could be accessed.

```bash
cd ..
docker run -it -v $(pwd):/openLANE_flow -v $PDK_ROOT:$PDK_ROOT -e PDK_ROOT=$PDK_ROOT -u $(id -u $USER):$(id -g $USER) efabless/openlane:v0.21
```

<img width="1917" height="1027" alt="OpenLANE Setup" src="https://github.com/user-attachments/assets/caefcc4c-37ee-48b2-b04b-a7008c4f5c48" />
An existing `docker` alias caused conflicts with normal Docker commands. The alias was removed using:

```bash
unalias docker
```

After entering the container, the current location and available files were checked using:

```bash
pwd
ls -ltr
```

The OpenLANE environment contains important files and directories such as `flow.tcl`, `run_designs.py`, `designs/`, `scripts/`, `docker_build/`, `configuration/` and `README.md`.

---
## 🔟 Lab: Running OpenLANE on picorv32a

The `picorv32a` processor design was used to explore the OpenLANE flow in interactive mode.

```bash
cd ~/Desktop/work/tools/openlane_working_dir/openlane
./flow.tcl -interactive
package require openlane 0.9
prep -design picorv32a
```

<img width="1917" height="1008" alt="picorv32a Preparation" src="https://github.com/user-attachments/assets/ca5ebd59-0d0d-47b1-89a2-b9d3997d0bb6" />
### Exploring the Run Directory

The generated run directory was then examined to understand the files created during the OpenLANE preparation stage.

```bash
cd designs/picorv32a
ls -ltr
cd src
ls -ltr
cd ../runs
ls -ltr
cd 06-09_11-26
ls -ltr
```

<img width="1917" height="1028" alt="Run Directory" src="https://github.com/user-attachments/assets/6e626abb-97d3-419d-ac6b-02d1319abbbd" />

<img width="1917" height="1018" alt="Run Files" src="https://github.com/user-attachments/assets/e4f2a587-bbbf-4696-a569-c02e925cbede" />
The generated run directory contains several important files and folders used during the OpenLANE flow.

- `PDK_SOURCES` — Contains information related to the selected PDK.
- `tmp/` — Stores temporary and intermediate files.
- `results/` — Contains the generated implementation results.
- `reports/` — Stores reports produced during different stages.
- `logs/` — Contains execution logs.
- `OPENLANE_VERSION` — Records the OpenLANE version used for the run.
- `cmds.log` — Keeps track of commands executed during the flow.
- `config.tcl` — Contains configuration settings for the design run.

These directories make it easier to track intermediate data, results, logs and configuration information throughout the OpenLANE process.

### Running Synthesis

The synthesis stage was started from the OpenLANE interactive shell using:

```bash
run_synthesis
```

<img width="1917" height="996" alt="Synthesis" src="https://github.com/user-attachments/assets/974df28f-3a6a-4436-ae56-178d089c189b" />
Yosys performs the synthesis process by converting the RTL design into a gate-level netlist using the SKY130 standard-cell libraries. OpenLANE also applies timing constraints such as clock period, input/output delays, clock uncertainty and transition limits.

The synthesized netlist is generated at:

`results/synthesis/picorv32a.synthesis.v`

The synthesis report showed a warning related to a net without a driver. The timing analysis also identified a critical path containing cells such as `sky130_fd_sc_hd__dfxtp_2`, `or2`, `or3`, `or4`, `o22ai`, `a221o` and `o2111a`.

<img width="1917" height="1028" alt="STA Critical Path" src="https://github.com/user-attachments/assets/94d64486-fe54-4063-9ffb-89fe60ca709d" />

### Lab Observation

Running OpenLANE in interactive mode helped in understanding how the SKY130 PDK, design configuration, synthesis and timing analysis are connected in the ASIC implementation flow.

---
## 1️⃣1️⃣ Key Learnings

- ✅ Understood how software instructions can eventually be converted into physical hardware.
- ✅ Learned the relationship between RISC-V instructions, processor RTL and silicon implementation.
- ✅ Studied the role of RTL, EDA tools and PDKs in ASIC design.
- ✅ Understood the purpose and contents of a Process Design Kit.
- ✅ Explored the open-source SKY130 130nm technology.
- ✅ Reviewed the major stages of the RTL-to-GDSII flow.
- ✅ Learned how OpenLANE combines synthesis, DFT, physical design and verification tools.
- ✅ Understood the purpose of DFT, antenna checking and Design Space Exploration.
- ✅ Explored the SKY130 PDK directory structure.
- ✅ Practiced setting up OpenLANE using Docker.
- ✅ Ran the `picorv32a` design in interactive mode.
- ✅ Examined synthesis results and identified the reported critical timing path.

---
## 👤 Author

**Vanga Pranvitha**  
Department of Electronics and Communication Engineering (ECE)  
Anurag University

