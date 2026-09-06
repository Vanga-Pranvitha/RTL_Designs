# 🔧 Module 1 — Introduction to Open-Source EDA, OpenLANE, and SKY130 PDK

<p>
  <img src="https://img.shields.io/badge/Tool-OpenLANE-blue" alt="OpenLANE">
  <img src="https://img.shields.io/badge/Tool-OpenROAD-purple" alt="OpenROAD">
  <img src="https://img.shields.io/badge/Tool-Magic-orange" alt="Magic">
  <img src="https://img.shields.io/badge/PDK-SKY130-red" alt="SKY130">
  <img src="https://img.shields.io/badge/Flow-RTL--to--GDS-green" alt="RTL to GDS">
</p>

> Part of the Chip Design Program — Physical Design series.

---

## 📖 Module Overview

This module introduces the basic concepts required to understand an open-source ASIC physical design flow. I learned how a software program is converted into hardware, how RTL is processed using different EDA tools, why a PDK is needed, and how OpenLANE connects these stages to generate a final GDSII layout.

| | |
|---|---|
| 🛠️ **Tools Used** | OpenLANE, OpenROAD, Yosys, OpenSTA, Magic, Netgen, Fault |
| 🧩 **Technology** | SKY130 — Open-source 130nm PDK |
| 📋 **Prerequisites** | Basic digital logic and Linux terminal knowledge |

---

## 📑 Contents

1. Understanding How Software Becomes Hardware
2. Basics of an Open-Source ASIC Flow
3. Role of the Process Design Kit
4. Getting Familiar with the SKY130 PDK
5. EDA Tools Used in Chip Design
6. Step-by-Step RTL to GDSII Process
7. Getting Started with OpenLANE
   - 7.1 Inside the OpenLANE Flow
   - 7.2 Making the Design Testable
   - 7.3 Physical Implementation Using OpenROAD
   - 7.4 Understanding Antenna Problems
   - 7.5 Exploring Different Design Configurations
8. Lab Work: Exploring the SKY130/OpenLANE Directory
9. Lab Work: Setting Up OpenLANE
10. Lab Work: Running picorv32a Through OpenLANE
11. What I Learned from Module 1
12. About the Author

---

## 2️⃣ Basics of an Open-Source ASIC Flow

An ASIC design is created through a sequence of steps that starts with an RTL description and ends with a physical chip layout. In an open-source flow, many of the tools required for these stages are freely available, which makes the complete design process easier to study and experiment with.

The main stages can be summarized as:

**RTL Design → Logic Synthesis → Floorplanning → Placement → Clock Tree Synthesis → Routing → Physical Verification → GDSII**

### 🔹 RTL Design

The design is first written using an HDL such as Verilog. RTL describes how the digital circuit should operate using registers, combinational logic, and sequential logic.

### 🔹 Logic Synthesis

The RTL code is converted into a gate-level representation using standard-cell libraries. The synthesis tool optimizes the logic according to the required design constraints.

### 🔹 Physical Design

After synthesis, the circuit is converted into an actual physical layout. This includes arranging cells on the chip, creating the clock network, and connecting the cells using metal layers.

### 🔹 Verification

The generated layout is checked for timing, connectivity, design-rule violations, and other physical issues before it can be used for fabrication.

### 🔹 GDSII Generation

The final physical layout is exported as a **GDSII** file. This file represents the geometry of the chip and is used as the final layout database for manufacturing.

### 📌 Why Open-Source ASIC Design?

Open-source EDA tools allow students and developers to understand the complete chip-design flow without depending completely on expensive proprietary software. Tools such as **Yosys, OpenROAD, Magic, and OpenLANE** can be used together to explore different stages of ASIC implementation.

---

## 3️⃣ Role of the Process Design Kit (PDK)

A **Process Design Kit (PDK)** is a collection of files and information provided for a particular semiconductor manufacturing technology. It helps designers create circuits that follow the rules and limitations of the selected fabrication process.

A PDK acts as a connection between the **EDA tools** and the **fabrication process**.

### 🔹 What Does a PDK Provide?

A typical PDK contains information such as:

- **Technology files** — describe the manufacturing layers and process rules.
- **Standard-cell libraries** — provide predefined logic cells used during synthesis and physical design.
- **SPICE models** — describe the electrical behavior of transistors and other devices.
- **Design rules** — specify minimum widths, spacing, enclosure, and other layout requirements.
- **LEF files** — provide physical information required for placement and routing.
- **GDS files** — contain the actual geometric layout information of cells.
- **Liberty files (`.lib`)** — contain timing and power information for standard cells.

### 🔹 Why Is a PDK Important?

Without a PDK, the EDA tools would not know the physical and electrical limitations of the target manufacturing technology. The PDK provides the required technology-specific information so that the design can be converted correctly from RTL into a manufacturable layout.

### 🔹 PDK in an Open-Source Flow

In this workshop, the **SKY130 PDK** is used with open-source EDA tools such as **Yosys, OpenROAD, Magic, and OpenLANE**. This allows the complete ASIC design flow to be explored using an openly available technology.

---

## 4️⃣ Getting Familiar with the SKY130 PDK

The **SKY130 PDK** is an open-source Process Design Kit developed for the **SkyWater 130nm CMOS technology**. It provides the technology information required by EDA tools to design and verify an ASIC.

Using SKY130, I was able to understand how a real semiconductor technology is represented inside an ASIC design environment.

### 🔹 Main Contents of SKY130

The PDK includes several important files and directories, such as:

- **Standard-cell libraries** for implementing digital logic.
- **Technology files** containing process and layer information.
- **SPICE models** for transistor-level simulation.
- **LEF files** containing physical cell information.
- **GDS files** containing cell layout data.
- **Liberty files** containing timing and power characteristics.
- **Design-rule information** used during physical verification.

### 🔹 Why SKY130 Is Useful

SKY130 makes it possible to experiment with an actual semiconductor manufacturing process using open-source EDA tools. Instead of working only with theoretical layouts, I can follow a complete flow from RTL design to a physical layout using a real 130nm technology.

### 🔹 SKY130 with OpenLANE

The SKY130 PDK works together with the **OpenLANE** flow. OpenLANE uses the technology files, standard-cell libraries, timing data, and physical information provided by the PDK during synthesis, placement, routing, and verification.

This combination provides an accessible environment for learning the complete **RTL-to-GDSII** design flow.

---
## 5️⃣ EDA Tools Used in Chip Design

**Electronic Design Automation (EDA)** tools are software applications used to design, analyze, simulate, and verify electronic circuits and ICs. Different tools are used at different stages of the ASIC design flow.

In the open-source flow, multiple tools work together to take the design from RTL code to the final physical layout.

### 🔹 Important EDA Tools

| Tool | Main Purpose |
|---|---|
| **Yosys** | RTL synthesis and logic optimization |
| **OpenROAD** | Physical design, placement, CTS, and routing |
| **OpenSTA** | Static timing analysis |
| **Magic** | Layout generation and physical verification |
| **Netgen** | Netlist-to-layout comparison |
| **Fault** | Design-for-test and fault-analysis related tasks |
| **OpenLANE** | Automates and connects multiple stages of the ASIC flow |

### 🔹 How the Tools Work Together

The output from one stage is generally used as the input for the next stage. For example, **Yosys** converts the RTL into a synthesized gate-level netlist, which is then passed to physical-design tools such as **OpenROAD**.

After placement and routing, tools such as **Magic** and **Netgen** can be used to check the physical layout and verify that the final design matches the intended circuit.

### 📌 Key Point

No single EDA tool performs the complete ASIC design process. Instead, several specialized tools are combined to create an end-to-end **RTL-to-GDSII** flow. OpenLANE helps automate this overall process by connecting these tools together.

---

## 6️⃣ Step-by-Step RTL to GDSII Process

The **RTL-to-GDSII flow** is the complete process of converting a digital circuit description into a physical layout that can be used for chip fabrication.

The major stages of the flow are:

**RTL → Synthesis → Floorplanning → Placement → CTS → Routing → Signoff → GDSII**

### 🔹 1. RTL Design

The design is initially described using an HDL such as **Verilog**. At this stage, the functionality of the digital circuit is defined.

### 🔹 2. Logic Synthesis

The RTL is synthesized into a gate-level netlist using standard cells from the selected technology library. Logic optimization is also performed during this stage.

### 🔹 3. Floorplanning

The overall physical structure of the chip is planned. The core area, I/O locations, power distribution, and major design blocks are considered.

### 🔹 4. Placement

The synthesized standard cells are placed inside the chip area. The goal is to obtain a compact placement while maintaining good timing and routing characteristics.

### 🔹 5. Clock Tree Synthesis

A clock distribution network is created so that the clock signal reaches the required sequential elements with controlled delay and skew.

### 🔹 6. Routing

The connections between the placed cells are created using the available metal layers. Routing must follow the technology design rules.

### 🔹 7. Physical Verification and Signoff

The completed layout is checked for design-rule violations, connectivity problems, timing issues, and other physical constraints.

### 🔹 8. GDSII Generation

After the required checks are completed, the final physical layout is exported in **GDSII format**. This represents the geometry of the chip and can be used as the final layout database for fabrication.

### 📌 Overall Flow

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
Physical Verification
    ↓
GDSII
````

This flow helped me understand how a simple RTL description is gradually transformed into an actual physical representation of a digital chip.

---

## 7️⃣ Getting Started with OpenLANE

**OpenLANE** is an open-source ASIC implementation flow that combines several EDA tools to automate the process of converting RTL into a physical chip layout.

It was developed to make the RTL-to-GDSII flow more accessible by bringing together tools for synthesis, timing analysis, floorplanning, placement, clock-tree synthesis, routing, and physical verification.

### 🔹 Why OpenLANE?

A complete ASIC flow normally requires several different tools, each handling a particular stage. OpenLANE connects these tools into a single automated flow, reducing the amount of manual work required.

The flow can be broadly represented as:

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
Physical Verification
     ↓
GDSII
````

### 🔹 Main Tools Used by OpenLANE

Some of the important open-source tools involved in the flow are:

* **Yosys** – RTL synthesis and logic optimization
* **OpenROAD** – Physical design and implementation
* **OpenSTA** – Static timing analysis
* **Magic** – Layout and design-rule checking
* **Netgen** – Layout versus schematic/netlist comparison
* **Fault** – Design-for-test related analysis

### 🔹 OpenLANE Configuration

OpenLANE uses configuration files to control the flow for a particular design. These configurations can define parameters such as clock information, utilization, core dimensions, routing settings, and other design constraints.

This makes it possible to run the same design with different settings and compare the resulting physical implementation.

### 📌 Learning Outcome

By working with OpenLANE, I understood how different open-source EDA tools are connected together to create a complete ASIC implementation flow, starting from RTL and ending with a GDSII layout.

---


### 7.1 🔄 Inside the OpenLANE Flow

OpenLANE divides the complete ASIC implementation process into several stages. Each stage performs a specific task and passes its output to the following stage.

The major steps in the OpenLANE flow are:

### 🔹 Synthesis

The RTL design is converted into a gate-level netlist using **Yosys**. During synthesis, the logic is optimized and mapped to cells available in the selected standard-cell library.

### 🔹 Floorplanning

The physical dimensions of the chip are decided and the basic arrangement of the design is created. Core utilization, aspect ratio, I/O placement, and power planning are considered at this stage.

### 🔹 Placement

The standard cells from the synthesized netlist are positioned inside the core area. Placement is optimized to reduce wire length and improve timing.

### 🔹 Clock Tree Synthesis

The clock network is generated and distributed to the sequential elements of the design. The objective is to maintain controlled clock delay and skew.

### 🔹 Routing

The placed cells are electrically connected using metal layers. OpenLANE uses routing tools to create these connections while following the technology rules.

### 🔹 Signoff Checks

The final implementation is checked for timing, design-rule violations, antenna issues, and layout-versus-netlist consistency.

### 🔹 GDSII Output

After completing the required checks, the physical design is converted into a **GDSII** file. This is the final layout representation produced by the flow.

### 📌 Flow Summary

```text
RTL
 ↓
Synthesis
 ↓
Floorplanning
 ↓
Placement
 ↓
Clock Tree Synthesis
 ↓
Routing
 ↓
Signoff Checks
 ↓
GDSII
````

Understanding these individual stages helped me see how OpenLANE automates the complete physical-design process instead of requiring every tool to be operated separately.


### 7.2 🧪 Making the Design Testable — DFT

**Design for Test (DFT)** refers to techniques used to make an integrated circuit easier to test after manufacturing.

Testing every internal part of a chip directly is difficult because many internal signals and nodes are not accessible from the outside. DFT methods improve this by providing ways to control and observe internal circuit elements.

### 🔹 Why DFT Is Required

Manufacturing defects can occur during chip fabrication. Even when the RTL and physical design are correct, defects in the manufactured chip may cause incorrect operation.

DFT helps identify such defects by making important internal signals accessible during testing.

### 🔹 Scan Chains

One common DFT technique is the use of **scan chains**. Flip-flops in the design are connected together to form a shift register during test mode.

Test data can be shifted into the scan chain, the circuit can be evaluated, and the resulting data can then be shifted out for analysis.

```text
Test Input
    ↓
[FF] → [FF] → [FF] → [FF]
                         ↓
                    Test Output
````

### 🔹 Benefits of DFT

* Makes internal circuit nodes easier to test.
* Helps detect manufacturing defects.
* Improves controllability and observability of the design.
* Supports automated testing after fabrication.
* Can improve the overall test coverage of the chip.

### 📌 Key Point

DFT is an important part of ASIC design because a circuit must not only be designed and manufactured correctly, but also be **testable after fabrication**.


### 7.3 🏗️ Physical Implementation Using OpenROAD

**OpenROAD** is an open-source tool used for automating important physical-design stages of an ASIC. It takes the synthesized design and helps convert it into a physical implementation.

OpenROAD is integrated into the OpenLANE flow and is mainly used during the physical-design portion of the process.

### 🔹 Major Tasks

OpenROAD supports several important stages, including:

- **Floorplanning** — Defines the basic physical structure of the chip.
- **Placement** — Positions standard cells within the core area.
- **Clock Tree Synthesis (CTS)** — Builds the clock distribution network.
- **Routing** — Creates connections between cells using metal layers.
- **Optimization** — Improves timing and other physical characteristics.

### 🔹 Placement and Routing

During placement, cells are arranged so that the design can meet timing and routing requirements. After placement, the routing stage connects the required pins and nets using the available routing layers.

The quality of placement and routing has a direct effect on factors such as:

- Timing performance
- Wire length
- Area utilization
- Power consumption
- Routing congestion

### 🔹 Role in OpenLANE

OpenROAD works together with other tools in the OpenLANE flow. It receives information generated during earlier stages and produces the physical implementation needed for the later verification and signoff steps.

### 📌 Key Point

OpenROAD provides the main automated physical-design capabilities required to transform a synthesized netlist into a routed chip layout.

---

### 7.4 📡 Understanding Antenna Rule Violations

During the fabrication of an integrated circuit, long metal wires can sometimes collect electrical charge during the manufacturing process. If this charge reaches a sensitive transistor gate, it can potentially damage the device.

This type of manufacturing issue is referred to as an **antenna violation**.

### 🔹 Why Antenna Violations Occur

During plasma-based manufacturing processes, metal layers may accumulate charge. A long metal connection attached to a transistor gate can behave like an antenna and transfer this accumulated charge to the gate.

Therefore, fabrication rules place limits on the amount of metal connected to sensitive areas of the circuit.

### 🔹 How OpenLANE Handles Antenna Issues

OpenLANE includes methods to detect and reduce antenna violations during the physical-design flow.

Some common techniques include:

- Breaking long metal connections into smaller sections.
- Using higher metal layers when appropriate.
- Adding antenna protection structures.
- Applying diode-based protection where required.

### 🔹 Antenna Checks

Antenna checking is performed as part of the physical verification process. If violations are detected, the design can be modified and routed again to satisfy the manufacturing rules.

### 📌 Key Point

Antenna rules are important because a layout that is logically and electrically correct may still cause problems during fabrication if these manufacturing constraints are not satisfied.

---

### 7.5 🔍 Exploring Different Design Configurations

**Design Space Exploration (DSE)** is the process of trying different design parameters and comparing their effect on the final implementation.

In OpenLANE, different configuration values can be changed to study how they affect important physical-design results such as **area, timing, power, and routing**.

### 🔹 Parameters That Can Be Explored

Some commonly adjusted parameters include:

- Core utilization
- Aspect ratio
- Clock period
- Placement density
- Routing settings
- Synthesis optimization options

Changing these parameters can produce different implementations of the same RTL design.

### 🔹 Why DSE Is Useful

A design may satisfy its functional requirements but still have poor timing, excessive area, or routing congestion. By testing different configurations, a better balance between these parameters can be found.

For example:

```text
Configuration
      ↓
Run OpenLANE
      ↓
Check Results
      ↓
Compare Area / Timing / Power
      ↓
Choose Better Configuration
````

### 📌 Key Point

Design Space Exploration helps in finding suitable OpenLANE settings for a particular design. It is useful for understanding the trade-offs between **performance, area, power, and manufacturability**.


## 8️⃣ Lab Work: Exploring the OpenLANE PDK Directory

Before running the OpenLANE flow, it is useful to understand how the PDK files and related technology information are organized.

The **PDK directory structure** contains the technology files, standard-cell libraries, models, and other resources required by the EDA tools.

### 🔹 Exploring the Directory

I explored the PDK directory using Linux terminal commands to understand the available files and folders.

The directory contains important resources related to:

- Technology definitions
- Standard-cell libraries
- Layout information
- Timing libraries
- SPICE models
- Design-rule information
- Process-specific configuration files

### 🔹 Why Directory Structure Matters

Different stages of the OpenLANE flow require different files from the PDK. Understanding where these files are located makes it easier to configure the tools and troubleshoot errors during the flow.

### 🔹 Important PDK Information

The PDK provides the technology-specific data required for:

```text
Synthesis
   ↓
Timing Analysis
   ↓
Floorplanning
   ↓
Placement & Routing
   ↓
Physical Verification
````

### 📸 PDK Directory Exploration

![PDK Directory Structure](https://github.com/user-attachments/assets/2a1731e8-68f1-4f06-b809-d4c72ffbe345)

![OpenLANE PDK Files](https://github.com/user-attachments/assets/c913b93e-0bce-4574-b643-d12e14b4bc40)

![Technology Files](https://github.com/user-attachments/assets/115e9fb5-5cdb-47fa-acde-d3797bbae3a7)

### 📌 Key Learning

By exploring the PDK directory, I understood that the physical-design tools depend on technology-specific files for correct synthesis, implementation, timing analysis, and verification.


## 9️⃣ Lab Work: Setting Up OpenLANE

After exploring the PDK structure, the next step was to prepare the **OpenLANE environment** and check whether the required tools and files were available.

OpenLANE depends on several open-source EDA tools and the selected PDK. Therefore, the environment needs to be configured correctly before starting a design run.

### 🔹 Checking the Environment

I first verified the OpenLANE installation and checked the required directories and configuration files.

The setup mainly involves:

- OpenLANE installation
- SKY130 PDK availability
- Required EDA tools
- Design files
- Configuration files
- Correct directory structure

### 🔹 OpenLANE Directory

The OpenLANE installation contains different folders for designs, scripts, configurations, PDK-related files, and supporting tools.

The design-specific files are placed inside the appropriate design directory before running the flow.

### 🔹 Running OpenLANE

Once the required setup was available, OpenLANE could be started from the terminal. The flow can then be configured for the required design and technology.

A typical workflow is:

```text
OpenLANE Setup
      ↓
Check PDK
      ↓
Prepare Design Files
      ↓
Load Configuration
      ↓
Start OpenLANE
      ↓
Run Design Flow
````

### 📸 OpenLANE Setup

![OpenLANE Setup](https://github.com/user-attachments/assets/82987169-5594-47f0-84fd-a8d47743f01f)

![OpenLANE Environment](https://github.com/user-attachments/assets/afe27646-ceea-4ba6-b805-a490ae529bf1)

### 📌 Key Learning

This lab helped me understand the basic requirements for setting up OpenLANE and the importance of having the correct PDK, tools, configuration files, and directory structure before starting an ASIC design run.


## 🔟 Lab Work: Running OpenLANE on `picorv32a`

After completing the basic OpenLANE setup, I ran the flow using the **picorv32a** design. This helped me understand how a real RTL design passes through the different stages of the ASIC implementation flow.

### 🔹 Preparing the Design

The `picorv32a` design is provided with the required RTL and configuration files. Before starting the run, the design directory and configuration settings were checked.

The main inputs required by the flow include:

- RTL source files
- Clock and timing constraints
- Technology and standard-cell information
- OpenLANE configuration files

### 🔹 Starting the Flow

OpenLANE was launched from the terminal and configured to run the `picorv32a` design.

The flow then processes the design through multiple stages:

```text
picorv32a RTL
      ↓
Synthesis
      ↓
Floorplanning
      ↓
Placement
      ↓
CTS
      ↓
Routing
      ↓
Physical Verification
      ↓
Final Layout
````

### 🔹 Observing the Results

During the run, I observed the generated reports and outputs from the different stages. These results can be used to evaluate the design in terms of area, timing, utilization, and other physical-design parameters.

### 📸 OpenLANE Run

![picorv32a OpenLANE Run](https://github.com/user-attachments/assets/55e2426c-5be0-4476-a9b4-a691b7dd3117)

![OpenLANE Flow Output](https://github.com/user-attachments/assets/bdc7a94f-2d8f-4071-9239-6d16b2d54e65)

![picorv32a Results](https://github.com/user-attachments/assets/c3d8d29d-d06c-42d0-adf9-57d5eefaf9e0)

![Final Design Output](https://github.com/user-attachments/assets/f8aa8506-55c3-4f05-9385-4e6fcd50d734)

### 📌 Key Learning

Running `picorv32a` through OpenLANE gave me practical experience with the complete RTL-to-GDSII flow. I also learned how to examine the outputs generated at different stages and understand the importance of configuration and design constraints.


## 1️⃣1️⃣ What I Learned from Module 1

This module gave me a basic understanding of the **open-source ASIC design flow** and how different EDA tools are used together to convert RTL into a physical chip layout.

### 🔹 Main Concepts I Learned

- Understood how a software description can be converted into hardware.
- Learned the basic stages of the **RTL-to-GDSII** flow.
- Understood the purpose and importance of a **Process Design Kit (PDK)**.
- Explored the structure and resources available in the **SKY130 PDK**.
- Learned about open-source EDA tools such as **Yosys, OpenROAD, OpenSTA, Magic, and Netgen**.
- Understood the role of **OpenLANE** in automating the ASIC implementation flow.
- Learned the basic concept of **Design for Test (DFT)**.
- Understood why **antenna violations** can occur during chip fabrication.
- Learned how different design parameters can be explored using **Design Space Exploration (DSE)**.
- Gained practical experience with the OpenLANE environment and the `picorv32a` design.

### 📌 Overall Learning

The practical exercises helped me connect the theoretical concepts of ASIC design with the actual tools and files used in an open-source physical-design environment.

## 1️⃣2️⃣ About the Author

### 👩‍💻 Vanga Pranvitha

**Department of Electronics and Communication Engineering (ECE)**  
**Anurag University**

This module is part of my learning journey in **VLSI, RTL Design, and Physical Design**, with a focus on understanding open-source EDA tools and the complete RTL-to-GDSII flow.

---



