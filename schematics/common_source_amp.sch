v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -20 40 20 40 {
lab=#net1}
N -40 -60 60 -60 {
lab=#net2}
N 60 -60 60 -50 {
lab=#net2}
N 60 40 80 40 {
lab=GND}
N 80 40 80 70 {
lab=GND}
N 60 70 80 70 {
lab=GND}
N 60 70 60 90 {
lab=GND}
N 60 10 130 10 {
lab=#net3}
C {nmos4.sym} 40 40 0 0 {name=M1 model=nmos w=5u l=0.18u del=0 m=1}
C {res.sym} 60 -20 0 0 {name=R1
value=10k
footprint=1206
device=resistor
m=1}
C {vsource.sym} -40 -30 0 0 {name=V1 value=5V savecurrent=false}
C {vsource.sym} -20 70 0 0 {name=V2 value="DC 0.9V AC 1" savecurrent=false}
C {gnd.sym} -20 100 0 0 {name=l1 lab=GND}
C {gnd.sym} -40 0 0 0 {name=l2 lab=GND}
C {gnd.sym} 60 90 0 0 {name=l3 lab=GND}
C {code_shown.sym} 140 -40 0 0 {name=s1 only_toplevel=false value=".model nmos NMOS (LEVEL=1 VTO=0.7 KP=200u LAMBDA=0.02 CGSO=100p CGDO=50p CBD=50p)"}
C {code_shown.sym} 140 40 0 0 {name=s2 only_toplevel=false value=".op"}
C {code_shown.sym} 140 110 0 0 {name=s3 only_toplevel=false value=".control
ac dec 20 1 100Meg
.endc"}
