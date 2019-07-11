"""
# After running a model, use solution dictionaries to replicate GAMS
# results with DataFrames
#
# NOTE:
# solution variables stored in "vars" and "soln" objects should
# be the primary source for model evaluation.
# This swas only created to assist those unfamiliar with python objects
"""

from jopSmall.OutputFunctions import baseValue, newValue, getDiff

#CG0
cg0 = baseValue(vars, soln,  'CG')
cgL = newValue(vars, soln, 'CG', iNum)

#CH0
ch0 = baseValue(vars, soln,  'CH')
chL = newValue(vars, soln, 'CH', iNum)

#CMI0
cmi0 = baseValue(vars, soln,  'CMI')
cmiL = newValue(vars, soln,  'CMI', iNum)

#CMO0
cmo0 = baseValue(vars, soln, 'CMO')
cmoL = newValue(vars, soln,  'CMO', iNum)

#CN0
cn0 = baseValue(vars, soln, 'CN')
cnL = newValue(vars, soln,  'CN', iNum)

#CPI0
cpi0 = baseValue(vars, soln, 'CPI')
cpiL = newValue(vars, soln,  'CPI', iNum)

#CX0
cx0 = baseValue(vars, soln, 'CX')
cxL = newValue(vars, soln,  'CX', iNum)

#D0
d0 = baseValue(vars, soln, 'D')
dL = newValue(vars, soln,  'D', iNum)

#DD0
dd0 = baseValue(vars, soln, 'DD')
ddL = newValue(vars, soln,  'DD', iNum)

#DS0
ds0 = baseValue(vars, soln, 'DS')
dsL = newValue(vars, soln,  'DS', iNum)

#FD
fd0 = baseValue(vars, soln, 'FD')
fdL = newValue(vars, soln, 'FD', iNum)

#IGT
igt0 = baseValue(vars, soln, 'IGT')
igtL = newValue(vars, soln, 'IGT', iNum)

#KS
ks0 = baseValue(vars, soln, 'KS')
ksL = newValue(vars, soln, 'KS', iNum)

#LAS
las0 = baseValue(vars, soln, 'LAS')
lasL = newValue(vars, soln, 'LAS', iNum)

#HH
hh0 = baseValue(vars, soln, 'HH')
hhL = newValue(vars, soln, 'HH', iNum)

#HN
hn0 = baseValue(vars, soln, 'HN')
hnL = newValue(vars, soln, 'HN', iNum)

#HW
hw0 = baseValue(vars, soln, 'HW')
hwL = newValue(vars, soln, 'HW', iNum)

#M
m0 = baseValue(vars, soln, 'M')
mL = newValue(vars, soln, 'M', iNum)

#N
n0 = baseValue(vars, soln, 'N')
nL = newValue(vars, soln, 'N', iNum)

#NKI
nki0 = baseValue(vars, soln, 'NKI')
nkiL = newValue(vars, soln, 'NKI', iNum)

#LNFOR
lnfor0 = baseValue(vars, soln, 'LNFOR')
lnforL = newValue(vars, soln, 'LNFOR', iNum)

#KPFOR
kpfor0 = baseValue(vars, soln, 'KPFOR')
kpforL = newValue(vars, soln, 'KPFOR', iNum)

#GVFOR
gvfor0 = baseValue(vars, soln, 'GVFOR')
gvforL = newValue(vars, soln, 'GVFOR', iNum)

#P
p0 = baseValue(vars, soln, 'P')
pL = newValue(vars, soln, 'P', iNum)

#PD
pd0 = baseValue(vars, soln, 'PD')
pdL = newValue(vars, soln, 'PD', iNum)

#PVA
pva0 = baseValue(vars, soln, 'PVA')
pvaL = newValue(vars, soln, 'PVA', iNum)

#RA
ra0 = baseValue(vars, soln, 'RA')
raL = newValue(vars, soln, 'RA', iNum)

#R
r0 = baseValue(vars, soln, 'R')
rL = newValue(vars, soln, 'R', iNum)

#S
s0 = baseValue(vars, soln, 'S')
sL = newValue(vars, soln, 'S', iNum)

#SPI
spi0 = baseValue(vars, soln, 'SPI')
spiL = newValue(vars, soln, 'SPI', iNum)


#V
v0 = baseValue(vars, soln, 'V')
vL = newValue(vars, soln, 'V', iNum)

#Y
y0 = baseValue(vars, soln, 'Y')
yL = newValue(vars, soln, 'Y', iNum)

#Yd
yd0 = baseValue(vars, soln, 'YD')
ydL = newValue(vars, soln, 'YD', iNum)

# DIFFERENCES

if iNum >= 0:
    #DFCG.L(I,G)      = CG.L(I,G)-CG0(I,G);
    dfcg = getDiff(vars, soln, 'CG', iNum)

    #DFFD.L(F,Z)      = FD.L(F,Z)-FD0(F,Z);
    dffd = getDiff(vars, soln, 'FD', iNum)

    #DK.L(K,Z)        = FD.L(K,Z)-FD0(K,Z);
    dk = getDiff(vars, soln, 'KS', iNum)

    #DY.L(Z)          = Y.L(Z)-Y0(Z);
    dy = getDiff(vars, soln, 'Y', iNum)

    #DDS.L(I)         = DS.L(I)-DS0(I);
    dds = getDiff(vars, soln, 'DS', iNum)

    #DDD.L(I)         = DD.L(I) - DD0(I);
    ddd = getDiff(vars, soln, 'DD', iNum)

     #DCX.L(I)         = CX.L(I) -CX0(I);
    dcx = getDiff(vars, soln, 'CX', iNum)

    #DCH.L(I,H)       = CH.L(I,H) - CH0(I,H);
    dch = getDiff(vars, soln, 'CH', iNum)

    #DRR.L(F,Z)       = R.L(F,Z)-R0(F,Z);
    dr = getDiff(vars, soln, 'R', iNum)

    #DCMI.L(L)        = CMI.L(L) - CMI0(L);
    dcmi = getDiff(vars, soln, 'CMI', iNum)

    #DCMO.L(CM)       = CMO.L(CM) - CMO0(CM);
    dcm = getDiff(vars, soln, 'CMO', iNum)
