# SKY130 Common-Source Amplifier — Simulation Results

## 1. Overview

This document records the schematic-level simulation results obtained for the SKY130 NMOS common-source amplifier.

The circuit was simulated using ngspice with the SKY130A process design kit and typical (tt) model corner.

The analyses performed include:

- DC operating-point analysis
- AC frequency-response analysis
- Small-signal output-impedance analysis
- Transient analysis
- Fourier analysis and total harmonic distortion (THD)

The values in this document are recorded simulation measurements, not measurements from fabricated silicon.

## 2. DC Operating-Point Analysis

The DC operating point was evaluated with a 1.8 V supply and a 0.9 V gate bias.

| Parameter | Measured Value |
|---|---:|
| Drain voltage | 0.9589 V |
| Gate voltage | 0.9000 V |
| Drain current | Approximately 84.1 µA |
| Transconductance (gm) | 0.6397 mS |
| Output conductance (gds) | 38.11 µS |
| Intrinsic output resistance (ro) | Approximately 26.24 kΩ |

The transistor operates with a positive drain-to-source voltage and conducts at the selected gate bias.

The intrinsic output resistance is consistent with the reciprocal of the measured output conductance:

ro = 1 / gds

## 3. AC Frequency-Response Analysis

AC analysis was used to characterize the small-signal voltage gain of the common-source amplifier.

| Measurement | Result |
|---|---:|
| Low-frequency voltage gain | 4.6316 V/V |
| Voltage gain | 13.3146 dB |
| Output phase | Approximately 180° |

The approximately 180° phase shift is consistent with the inverting behavior of a common-source amplifier.

The simulated low-frequency gain is also consistent with the small-signal estimate:

Av ≈ -gm × (RD || ro)

The measured gain is approximately 4.63 V/V in magnitude.

## 4. Output-Impedance Analysis

A separate testbench was used to estimate the transistor's small-signal output impedance.

For this measurement, the drain resistor and supply connection were removed, and an AC test source was applied at the drain while the transistor remained at its DC bias point.

| Measurement | Result |
|---|---:|
| Low-frequency output impedance | Approximately 26.246 kΩ |
| DC-derived intrinsic output resistance | Approximately 26.24 kΩ |

The close agreement supports the consistency of the AC impedance measurement with the DC operating-point conductance.

**Important:** This is the intrinsic small-signal output resistance of the transistor under the specified bias conditions. It is not the output impedance of the complete amplifier with its 10 kΩ drain resistor connected.

## 5. Transient Response and Gain Compression

Transient simulations used a 1 MHz sinusoidal input with a 0.9 V DC offset.

The input amplitude was varied to examine the amplifier's response to increasing signal levels.

| Input Amplitude (Peak) | Measured Voltage Gain |
|---:|---:|
| 10 mV | Approximately 4.60 |
| 25 mV | 4.6215 |
| 50 mV | 4.5875 |
| 100 mV | 4.4584 |
| 150 mV | 4.1839 |
| 200 mV | 3.6970 |

The measured gain decreases as the input amplitude increases.

This behavior indicates gain compression as the transistor moves further away from its small-signal operating conditions.

## 6. Harmonic-Distortion Analysis

Fourier analysis was performed using a 1 MHz fundamental frequency.

The input amplitude was varied to investigate the relationship between signal amplitude and harmonic distortion.

| Input Amplitude (Peak) | Total Harmonic Distortion |
|---:|---:|
| 25 mV | 0.443574% |
| 50 mV | 0.919882% |
| 53 mV | 0.980674% |
| 54 mV | Greater than 1% |
| 60 mV | 1.12625% |
| 100 mV | 2.07931% |
| 200 mV | 6.75037% |

A 1% THD threshold was selected as a project-specific comparison criterion.

Of the tested amplitudes, 53 mV peak was the largest that remained below this threshold. The 54 mV peak test exceeded 1%.

This result applies to the simulated 1 MHz operating conditions and should not be interpreted as a universal input-amplitude specification.

## 7. Engineering Observations

The simulations demonstrate several important characteristics of the common-source amplifier:

1. The DC operating point establishes the bias conditions used for small-signal analysis.
2. The AC gain is consistent with the transconductance and effective drain resistance.
3. The approximately 180° phase shift confirms the expected inverting behavior.
4. The measured intrinsic output resistance agrees closely with the value inferred from DC output conductance.
5. Increasing input amplitude causes gain compression.
6. Harmonic distortion increases with input amplitude.

Together, these results provide a schematic-level characterization of the amplifier under the selected SKY130 model and bias conditions.

## 8. Measurement Limitations

The results represent circuit simulations using the SKY130A typical model corner.

The following limitations apply:

- The reported results have not yet been independently reproduced from archived simulation output files.
- Original waveform and raw simulation files have not yet been archived in the repository.
- The THD results depend on the transient simulation duration, time step, and Fourier-analysis conditions.
- Physical layout parasitics have not been included.
- DRC, LVS, parasitic extraction, and post-layout simulation have not yet been completed.

Further work will preserve simulation outputs and compare schematic-level performance against the eventual extracted-layout implementation.
