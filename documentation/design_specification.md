# SKY130 Common-Source Amplifier — Design Specification

## 1. Design Overview

This project implements and characterizes a resistively loaded NMOS common-source amplifier using the SkyWater SKY130 process design kit.

The circuit is designed at the transistor level in Xschem and simulated using ngspice. The primary objective is to investigate the relationship between transistor biasing, small-signal gain, output impedance, transient response, and harmonic distortion.

## 2. Circuit Topology

The amplifier consists of:

- One SKY130 1.8 V NMOS transistor.
- One resistive drain load.
- A 1.8 V DC supply.
- A gate-bias voltage source.
- Ground-referenced source and bulk terminals.

The drain resistor connects the positive supply to the transistor drain. The input is applied to the gate, and the output is measured at the drain.

This configuration produces an inverted output signal relative to the input.

## 3. Device Configuration

| Parameter | Specification |
|---|---:|
| Device | `sky130_fd_pr__nfet_01v8` |
| Transistor width (W) | 2 µm |
| Transistor length (L) | 0.15 µm |
| Finger count (nf) | 1 |
| Multiplier | 1 |
| Source connection | Ground |
| Bulk connection | Ground |

## 4. Biasing and Circuit Parameters

| Parameter | Value |
|---|---:|
| Supply voltage (VDD) | 1.8 V |
| Gate DC bias (VIN, DC) | 0.9 V |
| Drain resistance (RD) | 10 kΩ |
| Input signal frequency | 1 MHz |
| Transient input amplitude | 53 mV peak |

The DC gate bias establishes the transistor operating point. The AC and transient simulations use this bias as the operating reference.

## 5. Simulation Configuration

### DC Operating-Point Analysis

The DC operating point is used to determine:

- Drain voltage.
- Gate voltage.
- Drain current.
- Transconductance (gm).
- Output conductance (gds).
- Intrinsic output resistance (ro).

### AC Analysis

AC analysis evaluates the amplifier's small-signal frequency response.

The analysis is used to determine:

- Voltage gain.
- Gain expressed in decibels.
- Output phase relative to the input.
- Frequency-dependent gain behavior.

### Output-Impedance Analysis

A separate testbench removes the drain resistor and supply connection and applies an AC test source at the transistor drain while maintaining the transistor's DC bias point. This estimates the transistor's intrinsic small-signal output resistance, which is compared with the value calculated from the DC operating-point output conductance.

### Transient Analysis

Transient analysis applies a sinusoidal input at a selected amplitude of 53 mV peak. This amplitude is also evaluated during harmonic-distortion characterization, where it produces approximately 0.9807% THD under the documented simulation conditions.

- Frequency: 1 MHz.
- DC offset: 0.9 V.
- Input amplitude: 53 mV peak.
- Simulation duration: 10 µs.
- Maximum time step: 1 ns.

The resulting output waveform is used to evaluate inversion, voltage gain, and large-signal behavior.

### Harmonic-Distortion Analysis

Fourier analysis is performed at a 1 MHz fundamental frequency.

A 1% total harmonic distortion (THD) threshold is used as a project-specific comparison criterion. The input amplitude is varied to investigate how increasing signal amplitude affects distortion.

## 6. Design Scope and Limitations

The current implementation is a schematic-level transistor simulation.

The following are not yet established:

- Physical layout dimensions.
- Design-rule compliance (DRC).
- Layout-versus-schematic verification (LVS).
- Parasitic extraction.
- Post-layout simulation.
- Fabrication-ready performance.

Simulation results are specific to the selected SKY130 model library, process corner, device dimensions, bias conditions, and testbench configuration.

## 7. Design Development Plan

The planned development stages are:

1. Complete transistor-level schematic design.
2. Verify DC operating conditions.
3. Characterize AC gain and output impedance.
4. Evaluate transient response and harmonic distortion.
5. Implement physical layout.
6. Perform DRC and LVS.
7. Extract parasitic elements.
8. Perform post-layout simulation and compare against schematic-level results.
