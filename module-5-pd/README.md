# SKY130 Module 5 — Routing, Verification and Post-Route Analysis

> **VLSI Design & Implementation Workshop**  
> **Author:** Vanga Pranvitha
> **Focus:** Routing • DRC • Power Distribution Network • TritonRoute • RTL-to-GDSII



# Module Introduction

This module covers the closing stages of the **RTL-to-GDSII physical design flow**. The main topics are signal routing, Design Rule Checking (DRC), Power Distribution Network (PDN) creation, global and detailed routing, and the use of TritonRoute.

It explains how a placed circuit is converted into a routed layout, while preserving electrical connections and checking that physical design rules are followed.

The overall flow covered is:

```text
Placed Design
     ↓
Power Distribution Network
     ↓
Global Routing
     ↓
Detailed Routing
     ↓
TritonRoute
     ↓
Design Rule Check
     ↓
Post-Route Verification
     ↓
Final Routed Design
```



# 1. Routing Methods and Design Rule Verification

### `SKY130_D5_SK1`

This part explains the basic routing process and the physical checks carried out after placement.

### Labs Covered

| Lab      | Topic                                          |
| -------- | ---------------------------------------------- |
| `SKY_L1` | Introduction to Maze Routing — Lee's Algorithm |
| `SKY_L2` | Lee's Algorithm — Conclusion                   |
| `SKY_L3` | Design Rule Check                              |



## 1.1 Maze Routing — Lee's Algorithm

Lee's algorithm is a **grid-based maze-routing method** that searches for a connection between a source and destination while steering clear of obstacles.

The basic routing process can be represented as:

```text
Source
  ↓
Grid Expansion
  ↓
Obstacle Avoidance
  ↓
Target Reached
  ↓
Backtracking
  ↓
Final Route
```

It expands through the available grid locations in an organized way until it reaches the target, then traces back to form the route.

### Key Concepts

* Routing grid
* Source and destination
* Obstacles
* Wave propagation
* Path finding
* Backtracking
* Route generation

## Figure 1:


<img width="1206" height="598" alt="image" src="https://github.com/user-attachments/assets/83ae8c8b-b2e3-4dec-afd3-7959280604fb" />

## Figure 2:


<img width="1070" height="592" alt="image" src="https://github.com/user-attachments/assets/710d257b-edeb-415c-bc2e-8d40b067e874" />


## 1.2 Lee's Algorithm — Conclusion

This lab reviews the main properties of maze routing, along with its practical limitations.

Important observations include:

* Systematic path exploration
* Guaranteed path discovery when a valid path exists
* Ability to avoid routing obstacles
* Computational cost for large routing grids
* Relationship between routing algorithms and physical design

These ideas help build an understanding of the routing engines used in modern physical-design tools.

## Figure 1:

<img width="1104" height="595" alt="image" src="https://github.com/user-attachments/assets/fb938a91-4a24-4bd1-bd49-97dea7c8b0ad" />

## Figure 2:

<img width="1263" height="607" alt="image" src="https://github.com/user-attachments/assets/a3d0fb93-7892-4d9f-92f4-d72d12a72de4" />

## 1.3 Design Rule Check — DRC

Once routing is complete, the layout is checked against the design rules defined for the target technology.

Design Rule Check (DRC) identifies layout geometry that may violate manufacturing requirements.

Typical checks include:

* Minimum metal width
* Minimum metal spacing
* Via spacing
* Via enclosure
* Layer connectivity
* Routing geometry
* Design-rule violations

The verification flow can be represented as:

```text
Routed Layout
      ↓
Physical Design Rules
      ↓
DRC Engine
      ↓
Violation Detection
      ↓
Debugging
      ↓
Corrected Layout
```

DRC is an important checkpoint before moving on to the remaining physical-verification steps.

## Figure 1:

<img width="1275" height="592" alt="image" src="https://github.com/user-attachments/assets/d10f8183-12a9-4e86-9d27-ec237f77ea25" />

## Figure 2:

<img width="1265" height="601" alt="image" src="https://github.com/user-attachments/assets/f2ef2391-03b1-4f90-9bf5-46290674d5db" />

---

# 2. Power Delivery and Signal Routing

### `SKY130_D5_SK2`

This section describes the **Power Distribution Network (PDN)** and how the main power straps connect to the power rails of standard cells.

### Labs Covered

| Lab      | Topic                                                             |
| -------- | ----------------------------------------------------------------- |
| `SKY_L1` | Lab steps to build Power Distribution Network                     |
| `SKY_L2` | From power straps to standard-cell power                          |
| `SKY_L3` | Basics of global and detailed routing and configuring TritonRoute |



## 2.1 Power Distribution Network

The **Power Distribution Network (PDN)** carries power and ground across the layout so that the cells can receive their required supplies.

A simplified PDN hierarchy is:

```text
Power Source
     ↓
Power Ring
     ↓
Power Straps
     ↓
Power Rails
     ↓
Standard Cells
```

A properly connected PDN links the supply source to the power connections of the standard cells.

## 2.2 From Power Straps to Standard-Cell Power

This stage examines how the upper-level power network is joined to the power rails used by standard cells.

The flow can be represented as:

```text
Power Straps
     ↓
Power Rails
     ↓
Standard Cell VDD
     ↓
Standard Cell GND
```

This ensures that standard cells placed throughout the design receive the required power and ground connections.



## 2.3 Global Routing & Detailed Routing

Signal routing is generally performed in two main stages:

### Global Routing

Global routing selects approximate paths and allocates routing resources for each net.

```text
Nets
 ↓
Routing Resources
 ↓
Global Routing
 ↓
Route Guides
```

### Detailed Routing

Detailed routing turns the global route guides into actual wires and vias while observing the required design rules.

```text
Global Route
     ↓
Track Assignment
     ↓
Detailed Routing
     ↓
Physical Wires & Vias
```

## Figure 1: Timing report showing a setup slack violation and OpenROAD routing activity

<img width="1059" height="635" alt="image" src="https://github.com/user-attachments/assets/d5ad7467-a51c-4482-b80b-c36c1e8878f1" />

## Figure 2: OpenROAD detailed-routing initialization, LEF/DEF reading and design information

<img width="1058" height="631" alt="image" src="https://github.com/user-attachments/assets/e7f7fee7-187a-4a65-9bca-6c50ba1aa968" />

## Figure 3: Track assignment and routing guide processing

<img width="1365" height="635" alt="image" src="https://github.com/user-attachments/assets/bdb9afb1-c1b7-45ee-a002-1ab8ec5cf4c0" />

## Figure 4: Detailed-routing optimization iterations and violation reduction

<img width="1235" height="634" alt="image" src="https://github.com/user-attachments/assets/d8761bd2-e278-4ef9-abf1-f7292b744df7" />

## Figure 5: Final detailed-routing summary with wire length, vias, runtime and routing statistics

<img width="1248" height="635" alt="image" src="https://github.com/user-attachments/assets/c8c1f2ca-ae7b-451d-9be6-6e0c2952305e" />

---

# 3. Understanding TritonRoute

### `SKY130_D5_SK3`

This section looks at key concepts in **TritonRoute**, the detailed-routing engine used to create physical connections in the design.

### Labs Covered

| Lab      | Topic                                                                                |
| -------- | ------------------------------------------------------------------------------------ |
| `SKY_L1` | TritonRoute Feature 1 — Honors pre-processed route guides                            |
| `SKY_L2` | TritonRoute Features 2 & 3 — Inter-guide connectivity and intra-/inter-layer routing |
| `SKY_L3` | TritonRoute method to handle connectivity                                            |
| `SKY_L4` | Routing topology algorithm and final files after routing                             |



## 3.1 TritonRoute — Pre-Processed Route Guides

TritonRoute relies on information from global routing to guide the detailed-routing process.

Route guides indicate the regions in which the nets are expected to be routed.

```text
Global Routing
      ↓
Route Guides
      ↓
TritonRoute
      ↓
Detailed Routing
```

The routing engine uses these guides while generating the final physical routes.



## 3.2 Inter-Guide Connectivity

Inter-guide connectivity is the process of joining segments of the same net that pass through separate route guides.

The completed route must provide an uninterrupted electrical path between the required connection points.

```text
Guide A
   │
   │ Connectivity
   ↓
Guide B
   │
   ↓
Complete Net
```



## 3.3 Intra-Layer & Inter-Layer Routing

A net may be routed along one metal layer or may move between layers when needed.

### Intra-Layer Routing

Connections are created within the same routing layer.

```text
Metal Layer
───────────────
     Route
───────────────
```

### Inter-Layer Routing

Connections transition between different metal layers using vias.

```text
Metal Layer 2
───────────────
       │
      VIA
       │
───────────────
Metal Layer 1
```

Together, these methods support connections across the different metal layers available in the layout.



## 3.4 TritonRoute Connectivity Handling

TritonRoute aims to preserve electrical connectivity for all nets during detailed routing.

The routing process involves:

```text
Netlist Connectivity
       ↓
Routing Guides
       ↓
Routing Topology
       ↓
Wire & Via Generation
       ↓
Connectivity Verification
```

The goal is to physically connect every required pin that belongs to each net.



## 3.5 Routing Topology Algorithm

Routing topology defines the structure used to connect the terminals of a net.

For multi-terminal nets, the routing topology must provide a connected structure while considering:

* Routing resources
* Obstacles
* Metal layers
* Vias
* Design rules
* Route guides
* Connectivity

After the topology is decided, it is implemented using physical wires and vias.



## 3.6 Final Files After Routing

When detailed routing finishes, the tools produce physical-design files that can be used for later analysis and verification.

Typical post-route information includes:

* Routed DEF
* Routed netlist
* Routing information
* Physical connectivity
* Reports
* DRC-related information
* Final routing database/files

These outputs describe the design as it stands after routing.

## Figure 1: Routing complete ayyaka OpenSTA run, RC extraction and timing analysis

<img width="1260" height="634" alt="image" src="https://github.com/user-attachments/assets/95c8f65e-de28-44fc-815a-d53f9d15934d" />

## Figure 2: 35-fastroute.guide routing guide file contents

<img width="1210" height="632" alt="image" src="https://github.com/user-attachments/assets/d4a71e19-ba2d-4e29-ac46-304fcd04b854" />

## Figure 3: SPEF_EXTRACTOR GitHub repository clone and files

<img width="1260" height="632" alt="image" src="https://github.com/user-attachments/assets/e73c8b14-aee9-4a7d-963d-7e4d43aa0d48" />

## Figure 4: OpenLane tmp directory lo routing-related intermediate files

<img width="949" height="594" alt="image" src="https://github.com/user-attachments/assets/fdbc817a-4bc9-4110-8e82-007bebd61a58" />

## Figure 5: Final results/routing directory with DEF, SPEF and routed design files

<img width="1058" height="621" alt="image" src="https://github.com/user-attachments/assets/a6576f16-4f09-499c-a370-3f40b1104cc8" />

## Figure 6: spef_extraction_setup_and_results

<img width="1061" height="627" alt="image" src="https://github.com/user-attachments/assets/b8e50f66-9bb8-48bd-9638-774f2c60d9c3" />

## Figure 7: openlane_synthesis_and_routing_results

<img width="1065" height="632" alt="image" src="https://github.com/user-attachments/assets/3c07ba80-336b-419f-a1e0-32ba86743d00" />

# Conclusion and Key Takeaways

**SKY130 Module 5** provides practical experience with the final routing activities in the physical-design flow.

The module includes **maze routing and Lee's algorithm, DRC, PDN generation, global routing, detailed routing, and the main features of TritonRoute**.

These labs connect the theory of routing with practical tool output. They show how route guides, connectivity, metal layers, vias, power distribution, and design-rule checks contribute to the final **RTL-to-GDSII implementation**.
