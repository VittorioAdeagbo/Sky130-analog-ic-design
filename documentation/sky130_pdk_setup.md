# SKY130 PDK Setup and Verification

## Environment
- Operating system: Debian GNU/Linux 13 (Trixie)
- Architecture: ARM64 / aarch64
- Schematic editor: Xschem 3.4.4
- Circuit simulator: ngspice 44.2
- PDK manager: Volare (isolated Python virtual environment)

## PDK Version
- PDK family: SKY130
- Selected release: 2024.08.17
- Version commit: 0fe599b2afb6708d281543108caf8310912f54af
- Process corner tested: typical (tt)
- PDK variant used for testing: sky130A

## Verification Test
Netlist: ../simulations/sky130_nmos_smoke_test.spice

Device:
- Model subcircuit: sky130_fd_pr__nfet_01v8
- Width: 2 um
- Length: 0.15 um
- Drain voltage: 1.0 V
- Gate voltage: 1.2 V
- Source and bulk: ground

Observed operating point:
- Drain voltage: 1.000000 V
- Gate voltage: 1.200000 V
- Drain current magnitude: 338.4924 uA

Result: PASS. ngspice completed the operating-point analysis using
the SKY130 typical-corner model library without fatal errors.

## Scope and Limitations
This confirms that the SKY130 model library loads successfully in ngspice
and supports a basic transistor operating-point simulation. It does not
validate the accuracy of the model against measured silicon data, Xschem
symbol integration, amplifier performance, physical layout, or design-rule
compliance.

The standalone verification test was performed independently and did not
modify the common-source amplifier circuit.
