v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -60 40 -20 40 {
lab=#net1}
N 20 40 50 40 {
lab=GND}
N 50 40 50 80 {
lab=GND}
N 20 80 50 80 {
lab=GND}
N 20 70 20 80 {
lab=GND}
N 20 70 20 90 {
lab=GND}
N -60 -70 20 -70 {
lab=#net2}
N 20 -70 20 10 {
lab=#net2}
C {sky130_fd_pr/nfet_01v8.sym} 0 40 0 0 {name=M1
W=2
L=0.15
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'"
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'"
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {vsource.sym} -60 70 0 0 {name=V2 value="DC 0.9V" savecurrent=false}
C {gnd.sym} -60 100 0 0 {name=l1 lab=GND}
C {gnd.sym} 20 90 0 0 {name=l3 lab=GND}
C {code_shown.sym} 100 -30 0 0 {name=s1 only_toplevel=false value=".lib \"$PDK_ROOT/$PDK/libs.tech/ngspice/sky130.lib.spice\" tt"}
C {code_shown.sym} 100 50 0 0 {name=s2 only_toplevel=false value=".control

ac dec 20 1 20Gig
let zout = mag(v(net2)/(-i(VTEST)))

.endc"}
C {vsource.sym} -60 -40 0 0 {name=VTEST value="DC 0.9588893V AC 1 phase 0" savecurrent=false}
C {gnd.sym} -60 -10 0 0 {name=l2 lab=GND}
