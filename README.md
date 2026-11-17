# SKY130 Analog IC Design

A transistor-level analog IC design project using the **SkyWater SKY130 process design kit (PDK)**, Xschem, and ngspice.

The project focuses on the design, simulation, and characterization of a CMOS common-source amplifier. The longer-term objective is to take the circuit from schematic-level design through physical layout, verification, and post-layout simulation.

## Project Overview

The primary circuit is an NMOS common-source amplifier implemented using the SKY130 1.8 V NMOS device model.

The project includes:

- SKY130 PDK installation and model verification
- Transistor-level schematic design using Xschem
- DC operating-point analysis
- AC frequency-response analysis
- Small-signal gain and output-impedance characterization
- Transient response and large-signal analysis
- Fourier analysis and total harmonic distortion (THD) measurements
- Planned physical layout, design-rule checking (DRC), and layout-versus-schematic (LVS) verification

## Tools and Environment

| Component | Version / Configuration |
|---|---|
| Operating system | Debian GNU/Linux 13 (Trixie) |
| Architecture | ARM64 / aarch64 |
| Schematic editor | Xschem 3.4.4 |
| Circuit simulator | ngspice 44.2 |
| PDK manager | Volare |
| Process design kit | SKY130A |
| PDK corner | Typical (tt) |

## Circuit Design

The main design is an NMOS common-source amplifier with a resistive drain load.

| Parameter | Value |
|---|---:|
| Supply voltage | 1.8 V |
| NMOS width | 2 µm |
| NMOS length | 0.15 µm |
| Drain resistance | 10 kΩ |
| Gate DC bias | 0.9 V |
| Source connection | Ground |
| Bulk connection | Ground |

## Simulation Results

### Independent NMOS Model Verification

As a separate validation step, the SKY130 NMOS device model was tested using standalone ngspice testbenches to verify model loading and basic DC behavior.

**Operating-point smoke test**
- Device: `sky130_fd_pr__nfet_01v8`
- Gate voltage: 1.2 V
- Drain voltage: 1.0 V
- Transistor dimensions: W = 2 µm, L = 0.15 µm
- Measured drain current: approximately 338.49 µA

**DC transfer-characteristic sweep**
- Drain voltage: 1.8 V
- Gate voltage sweep: 0–1.8 V
- Sweep increment: 0.01 V
- Number of data points: 181
- Drain current at VGS = 1.8 V: approximately 1.0306 mA

The transfer-characteristic data is archived in `simulations/tests/sky130_nmos_transfer.dat`. These tests verify model loading and basic DC device behavior; they do not constitute a complete transistor characterization.

### DC Operating Point

| Measurement | Result |
|---|---:|
| Drain voltage | 0.9589 V |
| Gate voltage | 0.9000 V |
| Drain current | Approximately 84.1 µA |
| Transconductance (gm) | 0.6397 mS |
| Output conductance (gds) | 38.11 µS |
| Intrinsic output resistance (ro) | Approximately 26.24 kΩ |

### AC Analysis

The simulated low-frequency voltage gain is approximately:

- Voltage gain: 4.63 V/V
- Gain: 13.31 dB
- Phase: Approximately 180°, consistent with an inverting common-source amplifier

### Intrinsic Transistor Output Resistance

The transistor's intrinsic low-frequency small-signal output resistance was measured at approximately 26.25 kΩ. The testbench removed the drain resistor and supply connection and applied an AC test source at the drain while maintaining the transistor's DC bias point.

This agrees closely with the output resistance estimated from the DC small-signal output conductance. It is not the output impedance of the complete amplifier.

### Transient Analysis

A 1 MHz sinusoidal input was applied to evaluate the amplifier's transient response and large-signal behavior.

The measured gain decreased as the input amplitude increased, indicating gain compression.

### Harmonic Distortion

Fourier analysis was performed at a 1 MHz fundamental frequency.

| Input amplitude (peak) | Measured THD |
|---:|---:|
| 25 mV | 0.443574% |
| 50 mV | 0.919882% |
| 53 mV | 0.980674% |
| 54 mV | Greater than 1% |
| 60 mV | 1.12625% |
| 100 mV | 2.07931% |
| 200 mV | 6.75037% |

Using a 1% THD criterion, the largest tested input amplitude meeting the criterion was 53 mV peak under the simulated 1 MHz operating conditions.

## Repository Structure

```text
sky130-analog-ic-design/
├── documentation/
│   ├── design_specification.md
│   ├── simulation_results.md
│   └── sky130_pdk_setup.md
├── layout/
│   └── .gitkeep
├── results/
│   ├── ac/
│   ├── dc/
│   ├── output_impedance/
│   ├── thd/
│   ├── transient/
│   └── measurement_summary.csv
├── schematics/
│   ├── common_source_amp.sch
│   ├── sky130_common_source_amp.sch
│   ├── sky130_common_source_amp_cap_test.sch
│   ├── sky130_common_source_amp_intrinsic_test.sch
│   ├── sky130_common_source_amp_transient.sch
│   ├── sky130_nmos_output_impedance.sch
│   ├── sky130_nmos_test.sch
│   ├── voltage_divider.sch
│   └── voltage_divider.sym
├── scripts/
│   ├── run_xschem.sh
│   └── setup_pdk.sh
├── simulations/
│   ├── sky130_nmos_smoke_test.spice
│   └── tests/
│       ├── sky130_model_test.spice
│       └── sky130_nmos_transfer.dat
├── .gitignore
└── README.md
```

Generated Xschem netlists and local PDK installation files are excluded from version control.

## Current Status

**Completed**
- SKY130 PDK setup and basic model verification
- Common-source amplifier schematic
- DC operating-point analysis
- AC response analysis
- Small-signal parameter extraction
- Output-impedance characterization
- Transient analysis
- THD characterization

**Planned**
- Physical layout implementation
- Design-rule checking (DRC) and layout-versus-schematic (LVS) verification
- Parasitic extraction and post-layout simulation

## Project Objective

The goal is to develop a practical understanding of analog integrated circuit design, from transistor-level circuit behavior and simulation to physical implementation and verification.

This repository documents the design process, simulation methodology, engineering decisions, and measured results as the project develops.
