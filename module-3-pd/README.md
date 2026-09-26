# Module 3 – From RTL Concepts to Physical Silicon
# CMOS Inverter: Simulation, SKY130A Layout, and the 16-Mask Fabrication Journey

---

## 📌 Introduction

This module walks through a full, hands-on journey of CMOS inverter design — starting at the transistor level in SPICE, moving into physical standard-cell layout using the SKY130A process design kit, extracting that layout back into an electrical netlist, re-simulating it in NGSPICE, and finally understanding how the transistors themselves get built on a silicon wafer through a 16-mask fabrication sequence.

The exercise begins with a plain CMOS inverter circuit. Its transient behavior, switching characteristics, propagation delay, and voltage transfer curve are all examined, along with how changing the PMOS/NMOS width ratio shifts performance. From there, the same inverter is built as a physical standard cell: its boundary, power rails, and interconnect are defined, the layout is extracted into parasitics-aware SPICE, and that extracted circuit is simulated again to confirm the physical version still behaves correctly. The module closes with a tour of the 16 masks used in real CMOS fabrication — from substrate prep to final metal routing.

In short, this module connects four normally-separate worlds: **circuit design, physical layout, post-layout verification, and semiconductor fabrication** — into one continuous flow.

---

## 🎯 Learning Outcomes

- Understand how a CMOS inverter behaves at the transistor level.
- Run and interpret SPICE transient simulations of an inverter.
- Read input/output waveforms and extract rise time, fall time, and propagation delay.
- Build and interpret the Voltage Transfer Characteristic (VTC) curve.
- Understand switching threshold voltage and how body effect influences it.
- Observe how PMOS/NMOS sizing ratios change inverter performance.
- Construct a CMOS inverter standard cell in SKY130A.
- Define a proper cell boundary and route power/ground correctly.
- Extract a physical layout into an electrical (SPICE) netlist.
- Simulate the extracted netlist in NGSPICE and validate functional correctness.
- Learn the 16 mask steps used to fabricate a real CMOS device.
- See, end to end, how a circuit idea becomes a manufactured transistor.

## 🛠️ Toolchain

| Tool / Technology | Role in This Module |
|---|---|
| **NGSPICE** | Runs transient simulations, both at schematic level and on the extracted layout |
| **Magic VLSI** | Used to draw, view, and extract the standard-cell layout |
| **OpenLane** | Provides the physical design environment for standard-cell implementation |
| **SKY130A PDK** | Supplies the device models, layer rules, and technology data |
| **SPICE** | Underlying circuit-simulation engine and modeling language |
| **Linux Terminal** | Used to run all design, extraction, and simulation commands |
| **Git / GitHub** | Repository management and version control for the design files |
| **CMOS Process Knowledge** | Understanding how the transistors are physically fabricated |

---

# 📑 Contents

1. Setting Up and Simulating the CMOS Inverter
2. Building the Standard Cell in SKY130A
3. The 16-Mask CMOS Fabrication Sequence
4. LDD (Lightly Doped Drain) Formation
5. Source/Drain Region Formation
6. Contacts and Local Interconnect
7. Upper-Level Metal Routing
8. End-to-End Flow Summary
9. Layout and Abstract Views
10. Setting the Cell Boundary
11. Wiring Power and Ground
12. Extracting the Layout
13. Producing the Extracted Netlist
14. Assembling the SPICE Deck
15. Running Transient Analysis in NGSPICE
16. Reading the I/O Waveforms
17. Verifying the Physical Layout
18. Anatomy of a Standard Cell
19. Parasitics From Extraction
20. Device Models and Parameters
21. Setting Up the Simulation
22. How the Inverter Actually Switches
23. Rise/Fall Behavior
24. Timing Metrics
25. Logic Voltage Levels
26. Sizing vs. Performance
27. Connecting Layout Back to Simulation
28. Full Flow Recap
29. Closing Thoughts

---

# 1. Setting Up and Simulating the CMOS Inverter

## 1.1 Defining the Inverter and Its SPICE Model

Every CMOS inverter is built from just two devices: a **PMOS pulled up to the supply rail** and an **NMOS pulled down to ground**, with their gates tied together as the input and their drains tied together as the output.

Before any simulation can run, the SPICE model has to describe these devices accurately — their geometry, threshold behavior, and mobility parameters — because everything downstream (delay numbers, switching point, waveform shape) depends on getting this starting point right. At this stage, the transistor width/length values, the supply rail voltage, and the input stimulus waveform are all chosen.

> **Added note:** In SKY130, the PMOS typically needs roughly 2–3× the width of the NMOS to compensate for hole mobility being lower than electron mobility — this is why sizing ratio comes up repeatedly later in this module.

---

## 1.2 Configuring the Simulation Environment

With the model in place, the simulation environment itself is configured — this is where the actual W/L ratios for both devices get locked in.

The W/L ratio is the single biggest lever over switching behavior: it sets how strong the pull-up network is relative to the pull-down network. Get this wrong and you either get a lopsided rise/fall time or a switching threshold that's skewed far from the ideal midpoint.

<img width="908" height="414" alt="Screenshot 2026-09-26 181530" src="https://github.com/user-attachments/assets/22bb5249-4708-4dda-b587-f91be17c8dbb" />


**Figure 2: Simulation environment and device parameter setup**

These parameters feed directly into how SPICE computes both the transient response and the VTC later on.

---

## 1.3 Running the SPICE Simulation

Once the circuit and parameters are defined, SPICE is run to solve the inverter's electrical behavior as the input sweeps over time.

The shared gate node sees the changing input; depending on its instantaneous voltage, one of the two transistors conducts while the other is cut off, which is what produces the inverted output.

<img width="1366" height="768" alt="Screenshot (197)" src="https://github.com/user-attachments/assets/df6fcf52-b9ad-446f-a355-49593131e25d" />

**Figure 3: First run of the CMOS inverter SPICE simulation**

This confirms basic functional correctness before moving into detailed timing and static analysis.

---

## 1.4 Reading the Input/Output Waveforms

The transient run produces overlaid input and output traces. The output should trace the exact logical complement of the input.

- Input LOW → PMOS conducts → output pulled toward VDD.
- Input HIGH → NMOS conducts → output pulled toward GND.

<img width="1366" height="768" alt="image" src="https://github.com/user-attachments/assets/74f1b44e-0a52-4361-a1b0-bd7b771008bc" />


**Figure 4: CMOS inverter input/output waveform pair**

This waveform is also the raw data used later to measure delay and transition times.

---

## 1.5 Looking Closer at the Transient Response

The output doesn't flip instantly — the transistor network has to charge or discharge whatever capacitance sits on the output node, and that takes finite time.

<img width="1920" height="1080" alt="Screenshot (148)" src="https://github.com/user-attachments/assets/093dfd64-273a-4b05-9e0b-a35b6f7cbbed" />

**Figure 5: Zoomed transient response**

This delay is exactly what rise time, fall time, and propagation delay quantify.

---

## 1.6 Zooming Into the Transition Points

Looking at a narrower time window makes it much easier to pin down exactly where the input and output cross their 50% points.

<img width="1366" height="768" alt="Screenshot (200)" src="https://github.com/user-attachments/assets/15457516-dc0c-4810-b688-898797726548" />


**Figure 6: Close-up of the transition region**

The time gap between the input's transition and the output's corresponding transition is the propagation delay.

---

## 1.7 Sweeping PMOS/NMOS Width Ratios

Several different PMOS-to-NMOS width ratios are simulated back-to-back for comparison.

Wider transistors supply more drive current and can charge/discharge the load faster — but they also add more parasitic capacitance, so there's a point past which making a device bigger stops helping and starts hurting.

<img width="777" height="443" alt="Screenshot 2026-09-26 182411" src="https://github.com/user-attachments/assets/0d5c30b7-6168-4f47-9907-e893b31061bd" />

**Figure 7: Sizing sweep and its effect on switching behavior**

> **Added note:** A common target in practice is a "balanced" inverter, where rise time ≈ fall time. Achieving this in SKY130A generally lands the PMOS/NMOS width ratio somewhere around 2:1 to 3:1, depending on the exact process corner used.

---

## 1.8 Static Characterization via VTC

The **Voltage Transfer Characteristic (VTC)** captures the DC relationship between input and output voltage, and reveals three regions: logic HIGH, the transition zone, and logic LOW.

<img width="1086" height="450" alt="image" src="https://github.com/user-attachments/assets/c4112494-6b30-46a9-a129-c148d4a8156f" />


**Figure 8: Static VTC curve**

A steep transition region is desirable — it means good noise immunity and sharp, well-defined logic levels.

---

## 1.9 Checking Inverter Robustness Across Sizing

VTC curves for different sizing ratios are overlaid to see how the switching point (V_M) shifts as relative device strength changes.

<img width="987" height="442" alt="image" src="https://github.com/user-attachments/assets/f396ae1c-dceb-4818-9755-4a931199be87" />

<p align="center">
<img src="images/09.jpg" width="800">
</p>

**Figure 9: Robustness comparison across sizing ratios**

This comparison is how a designer picks a ratio that gives stable, predictable switching along with acceptable noise margins.

---

## 1.10 Finding the Switching Threshold

The switching threshold (V_M) is the input voltage where the output crosses from HIGH to LOW — ideally VDD/2 for a perfectly symmetric inverter.

V_M shifts with transistor sizing, fabrication variation, and body-bias conditions — especially when source-to-body voltage isn't zero (the body effect).

<img width="935" height="424" alt="image" src="https://github.com/user-attachments/assets/25f1a60e-5d29-4234-8b98-cc0b53418b7b" />

**Figure 10: Switching threshold measurement**

Comparing the hand-calculated V_M against the simulated one is a useful sanity check on the design.

---

## 1.11 Interpreting the Full VTC

At low V_IN, PMOS is ON and NMOS is OFF, so V_OUT sits near VDD. At high V_IN, the roles flip and V_OUT sits near GND.
<img width="1366" height="768" alt="Screenshot (204)" src="https://github.com/user-attachments/assets/1f9a4786-fbe8-459e-80a1-68f91aa9df2d" />


**Figure 11: Complete VTC curve for the CMOS inverter**

The sharpness of the middle transition is a direct visual indicator of the inverter's voltage gain in that region.

---

## 1.12 A Second Sizing Comparison

A different PMOS/NMOS ratio is run to see, side by side, how it reshapes the switching curve.

<img width="1366" height="768" alt="Screenshot (201)" src="https://github.com/user-attachments/assets/c5f7ed82-5fb0-42c5-b863-926f14f27d57" />


**Figure 12: Second sizing condition, compared against the first**

This reinforces why sizing decisions are made early and deliberately in standard-cell design, not left as an afterthought.

---

## 1.13 Cross-Checking Against Hand Calculations

The simulated values are checked against theoretically calculated ones as a final sanity pass.

<img width="1366" height="768" alt="Screenshot (202)" src="https://github.com/user-attachments/assets/7ed014e7-88fb-4528-9db7-4316331ea2d1" />


**Figure 13: Simulated vs. calculated verification**

Agreement here builds confidence that the extracted timing numbers are trustworthy.

---

## 1.14 Wrapping Up the Characterization

Bringing the VTC, switching threshold, and timing data together gives a full picture of whether the chosen sizing meets the design goals.

<img width="1366" height="768" alt="Screenshot (205)" src="https://github.com/user-attachments/assets/359c3dce-54ce-462a-830f-7dc747911845" />


**Figure 14: Final characterization summary**

With this finished, the design is ready to move from schematic-level SPICE into a physical standard-cell layout.

---

# 2. Building the Standard Cell in SKY130A

## 2.1 Getting the Design Repository

The first practical step is cloning the repository that holds the standard-cell source files, configs, and supporting technology data, using Git.

<img width="958" height="934" alt="gitcloning 2nd image" src="https://github.com/user-attachments/assets/a9b140d8-4ff0-4579-b243-ceae1a28b9f7" />

**Figure 15: Cloning the standard-cell repository**

This gives a complete, self-contained environment for everything that follows.

---

## 2.2 Placing the SKY130A Technology File

The SKY130A technology file is copied into the standard-cell design directory. This file tells the layout tools how to interpret each process layer and device geometry correctly.

<img width="958" height="934" alt="3rd image sky130A tech is copied from magic to vsdstdcelldesign by using cp  command" src="https://github.com/user-attachments/assets/c4e9d76b-11d9-481b-a26e-665468b324a9" />

**Figure 16: Copying the SKY130A tech file into place**

Without the correct tech file in the right location, Magic can't render or process the layout properly.

---

## 2.3 Opening the CMOS Inverter Layout

With the tech file in place, the CMOS inverter layout opens in the layout editor, showing PMOS/NMOS placement, diffusion, polysilicon, contacts, and metal.

<img width="958" height="934" alt="4th image inverter layout" src="https://github.com/user-attachments/assets/5742fab9-ac85-4562-aa2d-be6d7464c84b" />

**Figure 17: SKY130A CMOS inverter layout**

A good layout satisfies design rules while staying compact and maintaining correct electrical connectivity throughout.

---

# 3. The 16-Mask CMOS Fabrication Sequence

The rest of this module traces how a real CMOS chip gets manufactured, using a 16-mask process. Each mask defines a specific region on the wafer, and the full sequence is built from repeated cycles of oxidation, lithography, implantation, deposition, etching, and metallization.

> **Added context:** "16-mask" refers to a representative, simplified process — modern commercial CMOS nodes may use 30+ masks due to additional layers for advanced isolation, multiple threshold-voltage options, and many more metal layers. The 16-mask version here captures the conceptual essentials without that added complexity.

---

## 3.1 Starting Material — The Silicon Substrate

Everything starts with a P-type silicon substrate, chosen for a specific doping concentration, resistivity, and crystal orientation.

<img width="1025" height="460" alt="image" src="https://github.com/user-attachments/assets/0cb3cb46-b54b-4376-836c-b87a9b7ba221" />


**Figure 18: P-type silicon substrate selection**

Substrate quality has downstream effects on threshold voltage, junction leakage, and overall device behavior.

---

## 3.2 Active Region Definition — Mask 1

Mask 1 marks out the active device regions. Field oxide is grown over everything else using LOCOS (**Local Oxidation of Silicon**) to isolate neighboring devices.

<img width="1920" height="1080" alt="Screenshot (162)" src="https://github.com/user-attachments/assets/1aff10a7-95a3-42ad-b3d5-5c0309004cc7" />

**Figure 19: Active regions defined via Mask 1**

LOCOS isolation also produces the well-known **bird's-beak** shape at the field oxide edge — a classic signature of this isolation technique.

---

## 3.3 P-Well Formation (Boron)

Boron, a P-type dopant, is implanted to create the P-well, with implant energy and dose tightly controlled for the target doping profile.

<img width="1920" height="1080" alt="Screenshot (165)" src="https://github.com/user-attachments/assets/08190702-815f-4c72-b610-97fb8e0166ca" />

**Figure 20: P-well formation via boron implant**

This P-well becomes the body region hosting the NMOS transistor.

---

## 3.4 N-Well Formation (Phosphorus)

Phosphorus, an N-type dopant, is implanted to form the N-well, which becomes the body region for the PMOS transistor.

<img width="1920" height="1080" alt="Screenshot (166)" src="https://github.com/user-attachments/assets/3eea2bb2-1a04-4bab-bbce-cebec3cfb9a1" />

**Figure 21: N-well formation via phosphorus implant**

Having both wells side by side on one substrate is exactly what makes "complementary" MOS possible.

---

## 3.5 Beginning Gate Formation

With both wells in place, gate formation begins — arguably the single most important structure in a MOS device, since it's what controls channel formation.

<img width="1920" height="1080" alt="Screenshot (167)" src="https://github.com/user-attachments/assets/af3ce00b-d164-453f-a816-0240d8722d5a" />

**Figure 22: Early-stage gate formation**

A thin gate oxide separates the gate conductor from the channel, enabling field-effect control of conduction.

---

## 3.6 Threshold Voltage and Body Effect Revisited

Threshold voltage is not a fixed number — it shifts with substrate doping, oxide thickness/capacitance, and source-to-body voltage. The body-effect term in the threshold equation captures exactly this last dependency.

<img width="1920" height="1080" alt="Screenshot (168)" src="https://github.com/user-attachments/assets/08b2624d-7192-45c2-8d63-1af8ac178f9f" />

**Figure 23: Threshold voltage and body effect**

This matters most in stacked-transistor or body-biased circuit configurations, where source-body voltage isn't zero.

---

## 3.7 Gate Patterning — Mask 4

Photolithography defines the gate shape: photoresist is deposited and exposed according to Mask 4's pattern.

<img width="1920" height="1080" alt="Screenshot (169)" src="https://github.com/user-attachments/assets/a492ef5b-3fa2-4c9b-a203-0bd4e646ea3b" />

**Figure 24: Gate patterning, Mask 4**

Gate length directly sets drive current, delay, and short-channel behavior — precision here is critical.

---

## 3.8 Gate Patterning — Mask 5

Mask 5 continues refining the gate structure, using photoresist to protect some regions while others are etched.

<img width="1920" height="1080" alt="Screenshot (172)" src="https://github.com/user-attachments/assets/9c71bc4c-91f1-4c3b-a4a5-511ddf4187aa" />

**Figure 25: Gate processing, Mask 5**

This prepares the transistor regions for the implantation steps that follow.

---

## 3.9 Gate Patterning — Mask 6

Mask 6 finishes the gate-processing sequence, giving the self-aligned reference structure needed for source/drain implantation.

<img width="1920" height="1080" alt="Screenshot (173)" src="https://github.com/user-attachments/assets/b4606e4d-1daa-4ae8-b158-10d8e8d97dcd" />

**Figure 26: Gate formation, Mask 6**

Self-alignment to the gate is a defining feature of modern MOS fabrication — it avoids needing a separate, error-prone mask just to line up source/drain with the channel.

---

# 4. LDD (Lightly Doped Drain) Formation

## 4.1 LDD — Mask 7

Lightly Doped Drain regions are added near the channel to soften the electric field at the drain edge, reducing hot-carrier-related degradation over the device's lifetime.

<img width="1920" height="1080" alt="Screenshot (174)" src="https://github.com/user-attachments/assets/83e12ad6-00cd-43b7-b9da-4af0ec4bd789" />

**Figure 27: LDD formation, Mask 7**

The LDD acts as a gentle doping ramp between the lightly-doped channel and the heavily-doped source/drain to come.

---

## 4.2 LDD — Mask 8

The complementary LDD implant is done for the opposite transistor type, using the appropriate dopant.

<img width="1920" height="1080" alt="Screenshot (175)" src="https://github.com/user-attachments/assets/a5014a7e-dbc5-40c7-820c-3cfecb867154" />

**Figure 28: Complementary LDD implant, Mask 8**

LDD is fundamentally a trade-off: it costs a bit of drive strength in exchange for meaningfully better long-term reliability.

---

# 5. Source/Drain Region Formation

## 5.1 Source/Drain — Mask 9

Heavily doped source and drain regions are formed, self-aligned to the gate so they land correctly on either side of the channel.

<img width="1920" height="1080" alt="Screenshot (176)" src="https://github.com/user-attachments/assets/a25c0e16-f874-4fb9-b54e-96fc86075bec" />

**Figure 29: Source/drain formation, Mask 9**

These heavily doped regions give low-resistance terminals while the channel region under the gate stays untouched.

---

## 5.2 Source/Drain — Mask 10

The complementary implant completes source/drain formation for the other device type.

<img width="1920" height="1080" alt="Screenshot (177)" src="https://github.com/user-attachments/assets/9a19c367-c638-4a29-9a6b-148632a9a514" />

**Figure 30: Complementary source/drain implant, Mask 10**

At this point, both transistors are structurally complete: wells, gate, source, and drain are all in place.

---

# 6. Contacts and Local Interconnect

## 6.1 Making Contacts

Contacts are etched down to the source, drain, and gate terminals and filled to provide a low-resistance link up to the metal interconnect stack.

<img width="1920" height="1080" alt="Screenshot (178)" src="https://github.com/user-attachments/assets/a6563950-7c0d-450b-ad24-42d353a4b0a4" />

**Figure 31: Contact and local interconnect formation**

Contact quality matters more than it might seem — poor contact resistance is a common, hard-to-debug source of degraded circuit performance.

---

# 7. Upper-Level Metal Routing

## 7.1 Connecting Everything With Metal

Metal layers tie together transistor terminals across the whole chip, with vias opening wherever a connection needs to jump between layers.

<img width="1920" height="1080" alt="Screenshot (179)" src="https://github.com/user-attachments/assets/b951251d-0461-40c9-8056-25eab941f27c" />

**Figure 32: Upper metal-level routing**

This final metallization step is what turns a set of isolated transistors into one working, electrically connected circuit — carrying signal, power, and ground across the die.

---

# 8. End-to-End Flow Summary

```text
CMOS Inverter Design
        ↓
SPICE Model Setup
        ↓
Transient Simulation
        ↓
Waveform Analysis
        ↓
Rise/Fall Delay Measurement
        ↓
Voltage Transfer Characteristic
        ↓
Switching Threshold Analysis
        ↓
Transistor Sizing Optimization
        ↓
SKY130A Standard-Cell Setup
        ↓
Repository and Technology File Setup
        ↓
CMOS Inverter Layout
        ↓
Silicon Substrate
        ↓
Active Region Formation
        ↓
N-Well / P-Well Formation
        ↓
Gate Formation
        ↓
LDD Formation
        ↓
Source / Drain Formation
        ↓
Local Contacts
        ↓
Metal Interconnects
        ↓
Higher-Level Metal
        ↓
Completed CMOS Structure
```

---

# 9. Layout and Abstract Views

The standard-cell layout is built in SKY130A using the required physical layers:

- Metal layers
- Polysilicon
- Diffusion
- Contacts
- Well regions
- Power and ground rails

An accompanying abstract view gives a simplified version of the cell's physical footprint for use by downstream digital-implementation tools.

Both views are checked to confirm the cell has correct structure and connectivity.

<img width="1372" height="611" alt="Screenshot (180)" src="https://github.com/user-attachments/assets/59d161c4-e4a5-4b98-ba5c-19cf02977397" />

**Figure 33: Layout and abstract view of the standard cell**

---

# 10. Setting the Cell Boundary

A defined cell boundary fixes the physical footprint of the standard cell — critical for standard-cell libraries, since every cell needs a consistent height so they can be tiled together in a row.

The boundary supports:

- Consistent cell dimensions across the library
- Predictable placement behavior
- Correct alignment with adjacent cells
- Correctly positioned power/ground rails
- Compatibility with the rest of the standard-cell library

<img width="1361" height="701" alt="Screenshot (181)" src="https://github.com/user-attachments/assets/0f9c2258-893a-4911-8d7c-f375712e0804" />

**Figure 34: Standard-cell boundary definition**

---

# 11. Wiring Power and Ground

Power and ground are then wired into the cell:

- **VDD** — the positive supply rail.
- **GND** — the reference/ground rail.

These are routed to the correct transistor terminals through the appropriate layout layers.

<img width="1359" height="712" alt="Screenshot (182)" src="https://github.com/user-attachments/assets/e56ddad5-d321-4234-af24-3577a3d52301" />

**Figure 35: Power and ground routing in the layout**

Getting this right is non-negotiable — a misrouted rail can silently break the entire cell.

---

# 12. Extracting the Layout

Extraction converts the finished physical geometry into an electrical netlist, capturing:

- Devices present in the layout
- Node-level electrical connectivity
- Parasitic elements
- Actual device dimensions as drawn
- Power/ground connectivity

<img width="958" height="934" alt="extracting 5th image" src="https://github.com/user-attachments/assets/9281895a-cdaf-43b5-bd97-fe5652ed2a41" />

**Figure 36: Layout extraction step**

Simulating this extracted version gives a far more realistic picture than an idealized schematic-only simulation ever could.

---

# 13. Producing the Extracted Netlist

Once extraction finishes, the resulting files are checked in the working directory. This netlist carries connectivity and device-level information ready for SPICE simulation.

<img width="958" height="934" alt="commands for 5th image" src="https://github.com/user-attachments/assets/6e2a0e14-19a6-499c-8211-922763a2d024" />

**Figure 37: Extracted netlist and generated files**

---

# 14. Assembling the SPICE Deck

The extracted data is assembled into a full SPICE deck, including:

- Technology/model info
- Cell subcircuit definition
- I/O node definitions
- Supply and ground connections
- Transistor parameters
- Simulation control statements

<img width="958" height="934" alt="6th spice file" src="https://github.com/user-attachments/assets/71584479-2934-46cf-a0fa-99bd6f1ad115" />

**Figure 38: Assembled SPICE simulation file**

---

# 15. Running Transient Analysis in NGSPICE

NGSPICE runs the transient analysis on the extracted circuit, tracking how the output responds over time to the applied input while the cell is powered.

Nodes monitored:

- Input
- Output
- VDD
- GND

<img width="958" height="934" alt="7th image" src="https://github.com/user-attachments/assets/156adb31-de86-4f91-95b1-6b047d725ae7" />

**Figure 39: NGSPICE transient analysis on the extracted netlist**

A successful run here confirms the extracted circuit is properly connected and simulation-ready.

---

# 16. Reading the I/O Waveforms

The generated waveform shows the expected complementary behavior:

- Input LOW → Output HIGH
- Input HIGH → Output LOW

<img width="958" height="934" alt="8th" src="https://github.com/user-attachments/assets/462635ce-8158-4138-8edb-8b8db8b45fa1" />

**Figure 40: Extracted-circuit input/output waveforms**

The simulated voltage levels land close to the ideal supply and ground levels — confirming correct operation of the physically implemented cell.

---

# 17. Verifying the Physical Layout

With the basic layout complete, it's checked for correct transistor formation, diffusion, polysilicon geometry, contacts, metal routing, and power connectivity.

A layout ready for use should show:

- Correct device-level connectivity
- Correct power distribution
- Proper cell boundary
- Valid, DRC-clean layer usage
- Correct transistor placement

---

# 18. Anatomy of a Standard Cell

The cell follows the conventional CMOS layout convention: PMOS network on top (tied to VDD), NMOS network on bottom (tied to GND).

The input drives both transistor gates; the output comes off the shared drain node between the pull-up and pull-down networks.

This regular structure is what lets standard cells be tiled row after row in a library while still delivering complementary logic.

---

# 19. Parasitics From Extraction

Extraction doesn't just capture ideal connectivity — it also picks up parasitic resistance and capacitance from the actual physical geometry, which schematic-only simulation misses entirely.

These parasitics affect:

- Propagation delay
- Rise time
- Fall time
- Output transition shape
- Overall dynamic behavior

This is exactly why extracted-layout simulation is treated as a required verification step, not an optional one.

---

# 20. Device Models and Parameters

The extracted SPICE representation pulls in SKY130A's device models, giving NGSPICE the parameters it needs to compute MOS device behavior accurately.

Because it reflects the as-drawn geometry, the extracted cell is a much closer match to real silicon behavior than an idealized schematic model.

---

# 21. Setting Up the Simulation

Transient analysis requires a defined supply condition and input stimulus:

- Supply voltage applied across VDD and GND
- A time-varying digital waveform driving the input

Goals of the run:

1. Confirm correct logic function
2. Confirm proper voltage levels
3. Observe output transition shape
4. Extract timing behavior
5. Confirm overall simulation stability

---

# 22. How the Inverter Actually Switches

### When Input Is LOW
- PMOS: ON
- NMOS: OFF
- Output pulled toward VDD → **Output = HIGH**

### When Input Is HIGH
- PMOS: OFF
- NMOS: ON
- Output pulled toward GND → **Output = LOW**

The output is always the logical complement of the input — this is the entire point of the circuit.

---

# 23. Rise/Fall Behavior

- Input LOW→HIGH transition → Output goes HIGH→LOW.
- Input HIGH→LOW transition → Output goes LOW→HIGH.

The finite slope in each transition comes from charging/discharging load and parasitic capacitance — it's never instantaneous in a real circuit, and extracted parasitics make this slope even more pronounced than an idealized schematic would suggest.

---

# 24. Timing Metrics

Key timing parameters extracted from the waveform:

- Rise time
- Fall time
- Propagation delay
- Input transition time
- Output transition time

These numbers matter a lot once cells start getting chained together into larger digital paths — a slower cell here shows up as slack lost everywhere downstream.

---

# 25. Logic Voltage Levels

Simulation confirms the output reaches proper logic levels: HIGH close to VDD, LOW close to GND.

This is the final check that the extracted cell behaves as a clean digital logic element, not just an analog circuit that happens to look right.

---

# 26. Sizing vs. Performance

PMOS/NMOS sizing affects:

- Drive strength
- Rise/fall time
- Propagation delay
- Power consumption
- Overall switching behavior

The physical dimensions drawn in layout carry directly into the extracted netlist, so sizing decisions made early in the schematic phase are locked in by the time layout is done.

---

# 27. Connecting Layout Back to Simulation

**Layout → Extraction → SPICE Netlist → NGSPICE Simulation → Waveform Analysis**

This chain is really the core idea of the whole module: layout defines the physical structure, extraction converts that structure into an electrical model, NGSPICE simulates that model, and the resulting waveform is the final proof that the physical implementation actually works.

---

# 28. Full Flow Recap

```text
SKY130A Technology
        ↓
Standard Cell Layout
        ↓
Define Cell Boundary
        ↓
Power & Ground Connections
        ↓
Layout Verification
        ↓
Parasitic Extraction
        ↓
SPICE Netlist Generation
        ↓
SPICE Simulation Setup
        ↓
NGSPICE Transient Analysis
        ↓
Input / Output Waveform
        ↓
Functional and Timing Analysis
```

---

## 📊 Results

- The CMOS inverter was built and simulated using complementary PMOS/NMOS transistors.
- SPICE transient analysis confirmed correct functional inversion behavior.
- Rise/fall behavior, propagation delay, switching threshold, and VTC were all characterized.
- Multiple PMOS/NMOS sizing ratios were compared to understand their effect on performance.
- The inverter was implemented as a physical standard-cell layout in SKY130A, complete with cell boundary, power/ground routing, diffusion, polysilicon, contacts, and metal.
- The layout was extracted into an electrical netlist and re-simulated in NGSPICE.
- The extracted-circuit waveform matched expected inverter behavior, validating the physical implementation.
- The full 16-mask CMOS fabrication sequence was studied, covering well formation, gate formation, LDD, source/drain formation, contacts, and metal interconnect.

Overall, this module traces a complete chain: **circuit design → SPICE simulation → characterization → physical layout → extraction → post-layout simulation → CMOS fabrication.**

---

## 🎯 Conclusion

This module gave a complete, ground-up view of CMOS inverter design — from an idealized transistor-level SPICE model, all the way through to a physically fabricated standard cell. Along the way, the inverter's transient response, VTC, switching threshold, and sizing sensitivity were all examined in detail.

That understanding was then carried into a real SKY130A standard-cell layout, where the cell boundary, PMOS/NMOS placement, power/ground rails, contacts, polysilicon, and metal interconnect all had to be handled correctly. Extracting that layout back into an electrical netlist and re-simulating it in NGSPICE closed the loop — confirming that the physical implementation actually preserves the intended circuit behavior, parasitics and all.

Finally, walking through the 16-mask CMOS fabrication sequence connected all of this back to how these structures are physically manufactured on a silicon wafer, through repeated cycles of masking, implantation, deposition, etching, and metallization.

Altogether, this module demonstrates the complete **RTL-to-physical-design and CMOS implementation pipeline**, with hands-on exposure to **SPICE, NGSPICE, Magic VLSI, the SKY130A PDK, layout extraction, standard-cell design, and CMOS fabrication technology**.

## 👤 Author

**Vanga Pranvitha**
