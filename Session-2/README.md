# RTL Design, Verification and Synthesis Using Open-Source EDA Tools



## Overview

This repository presents practical experiments on RTL design, functional simulation, logic synthesis, and waveform analysis using open-source EDA tools. The experiments were performed using **Icarus Verilog, GTKWave, and Yosys** to understand the digital design and verification workflow.

### Experiments Covered

1. Multiplexer Design, Simulation and Synthesis
2. Hierarchical Verilog Modules and Circuit Visualization
3. BabySoC RTL Exploration and Netlist Generation
4. Pre-Synthesis Simulation and Waveform Analysis

---

# Experiment 1: Multiplexer RTL Design and Verification

## Objective

To design and verify a 2:1 multiplexer using Verilog and understand its simulation, synthesis, and schematic visualization.

## 1.1 Testbench Development

A testbench was created to apply different input combinations to the `good_mux` module and check its output response.

The following system tasks were used to record simulation activity:

```verilog
$dumpfile("tb_good_mux.vcd");
$dumpvars(0, tb_good_mux);
```

The signals monitored during simulation were `i0`, `i1`, `sel`, and `y`. Different input values and select conditions were applied to verify the expected multiplexer behavior.

### Screenshot

<img width="1001" height="1600" alt="MUX Testbench" src="https://github.com/user-attachments/assets/0b43588a-9301-4d53-b7bd-2f684ac3df32" />

## 1.2 Compiling and Executing the Simulation

The design and its testbench were compiled using Icarus Verilog.

```bash
iverilog -o tb_good_mux.out good_mux.v tb_good_mux.v
```

The compiled output was executed using:

```bash
vvp tb_good_mux.out
```

The simulation produced the waveform file `tb_good_mux.vcd`.

## 1.3 Waveform Inspection Using GTKWave

The waveform was opened using GTKWave:

```bash
gtkwave tb_good_mux.vcd
```

The waveform was examined to understand how the output `y` responds to the input signals and select line.

### Screenshot

<img width="1136" height="524" alt="MUX Simulation Waveform" src="https://github.com/user-attachments/assets/c3891025-f081-420f-ab91-4bb77497758d" />

## 1.4 Logic Synthesis

Yosys was used to process and optimize the multiplexer RTL.

The source file can be opened with:

```bash
vi good_mux.v
```

The synthesis flow converts the RTL description into a logic-level implementation and generates a netlist. Depending on the synthesis commands and target library, the result may be represented using generic logic cells or technology-specific standard cells.

## 1.5 Schematic Visualization

The Yosys `show` command can be used to inspect the synthesized design:

```tcl
show
```

The schematic helps illustrate the connections between the input signals, select line, and output.

### Screenshot

<img width="1524" height="808" alt="Synthesized MUX Schematic" src="https://github.com/user-attachments/assets/55fc92ae-4960-4d35-8466-25fbbcadb7a1" />

### Result

The multiplexer was simulated and its output behavior was examined using GTKWave. Synthesis and schematic visualization provided insight into how the RTL description is represented as a logic circuit.

---

# Experiment 2: Multi-Module RTL Synthesis and Visualization

## Objective

To study the synthesis of interconnected Verilog modules and visualize their hierarchical structure using Yosys.

## 2.1 Processing the RTL Design

The design containing multiple Verilog modules was processed through synthesis. The flow involved logic optimization, module processing, and cell mapping as applicable to the selected synthesis script.

### Screenshot

<img width="1599" height="899" alt="Multi-Module Synthesis" src="https://github.com/user-attachments/assets/3e43f919-d01a-4d49-94e2-035b79b672a3" />

## 2.2 Generating the Circuit Schematic

The following command was used to display the selected design:

```tcl
show
```

The generated schematic provides a graphical view of the logic elements, signal paths, and connections between inputs and outputs.

### Screenshot

<img width="1599" height="899" alt="Synthesized Circuit View" src="https://github.com/user-attachments/assets/8bddff3a-6de4-4e15-b8c5-179cf999675c" />

## 2.3 Examining Module Connectivity

The multi-module design was displayed using:

```tcl
show multiple_modules
```

The design illustrates how two submodules can be interconnected through an intermediate signal.

The main signals and components include:

- Inputs: `a`, `b`, and `c`
- First submodule: `submodule1`
- Intermediate connection: `net1`
- Second submodule: `submodule2`
- Output: `y`

### Screenshot

<img width="1599" height="899" alt="Hierarchical Module Connections" src="https://github.com/user-attachments/assets/e202bfd0-5bba-4dc6-bc4c-8905c441dfe5" />

### Result

The experiment demonstrated how separate RTL modules can be connected to form a larger design. Schematic visualization made the signal flow and module interconnections easier to understand.

---

# Experiment 3: BabySoC RTL Exploration and Netlist Generation

## Objective

To examine the BabySoC design hierarchy, explore its RTL source files, and understand netlist generation and pre-synthesis verification.

## 3.1 Exploring the Design Hierarchy

The BabySoC project integrates a processor core with supporting modules such as the PLL, DAC, clock logic, and other functional blocks.

A Verilog netlist can be written from the current Yosys design using:

```tcl
write_verilog -noattr multiple_modules_netlist.v
```

The hierarchy can be flattened using:

```tcl
flatten
```

The selected design can then be visualized with:

```tcl
show multiple_modules
```

**Note:** The `flatten` command modifies the current in-memory design hierarchy. The output depends on which modules were read and selected before the command was executed.

### Screenshot

<img width="1920" height="1060" alt="BabySoC Design Hierarchy" src="https://github.com/user-attachments/assets/34b6b0b0-04dd-4268-a148-37bfbf604f5c" />

## 3.2 Exporting the Flattened Netlist

After flattening, the resulting design can be exported to another Verilog file:

```tcl
write_verilog -noattr multiple_modules_netlist2.v
```

This file represents the current design after the hierarchy-processing operations performed in Yosys.

## 3.3 Reviewing the RTL Source Files

The project contains several Verilog files that implement different parts of the BabySoC system.

Important source files include:

| File | Purpose |
|---|---|
| `avsdac.v` | DAC module |
| `avspll.v` | PLL module |
| `clk_gate.v` | Clock-gating logic |
| `pseudo_rand.v` | Pseudorandom logic |
| `pseudo_rand_gen.v` | Pseudorandom generator |
| `rvmyth.v` | Processor core |
| `rvmyth_gen.v` | Processor-related generation logic |
| `testbench.v` | Simulation testbench |
| `vsdbabysoc.v` | Top-level BabySoC module |

### Screenshot

<img width="1920" height="1060" alt="BabySoC RTL Source Files" src="https://github.com/user-attachments/assets/2e0aca5c-4208-44ce-aec9-b8f0d9fedc6f" />

## 3.4 Understanding the RVMYTH Core

The `rvmyth.v` file contains the RVMYTH processor core. Its implementation includes clock and reset interfaces, instruction-processing logic, and program-counter-related operations.

The processor core interacts with the other BabySoC modules as part of the overall system.

### Screenshot

<img width="1920" height="1060" alt="RVMYTH Processor RTL" src="https://github.com/user-attachments/assets/b10b537f-a770-4601-a017-74575d843095" />

---

# Experiment 4: BabySoC Testbench and Pre-Synthesis Simulation

## Objective

To compile the BabySoC RTL design with its testbench, execute a pre-synthesis simulation, and inspect the generated waveforms.

## 4.1 Checking the Testbench

The top-level module declaration and included source files can be inspected using:

```bash
grep -n "module vsdbabysoc" testbench.v
```

```bash
grep -n "include" testbench.v
```

These commands help identify the relevant declarations and include directives in `testbench.v`. They do not independently verify that every required module compiles successfully.

## 4.2 Compiling the RTL Design

The testbench was compiled using Icarus Verilog:

```bash
iverilog -o pre_synth_sim.out -DPRE_SYNTH_SIM -I ./include testbench.v
```

### Command Reference

| Option | Description |
|---|---|
| `iverilog` | Compiles Verilog source files |
| `-o pre_synth_sim.out` | Sets the output executable name |
| `-DPRE_SYNTH_SIM` | Defines the `PRE_SYNTH_SIM` macro |
| `-I ./include` | Adds the include directory to the search path |
| `testbench.v` | Specifies the testbench source file |

The compilation must complete without errors before proceeding.

### Screenshot

<img width="1920" height="1060" alt="BabySoC Compilation" src="https://github.com/user-attachments/assets/3a7f07f8-7bf7-4246-8833-0f3a1cdea093" />

## 4.3 Running the Simulation

The generated simulation executable was run using:

```bash
./pre_synth_sim.out
```

The testbench is configured to generate a VCD waveform file named:

```text
pre_synth_sim.vcd
```

The exact output filename depends on the dump-file statement in the testbench.

## 4.4 Loading Waveforms in GTKWave

The simulation waveform was opened with:

```bash
gtkwave pre_synth_sim.vcd
```

The following signals were selected for inspection:

- `CLK`
- `ENb_CP`
- `ENb_VCO`
- `OUT`
- `REF`
- `RV_TO_DAC`
- `VCO_IN`
- `VREFH`
- `reset`

### Screenshot

<img width="1920" height="1060" alt="BabySoC Waveform Viewer" src="https://github.com/user-attachments/assets/f5b189dc-4cd7-4567-bb82-29cf62871092" />

## 4.5 Inspecting the Processor-to-DAC Interface

The `RV_TO_DAC` bus was expanded in GTKWave to inspect its individual bits:

- `RV_TO_DAC[9]`
- `RV_TO_DAC[8]`
- `RV_TO_DAC[7]`
- `RV_TO_DAC[6]`
- `RV_TO_DAC[5]`
- `RV_TO_DAC[4]`
- `RV_TO_DAC[3]`
- `RV_TO_DAC[2]`
- `RV_TO_DAC[1]`
- `RV_TO_DAC[0]`

This allows the individual bit transitions to be inspected and compared with the other visible signals. The actual values and timing behavior should be interpreted from the generated waveform.

### Screenshot

<img width="1920" height="1060" alt="RV_TO_DAC Bus Analysis" src="https://github.com/user-attachments/assets/7041a770-d09d-4d46-b4d6-6d9d7e7cbf05" />

---

# Command Reference

## Multiplexer Simulation

```bash
vi good_mux.v
iverilog -o tb_good_mux.out good_mux.v tb_good_mux.v
vvp tb_good_mux.out
gtkwave tb_good_mux.vcd
```

## Yosys Visualization

```tcl
show
show multiple_modules
```

## BabySoC Netlist Operations

```tcl
write_verilog -noattr multiple_modules_netlist.v
flatten
show multiple_modules
write_verilog -noattr multiple_modules_netlist2.v
```

## BabySoC Simulation and Waveform Analysis

```bash
grep -n "module vsdbabysoc" testbench.v
grep -n "include" testbench.v
iverilog -o pre_synth_sim.out -DPRE_SYNTH_SIM -I ./include testbench.v
./pre_synth_sim.out
gtkwave pre_synth_sim.vcd
```

---

# Tools and Technologies

- **Verilog HDL** — Hardware description and RTL design
- **Icarus Verilog** — RTL compilation and simulation
- **GTKWave** — Simulation waveform inspection
- **Yosys** — Logic synthesis and netlist generation
- **Graphviz** — Graph-based schematic visualization when used by the Yosys flow

---

# Conclusion

These experiments provided practical exposure to RTL simulation, logic synthesis, hierarchical module design, netlist generation, and waveform analysis.

The multiplexer experiment demonstrated basic functional verification and synthesis. The multi-module experiment illustrated hierarchical connectivity, while the BabySoC experiments explored a more complex RTL system and its processor-to-DAC interface.

The overall workflow covered in this repository is:

**RTL Design → Testbench Development → Simulation → Waveform Analysis → Logic Synthesis → Netlist Visualization**

This work helped strengthen my understanding of digital design verification and the use of open-source EDA tools.


**Author:** Vanga Pranvitha
