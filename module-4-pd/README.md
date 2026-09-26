# Module 4: Static Timing Closure, Clock Distribution & Backend Implementation

## 📌 Project Summary

This project walks through the backend implementation and timing-verification stages of a complete RTL-to-GDSII flow, built around the PicoRV32A core using the OpenLane automation suite, the OpenROAD engine, and the SKY130 open-source PDK.

The work spans:

RTL Capture → Logic Synthesis → Standard-Cell Mapping → Floorplan Definition → Cell Placement → Clock Tree Construction → Timing Verification → Detailed Routing → Sign-off Checks

Core timing concepts explored in this module include:

* **Setup margin**
* **Hold margin**
* **Arrival time**
* **Required time**
* **Slack**
* **Clock skew**
* **Clock insertion delay**
* **Clock buffer sizing**
* **Crosstalk-driven delay shift**
* **Propagated (real) clock analysis**
* **Ideal clock analysis**

## 🎯 Goals

1. Understand the complete RTL-to-GDSII backend flow.
2. Set up and run an OpenLane implementation flow end-to-end.
3. Implement the PicoRV32A core on the SKY130 PDK.
4. Study logic synthesis and standard-cell technology mapping.
5. Examine the cell-type breakdown produced after synthesis.
6. Understand how cells are distributed during placement.
7. Explore Clock Tree Synthesis (CTS) in detail.
8. Understand how buffers shape clock distribution.
9. Evaluate clock skew and insertion delay.
10. Perform setup and hold timing checks.
11. Study the impact of real interconnect parasitics on delay.
12. Understand crosstalk-driven delay and its effect on skew.
13. Interpret timing reports produced by OpenROAD.
14. Compare ideal-clock and propagated-clock analysis modes.
15. Understand the timing-closure process and slack recovery.

## 🔧 Toolchain

| **Tool / Technology** | **Role**                                              |
| ---------------------- | ------------------------------------------------------ |
| **OpenLane**            | End-to-end RTL-to-GDSII automation flow                |
| **OpenROAD**            | Backend implementation engine and STA                  |
| **Yosys**               | RTL elaboration, synthesis, and logic optimization     |
| **SKY130 PDK**          | Open-source CMOS process and cell library              |
| **Magic**               | Layout viewer and DRC/LVS verification                 |
| **PicoRV32A**           | RISC-V core used as the reference design               |
| **Linux Shell**         | Flow orchestration                                     |
| **Tcl**                 | Scripting for OpenLane/OpenROAD configuration          |
| **Git & GitHub**        | Documentation and version tracking                     |

## 🔬 Flow Sequence

```
RTL Capture
↓
OpenLane Setup
↓
Synthesis
↓
Technology Mapping
↓
Cell Statistics
↓
Floorplan
↓
Placement
↓
Clock Tree Synthesis
↓
Routing
↓
Parasitic Extraction
↓
Timing Verification
↓
Setup/Hold Sign-off
↓
Physical Verification
```

## 1. Routing Layer Coordinate Data

This view displays coordinate data tied to the routing stack — layers such as li1, met1, met2, met3, met4, and met5.

The coordinates mark physical boundaries and reference points for each routing layer, confirming that backend design work is grounded in geometric layout data rather than purely logical connectivity.

<img width="940" height="544" alt="image" src="https://github.com/user-attachments/assets/460b53d1-16d5-4a7f-824b-5758aad39e4e" />

Concepts highlighted:

* Local interconnect (li1)
* Metal stack layers
* Coordinate geometry
* Routing dimensions
* Per-layer geometry rules

Useful for tracing the physical position and routing paths of nets and cells.

## 2. Magic Layout Editor Session

A view of the Magic layout tool operating on SKY130 geometry.

The canvas shows several physical layers — active/diffusion regions, poly, contacts, and metal — along with an open Magic console. The console's grid command reflects the layout grid spacing defined by the SKY130 process.

<img width="940" height="474" alt="image" src="https://github.com/user-attachments/assets/e5af02df-e4c8-4eeb-88ed-fdaaa12585bf" />

Highlights:

* Interactive layout editing
* SKY130 process rules
* Layer-by-layer visualization
* Fixed layout grid
* Built-in design-rule checking
* Physical-level debugging

## 3. Zoomed Standard-Cell Geometry

A close-up of a single standard cell's physical layout.

Distinct colors/patterns mark the different CMOS process layers making up the cell.

<img width="690" height="425" alt="image" src="https://github.com/user-attachments/assets/7e80e3b9-9f55-4630-ba6a-898a4e29c2df" />

Visible structures:

* Metal/interconnect
* Diffusion regions
* Polysilicon gates
* Contact cuts
* Transistor stack
* Power rail connections

Shows how a logical cell definition becomes a physical shape ready for placement and routing.

## 4. OpenLane Run Configuration

The configuration used for implementing PicoRV32A in OpenLane.

Key settings shown:

DESIGN_NAME = picorv32a
CLOCK_PERIOD = 4.500
CLOCK_PORT = clk

<img width="940" height="543" alt="image" src="https://github.com/user-attachments/assets/32023345-9ca1-4fdf-9006-05a9ea94c2eb" />

Also defined: the RTL source pointer and the SDC constraints file.

Configuration establishes:

* Design identifier
* RTL source path
* SDC constraint file
* Target clock period
* Clock port name
* Runtime environment
* Standard-cell library selection

A 4.5 ns clock period targets roughly 222 MHz operation.

## 5. Launching the OpenLane Environment

Startup of the OpenLane toolflow from the shell.

Version reported:

Version: rc3

<img width="940" height="208" alt="image" src="https://github.com/user-attachments/assets/243b5fe3-254d-4398-9045-055a600964c4" />

Shows:

* Flow initialization
* Containerized (Docker) execution
* Version identification
* Shell-driven workflow

OpenLane chains together synthesis, floorplanning, placement, CTS, routing, and verification into one automated sequence.

## 6. Synthesis Output and Flip-Flop Mapping

Synthesis results for the PicoRV32A design.

Generic flip-flops are mapped onto SKY130 sequential cells, for example:

mapped 1572 $DFF_P cells

<img width="940" height="613" alt="image" src="https://github.com/user-attachments/assets/3b197491-fac0-4715-8cb5-65d3c180e247" />

Reported statistics:

* Wire count
* Wire-bit count
* Public wire count
* Total cell count
* Gate-type distribution
* Mapped flip-flop count

Synthesis translates RTL behavior into a gate-level netlist built from the target cell library.

## 7. Cell-Type Breakdown After Mapping

Additional synthesis statistics following technology mapping.

Cell categories reported include:

* AND-type gates
* OR-type gates
* NAND-type gates
* NOR-type gates
* Inverting buffers
* Non-inverting buffers
* Sequential (flip-flop) cells

Estimated die area is also reported:

Chip area for module 'picorv32a'

<img width="940" height="749" alt="image" src="https://github.com/user-attachments/assets/46817632-ed8f-4afa-bb70-91b5339b48a8" />

These numbers give a sense of design complexity and physical footprint.

Key metrics:

* Total cell count
* Cell-type mix
* Net/wire count
* Estimated area
* Mapped-cell inventory

## 8. STA Report Showing a Slack Failure

A timing report captured mid-flow.

Fields included:

* Arrival time
* Required time
* Library setup margin
* Clock definition
* Clock-path delay
* Slack value

Result shown:

slack (VIOLATED)

<img width="940" height="1005" alt="image" src="https://github.com/user-attachments/assets/37259769-d279-4c0c-a5a7-fc246cd2e457" />

A negative slack value means the path fails to meet its timing budget.

This is the core reason STA runs throughout implementation, not just at the end.

Common fixes for violations:

* Upsizing cells
* Adding buffers
* Re-placing cells
* Adjusting clock structure
* Re-routing critical nets

## 9. Power-Conscious Clock Tree Construction

An explanation of power-aware CTS.

<img width="940" height="434" alt="image" src="https://github.com/user-attachments/assets/d4482e5e-4055-4ea9-a9bd-04acde0d2267" />

Two buffering stages are shown:

* Stage 1
* Stage 2

Delay lookup tables are keyed by:

* Input transition (slew)
* Output capacitive load

These tables capture how buffer delay changes with drive conditions and loading.

Illustrates the dual objective of CTS: meeting timing targets while managing dynamic power draw across the clock network.

## 10. Full-Chip Physical Layout

A wide view of the completed physical layout.

The dense fabric represents thousands of placed cells with their associated routing.

<img width="940" height="529" alt="image" src="https://github.com/user-attachments/assets/22ac93c7-d9b0-4021-9123-4d2e79289693" />

Illustrates the shift from:

## Netlist Description → Physical Cell Realization

This density is typical for a processor-class block with a large cell count.

Relevant for evaluating:

* Density distribution
* Placement quality
* Available routing resources
* Utilization
* Chip-level organization

## 11. Close-Up View of Placed Cells and Wiring

A zoomed-in look at placed standard cells and their interconnections.

<img width="940" height="601" alt="image" src="https://github.com/user-attachments/assets/dc90b866-5792-4171-a058-13b847cbfdc9" />

Cell types visible:

* Flip-flops
* NAND-type gates
* NOR-type gates
* AND-type gates
* Other combinational logic

Clock and power routing structures are also present.

Shows how cells sit physically and connect once placement is finalized.

## 12. Clock Tree Synthesis Concept

An illustration of how CTS distributes a clock signal.

Two registers, **FF_A** and **FF_B**, are fed from a shared clock source through the clock tree.

Skew is defined as:

Skew = t_B − t_A

Target condition:

Skew ≈ 0 ps

<img width="940" height="853" alt="image" src="https://github.com/user-attachments/assets/2cac79fc-cf24-40cd-b248-4f27b50fe6ea" />

CTS aims to align clock arrival times across all sequential elements as tightly as feasible.

Skew has direct consequences for:

* Setup margin
* Hold margin
* Max achievable frequency
* Overall timing closure

## 13. Buffer Insertion Along the Clock Network

Demonstrates how buffering is applied across the clock tree.

The network fans out into branches, each driven by inserted buffers sized to their respective loads.

RC behavior and propagation delay through a buffer stage are also depicted.

Buffering is necessary since one clock driver cannot directly and efficiently drive every register in a large design.

<img width="940" height="434" alt="image" src="https://github.com/user-attachments/assets/0c87a996-26f9-49af-aabf-30b0a5061703" />

Buffers contribute to:

* Stronger drive capability
* Controlled edge rates
* Lower cumulative delay
* Effective clock fan-out
* Matched arrival times

## 14. Crosstalk Impact on Delay and Skew

Illustrates how coupling capacitance from adjacent wires alters signal delay.

<img width="940" height="434" alt="image" src="https://github.com/user-attachments/assets/80edcfd8-56d2-4c2d-a11a-c7a09699a831" />

Compares:

Without Aggressor Coupling
Delay = D

versus:

With Aggressor Coupling
Delay = D + Δ

The relationship shown:

L1 = L2 + Δ

and:

SKEW = L1 − (L2 + Δ)

Crosstalk can therefore shift signal timing and, in turn, disturb clock skew — a factor that becomes significant as interconnect scales down.

## 15. Placement Quality and Legality Verification

Output from the placement stage.

Reported statistics:

* Cell count
* Fixed-cell count
* Net count
* Design area
* Utilization percentage
* Row count

Also reported, placement quality metrics:

* Mean displacement
* Peak displacement
* HPWL (half-perimeter wirelength)
* Displacement per placement site
* Displacement per row

Legality results:

row_check  ==> PASS
site_check ==> PASS
power_check ==> PASS
edge_check ==> PASS
placed_check ==> PASS
overlap_check ==> PASS

Confirms the placement satisfies key physical constraints.

## 16. Hold Timing Check with Propagated Clocks

Demonstrates hold analysis using real (propagated) clock timing.

Timing path structure:

**Launching Register → Combinational Path → Capturing Register**

<img width="940" height="434" alt="image" src="https://github.com/user-attachments/assets/4bcff447-4c39-4391-8f53-b669070a3f8f" />

The clock path traverses several buffer stages.

Defined terms:

* Arrival time
* Required time
* Clock uncertainty margin
* Hold requirement
* Clock insertion delay
* Slack

Hold condition expressed as:

θ + Δ₁ > H + Δ₂ + HU

Example parameters used:

Clock Frequency = 1.2 GHz
Clock Period = 0.83 ns

Demonstrates how propagated clock delays factor into hold verification.

## 17. Hold Timing via Internal Flip-Flop Structure

A deeper look at hold timing using the flip-flop's internal master-slave structure.

Modeled using two internal multiplexers:

* MuxA
* MuxB

Shows how data flows through the internal latch stages.

<img width="940" height="434" alt="image" src="https://github.com/user-attachments/assets/31741c35-0945-405f-98c7-be58449410de" />

The waveform relates:

* Clock edge
* Input D
* Internal node Q_M
* Output Q

Explains why internal propagation through the flip-flop takes finite time, and why that time factors into the hold requirement.

## 18. Timing Paths Under Real-Clock Conditions

Timing evaluation using propagated clocks and actual interconnect RC values.

<img width="940" height="434" alt="image" src="https://github.com/user-attachments/assets/2cd14f4e-0b57-4b5c-b01e-89c00453c381" />

Paths traced between:

* Primary inputs
* Registers
* Clock buffers
* Combinational blocks
* Primary outputs
* Clock distribution network

Delay contributors identified:

Interconnect RC delay
+
Buffer/cell delay

Total path delay = cell delay + interconnect delay.

Hold condition (same form as before):

θ + Δ₁ > H + Δ₂ + HU

More representative of silicon behavior than an idealized clock model.

## 19. OpenROAD Clock Propagation Report

An OpenROAD-generated timing report with full clock propagation detail.

<img width="940" height="434" alt="image" src="https://github.com/user-attachments/assets/e22eee41-c9be-4cfc-96f3-29fff19fd38f" />

Report contents:

* Clock source point
* Network insertion delay
* Buffer-stage delays
* Clock reconvergence pessimism removal (CRPR)
* Library setup margin
* Required time
* Arrival time
* Slack

Result reported:

slack (VIOLATED)

Indicates the path under evaluation misses its timing target under these conditions.

Useful for pinpointing exactly which delay component drives the violation.

## 20. Post-CTS Skew Report and Buffer List

Timing results captured after clock-tree construction.

Reported outcome:

slack (MET)

meaning the path satisfies its timing constraint.

<img width="940" height="434" alt="image" src="https://github.com/user-attachments/assets/16704675-c56f-44cc-965f-731aa87b316c" />

Also shown:

report_clock_skew -hold
report_clock_skew -setup

Skew value reported:

0.19

Below this, the CTS buffer-cell selection list is visible.

Shows that the CTS buffer set is a configurable parameter of the flow.

## 21. Placement Snapshot After Re-Configuration

A second placement-stage report for PicoRV32A, taken after config changes.

<img width="940" height="434" alt="image" src="https://github.com/user-attachments/assets/d0ceb389-a03e-460f-b00a-3a760e97453d" />

Reported fields:

* Cell count
* Fixed-cell count
* Net count
* Design area
* Utilization
* Row count
* HPWL
* Displacement metrics

Legality checks again pass:

row_check     ==> PASS
site_check    ==> PASS
power_check   ==> PASS
edge_check    ==> PASS
placed_check  ==> PASS
overlap_check ==> PASS

Confirms a legal placement ready for subsequent stages.

## 22. Timing Evaluation Under Ideal-Clock Assumptions

Timing analysis performed assuming an **ideal clock network.**

<img width="940" height="603" alt="image" src="https://github.com/user-attachments/assets/70752c94-829b-49e9-8b84-1886856cc095" />

Paths span:

* Registers
* Buffer stages
* Combinational logic
* Clock distribution
* Isolation/decoupling elements

Paths between sequential stages are highlighted for reference.

Ideal-clock mode assumes a perfect, zero-skew clock distribution prior to actual CTS results being available.

Useful for isolating:

**Data-path contributions**

from:

**Clock-network contributions**

Buffers and clock-related elements are also marked in the diagram.

## 23. Setup Timing Under Ideal-Clock Assumptions

Explains setup checking under an idealized clock model.

The flip-flop's internal mux structure is used again:

* MuxA
* MuxB

Waveform relationships shown:

* Clock
* Data (D)
* Internal node Q_M
* Output Q

Key point: data must settle at the internal capture node with enough margin ahead of the triggering clock edge.

**A minimum interval before the clock edge is required for data to reach the internal storage node.**

This internal margin is what defines the flip-flop's setup requirement.

**📊 Core Timing Definitions**

**Setup Time**

The minimum interval for which data must hold steady before the triggering clock edge.

Data must settle before:
                    ↓
                Clock Edge

A setup violation happens when data shows up too late relative to the edge.

**Hold Time**

The minimum interval for which data must remain steady after the triggering clock edge.

Clock Edge
    ↓
Data must hold steady

A hold violation happens when data changes too soon after the edge.

<img width="940" height="367" alt="image" src="https://github.com/user-attachments/assets/f9560748-dd69-4266-929a-2eed92d1fbc0" />

**Arrival Time**

The point at which data actually reaches the capturing element.

Influenced by:

* Cell delay
* Interconnect delay
* Buffer stages
* Routing parasitics

**Required Time**

The latest moment by which data must arrive to satisfy the timing constraint.

**Slack**

The margin between required and actual timing.

For setup checks:

Slack = Required Time − Arrival Time

Interpretation:

Positive Slack → Constraint satisfied
Zero Slack     → Boundary condition
Negative Slack → Constraint violated

# ⏱️ Ideal Clock vs Propagated Clock

| **Attribute**        | **Ideal Clock**           | **Propagated Clock**       |
| ---------------------- | -------------------------- | ---------------------------- |
| Clock network model     | Idealized, zero-delay      | Fully implemented           |
| Buffer delay            | Not modeled in detail      | Fully accounted for         |
| Clock skew              | Assumed negligible         | Measured and included       |
| Interconnect RC         | Simplified/ignored         | Fully included              |
| CTS effects             | Not reflected              | Fully reflected              |
| Overall accuracy        | Early-stage estimate       | Silicon-representative       |

### 🌳 CTS Process Flow

**Clock Source
↓
Buffer Insertion
↓
Tree Branching
↓
Signal Distribution
↓
Sequential Elements**

Primary goals:

Minimize clock skew
Manage insertion delay
Keep slew within bounds
Handle capacitive fan-out load
Distribute clock evenly across the die
Meet setup and hold targets

## 🧮 Achieving Timing Closure

Timing closure refers to iteratively adjusting the physical implementation until all timing constraints are met.

Common techniques:

1. Cell up/down-sizing
2. Buffer insertion
3. Buffer resizing
4. Placement refinement
5. Clock-tree tuning
6. Routing adjustments
7. Trimming excess wire delay
8. Skew reduction
9. Critical-path optimization

The end goal is positive (or zero) slack across every timing path that matters.

## 🏁 Wrap-Up

Module 4 traces the journey from a synthesized RTL netlist to a fully placed, clocked, and timing-verified physical design.

The overall flow connects:

## Synthesis → Placement → Clock Tree Synthesis → Routing → Parasitic Extraction → Static Timing Analysis → Timing Closure

The captured results illustrate a practical PicoRV32A implementation on the SKY130 process using the OpenLane/OpenROAD toolchain.

The module underscores how physical implementation choices affect timing through:

* Cell delay
* Interconnect RC delay
* Clock insertion delay
* Clock skew
* Crosstalk coupling
* Buffer delay
* Setup/hold requirements

In short, a successful physical design needs both **geometric legality and timing correctness.**

## 👤 Author

**Vanga Pranvitha**
[RTL Workshop Repository](https://github.com/madapaamrutha-svg/RTL_Workshop)
