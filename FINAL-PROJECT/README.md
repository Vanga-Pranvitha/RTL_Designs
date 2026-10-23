# 💊 Pill Reminder Timer Controller Using Verilog HDL

![Verilog](https://img.shields.io/badge/HDL-Verilog-blue)
![Simulation](https://img.shields.io/badge/Simulation-PASS-brightgreen)
![Synthesis](https://img.shields.io/badge/Synthesis-Yosys-orange)
![Physical Design](https://img.shields.io/badge/Physical%20Design-In%20Progress-yellow)
![Status](https://img.shields.io/badge/Project-Academic%20Project-purple)

## 📑 Table of Contents

1. [Project Overview](#1-project-overview)
2. [Problem Statement](#2-problem-statement)
3. [Project Objectives](#3-project-objectives)
4. [Proposed System](#4-proposed-system)
5. [Tools and Technologies](#5-tools-and-technologies)
6. [Project Directory Structure](#6-project-directory-structure)
7. [Digital Design Fundamentals](#7-digital-design-fundamentals)
8. [RTL Design](#8-rtl-design)
9. [Functional Verification](#9-functional-verification)
10. [Simulation Results](#10-simulation-results)
11. [Logic Synthesis Using Yosys](#11-logic-synthesis-using-yosys)
12. [Gate-Level Simulation](#12-gate-level-simulation)
13. [RTL-to-GDSII Design Flow](#13-rtl-to-gdsii-design-flow)
14. [Physical Design Stages](#14-physical-design-stages)
15. [Floorplanning](#15-floorplanning)
16. [Placement](#16-placement)
17. [Clock Tree Synthesis](#17-clock-tree-synthesis)
18. [Routing](#18-routing)
19. [Physical Verification](#19-physical-verification)
20. [Layout and GDSII Generation](#20-layout-and-gdsii-generation)
21. [Results Summary](#21-results-summary)
22. [Challenges and Learning Outcomes](#22-challenges-and-learning-outcomes)
23. [Future Enhancements](#23-future-enhancements)
24. [Conclusion](#24-conclusion)
25. [References](#25-references)

---

## 1. Project Overview

The **Pill Reminder Timer Controller** is a digital hardware design project developed using Verilog Hardware Description Language (HDL). The project focuses on implementing a timer-based controller that can support medicine reminder operations through digital logic.

The design process begins with Register Transfer Level (RTL) coding and continues through functional verification, logic synthesis, and gate-level simulation. The next stage involves physical implementation, where the synthesized design is converted into a physical integrated-circuit layout using an RTL-to-GDSII design flow.

This project provides practical experience with digital system design, hardware simulation, logic synthesis, timing-related concepts, and semiconductor physical design tools.

### Project Information

| Parameter | Description |
|---|---|
| Project Name | Pill Reminder Timer Controller |
| Design Language | Verilog HDL |
| Design Level | Register Transfer Level (RTL) |
| Functional Simulation | Icarus Verilog |
| Waveform Viewer | GTKWave |
| Synthesis Tool | Yosys |
| Physical Design Flow | OpenLane |
| Target Technology | SkyWater SKY130 PDK |
| Layout Support | Magic |
| Current Status | RTL, synthesis and gate-level checks passed; physical design pending |

## 2. Problem Statement

Medication schedules require users to remember when to take their medicines. Forgetting a scheduled dose may affect the consistency of a medication routine. A timer-based digital controller can provide the underlying timing and control logic required for a reminder system.

The objective of this project is to design and verify a digital controller in Verilog HDL and explore how that logic can be synthesized into a hardware representation. The project also studies the steps needed to convert the synthesized circuit into a physical layout.

**Note:** This project implements digital controller logic. Actual medication delivery, real-time clock accuracy, audible alerts, display interfaces, and clinical use require additional hardware, software, and validation where applicable.

## 3. Project Objectives

The major objectives are listed below.

| No. | Objective | Purpose |
|---:|---|---|
| 1 | RTL design | Describe the controller using Verilog HDL |
| 2 | Functional simulation | Verify expected logic behaviour |
| 3 | Testbench development | Apply test inputs and check outputs |
| 4 | Waveform analysis | Observe signal transitions over time |
| 5 | Logic synthesis | Convert RTL into a gate-level representation |
| 6 | Netlist validation | Test the synthesized circuit |
| 7 | Physical design | Explore floorplanning, placement and routing |
| 8 | Layout verification | Check physical design rules and connectivity |
| 9 | GDSII generation | Prepare the final layout representation after successful implementation |

## 4. Proposed System

The project follows a digital hardware development process. Each stage produces an output that is used by the next stage.

### High-Level Workflow

```text
Specification
     |
     v
Verilog RTL Design
     |
     v
Testbench Development
     |
     v
RTL Simulation
     |
     v
Logic Synthesis (Yosys)
     |
     v
Gate-Level Netlist
     |
     v
Gate-Level Simulation
     |
     v
Physical Design (OpenLane)
     |
     v
Floorplanning and Placement
     |
     v
Clock Tree Synthesis
     |
     v
Routing and Physical Verification
     |
     v
Final Layout / GDSII
```

**Workflow explanation:** RTL simulation checks the logical behaviour of the design before synthesis. Synthesis generates a netlist, and gate-level simulation checks that netlist. Physical design then implements the circuit using the selected technology library and physical design rules.



## 5. Tools and Technologies

| Tool / Technology | Application in the Project |
|---|---|
| Verilog HDL | Describes the controller logic |
| Icarus Verilog | Compiles and runs Verilog simulations |
| GTKWave | Displays simulation waveforms |
| Yosys | Performs logic synthesis and netlist generation |
| OpenLane | Automates the RTL-to-GDS physical design process |
| SKY130 PDK | Provides technology-specific information for physical implementation |
| Magic | Supports layout viewing and physical verification |
| Linux / Ubuntu | Development environment for command-line EDA tools |
| Docker | Provides a containerized environment for tools such as OpenLane |

### Why These Tools Are Used

- **Verilog HDL:** Allows digital hardware to be described through modules, signals, registers and logic.
- **Icarus Verilog:** Makes it possible to test the design without fabricating hardware.
- **GTKWave:** Helps inspect clock, reset, input and output signal behaviour.
- **Yosys:** Converts the RTL description into a synthesized netlist.
- **OpenLane:** Coordinates physical design stages using the configured technology and design settings.
- **SKY130 PDK:** Supplies technology-specific libraries and physical rules needed by supported implementation flows.
- **Magic:** Helps inspect physical layouts and perform supported layout checks.

## 6. Project Directory Structure

The project uses separate directories for design source files and testbenches. Generated reports and simulation artifacts are kept separately from the RTL source.

```text
final-project/
│
├── src/
│   └── pill_reminder.v
│
├── tb/
│   ├── tb_pill_reminder.v
│   └── tb_pill_reminder_gls.v
│
├── pill_reminder_netlist.v
├── pill_reminder_gls.v
├── yosys.log
├── gls_synthesis.log
├── dump.vcd
├── sim.out
├── gls.out
├── RESULTS.txt
└── README.md
```

| File / Directory | Description |
|---|---|
| `src/pill_reminder.v` | Main RTL design |
| `tb/tb_pill_reminder.v` | RTL testbench |
| `tb/tb_pill_reminder_gls.v` | Gate-level simulation testbench |
| `pill_reminder_netlist.v` | Generated synthesized netlist |
| `pill_reminder_gls.v` | Netlist used for gate-level simulation |
| `yosys.log` | Synthesis log |
| `gls_synthesis.log` | Gate-level synthesis or preparation log |
| `dump.vcd` | Simulation waveform data |
| `sim.out` | RTL simulation output, if retained |
| `gls.out` | Gate-level simulation output, if retained |
| `RESULTS.txt` | Summary of recorded project results |
| `README.md` | Project documentation |

*Generated filenames can differ depending on the commands and tool configuration used.*

## 7. Digital Design Fundamentals

### 7.1 Hardware Description Language

A Hardware Description Language (HDL) describes the structure and behaviour of digital circuits. Verilog is widely used to design and verify combinational and sequential logic.

### 7.2 Register Transfer Level

Register Transfer Level describes a digital system in terms of registers, data movement, clocked operations and logic between registers. RTL is a common starting point for synthesis.

### 7.3 Combinational Logic

Combinational logic produces outputs based on current input values. Examples include Boolean logic, multiplexers, decoders and comparators.

### 7.4 Sequential Logic

Sequential logic stores state and normally changes that state in response to a clock edge or another specified event. Registers, counters and finite-state machines are examples of sequential logic.

### 7.5 Testbench

A testbench is a simulation environment that applies input conditions to the design and checks whether the resulting outputs match expected behaviour.

### 7.6 Netlist

A netlist represents a circuit as connected logic cells and signals. A synthesized netlist is produced from RTL by a synthesis tool.

## 8. RTL Design

The main design source is `src/pill_reminder.v`.

RTL design translates the controller requirements into synthesizable Verilog. Depending on the implementation, this may involve registers, counters, control conditions, state transitions and output logic.

### RTL Development Process

| Step | Activity | Expected Outcome |
|---:|---|---|
| 1 | Identify the required controller behaviour | Design requirements |
| 2 | Define input and output signals | Module interface |
| 3 | Implement control and timing logic | RTL source |
| 4 | Compile the RTL | Syntax and elaboration checks |
| 5 | Simulate using a testbench | Functional results |
| 6 | Correct any detected issues | Verified RTL |

<img width="681" height="646" alt="VirtualBox_vsdworkshop_23_10_2026_23_48_24" src="https://github.com/user-attachments/assets/aee99bc4-939a-4559-a0a4-66e946bed46e" />

<img width="681" height="646" alt="VirtualBox_vsdworkshop_24_10_2026_03_21_23" src="https://github.com/user-attachments/assets/ce149988-bda1-4f89-b74e-91e274971403" />



## 9. Functional Verification

Functional verification checks whether the RTL behaves according to its intended logic.

The RTL testbench provides stimulus to the design and evaluates the resulting responses. Simulation can expose issues such as incorrect control conditions, unexpected state transitions, counter behaviour errors or incorrect outputs.

### Verification Process

1. Compile the design and its testbench.
2. Run the simulation.
3. Observe the test results.
4. Inspect waveforms if necessary.
5. Correct any failures and rerun the tests.

### Verification Terminology

| Term | Meaning |
|---|---|
| Test stimulus | Inputs applied during simulation |
| Expected output | Result predicted from the design specification |
| Actual output | Result produced by the simulated design |
| Check | Comparison between expected and actual behaviour |
| Error count | Number of failed checks reported by the testbench |
| PASS | The testbench's recorded checks completed without reported errors |

### RTL Simulation Result

The recorded RTL simulation completed **96 checks with 0 errors**.

<img width="681" height="646" alt="VirtualBox_vsdworkshop_24_10_2026_03_21_23" src="https://github.com/user-attachments/assets/1ba434ce-5669-4e8e-b108-22d86c39bd66" />


## 10. Simulation Results

Simulation results provide evidence that the design was tested before physical implementation.

| Verification Item | Recorded Result | Interpretation |
|---|---|---|
| RTL simulation checks | 96 | Functional testbench checks completed |
| RTL simulation errors | 0 | No errors reported by the recorded testbench run |
| Waveform generation | `dump.vcd` | Waveform data file is present in the project artifacts |
| Gate-level checks | 94 | Gate-level testbench checks completed |
| Gate-level errors | 0 | No errors reported by the recorded gate-level run |

A zero-error result confirms the recorded checks passed. It does not, by itself, guarantee that every possible input condition has been tested or that the final physical circuit is free from all defects.

### Waveform Analysis Using GTKWave

A Value Change Dump (VCD) file records signal changes during simulation. GTKWave can display these changes against simulation time.

Waveform analysis can help examine:

- Clock transitions.
- Reset behaviour.
- Changes in control signals.
- State transitions, where applicable.
- Output responses to test inputs.
- Timing relationships between signals.

<img width="1366" height="655" alt="VirtualBox_vsdworkshop_23_10_2026_20_02_00" src="https://github.com/user-attachments/assets/cdcce63d-52a2-4f73-a949-a6dfd87b2cae" />


## 11. Logic Synthesis Using Yosys

Logic synthesis converts the RTL design into a network of logic cells and connections.

Yosys reads and processes the Verilog source, performs synthesis transformations and generates a netlist. The synthesis report provides information about the resulting logic structure.

### Synthesis Process

| Stage | Description |
|---|---|
| RTL reading | Reads the Verilog source |
| Design preparation | Processes the module hierarchy and design representation |
| Logic optimization | Simplifies and optimizes logic |
| Technology-independent synthesis | Converts the design into a generic logic representation |
| Netlist generation | Writes the synthesized circuit representation |
| Report inspection | Checks cell counts, warnings and synthesis status |

### Recorded Synthesis Result

| Parameter | Result |
|---|---:|
| Generic cell count | 57 |
| Reported synthesis problems | 0 |
| Recorded status | PASS |

The reported 57 cells are **generic synthesis cells**, not a confirmed count of final SKY130 standard cells. Technology mapping and physical implementation can change the cell count.

### Why Synthesis Is Important

- Converts behavioural RTL into a circuit representation.
- Helps identify synthesis warnings and unsupported constructs.
- Provides a netlist for downstream verification.
- Supplies an input to the physical design flow.

<img width="1366" height="655" alt="VirtualBox_vsdworkshop_23_10_2026_20_05_17" src="https://github.com/user-attachments/assets/b46b5dc3-74ef-4539-8a8d-1233edd24b69" />


## 12. Gate-Level Simulation

Gate-level simulation verifies the generated netlist by simulating the circuit representation after synthesis.

It helps identify differences between RTL behaviour and the synthesized logic. The usefulness of the comparison depends on the netlist, testbench, simulation models and checks used.

### RTL Simulation vs Gate-Level Simulation

| Feature | RTL Simulation | Gate-Level Simulation |
|---|---|---|
| Input design | Verilog RTL | Synthesized netlist |
| Main purpose | Verify design behaviour | Validate synthesized logic behaviour |
| Representation | Higher-level RTL constructs | Gate or cell-level circuit representation |
| Typical checks | Functional behaviour | Behaviour after synthesis |
| Timing model | Often idealized | May use ideal or cell-delay models, depending on setup |

### Recorded Gate-Level Result

- Checks completed: **94**
- Errors reported: **0**
- Recorded status: **PASS**


<img width="681" height="646" alt="VirtualBox_vsdworkshop_23_10_2026_22_22_40" src="https://github.com/user-attachments/assets/0c23a6a8-1883-4fd8-9b69-e005927d983b" />


## 13. RTL-to-GDSII Design Flow

RTL-to-GDSII is the process of converting a hardware description into a physical integrated-circuit layout.

| Stage | Input | Output | Purpose |
|---|---|---|---|
| RTL design | Requirements | Verilog source | Describe digital behaviour |
| RTL verification | RTL and testbench | Simulation results | Check logical correctness |
| Synthesis | RTL | Synthesized netlist | Create a logic-cell representation |
| Floorplanning | Netlist and design constraints | Initial floorplan | Define chip area and major physical regions |
| Placement | Netlist and floorplan | Placed cells | Assign physical locations to cells |
| Clock Tree Synthesis | Placed design and clock constraints | Clock distribution network | Distribute clock signals |
| Routing | Placed design and connectivity | Routed layout | Connect cells through metal layers |
| Physical verification | Layout and technology rules | Verification reports | Check physical constraints and connectivity |
| GDSII generation | Completed physical layout | GDSII file | Produce a layout database for fabrication-related workflows |

The exact sequence and available stages depend on the OpenLane version, configuration, PDK and selected flow.

## 14. Physical Design Stages

Physical design determines how synthesized logic is physically arranged and interconnected.

The physical design process must consider chip area, cell placement, routing resources, power distribution, clock delivery and technology-specific design rules.

### Major Physical Design Stages

| Stage | Main Activity | Why It Matters |
|---|---|---|
| Floorplanning | Defines the chip's physical boundaries | Establishes space for the design |
| Power planning | Creates power distribution structures | Supplies power to cells |
| Placement | Positions standard cells | Influences area, timing and routability |
| CTS | Builds the clock network | Controls clock delivery and skew |
| Routing | Connects cell pins and nets | Establishes physical connectivity |
| DRC | Checks layout geometry against rules | Identifies manufacturing-rule violations |
| LVS | Compares layout connectivity with the reference circuit | Detects connectivity mismatches |
| GDSII generation | Exports the layout database | Produces the final layout artifact |

**Current status:** RTL simulation, generic synthesis and gate-level simulation have recorded passing results. Completion of the physical design stages has not yet been verified.

## 15. Floorplanning

Floorplanning is an early physical design stage that establishes the overall chip area and the initial physical organization of the design.

It considers the size of the design, placement regions, pin locations, power distribution and the space required for later routing.

### Important Floorplanning Concepts

| Concept | Explanation |
|---|---|
| Core area | Region in which the main logic cells are placed |
| Die area | Overall physical boundary of the chip |
| Utilization | Fraction of the available core area occupied by cells |
| Pin placement | Assignment of input/output pins to physical locations |
| Power planning | Arrangement of power and ground structures |
| Routing resources | Space and metal layers available for interconnects |

High utilization may reduce the available routing space, while very low utilization may increase the required area. The appropriate target depends on design constraints and the flow configuration.



## 16. Placement

Placement assigns physical locations to standard cells inside the floorplan.

The placement engine considers connectivity and implementation constraints to position cells in a way that supports timing and routing.

### Placement Objectives

- Reduce unnecessary wire length.
- Improve timing where possible.
- Avoid excessive local congestion.
- Keep cells within legal placement regions.
- Prepare the design for clock tree synthesis and routing.

### Placement Outputs

| Output | Description |
|---|---|
| Placed netlist or database | Design representation with cell locations |
| Placement reports | Information about placement quality and constraints |
| Congestion information | Indicates areas with limited routing resources |
| Timing reports | May show timing estimates for the placed design |


## 17. Clock Tree Synthesis

Clock Tree Synthesis (CTS) constructs a clock distribution network for sequential elements.

As a design becomes physically distributed, the clock signal may arrive at different registers at different times. CTS inserts suitable buffers or other supported clock cells to manage clock distribution.

### Important Clock Concepts

| Term | Meaning |
|---|---|
| Clock period | Time between successive active clock edges |
| Clock latency | Delay from the clock source to a clock endpoint |
| Clock skew | Difference in clock arrival times between endpoints |
| Clock buffer | Cell used to drive or distribute the clock signal |
| Setup time | Minimum data stability time required before a sampling edge |
| Hold time | Minimum data stability time required after a sampling edge |

CTS is only applicable where the design and flow have a clock network that requires synthesis. The exact result depends on the design's sequential logic and clock configuration.



## 18. Routing

Routing creates the physical metal connections between placed cells and the relevant input/output pins.

The routing engine must follow technology-specific constraints, including permitted metal layers, wire spacing, via rules and connectivity requirements.

### Routing Types

| Type | Description |
|---|---|
| Global routing | Estimates routing paths and allocates routing resources |
| Detailed routing | Creates detailed wire and via geometries |
| Signal routing | Connects functional signals |
| Clock routing | Routes the clock network after CTS |
| Power routing | Implements power and ground connections |

### Why Routing Matters

Poor routing can lead to congestion, longer interconnects, timing problems or design-rule violations. Routing reports help identify whether the physical connections were completed successfully.



## 19. Physical Verification

Physical verification checks whether the implemented layout meets the selected technology's physical constraints and matches the intended circuit connectivity.

### Design Rule Checking (DRC)

DRC checks geometric constraints such as wire width, spacing, via dimensions and other technology-defined layout rules.

### Layout Versus Schematic (LVS)

LVS compares the connectivity extracted from the physical layout against the reference netlist or schematic. It helps identify missing connections, unintended connections and device mismatches.

### Timing and Parasitic Checks

Physical implementation can also require timing analysis using estimated or extracted interconnect parasitics. The exact checks depend on the flow and the available reports.

| Verification | Main Purpose | Desired Outcome |
|---|---|---|
| DRC | Check manufacturing geometry rules | No unresolved violations |
| LVS | Compare circuit connectivity | Matching reference and layout |
| Timing analysis | Evaluate path timing | Meets configured timing constraints |
| Routing checks | Inspect connectivity and route completion | No unresolved routing failures |

**Important:** These checks must actually run and produce reports before the project can claim successful physical verification.


## 20. Layout and GDSII Generation

The physical layout represents the placement of circuit elements and their metal interconnections.

GDSII is a common layout database format used in integrated-circuit design workflows. A valid final GDSII file should be generated from the configured flow after the required physical design stages have completed.

### Layout Review Checklist

- [ ] Floorplanning completed.
- [ ] Placement completed.
- [ ] Clock tree synthesis completed, if required.
- [ ] Routing completed.
- [ ] Required physical verification performed.
- [ ] Timing and implementation reports reviewed.
- [ ] Final GDSII generated.
- [ ] Output files inspected and saved.

### Final Layout Screenshot


**Current status:** Final physical layout and GDSII generation remain pending verification. No successful final GDSII output is claimed at this stage.

## 21. Results Summary

The following table summarizes the currently recorded results.

| No. | Project Stage | Result | Status |
|---:|---|---|---|
| 1 | RTL development | Verilog source created | Completed |
| 2 | RTL simulation | 96 checks, 0 errors | PASS |
| 3 | Generic synthesis | 57 generic cells, 0 reported problems | PASS |
| 4 | Gate-level simulation | 94 checks, 0 errors | PASS |
| 5 | Floorplanning | Final result not verified | Pending |
| 6 | Placement | Final result not verified | Pending |
| 7 | Clock Tree Synthesis | Final result not verified | Pending |
| 8 | Routing | Final result not verified | Pending |
| 9 | DRC/LVS | Final reports not verified | Pending |
| 10 | GDSII generation | Final file not verified | Pending |

The completed simulation and synthesis results demonstrate progress through the logical design stages. Physical implementation must be completed and verified separately.

## 22. Challenges and Learning Outcomes

### Challenges

The project involves multiple tools, file formats and stages. Common challenges include:

- Correcting Verilog syntax or logic errors.
- Writing effective testbench checks.
- Understanding waveform timing.
- Interpreting synthesis reports and generic cell counts.
- Configuring the physical design environment and technology libraries.
- Managing disk space and dependencies in the Linux environment.
- Understanding physical design failures and their associated reports.

These are general development challenges; only the issues confirmed in the project logs should be reported as actual encountered problems.

### Learning Outcomes

Through this project, the following concepts can be studied and demonstrated:

1. Verilog RTL design.
2. Testbench development and functional simulation.
3. Waveform inspection using GTKWave.
4. Logic synthesis using Yosys.
5. Gate-level netlist validation.
6. The purpose of floorplanning, placement, CTS and routing.
7. Physical verification using technology-specific rules.
8. The role of the SKY130 PDK and GDSII in a physical design flow.

## 23. Future Enhancements

Possible future enhancements include:

- Completing the configured OpenLane physical design flow.
- Reviewing area, timing and routing reports.
- Performing DRC and LVS checks and resolving any reported issues.
- Generating and inspecting the final GDSII layout.
- Improving testbench coverage for additional input and reset conditions.
- Adding an external display or alert interface in a future hardware version.
- Integrating a real-time clock if calendar-based reminders are required.
- Testing the completed hardware system after fabrication, if fabrication is pursued.

These are proposed enhancements, not features claimed to be implemented in the current design.

## 24. Conclusion

The Pill Reminder Timer Controller project demonstrates the development and verification of a timer-based digital controller using Verilog HDL. The recorded RTL simulation completed 96 checks with no reported errors, generic synthesis reported 57 cells with no reported problems, and gate-level simulation completed 94 checks with no reported errors.

The project also explores the complete RTL-to-GDSII process, including floorplanning, placement, clock tree synthesis, routing and physical verification. These physical design stages remain to be completed and verified before the project can claim a final physical layout.

Overall, the project provides a foundation for understanding digital design, verification, synthesis and the physical implementation process used in integrated-circuit development.

## 25. References

1. [Verilog IEEE Standard Information](https://standards.ieee.org/)
2. [Icarus Verilog Documentation](https://steveicarus.github.io/iverilog/)
3. [GTKWave Documentation](https://gtkwave.sourceforge.net/)
4. [Yosys Documentation](https://yosyshq.readthedocs.io/)
5. [OpenLane Documentation](https://openlane2.readthedocs.io/)
6. [SkyWater SKY130 PDK](https://github.com/google/skywater-pdk)
7. [Magic VLSI Layout Tool](http://opencircuitdesign.com/magic/)

---

**Project:** Pill Reminder Timer Controller  
**Design Language:** Verilog HDL  
**Current Milestone:** RTL verification, generic synthesis and gate-level checks passed; physical design is in progress.
