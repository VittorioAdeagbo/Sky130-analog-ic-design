v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N -80 -70 20 -70 {
lab=#net1}
N 20 -70 20 -60 {
lab=#net1}
N -60 40 -20 40 {
lab=#net2}
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
N 20 0 20 10 {
lab=#net3}
C {res.sym} 20 -30 0 0 {name=R1
value=10k
footprint=1206
device=resistor
m=1}
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
C {vsource.sym} -80 -40 0 0 {name=V1 value="1.8V" savecurrent=false}
C {vsource.sym} -60 70 0 0 {name=V2 value="DC 0.9V AC 1V" savecurrent=false}
C {gnd.sym} -60 100 0 0 {name=l1 lab=GND}
C {gnd.sym} -80 -10 0 0 {name=l2 lab=GND}
C {gnd.sym} 20 90 0 0 {name=l3 lab=GND}
C {code_shown.sym} 100 -30 0 0 {name=s1 only_toplevel=false value=".lib \"$PDK_ROOT/$PDK/libs.tech/ngspice/sky130.lib.spice\" tt"}
C {code_shown.sym} 100 50 0 0 {name=s2 only_toplevel=false value=".control
ac dec 10 1 20Gig
let vin_mag = mag(v(net2))
let vout_mag = mag(v(net3))
let gain_mag = vout_mag/vin_mag
let gain_db = 20*log10(gain_mag)
let gain_drop = gain_db[0]-gain_db
plot db(v(net3)/v(net2))
.endc"}
