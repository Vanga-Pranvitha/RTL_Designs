# 🟨 Module-2 — Physical Design: Floorplan, Placement, Power Distribution & CTS



## 📖 Module Overview

This module focuses on the **physical design stage of the ASIC flow**, where the synthesized gate-level netlist is converted into a physical layout suitable for fabrication.

The module covers important physical-design concepts such as **floorplanning, core and die dimensions, utilization, aspect ratio, preplaced cells, decoupling capacitors, power planning, pin placement, placement blockages, global placement, detailed placement, library characterization, and clock tree synthesis**.

It also goes one level deeper into the **design of standard cells**, including transistor-level design, Euler paths, stick diagrams, DRC, LVS, and parasitic extraction. The concepts are connected to a practical **OpenLane implementation using the `picorv32a` design**.

|                      |                                                           |
| -------------------- | --------------------------------------------------------- |
| 🛠️ **Tools Used**   | OpenLane, OpenROAD, Magic, Yosys                          |
| 🧩 **Design Used**   | `picorv32a` RISC-V Core                                   |
| 📋 **Prerequisites** | Module-1 synthesis flow and basic standard-cell knowledge |

## 📑 Contents

1. Physical Floorplanning

   * 1.1 Understanding Core and Die
   * 1.2 Core Utilization and Aspect Ratio
   * 1.3 Preplaced and Fixed Cells
   * 1.4 Decap Cells and Power Distribution
   * 1.5 I/O Pin Placement
   * 1.6 Placement Restrictions
2. Standard-Cell Placement

   * 2.1 Global Placement
   * 2.2 Detailed Placement and Optimization
3. Timing Libraries and Clock Tree Synthesis

   * 3.1 NLDM and CCS Characterization
   * 3.2 Clock Tree Synthesis
4. Standard-Cell Creation Flow

   * 4.1 Cell Design Inputs
   * 4.2 Circuit Design and Characterization
   * 4.3 Euler Path and Stick Diagram
   * 4.4 DRC, LVS and Parasitic Extraction
5. Practical Lab — Floorplan and Placement of `picorv32a`
6. Key Learnings

---

## 1️⃣ Physical Floorplanning

### 1.1 Core and Die Structure

<img width="796" height="667" alt="Screenshot 2026-09-06 171141" src="https://github.com/user-attachments/assets/80fa165f-c135-497f-add2-fe634ed0d767" />

A semiconductor wafer contains several repeated rectangular regions called **dies**. Each die represents the complete physical area associated with an individual chip.

Within the die is the **core area**, where the standard cells and other logical elements are placed and routed. The region outside the core provides space for I/O pads, ESD structures and portions of the power distribution network.

Therefore, the die represents the complete chip area, whereas the core is the main region used for implementing the digital logic.

### 1.2 Core Utilization and Aspect Ratio

<img width="1655" height="1078" alt="Screenshot 2026-09-06 171220" src="https://github.com/user-attachments/assets/7b0c13ad-9c03-4548-b7df-c55b25a77268" />

During floorplanning, the dimensions of the core and die have to be determined before standard-cell placement begins.

Two important parameters used for this are **utilization factor** and **aspect ratio**.

* **Utilization Factor** = Area occupied by logical cells / Total core area.
  It indicates how much of the available core area is occupied by cells. Very high utilization leaves insufficient space for routing, so practical designs generally maintain some free area.

* **Aspect Ratio** = Height / Width.
  An aspect ratio of 1 represents a square core. A value greater or smaller than 1 results in a rectangular core.

The required values depend on the cell count, routing requirements and physical constraints of the design.

### 1.3 Preplaced and Fixed Cells

<img width="1437" height="1077" alt="Screenshot 2026-09-06 171321" src="https://github.com/user-attachments/assets/f4adf99b-5e49-4bda-b57b-841347a0c914" />

<img width="1670" height="1065" alt="Screenshot 2026-09-06 171330" src="https://github.com/user-attachments/assets/09e753e4-9e02-4652-8c18-446d6b84130a" />

Some blocks in an ASIC are larger than ordinary standard cells and cannot simply be placed automatically.

Examples include **memory blocks, clock-related cells, comparators, multiplexers and hard IP blocks**. These blocks are assigned fixed positions during floorplanning.

Once their locations are decided, the automatic placement tool considers them as obstacles and places the remaining standard cells around them.

### 1.4 Decoupling Capacitors and Power Distribution

A large number of gates can switch at the same time and suddenly demand current from the power network. Since the power network contains resistance and inductance, the supply voltage can temporarily decrease or fluctuate.

This effect can produce **voltage droop and ground bounce**, which may affect the reliability of digital logic.

<img width="1642" height="328" alt="Screenshot 2026-09-06 171549" src="https://github.com/user-attachments/assets/fcc5b53b-d2c7-424a-be87-863821f5d84c" />

<img width="1731" height="1027" alt="Screenshot 2026-09-06 171432" src="https://github.com/user-attachments/assets/2dd64ea1-cac2-43a7-b03a-012c2ea46daf" />

When the voltage variation becomes large enough, the signal may enter the undefined region between **Vil** and **Vih**. This can result in incorrect logic interpretation.

#### Decoupling Capacitors

**Decoupling capacitors, or decaps**, help reduce these local supply fluctuations.

<img width="1537" height="1056" alt="Screenshot 2026-09-06 171519" src="https://github.com/user-attachments/assets/2e6d68b1-eb30-42cf-9090-3138bd9f54f5" />

<img width="1547" height="968" alt="Screenshot 2026-09-06 171458" src="https://github.com/user-attachments/assets/270995c9-cf61-4cc0-bf9e-a2bb4c4b5c8e" />

A decap is placed close to switching cells and connected between the power rails. It stores charge and can provide current locally when a switching event occurs. This reduces the effect of the resistance and inductance present in the longer power path.

In the floorplan, decap cells such as **DECAP1, DECAP2 and DECAP3** can be placed around fixed blocks to support local power stability.

#### Power Distribution Network

Apart from local decaps, the entire design requires a reliable **Power Distribution Network (PDN)**.

<img width="1781" height="1078" alt="Screenshot 2026-09-06 171608" src="https://github.com/user-attachments/assets/0ac5af3a-67b9-4438-9329-1de49ad1d186" />

The PDN consists of horizontal and vertical power straps that distribute **VDD and VSS** throughout the core.

Power planning is performed early because sufficient routing resources must be reserved for both power and signal connections.

### 1.5 I/O Pin Placement

<img width="1856" height="1078" alt="Screenshot 2026-09-06 171658" src="https://github.com/user-attachments/assets/cee1e091-342e-4187-b834-a7e2b9b6da4d" />

After deciding the locations of fixed blocks and the power network, the input and output pins are assigned physical positions.

Examples include `Din1..4`, `Dout1..4`, `Clk1`, `Clk2`, `ClkOut` and other interface signals.

Good pin placement helps reduce routing complexity and allows signals to reach their corresponding internal blocks efficiently.

### 1.6 Placement Blockages

<img width="1588" height="1078" alt="Screenshot 2026-09-06 171718" src="https://github.com/user-attachments/assets/d2ec3d35-547e-4c30-9b2b-d02027e564d4" />

A **placement blockage** prevents the automatic placer from inserting standard cells into regions that are already occupied or reserved.

These restrictions can be applied around preplaced blocks and other reserved regions.

After fixing the pins, preplaced blocks, decaps, power network and placement blockages, the floorplan is ready for the placement stage.

---

## 2️⃣ Standard-Cell Placement

### 2.1 Global Placement

Once the floorplan is complete, the placer assigns approximate positions to the standard cells generated during synthesis.

This first stage is called **global placement**.

The main objectives are to obtain a good distribution of cells, reduce estimated wirelength and maintain reasonable cell density. At this stage, cells may not yet be placed at their final legal positions.

### 2.2 Detailed Placement and Optimization

<img width="1317" height="661" alt="Screenshot 2026-09-06 174201" src="https://github.com/user-attachments/assets/93b3a8d5-0108-45d1-b5e7-f861955c8651" />

After global placement, **detailed placement** is performed.

The cells are aligned with the legal placement rows and site grid, while overlaps are removed. The tool also performs local optimization to improve timing and reduce unnecessary wirelength.

At this stage, timing information becomes increasingly important because cell delay and interconnect effects influence the final placement quality.

---

## 3️⃣ Timing Libraries and Clock Tree Synthesis

### 3.1 NLDM, CCS and Cell Characterization

<img width="1066" height="317" alt="Screenshot 2026-09-06 174419" src="https://github.com/user-attachments/assets/f43ac468-3ff2-4e55-87c8-15a4447d5ab4" />

Physical-design tools require accurate information about the delay, transition and power behavior of standard cells.

Two commonly used timing models are **NLDM** and **CCS**.

* **NLDM — Non-Linear Delay Model:**
  Uses lookup tables to represent cell delay and output transition based on input transition and output load capacitance.

* **CCS — Composite Current Source:**
  Represents the output behavior using a current-source based model. It provides more detailed waveform information and can improve accuracy for advanced timing, noise and crosstalk analysis.

These models are generated through **cell characterization**, where cells are simulated across different input slews, loads and operating conditions using SPICE.

The resulting information is stored in Liberty `.lib` files and is used by synthesis, timing analysis and physical-design tools.

### 3.2 Clock Tree Synthesis

After placement, the clock signal has to reach all sequential elements with controlled delay.

<img width="1066" height="317" alt="Screenshot 2026-09-06 174419" src="https://github.com/user-attachments/assets/f43ac468-3ff2-4e55-87c8-15a4447d5ab4" />

**Clock Tree Synthesis (CTS)** creates a structured network of buffers and inverters between the clock source and the clock pins of flip-flops.

The main objectives of CTS are:

* Reduce **clock skew**
* Control **clock insertion delay**
* Provide balanced clock distribution
* Maintain reliable clock timing across the design

Instead of using one long direct connection, the clock is distributed through a balanced tree so that different flip-flops receive the clock with similar delays.

---

## 4️⃣ Standard-Cell Creation Flow

The previous sections treated standard cells as ready-to-use building blocks. In this section, the design process of an individual standard cell is considered.

<img width="1886" height="1078" alt="Screenshot 2026-09-06 175120" src="https://github.com/user-attachments/assets/dede17c2-577d-4a20-8d2f-0babd450b173" />

### 4.1 Inputs Required for Cell Design

A standard-cell designer works with information supplied by the **Process Design Kit (PDK)**.

The major inputs include:

* **Process Design Rules:** Define layout constraints such as minimum width, spacing and extensions.
* **SPICE Models:** Provide transistor-level models required for circuit simulation.
* **Cell Specification:** Defines the required logic function, pin configuration and drive strength.

<img width="1917" height="1078" alt="Screenshot 2026-09-06 175328" src="https://github.com/user-attachments/assets/32551ae9-60a2-4d4b-8923-e80143faf309" />

### 4.2 Transistor-Level Circuit Design and Characterization

The first step is to construct the transistor-level circuit according to the required logic function.

The PMOS and NMOS devices are sized appropriately to achieve the required electrical behavior, such as switching characteristics and noise margins.

After simulation confirms correct operation, the cell is characterized for parameters such as:

* Propagation delay
* Power consumption
* Output transition
* Noise margins

Characterization is performed across different **process, voltage and temperature (PVT) conditions**.

### 4.3 Euler Path and Stick Diagram

<img width="1877" height="1078" alt="Screenshot 2026-09-06 175642" src="https://github.com/user-attachments/assets/87306482-7b68-4473-9b49-42466ab98d73" />

<img width="1255" height="671" alt="Screenshot 2026-09-06 180144" src="https://github.com/user-attachments/assets/fc906999-f818-4dfd-9c5e-33060c106893" />

The transistor schematic is converted into a compact physical layout using concepts from graph theory.

An **Euler path** is a path through a graph that visits every edge exactly once. For CMOS logic, a suitable common Euler path for the PMOS and NMOS networks can help arrange the transistors efficiently.

Using a suitable transistor ordering reduces diffusion breaks and allows the layout to occupy less area.

A **stick diagram** is then used as an intermediate representation. It shows the approximate connectivity and arrangement of:

* Polysilicon
* Diffusion
* Metal

without specifying the exact physical dimensions.

### 4.4 DRC, LVS and Parasitic Extraction

Layout rules can be represented using **lambda (λ)**, where λ is related to the minimum feature size of the technology.

After completing the layout, several verification steps are performed.

* **DRC — Design Rule Check:**
  Checks whether the layout satisfies the geometric rules defined by the PDK.

* **LVS — Layout Versus Schematic:**
  Compares the extracted layout netlist with the original schematic to confirm that they represent the same circuit.

Parasitic extraction can then be used to obtain the resistance and capacitance introduced by the physical layout.

Only after successful verification can the cell be considered suitable for inclusion in a standard-cell library.

---

## 5️⃣ Practical Lab — Floorplan and Placement of `picorv32a`

The concepts discussed above were applied to the `picorv32a` RISC-V design using the **OpenLane flow**.

The working directory was accessed using:

```bash
cd ~/Desktop/work/tools/openlane_working_dir/openlane
# inside the OpenLane flow shell
```

<img width="1917" height="1018" alt="Screenshot 2026-09-06 172157" src="https://github.com/user-attachments/assets/d14727d4-7928-4a05-b5f2-24a3068cd90f" />

The floorplan stage generates the physical dimensions and placement information for the design.

The generated floorplan DEF file can be inspected using:

```bash
cd designs/picorv32a/runs/06-09_11-26/results/floorplan
ls -ltr
less picorv32a.floorplan.def
```

<img width="1917" height="1020" alt="Screenshot 2026-09-06 172538" src="https://github.com/user-attachments/assets/9da89218-3ab4-4e24-8d90-a0b6519a57be" />

The resulting floorplan can be opened in **Magic** for physical inspection and DRC-related checking.

<img width="1275" height="733" alt="layout" src="https://github.com/user-attachments/assets/f4bc2a99-72e7-47eb-9333-0e832a8a69c5" />

<img width="962" height="668" alt="layout1" src="https://github.com/user-attachments/assets/bdb97531-887d-4602-8051-866bc0b48e14" />

The Magic view shows the physical die area and the placement rows that are available for standard-cell placement.

After completing the floorplan, the placement stage produces a more detailed physical representation in which the synthesized standard cells are positioned within the available rows.

<img width="1038" height="641" alt="placementmagic" src="https://github.com/user-attachments/assets/792d1a97-87c0-435f-b2d8-51db755e4116" />

<img width="1073" height="703" alt="placement1" src="https://github.com/user-attachments/assets/818d0b0f-8c1c-40b4-a1f0-9d528a5aa8c6" />

---

## 6️⃣ Key Learnings

* ✅ Understood the difference between the **core and die** and their importance during floorplanning.
* ✅ Learned how **utilization factor and aspect ratio** influence core dimensions.
* ✅ Studied the purpose of **preplaced cells** and their role as fixed physical blocks.
* ✅ Understood **voltage droop and ground bounce** caused by non-ideal power networks.
* ✅ Learned how **decoupling capacitors and PDNs** help maintain stable power distribution.
* ✅ Studied **pin placement and placement blockages** before automatic cell placement.
* ✅ Differentiated between **global placement and detailed placement**.
* ✅ Learned the purpose of **NLDM and CCS timing models** in timing-driven physical design.
* ✅ Understood **Clock Tree Synthesis** and its role in controlling clock skew and insertion delay.
* ✅ Studied the standard-cell development process from **PDK inputs and transistor-level design to layout verification**.
* ✅ Understood the use of **Euler paths and stick diagrams** for compact CMOS layout design.
* ✅ Learned the importance of **DRC and LVS** before adding a cell to a standard-cell library.
* ✅ Performed the **floorplan and placement stages of `picorv32a` using OpenLane** and inspected the generated layout using Magic.

## 👤 AUTHOR

**Vanga Pranvitha**

