v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 40 -80 40 -30 {
lab=Vout}
N -50 -140 40 -140 {}
N -50 -140 -50 -80 {}
C {res.sym} 40 0 0 0 {name=R1
value=10k
footprint=1206
device=resistor
m=1}
C {vsource.sym} -50 -50 0 0 {name=V1 value=1.8 savecurrent=false}
C {gnd.sym} -50 -20 0 0 {name=l1 lab=GND}
C {gnd.sym} 40 30 0 0 {name=l2 lab=GND}
C {lab_pin.sym} 40 -60 0 0 {name=p1 sig_type=std_logic lab=Vout}
C {simulator_commands.sym} 120 -30 0 0 {name=COMMANDS
simulator=ngspice
only_toplevel=false
value=".op"}
C {res.sym} 40 -110 0 0 {name=R2
value=10k
footprint=1206
device=resistor
m=1}
