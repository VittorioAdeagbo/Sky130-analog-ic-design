v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -130 -90 -0 -90 {
lab=#net1}
N -0 -90 -0 -60 {
lab=#net1}
N -70 -30 -40 -30 {
lab=#net2}
N -0 -0 0 30 {
lab=GND}
N -0 -30 20 -30 {
lab=GND}
N 20 -30 20 10 {
lab=GND}
N -0 10 20 10 {
lab=GND}
C {sky130_fd_pr/nfet_01v8.sym} -20 -30 0 0 {name=M1
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
C {vsource.sym} -70 0 0 0 {name=V1 value=1.2V savecurrent=false}
C {vsource.sym} -130 -60 0 0 {name=V2 value="1V" savecurrent=false}
C {code_shown.sym} 80 -110 0 0 {name=s1 only_toplevel=false value=".lib \"$PDK_ROOT/$PDK/libs.tech/ngspice/sky130.lib.spice\" tt"}
C {gnd.sym} -130 -30 0 0 {name=l1 lab=GND}
C {gnd.sym} -70 30 0 0 {name=l2 lab=GND}
C {gnd.sym} 0 30 0 0 {name=l3 lab=GND}
C {code_shown.sym} 80 -50 0 0 {name=s2 only_toplevel=false value=".control
op
print v(net1)
print v(net2)
.endc"}
