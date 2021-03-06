*===============================================================================
* PREAMBLE
*===============================================================================

$TITLE JOPLIN_COLLAPSED ANALYSIS MODEL - JOPLSMALL(WRS:2-05)
$OFFSYMLIST OFFSYMXREF

$ONTEXT
================================================================================
CODE:    Christopher Keyes, Harvey Cutler (2017)

DATA:    CSU & NIST Center for Community Resliancy
================================================================================

Collapsed Joplin Model :

CES production

NOTES:
This was prevously Chris's JOPsm_WS_DY script that has been adjusted to use the
elasticities in Harvey's 'jopLincollapseDYN_BH' script and the framework of Chris's
Shelby model

This is now the working model of Joplin Small that Harvey prefers

$OFFTEXT
*===============================================================================
* OPTION FILE
*===============================================================================

$onecho > minos5.opt
* OPTIONS FOR HIGHLY NON-LINEAR MODELS

*penalty parameter       = 100
major damping parameter = 0.1
minor damping parameter = 0.1
*scale all variables
$offecho

*===============================================================================
* SETS FOR SIMULATIONS
*===============================================================================
SETS
t        TIME PERIODS
*/ 1*1 /
/ 1*1 /

SM       SIMMLOOP
*/ BASE, TODAY /
/ BASE, TODAY,simm/

*===============================================================================
* SET DECLARATION
*===============================================================================
SETS

Z  ALL ACCOUNTS IN SOCIAL ACCOUNTING MATRIX
/
const1
Retail1
Serv1
HC1
Accom1
Rest1
ag2
const2
manuf2
Retail2
Serv2
HC2
Accom2
Rest2
ag3
util
const3
Retail3
Serv3
HC3
HS1
HS2
HS3
L1
L2
L3
L4
L5
Land
Kap
Inves
HH1
HH2
HH3
HH4
HH5
USSOCL1
USSOCL2
USSOCL3
USSOCL4
USSOCL5
STPIT
LOCTAX
PROPTX
ACCTAX
CYGF
FED
ROW
/

F(Z)     FACTORS
/
L1, L2, L3, L4, L5, LAND, KAP
/

L(F)     LABOR
/
L1, L2, L3, L4, L5
/

LA(F)    LAND
/
LAND
/

K(F)     CAPITAL
/
KAP
/

G(Z)     GOVERNMENTS
/
USSOCL1, USSOCL2, USSOCL3, USSOCL4, USSOCL5,
STPIT, LOCTAX, PROPTX, ACCTAX, CYGF, FED
/

GN(G)    ENDOGENOUS GOVERNMENTS
/
FED
/

GNL(G)   LOCAL  ENDOGENOUS GOVERNMENTS
/
Fed
/

GX(G)    EXOGENOUS GOVERMENTS
/
USSOCL1, USSOCL2, USSOCL3, USSOCL4, USSOCL5,
STPIT, LOCTAX, PROPTX, ACCTAX
/

GS(G)    SALES OR EXCISE TAXES
/
LOCTAX, ACCTAX
/

GL(G)    LAND TAXES
/
PROPTX
/

GF(G)    FACTOR TAXES
/
USSOCL1, USSOCL2, USSOCL3, USSOCL4, USSOCL5,
PROPTX
/

GFUS(G)  SS PAYMENT
/
USSOCL1, USSOCL2, USSOCL3, USSOCL4, USSOCL5
/

GFUSC(G) SS PAYMENT
/
USSOCL1, USSOCL2, USSOCL3, USSOCL4, USSOCL5
/

GI(G)    INCOME TAX UNITS
/
STPIT
/

GH(G)    HOUSEHOLD TAX UNITS
/
PROPTX
/

GY(G)    EXOGNOUS TRANSFER PMT
/
USSOCL1, USSOCL2, USSOCL3, USSOCL4, USSOCL5,
STPIT, LOCTAX, PROPTX,ACCTAX,
FED
/

GT(G)    ENDOGENOUS TRANSFER PMT
/
CYGF, FED
/

H(Z)     HOUSEHOLDS
/
HH1, HH2, HH3, HH4, HH5
/

IG(Z)    I+G SECTORS
/
const1, Retail1, Serv1, HC1, Accom1,
Rest1, ag2, const2, manuf2, Retail2, Serv2, HC2, Accom2,
Rest2, ag3, util, const3, Retail3, Serv3, HC3,
HS1, HS2, HS3, FED
/

I(IG)    INDUSTRY SECTORS
/
const1, Retail1, Serv1, HC1, Accom1,
Rest1, ag2, const2, manuf2, Retail2, Serv2, HC2, Accom2,
Rest2, ag3, util, const3, Retail3, Serv3, HC3,
HS1, HS2, HS3
/


IG2(IG)  ENDOGENOUS GOVERNMENTS
/
FED
/

cf(G)
/cygf/

IP(I)    PRODUCTION SECTORS
/
const1, Retail1, Serv1, HC1, Accom1,
Rest1, ag2, const2, manuf2, Retail2, Serv2, HC2, Accom2,
Rest2, ag3, util, const3, Retail3, Serv3, HC3
/

FG(IG)   PRODUCTION GOV.
/
const1, Retail1, Serv1, HC1, Accom1,
Rest1, ag2, const2, manuf2, Retail2, Serv2, HC2, Accom2,
Rest2, ag3, util, const3, Retail3, Serv3, HC3
/

HD(I)    HOUSING SERV.DEMAND
/
HS1, HS2, HS3
/

VARS     NUMBER OF VARIABLES CONTAINING SOLUTION VALUES
/ 1*10 /

R1H      REPORT 1 FOR SCALARS
/
GFREV, SFREV, PIT,
DGF, DSF, DDRE, PDRE, SPI, COMM, COMMO,
GN, NKI, HH, W, W1, W2, W3, R,RL, L , K, HN, HW,GFSAV, LD,
HC, SSC, LAND, LAS
/

R2H      REPORT 2 FOR STATUS
/
M-STAT, S-STAT
/

MS       LABELS FOR MODEL STATUS
/
OPTIMAL, LOCALOP, UNBOUND,
INFSBLE, INFSLOC, INFSINT,
NOOPTML, MIPSOLN, NOINTGR,
INFSMIP, UNUSED,  UNKNOWN,
NOSOLUT
/

SS       LABELS FOR SOLVER STATUS
/
OK, ITERATE, RESRCE,
SOLVER,  EVALUATE, NOTKNWN,
NOTUSED, PRE-PROC, SETUP,
SLVFAIL, SLVINTER, POST-PROC,
METSYS
/

*===============================================================================
* SETS FOR MISC TABLES ONLY

HSSET(I)         HOUSING SERVICES
/
HS1, HS2, HS3
/

HH1(H)           HOUSEHOLDS (INCOME 1)
/
HH1
/

HH2(H)           HOUSEHOLDS (INCOME 2)
/
HH2
/

HH3(H)           HOUSEHOLDS (INCOME 3)
/
HH3
/

HH4(H)           HOUSEHOLDS (INCOME 4)
/
HH4
/

HH5(H)           HOUSEHOLDS (INCOME 5)
/
HH5
/

ETA              ELASTICITIES
/
ETAL1
ETAI1
ETALB1
ETAPIT
ETAPT
ETARA
NRPG
ETAYD
ETAU
ETAM
ETAE
ETAY
ETAOP
/

ETALANDCAP(ETA)  LANDCAP TABLE ELASTICITIES
/
ETAL1, ETAI1, ETALB1
/

ETAMISCH(ETA)    MISCH TABLE ELASTICITIES
/
ETAPIT, ETAPT, ETARA, NRPG, ETAYD, ETAU
/

ETAMISC(ETA)  MISC TABLE ELASTICITIES
/
ETAM, ETAE, ETAY, ETAOP
/

*===============================================================================
ALIAS

(I,J), (I,I1), (Z,Z1), (F,F1), (G,G1), (G,G2), (GI,GI1),
(GS,GS1),(GX,GX1), (GN,GN1), (GH,GH1), (GF,GF1), (H,H1),
(HD, HD1), (IP,JP), (IG,JG),(GY,GY1), (GT,GT1), (GY, GY2),(GNL, GNL1)
;

*===============================================================================

*===============================================================================
* ADDITIONAL RUN FILES
*===============================================================================

TABLE SAM(Z,Z1) SOCIAL ACCOUNTING MATRIX
$ONDELIM
*$INCLUDE C:\tester\new dir\SAM Seaside.CSV
$INCLUDE z:\Users\taolu\Desktop\presentation\Seaside\seaside\GMS_seaside_CD\SAM SeasideKC.csv
$OFFDELIM
$INCLUDE z:\Users\taolu\Desktop\presentation\Seaside\seaside\GMS_seaside_CD\Seaside Misc.prn
*$offdelim

TABLE BB(I,IG) CAPITAL COMP
$ONDELIM
*$INCLUDE C:\Dropbox\CGE_Modeling\Models\GAMS_Models\Joplin\JOP_SMALL\Run_Files\CAPCOMjop.CSV
$INCLUDE z:\Users\taolu\Desktop\presentation\Seaside\seaside\GMS_seaside_CD\Seaside Capcom.CSV
*"SEASIDE_HC.xlsx"
$OFFDELIM

*===============================================================================
* VARIABLE DECLARATION
*===============================================================================

SCALARS
DEPR                     DEPRECIATION RATE FOR K
EPSILON                  SMALL NUMBER FOR LOWER BOUNDS

PARAMETERS
A(Z,Z1)                  INPUT OUTPUT COEFFICIENTS
AD(Z,Z1)                 DOMESTIC INPUT OUTPUT COEFFICIENTS
AG(Z,G)                  GOVERNMENT SPENDING SHARES OF NET INCOME
AGFS(Z,G)
SIGMA(I)                 ELASTICITY OF SUBSTITUTION IN PRODUCTION FUNCTION
ALPHA(F,I)               FACTOR SHARE EXPONENTS IN PRODUCTION FUNCTION
ALPHA1(F,I)
B(I,IG)
B1(I,J)
FCONST(F,I)
GAMMA(I)                 PRODUCTION FUNCTION SCALE
DELTA(I)
PIT(G,H)
PIT0(G,H)                PERSONAL INCOME TAX SAM VALUE
PRIVRET1(H)
PRIVRET(H)
LFOR(LA)                 PROPORTION OF LAND INCOME    OUTFLOW
KFOR(K)                  PROPORTION OF CAPITAL INCOME  OUTFLOW
GFOR(G)                  PROPORTION OF GOVT INCOME OUTFLOW
out(G1,G1)
TAUF(G,F,Z)              FACTOR TAXES
TAUFH(G,F)               AGG FACTOR TAXES
TAUFL(G,L)               EMPLOYEE PORTION OF FACTOR TAXES
TAUFLA(G,LA)             LAND FACTOR TAXES
TAUFK(G,K)               CAPITAL FACTOR TAXES
TAUFX(G,F,Z)
TAUH(G,H)                HOUSEHOLD TAXES OTHER THAN PIT
TAUH0(G,H)               HOUSEHOLD TAXES OTHER THAN PIT SAM VALUE
TAUM(G,IG)               IMPORT DUTY RATES
TAUQ(G,IG)               AVERAGE SALES TAX RATES
TAUC(G,I)                EXPERIMENTAL CONSUMPTION SALES TAX RATES
TAUCH(G,HD)              HOUSING CONSUMPTION SALES TAX RATES
TAUV(G,I)                EXPERIMENTAL CONSUMPTION SALES TAX RATES
TAUN(G,IG)               EXPERIMENTAL CONSUMPTION SALES TAX RATES
TAUX(G,IG)               EXPERIMENTAL CONSUMPTION SALES TAX RATES
TAUG(G,I)                EXPERIMENTAL CONSUMPTION SALES TAX RATES
TAXS(G,GX)               TAX DESTINATION SHARES
TAXS1(GNL)

BETA(I,H)                INCOME ELASTICITY OF DEMAND
BETAH(HD,H)              INCOME ELASTICITY OF HOUSING DEMAND
ETAD(I)                  DOMESTIC SHARE PRICE ELASTICITIES
ETAE(I)                  EXPORT ELASTICITIES WITH RESPECT TO DOMESTIC PRICE
ETAI(IG)                 LAND ELASTICITY
ETAIX(K,IG)              LAND ELASTICITY
ETAL(LA,IG)              LAND ELASTICITY
ETAL1(IG)                LABOR ELASTICITY
ETALB1(IG)               LABOR ELASTICITY
ETALB(L,IG)              LABOR ELASTICITY
ETAM(I)                  IMPORT ELASTICITIES WITH RESPECT TO DOMESTIC PRICE
ETARA(H)                 L SUPPLY ELASTICITY WITH RESPECT TO AVERAGE WAGE
ETAYDO(H)                RESPONSIVENESS OF OUT MIGRATION TO AFTER TAX EARNINGS
ETAUO(H)                 RESPONSIVENESS OF OUT MIGRATION TO UNEMPLOYMENT
ETAYDI(H)                RESPONSIVENESS OF IN MIGRATION TO AFTER TAX EARNINGS
ETAUI(H)                 RESPONSIVENESS OF IN MIGRATION TO UNEMPLOYMENT
ETAYD(H)                 RESPONSIVENESS OF INMIGRATION TO AFTER TAX EARNINGS
ETAU(H)                  RESPONSIVENESS OF INMIGRATION TO UNEMPLOYMENT
ETAPT(H)                 HOUSEHOLD RESPONSE TO TRANSFER PAYMENTS
ETAPIT(H)                L SUPPLY ELASTICITY WITH RESPECT TO TAXES
HOUSECOR(H,HD)           HOUSEHOLD HOUSING RELATIONSHIP
JOBCOR(H,L)              CORRECTION FACTOR BETWEEN HOUSEHOLDS AND JOBS
LAMBDA(I,J)              CROSS PRICE ELASTICITIES
LAMBDAH(HD,HD1)          HOUSING CROSS PRICE ELASTCITIES
NRPG(H)                  NATURAL RATE OF POPULATION GROWTH
RHO(I)                   EXPONENT IN PRODUCTION FUNCTION
TT(F,IG)

R1(R1H,SM)               REPORT  SCALAR VARIABLES
R2(R2H,SM)               REPORT  SOLVER AND MODEL STATUS VALUES

CG0(I,G)                 REAL    GOVERNMENT CONSUMPTION
CG0T(I,G)
CH0(I,H)                 REAL    PRIVATE CONSUMPTION
CH0T(I,H)
CN0(I)                   REAL    INVESTMENT BY SECTOR OF SOURCE
CN0T(I)
CPI0(H)                  PRICE   CONSUMER PRICE INDICES
CPIN0(H)                 PRICE   NONHOUSING PRICE INDEX
CPIH0(H)                 PRICE   HOUSING PRICE INDEX
CX0(I)                   REAL    EXPORT CONSUMPTION
D0(I)                    RATIO   DOMESTIC SUPPLY SHARE OF DOMESTIC DEMAND
DD0(Z)                   REAL    DOMESTIC DEMAND
DS0(Z)                   REAL    DOMESTIC SUPPLY QUANTITIES
DQ0(Z)

FD0(F,Z)                 REAL    FACTOR DEMAND
IGT0(G,GX)               NOMINAL INTER GOVERNMENTAL TRANSFERS
KS0(K,IG)                REAL    CAPITAL STOCK
KSNEW0(K,IG)
LAS0(LA,IG)              ASSESSOR        LAND STOCK
HH0(H)                   NUMBER OF HOUSEHOLDS
HN0(H)                   NUMBER OF NONWORKING HOUSEHOLDS
HW0(H)                   NUMBER OF WORKING HOUSEHOLDS
M0(I)                    REAL    IMPORTS
M01(Z)                   REAL    IMPORTS
MI0(H)                   REAL    IN MIGRATION
MO0(H)                   REAL    OUT MIGRATION
N0(K,IG)                 REAL    GROSS INVESTMENT BY SECTOR OF DESTINATION
NKI0                     NOMINAL NET CAPITAL INFLOW
KPFOR01(K)
KPFOR0(K)                NOMINAL   CAPITAL OUTFLOW
LNFOR0(LA)               NOMINAL   LAND OUTFLOW
LNFOR01(LA)
GVFOR0(G)                NOMINAL   GOVT OUTFLOW
P0(IG)                   PRICE   AGGREGATE PRICES
PH0(HD)                  PRICE   AGGREGATE HOUSING PRICES
PD0(I)                   PRICE   DOMESTIC PRICES
PVA0(I)                  PRICE   VALUE ADDED PRICES
PWM0(I)                  PRICE   IMPORT PRICE
PW0(I)
Q0(Z)                    REAL    SOCIAL ACCOUNTING MATRIX COLUMN TOTALS
Q10(Z)                   REAL    SOCIAL ACCOUNTING MATRIX ROW TOTALS
R0(F,Z)                  PRICE   INITIAL SECTORAL RENTAL RATE FOR FACTOR
RA0(F)                   AVERAGE RENTAL RATES FOR FACTORS
S0(Z)                    NOMINAL SAVINGS
SPI0                     PERSONAL INCOME (OBJ FUNC)
V0(I)                    REAL    INTERMEDIATE DEMAND
V0T(I)
TP(H,G)                  NOMINAL GOVERNMENT SOCIAL SECURITY PAYMENTS
TAUF0(G,F,Z)             SOCIAL SECURITY TAX
YD0(H)                   NOMINAL AFTER TAX TOTAL HOUSEHOLD INCOMES
Y0(Z)                    NOMINAL GROSS HOUSEHOLD INCOME
Y01(H)
YT0(G)                    GOV INCOMES
GCP10(I)                 REAL    GROSS CITY PRODUCT
GCP0
DDCX(I)

Lstore(Z,L,t)
dystore(Z,t)
dsstore(I,t)
hhstore(H,t)
fstore(z,f,t)
cpistore(h,t)
ksstore(k,i,t)
dmstore(i,t)
dvstore(i,t)
dfstore(f,i,t)
Nstore(k,i,t)

* MISC TABLES
TPC(H,G)
IGTD(G, G1)
TAUFF(G,F)
IOUT(G1, G1)
LANDCAP(IG, ETALANDCAP)
MISCH(H, ETAMISCH)
MISC(IG, ETAMISC)
ALPHA2(F,I)
Y0test(G)
;


*===============================================================================
* SIMPLIFYING TABLES AND DOING AWAY WITH MISC FILES
*===============================================================================

out(G1,G1)                       = 0;
OUT('FED', 'CYGF')              = 1;

IGTD(G,G1)                       = 0;
*IGTD('FED', GFUS)                = 1;
*IGTD('FED', 'STPIT')             = 1;
*IGTD('FED', 'LOCTAX')             = 1;
*IGTD('FED', 'PROPTX')             = 1;
IGTD('CYGF',GFUS)=1;
IGTD('CYGF','STPIT')=1;
IGTD('CYGF', 'acctax')          = 1;
IGTD('CYGF', 'LOCTAX')          = 1;
IGTD('CYGF', 'PROPTX')           = 1;


TPC(H,G)                         = 0;
TPC(H,GFUS)                      = 1;


TAUFF(G,F)                       = 0;
TAUFF('USSOCL1', 'L1')            = 1;
TAUFF('USSOCL2', 'L2')            = 1;
TAUFF('USSOCL3', 'L3')            = 1;
TAUFF('USSOCL4', 'L4')            = 1;
TAUFF('USSOCL5', 'L5')            = 1;
TAUFF('PROPTX', 'KAP')          = 1;

IOUT(G1, G1)                     = 0;
IOUT('FED', 'CYGF')             = 1;

LANDCAP(IG, ETALANDCAP)          = 1;
LANDCAP('const1', 'ETAL1')       = 0.5;
LANDCAP('Retail1', 'ETAL1')      = 2;
LANDCAP('Serv1', 'ETAL1')        = 1.4;
LANDCAP('HC1', 'ETAL1')          = 1.4;
LANDCAP('Accom1', 'ETAL1')       = 0.5;
LANDCAP('Rest1', 'ETAL1')        = 0.5;
LANDCAP('ag2', 'ETAL1')          = 0.5;
LANDCAP('const2', 'ETAL1')       = 0.5;
LANDCAP('manuf2', 'ETAL1')       = 0.5;
LANDCAP('Retail2', 'ETAL1')      = 2;
LANDCAP('Serv2', 'ETAL1')        = 0.5;
LANDCAP('HC2', 'ETAL1')          = 0.5;
LANDCAP('Accom2', 'ETAL1')       = 0.5;
LANDCAP('Rest2', 'ETAL1')        = 0.5;
LANDCAP('ag3', 'ETAL1')          = 0.5;
LANDCAP('util', 'ETAL1')         = 1.4;
LANDCAP('const3', 'ETAL1')       = 1.4;
LANDCAP('Retail3', 'ETAL1')      = 2;
LANDCAP('Serv3', 'ETAL1')        = 1.4;
LANDCAP('HC3', 'ETAL1')          = 2;
LANDCAP('HS1', 'ETAL1')          = 2;
LANDCAP('HS2', 'ETAL1')          = 2;
LANDCAP('HS3', 'ETAL1')          = 2;

MISCH(H, ETAMISCH)               = 0;
MISCH(HH1, 'ETAPT')              = -0.5;
MISCH(HH2, 'ETAPIT')             = -0.15;
MISCH(HH3, 'ETAPIT')             = -0.2;
MISCH(HH4, 'ETAPIT')             = -0.25;
MISCH(HH5, 'ETAPIT')             = -0.35;

MISCH(H, 'NRPG')                 = 1;
MISCH(H, 'ETARA')                = 1;

* DRAM
MISCH(HH2, 'ETARA')                = 0.2;
MISCH(HH3, 'ETARA')                = 0.3;
MISCH(HH4, 'ETARA')                = 0.5;
MISCH(HH5, 'ETARA')                = 0.8;

MISCH(HH1, 'ETAYD')              = 1.3;
MISCH(HH2, 'ETAYD')              = 1.6;
MISCH(HH3, 'ETAYD')              = 1.8;
MISCH(HH4, 'ETAYD')              = 2.0;
MISCH(HH5, 'ETAYD')              = 2.1;

MISCH(HH1, 'ETAU')               = -0.8;
MISCH(HH2, 'ETAU')               = -0.6;
MISCH(HH3, 'ETAU')               = -0.5;
MISCH(HH4, 'ETAU')               = -0.4;
MISCH(HH5, 'ETAU')               = -0.3;

MISC(IG, ETAMISC)                = 0;
MISC(IP, 'ETAM')                 = 1;
MISC(IP, 'ETAE')                 = -3.65;
MISC(I, 'ETAY')                  = 1;
MISC(I, 'ETAOP')                 = -1;


* CENTERVILLE MISC
*MISCH(H, 'ETAYD')                = 1;
*MISCH(H, 'ETAU')                 = -1;

*===============================================================================
* PARAMETERS AND ELASTICITIES
*===============================================================================

BETA(I,H)        = MISC(I,'ETAY');
BETAH(HD,H)      = MISC(HD,'ETAY');
LAMBDA(I,I)      = MISC(I,'ETAOP');
LAMBDAH(HD,HD)   = MISC(HD,'ETAOP');
ETARA(H)         = MISCH(H,'ETARA');
ETAM(I)          = MISC(I,'ETAM');
ETAE(I)          = MISC(I,'ETAE');
ETAPIT(H)        = MISCH(H,'ETAPIT');
ETAPT(H)         = MISCH(H,'ETAPT');
ETAYD(H)         = MISCH(H,'ETAYD');
ETAU(H)          = MISCH(H,'ETAU');

ETAIX('KAP',IG)  = LANDCAP(IG,'ETAI1');
ETAI(IG)         = LANDCAP(IG,'ETAI1');
ETAL('LAND',IG)  = LANDCAP(IG,'ETAL1');
ETALB(L,IG)      = LANDCAP(IG,'ETALB1');

NRPG(H)          = MISCH(H,'NRPG');

* CENTERVILLE ELASTICITIES

ETARA(H)          = 2.5;
*ETARA(H)          = 2.0;

ETAUI(H)          = -1.5;
ETAUO(H)          = -0.72;

ETAYDO(H)         = 1.4;
ETAYDI(H)         = 1.5;

*ETAIX('KAP',IG)  = 0.1*ETAIX('KAP',IG);
ETAIX('KAP',IG)  = 0.1;
ETAE(IP)          = -1.5;


* DRAM ELASTICITIES
*ETAUO(H)         = MISCH(H, 'ETAU');
*ETAUI(H)         = MISCH(H, 'ETAU');
*ETAE(IP)         = -1.65;

*ETAYDO(H)         = ETAYD(H);
*ETAYDI(H)         = ETAYD(H);

*ETAUI(H)          = ETAU(H);
*ETAUO(H)          = ETAU(H);

SIGMA(I)         = 0.67;


*===============================================================================
* CALIBRATION
*===============================================================================

Q10(Z)   = SUM(Z1,SAM(Z,Z1) );
Q0(Z)    = SUM(Z1,SAM(Z1,Z) );
DQ0(Z)   = Q10(Z)-Q0(Z);

Q10(Z)   = SUM(Z1,SAM(Z,Z1) );
Q0(Z)    = SUM(Z1,SAM(Z1,Z) );
DQ0(Z)   = Q10(Z)-Q0(Z);

B1(I,J)=  SAM(I,J);

out(G1,G1) = IOUT(G1,G1);

HH0(H)           = HHTABLE(H,'HH0');
HW0(H)           = HHTABLE(H,'HW0');
HN0(H)           = HH0(H) - HW0(H);

MI0(H)           = HH0(H) * 0.04;
MO0(H)           = HH0(H) * 0.04;

FD0(F,Z)         = EMPLOY(Z,F);

JOBCOR(H,L)      = JOBCR(H,L);

TAUQ(GS,I)       = SAM(GS,I)/
                         (SUM(J, SAM(I,J)) + SUM(H, SAM(I,H)) + SAM(I, 'INVES')
                         + SUM(G,SAM(I,G)) + SAM(I,'ROW') - SUM(GS1, SAM(GS1,I)));


TAUC(GS,I)       = TAUQ(GS,I);
TAUV(GS,I)       = TAUQ(GS,I);
TAUN(GS,I)       = TAUQ(GS,I);
TAUG(GS,I)       = TAUQ(GS,I);
TAUX(GS,I)       = TAUQ(GS,I);

TAUH(GH,H)       = SAM(GH,H) / HH0(H);
TAUH0(GH,H)      = SAM(GH,H) / HH0(H);

TAUF0(G,F,Z)     = 0;
TAUF(GF,F,I)$(SAM(F,I) AND TAUFF(GF,F))  = SAM(GF,I) / SAM(F,I);
TAUF(GF,F,G)$(SAM(F,G) AND TAUFF(GF,F))  = SAM(GF,G) / SAM(F,G);
TAUFX(GF,F,Z)    = TAUF(GF,F,Z);

TAUFH(GF,F)$(TAUFF(GF,F))        = SAM(GF,F) / SUM(Z, SAM(Z,F));

TAUFH(GF,L)      = SAM(GF,L) / SUM(IG, SAM(L,IG));

TAUFL(GF,L)      = SAM(GF,L) / SUM(Z, SAM(Z,L));
TAUFLA(GF,LA)    = SAM(GF,LA) / SUM(Z, SAM(Z,LA));
TAUFK(GF,K)      = SAM(GF,K) / SUM(Z, SAM(Z,K));

TAXS(G,GX)$(IGTD(G,GX) EQ 1)     = SAM(G,GX)/
                                         SUM(G1$(IGTD(G1,GX) EQ 1), SAM(G1,GX));

TAXS1(GNL)       = SAM(GNL,'CYGF')/SUM(GNL1, SAM(GNL1,'CYGF'));
display Taxs1;

IGT0(G,GX)       = SAM(G,GX);

display IGT0;

PWM0(I)          = 1;
PW0(I)           = 1;
P0(I)            = 1;
PH0(HD)          = 1;
PD0(I)           = 1;
CPI0(H)          = 1;
CPIN0(H)         = 1;
CPIH0(H)         = 1;
TT(F,IG)         = 1;
R0(F, Z)         = 1;
RA0(f)           = 1;

R0(F,IG)$EMPLOY(IG,F)    = SAM(F ,IG) / (EMPLOY(IG,F)) ;

TP(H,G)          = 0;
TP(H,G)$(HH0(H)) = SAM(H,G) / ( HH0(H) );

KS0(K,IG)        = FD0(K,IG);
KSNEW0(K,IG)     = KS0(K,IG);
LAS0(LA,IG)      = FD0(LA ,IG);

DEPR             = SUM(IG, SAM(IG,'INVES') ) / (SUM((K,IG), KS0(K,IG)));

A(Z,Z1)          = SAM(Z,Z1) / Q0(Z1);

AGFS('L1',G)    = SAM('L1',G)+SAM('USSOCL1',G);
AGFS('L2',G)    = SAM('L2',G)+SAM('USSOCL2',G);
AGFS('L3',G)    = SAM('L3',G)+SAM('USSOCL3',G);
AGFS('L4',G)    = SAM('L4',G)+SAM('USSOCL4',G);
AGFS('L5',G)    = SAM('L5',G)+SAM('USSOCL5',G);

AG(I,G)$(SUM(J, SAM(J,G) ) + SUM(F, SAM(F,G) ) + SUM(GF, SAM(GF,G) ) )
        = SAM(I,G) / ( SUM(J, SAM(J,G) ) + SUM(F, SAM(F,G) )
        + SUM(GF, SAM(GF,G) ));

AG(F,G)$(SUM(I, SAM(I,G) ) + SUM(F1, SAM(F1,G) ) + SUM(GF, SAM(GF,G) ) )
        = SAM(F,G) / ( SUM(I, SAM(I,G) ) + SUM(F1, SAM(F1,G) )
        + SUM(GF, SAM(GF,G) ) );

AG(L,G)$(SUM(I, SAM(I,G) ) + SUM(F1, SAM(F1,G) ) + SUM(GF, SAM(GF,G) ) )
        = AGFS(L,G) / ( SUM(I, SAM(I,G) ) + SUM(F1, SAM(F1,G) )
        + SUM(GF, SAM(GF,G) ) );

CX0(I)           = SAM(I,'ROW')/P0(I) /( 1 + SUM(GS, TAUQ(GS,I) ) );

M0(IP)           = SUM(Z,SAM(IP,Z)) -
                         (SUM(J, B1(J,IP))
                         + SUM(F,SAM(F,IP))
                         + SUM(G, SAM(G,IP)));

M0(I)            = M0(I) / PWM0(I);

V0(I)            = SUM(J, SAM(I,J) ) / P0(I) /( 1 + SUM(GS, TAUQ(GS,I) ) );
V0T(I)           = SUM(J, SAM(I,J) ) / P0(I) ;


CH0(I,H)         = SAM(I,H) / P0(I)/ ( 1 + SUM(GS, TAUQ(GS,I) ) );
CH0T(I,H)        = SAM(I,H) / P0(I);

CG0(I,GN)        = SAM(I,GN) / P0(I)/ ( 1 + SUM(GS, TAUQ(GS,I) ) );
CG0T(I,GN)       = SAM(I,GN) / P0(I);

N0(K,IG)         = (KS0(K,IG)) * (DEPR);

B(I,IG)          = BB(I,IG);

CN0(I)           = 0;
CN0(I)           = SUM(IG, B(I,IG) * SUM(K, N0(K,IG)) ) / P0(I)/ ( 1 + SUM(GS, TAUN(GS,I) ) );
CN0T(I)          = SUM(IG, B(I,IG) * SUM(K, N0(K,IG)) )/P0(I);

DD0(I)           = SUM(H, CH0(I,H) ) + SUM(G, CG0(I,G) ) + CN0(I) + V0(I);
D0(I)            = 1 - (M0(I) / DD0(I));

ETAD(I)          = - ETAM(I) * M0(I) / (DD0(I) * D0(I));


DS0(I)           = DD0(I) + CX0(I) - M0(I);

AD(I,J)          = SAM(I,J) / P0(I) /(1 + SUM(GS, TAUQ(GS, I)))/ DS0(J);

PVA0(I)          = PD0(I) - SUM(J, AD(J,I) * P0(J)*(1 + SUM(GS, TAUQ(GS, J)))); DISPLAY PVA0;


RHO(I)           = (1-SIGMA(I))/SIGMA(I);
*RHO(I)           = (SIGMA(I)-1)/SIGMA(I);

ALPHA1(F,I)      = 0;
ALPHA2(F,I) = SUM(GF$TAUFF(GF,F), SAM(GF,I) ); DISPLAY ALPHA2;
 ALPHA1(F,I)  =   ( SAM(F,I)            + SUM(GF$TAUFF(GF,F), SAM(GF,I) ) )
                / ( SUM(F1, SAM(F1,I) ) + SUM(GF, SAM(GF,I)             ) );  display alpha1;

*  ALPHA1(F,I)  =    SAM(F,I )
*                / ( SUM(F1, SAM(F1,I)));

 ALPHA(F,I) =  ALPHA1(F,I)/(SUM(F1, ALPHA1(F1,I)));  DISPLAY ALPHA;

* ALPHA1(F,I)  =   ( SAM(F,I)            + SUM(GF$TAUFF(GF,F), SAM(GF,I) ) )
*                / ( SUM(F1, SAM(F1,I) ) + SUM(GF, SAM(GF,I)             ) );

*  ALPHA1(F,I)  =    SAM(F,I )
*                / ( SUM(F1, SAM(F1,I)));


DELTA(I) = DS0(I)/ (PROD(F$ALPHA(F,I),FD0(F,I)**ALPHA(F,I)));  display delta;

PRIVRET(H)       = SUM(Z,SAM(Z,H))
                         - (SUM(F, SAM(H,F))
                         + SUM(GX,SAM(H,GX)));

PRIVRET(H)       = PRIVRET(H)/HH0(H);

Y0(F)            = SUM(IG, SAM(F,IG) );

KPFOR01(K)       = SAM('KAP', 'ROW');
KPFOR0(K)        = SUM(Z,SAM(Z,K)) - (SUM(IG, SAM(K,IG)));

LNFOR01(LA)      = SAM('LAND', 'ROW');
LNFOR0(LA)       = SUM(Z,SAM(Z,LA)) - (SUM(IG, SAM(LA,IG)));

GVFOR0(G)        = SAM(G, 'ROW');
GVFOR0(GT)       = SUM(Z,SAM(Z,GT))
                         - (SUM(I, SAM(GT,I))
                         + SUM(F, SAM(GT,F))
                         + SUM(H,SAM(GT,H))
                         + SUM(G1,SAM(GT,G1)));

A(H,L)           = SAM(H,L) / HW0(H) /
                         (Y0(L) + SUM(Z,SAM(Z,L))
                         - (SUM(IG, SAM(L,IG))))*( 1 - SUM(G, TAUFL(G,L)));

A(H,'KAP')       = SAM(H,'KAP') / HW0(H)
                         /(Y0('KAP') + SUM(Z,SAM(Z,'KAP')) - (SUM(IG, SAM('KAP',IG))));

A(H,'LAND')      = SAM(H,'LAND') / HW0(H)
                         / (Y0('LAND') + SUM(Z,SAM(Z,'LAND'))
                         -(SUM(IG, SAM('LAND',IG))))* ( 1 - SUM(G, TAUFLA(G,'LAND')) );

S0(H)            = SAM('INVES',H);

YD0(H)           = SUM(I, SAM(I,H) ) + S0(H);

Y0(G)            = SUM(Z, SAM(G,Z)) - SAM(G,'ROW' );


S0(G)            = SAM('INVES',G);

LFOR(LA)         = LNFOR0(LA)/(SUM(IG, SAM('LAND', IG)));
KFOR(K)          = KPFOR0(K)/(SUM(IG, SAM('KAP', IG)));
GFOR(G)$(Y0(G))  = GVFOR0(G)/(Y0(G));

NKI0     = SUM(I, M0(I) * PWM0(I) ) - SUM(I, CX0(I) * PD0(I) )
                 - SUM(H, PRIVRET(H)*HH0(H)) - SUM(LA, LNFOR0(LA))
                 - SUM(K, KPFOR0(K)) - SUM(G, GVFOR0(G));

Y0(H)    = SUM(L,  A(H,L) * HW0(H) / SUM(H1, A(H1,L) * HW0(H1) )
                 * Y0(L) * ( 1 - SUM(G, TAUFL(G,L))))
                 + SUM(LA,  A(H,LA) * HW0(H) / SUM(H1, A(H1,LA) * HW0(H1))
                 * (Y0(LA) * ( 1 - SUM(G, TAUFLA(G,LA)))+ LNFOR0(LA)) )
                 + SUM(K,  A(H,K) * HW0(H) / SUM(H1, A(H1,K) * HW0(H1)) * (Y0(K)
                 * ( 1 - SUM(G, TAUFK(G,K)))+ KPFOR0(K))) ;

SPI0             = SUM(H, Y0(H) )
                         + SUM((H,G), TP(H,G) * HH0(H))
                         + SUM(H, PRIVRET(H)*HH0(H));

PIT(GI,H)        = SAM(GI,H) / (Y0(H));

PIT0(GI,H)       = SAM(GI,H) / (Y0(H));

GCP0             = SUM((I,H), (CH0(I,H)))
                         + SUM(I, CN0(I))
                         + SUM((I,GN), (CG0(I,GN)))
                         + SUM(I, CX0(I))
                         - SUM(I, M0(I));

GCP10(I)         = SUM(H, CH0(I,H)) + CN0(I) + SUM(GN, CG0(I,GN)) + CX0(I)-M0(I);
parameter kevintest,kevintest1(gt),kevintest2;
kevintest=sum(gx,sam('cygf',gx));
kevintest1(gt)=SUM(GX, IGT0(GT,GX));
kevintest2= y0('fed');
display kevintest,kevintest1,kevintest2;
*===============================================================================

OPTION DECIMALS = 8;
DISPLAY
Q0, Q10, DQ0,

BETA, BETAH, LAMBDA, LAMBDAH, ETAE, ETAM, ETAPIT, ETAPT, NRPG,

ETAI, ETAIX, ETALB, ETAD, DEPR, ALPHA,

TAUQ, TAUC, TAUV, TAUN, TAUG, TAUX, TAUF, TAUFX, TAUH,

TAUFH, TAUFF, TAUFL, TAUFK, TAXS, TAXS1,

HH0, HW0, HN0, JOBCOR, FD0, KS0, DS0,

AGFS, IGT0, M0, V0, V0T, CH0, CH0T, CG0, CN0, CX0,

KPFOR0, GVFOR0, KFOR, GFOR, PRIVRET, YD0, Y0, S0, PIT, PIT0,

SPI0, R0, RA0, TP, A, AD, ETAE
;

*===============================================================================
* ACTIVE VARIABLE DECLARATION
*===============================================================================

VARIABLES

CG(I,G)   PUBLIC CONSUMPTION
CH(I,H)   PRIVATE CONSUMPTION
CN(I)     GROSS INVESTMENT BY SECTOR OF SOURCE
CPI(H)    CONSUMER PRICE INDEX
CPIN(H)   NONHOUSING CONSUMER PRICE INDEX
CPIH(H)   HOUSING CONSUMER PRICE INDEX
CX(I)     EXPORT DEMAND
D(I)      DOMESTIC SHARE OF DOMESTIC DEMAND
DD(I)     DOMESTIC DEMAND
DS(I)     DOMESTIC SUPPLY
FD(F,Z)   SECTORAL FACTOR DEMAND
GCP       GROSS AGGREGATE CITY PRODUCT
GCP1(I)   GROSS CITY PRODUCT BY SECTOR
HH(H)     NUMBER OF HOUSEHOLDS
HN(H)     NUMBER OF NONWORKING HOUSEHOLDS
HW(H)     NUMBER OF WORKING HOUSEHOLDS
IGT(G,G1) INTER GOVERNMENTAL TRANSFERS
KS(K,IG)  CAPITAL FLOW
LAS(LA,IG) LAND FLOW
M(I)      IMPORTS
N(K,IG)   GROSS INVESTMENT BY SECTOR OF DESTINATION
NKI       NET CAPITAL INFLOW
LNFOR(LA) LAND OUTFLOW
KPFOR(K)  CAPITAL OUTFLOW
GVFOR(G)  GOVT OUTFLOW
P(I)      AGGREGATE DOMESTIC PRICE PAID BY PURCHASERS
PD(I)     DOMESTIC PRICE RECEIVED BY SUPPLIERS
PVA(I)    VALUE ADDED PRICE
RA(Z)     ECONOMY WIDE SCALAR RENTAL RATES OF FACTORS
R(F,Z)    SECTORAL RENTAL RATES
S(Z)      SAVINGS
SPI       PERSONAL INCOME (OBJECTIVE FUNCTION)
V(I)      INTERMEDIATE GOODS
Y(Z)      GROSS INCOMES
YD(H)     AFTER TAX TOTAL HOUSEHOLD INCOMES
YT(G,G1)  GOV INCOME

*DIFFERENCES FOR RESULTS INITIALIZED BELOW
DFCG(I,G)
DFCH(I,H)
DFCN(IG)
DFCPI(H)
DCX(I)
DFD(I)
DFDD(I)
DFS(I)
DGCP
DGCP1(I)
DFHH(H)
DFHN(H)
DFHW(H)
DFFD(F,Z)
DK(K,Z)
DRR(F,Z)
DM(I)
DY(Z)
TAXB(H)
TAXSIM(H)
DDS(I)
DSS(G)
DDD(I)
DCH(I,H)
DLAS(LA,IG)
TAUTST(F,GN)
DV(I)
DW(F,I)
;

*===============================================================================
* INITIAL VALUES
*===============================================================================

P.L(I)           = P0(I);
PD.L(I)          = PD0(I);
PVA.L(I)         = PVA0(I);
RA.L(F)          = RA0(F);
R.L(F,Z)         = R0(F,Z);
CPI.L(H)         = CPI0(H);
DS.L(I)          = DS0(I);
DD.L(I)          = DD0(I);
V.L(I)           = V0(I);
FD.L(F,Z)        = FD0(F,Z);
HH.L(H)          = HH0(H);
HN.L(H)          = HN0(H);
HW.L(H)          = HW0(H);
KS.L(K,IG)       = KS0(K,IG);
CN.L(I)          = CN0(I);
D.L(I)           = D0(I);
CX.L(I)          = CX0(I);
M.L(I)           = M0(I);
NKI.L            = NKI0;
KPFOR.L(K)       = KPFOR0(K);
LNFOR.L(LA)      = LNFOR0(LA);
GVFOR.L(G)       = GVFOR0(G);
N.L(K,IG)        = N0(K,IG);
Y.L(Z)           = Y0(Z);
YD.L(H)          = YD0(H);
IGT.L(G,GX)      = IGT0(G,GX);
CH.L(I,H)        = CH0(I,H);
CG.L(I,G)        = CG0(I,G);
S.L(Z)           = S0(Z);
SPI.L            = SPI0;
LAS.L(LA,IG)     = LAS0(LA,IG);

*===============================================================================

P.L(I)$(ABS(P.L(I))                      LT 1)=0;
PD.L(I)$(ABS(PD.L(I))                    LT 0.00000001)=0;
PVA.L(I)$(ABS(PVA.L(I))                  LT 0.00000001)=0;
RA.L(F)$(ABS(RA.L(F))                    LT 0.00000001)=0;
R.L(F,Z)$(ABS(R.L(F,Z))                  LT 0.00000001)=0;
CPI.L(H)$(ABS(CPI.L(H))                  LT 0.00000001)=0;
DS.L(I)$(ABS(DS.L(I))                    LT 0.00000001)=0;
DD.L(I)$(ABS(DD.L(I))                    LT 0.00000001)=0;
V.L(I)$(ABS(V.L(I))                      LT 0.00000001)=0;
FD.L(F,Z)$(ABS(FD.L(F,Z))                LT 0.00000001)=0;
HH.L(H)$(ABS(HH.L(H))                    LT 0.00000001)=0;
HN.L(H)$(ABS(HN.L(H))                    LT 0.00000001)=0;
HW.L(H)$(ABS(HW.L(H))                    LT 0.00000001)=0;
KS.L(K,IG)$(ABS(KS.L(K,IG))              LT 0.0000001)=0;
LAS.L(LA,IG)$(ABS(LAS.L(LA,IG))          LT 0.00000001)=0;
CN.L(I)$(ABS(CN.L(I))                    LT 0.00000001)=0;
N.L(K,IG)$(ABS(N.L(K,IG))                LT 0.00000001)=0;
D.L(I)$(ABS(D.L(I))                      LT 0.00000001)=0;
CX.L(I)$(ABS(CX.L(I))                    LT 0.00000001)=0;
M.L(I)$(ABS(M.L(I))                      LT 0.00000001)=0;
NKI.L$(ABS(NKI.L)                        LT 0.00000001)=0;
LNFOR.L(LA)$(ABS(LNFOR.L(LA))            LT 0.00000001)=0;
KPFOR.L(K)$(ABS(KPFOR.L(K))              LT 0.00000001)=0;
GVFOR.L(G)$(ABS(GVFOR.L(G))              LT 0.00000001)=0;
Y.L(Z)$(ABS(Y.L(Z))                      LT 0.00000001)=0;
YD.L(H)$(ABS(YD.L(H))                    LT 0.00000001)=0;
IGT.L(G,G1)$(ABS(IGT.L(G,G1))            LT 0.00000001)=0;
CH.L(I,H)$(ABS(CH.L(I,H))                LT 0.00000001)=0;
CG.L(I,G)$(ABS(CG.L(I,G))                LT 0.00000001)=0;
S.L(Z)$(ABS(S.L(Z))                      LT 0.00000001)=0;
SPI.L$(ABS(SPI.L)                        LT 0.00000001)=0;

*===============================================================================
* DEFINE BOUNDS
*===============================================================================

P.LO(I)          = P.L(I)        / 1000;   P.UP(I)       = P.L(I)        * 1000;
PD.LO(I)         = PD.L(I)       / 1000;   PD.UP(I)      = PD.L(I)       * 1000;
PVA.LO(I)        = PVA.L(I)      / 1000;   PVA.UP(I)     = PVA.L(I)      * 1000;
RA.LO(F)         = RA.L(F)       / 1000;   RA.UP(F)      = RA.L(F)       * 1000;
CPI.LO(H)        = CPI.L(H)      / 1000;   CPI.UP(H)     = CPI.L(H)      * 1000;
DS.LO(I)         = DS.L(I)       / 1000;   DS.UP(I)      = DS.L(I)       * 1000;
DD.LO(I)         = DD.L(I)       / 1000;   DD.UP(I)      = DD.L(I)       * 1000;
D.LO(I)          = D.L(I)        / 1000;   D.UP(I)       = D.L(I)        * 1000;
V.LO(I)          = V.L(I)        / 1000;   V.UP(I)       = V.L(I)        * 1000;
FD.LO(F,Z)       = FD.L(F,Z)     / 1000;   FD.UP(F,Z)    = FD.L(F,Z)     * 1000;
HH.LO(H)         = HH.L(H)       / 1000;   HH.UP(H)      = HH.L(H)       * 1000;
HW.LO(H)         = HW.L(H)       / 1000;   HW.UP(H)      = HW.L(H)       * 1000;
HN.LO(H)         = HN.L(H)       / 1000;   HN.UP(H)      = HN.L(H)       * 1000;
KS.LO(K,IG)      = KS.L(K,IG)    / 1000;   KS.UP(K,IG)   = KS.L(K,IG)    * 1000;
LAS.LO(LA,IG)    = LAS.L(LA,IG)  / 1000;   LAS.UP(LA,IG) = LAS.L(LA,IG)  * 1000;
M.LO(I)          = M.L(I)        / 1000;   M.UP(I)       = M.L(I)        * 1000;
Y.LO(Z)          = Y.L(Z)        / 1000;   Y.UP(Z)       = Y.L(Z)        * 1000;
YD.LO(H)         = YD.L(H)       / 1000;   YD.UP(H)      = YD.L(H)       * 1000;
CH.LO(I,H)       = CH.L(I,H)     / 1000;   CH.UP(I,H)    = CH.L(I,H)     * 1000;
CG.LO(I,G)       = CG.L(I,G)     / 1000;   CG.UP(I,G)    = CG.L(I,G)     * 1000;
CX.LO(I)         = CX.L(I)       / 1000;   CX.UP(I)      = CX.L(I)       * 1000;
R.LO(F,IG)       = R.L(F,IG)     / 1000;   R.UP(F,IG)    = R.L(F,IG)     * 1000;
CN.LO(I)         = 0;
N.LO(K,IG)       = 0;

*===============================================================================

R1('SPI',SM)     = SPI.L;
R1('HH',SM)      = SUM(H, HH.L(H) );
R1('HN',SM)      = SUM(H, HN.L(H) );
R1('HW',SM)      = SUM(H, HW.L(H) );
R1('R',SM)       = SUM(Z, R.L('KAP',Z));
R1('RL',SM)      = RA.L('LAND');
R1('L',SM)       = SUM((L,Z), FD.L(L,Z) );
R1('K',SM)       = SUM(Z, FD.L('KAP',Z) );
R1('LAND',SM)    = SUM(IG, FD0('LAND',IG) );
R1('GFSAV',SM)   = S.L('CYGF');

*===============================================================================
* EQUATION DECLARATION
*===============================================================================

EQUATIONS

CPIEQ(H)         CONSUMER PRICE INDICES
YEQ(H)           HOUSEHOLD GROSS INCOMES
YDEQ(H)          HOUSEHOLD DISPOSABLE INCOMES
CHEQ(I,H)        PRIVATE CONSUMPTION
SHEQ(H)          HOUSEHOLD SAVINGS
PVAEQ(I)         VALUE ADDED
PFEQ(I)          PRODUCTION FUNCTION
FDEQ(F,I)        FACTOR DEMAND
VEQ(I)           INTERMEDIATE DEMAND
YFEQL(L)         LABOR FACTOR INCOME
YFEQK(K)         CAPITAL FACTOR INCOME
YFEQLA(LA)       LAND FACTOR INCOME
LANFOR(LA)       LAND INCOME OUTFLOW
KAPFOR(K)        CAPITAL INCOME OUTFLOW
GOVFOR(G)        GOVT OUTFLOW
XEQ(I)           EXPORT DEMAND
DEQ(I)           DOMESTIC SHARES
MEQ(I)           IMPORT DEMAND
PEQ(I)           AGGREGATED PRICES
NKIEQ            NET CAPITAL INFLOW
NEQ(K,I)         GROSS INVESTMENT BY SECTOR OF DESTINATION
CNEQ(I)          GROSS INVESTMENT BY SECTOR OF SOURCE
KSEQ(K,IG)       CAPITAL STOCK
LSEQ1(H)         LABOR SUPPLY
LASEQ1(LA,I)     LAND SUPPLY1
POPEQ(H)         POPULATION
ANEQ(H)          NUMBER OF NON WORKING HOUSEHOLDS
YGEQ(GX)         GOVERNMENT INCOME
CGEQ(I,GN)       GOVERNMENT ENDOGENOUS PURCHASES OF GOODS AND SERVICES
GFEQ(F,GN)       GOVERNMENT ENDOGENOUS RENTAL OF FACTORS
GSEQL(G)         GOVERNMENT SAVINGS
GSEQ(G)          GOVERNMENT SAVINGS
TDEQ(G,G1)       DISTRIBUTION OF TAXES
YGEQ1(GNL)       GOV TRANSFERS
YGEQ2 (cf)
SPIEQ            STATE PERSONAL INCOME - OBJECTIVE FUNCTION
LMEQ1(L)         LABOR MARKET CLOSURE
KMEQ(K,IG)       CAPITAL MARKET CLEARING
LAMEQ(LA,IG)     LAND MARKET CLEARING
GMEQ(I)          GOODS MARKET CLEARING
DDEQ(I)          DEFINITION OF DOMESTIC DEMAND
GSEQJ1(G)
;

*===============================================================================
* EQUILIBRIUM EQUATIONS
*===============================================================================

CPIEQ(H).. CPI(H)        =E= SUM(I, P(I)  * ( 1 + SUM(GS, TAUC(GS,I) ) ) * CH(I,H) )
                                 / SUM(I, P0(I) * ( 1 + SUM(GS, TAUQ(GS,I) ) ) * CH(I,H) );

YEQ(H).. Y(H)            =E= SUM(L,  A(H,L) * HW(H) / SUM(H1, A(H1,L) * HW(H1) )
                                 * Y(L) * ( 1 - SUM(G, TAUFL(G,L))))
                                 + SUM(LA,  A(H,LA) * HW(H) / SUM(H1, A(H1,LA) * HW(H1)) * (Y(LA)+ LNFOR(LA))*( 1 - SUM(G, TAUFLA(G,LA) ) ) )
                                 + SUM(K,  A(H,K) * HW(H) / SUM(H1, A(H1,K) * HW(H1)) * (Y(K) + KPFOR(K)) * ( 1 - SUM(G, TAUFK(G,K) ) ) );


YDEQ(H).. YD(H)          =E=   Y(H) + (PRIVRET(H) * HH(H))
                                         + SUM(G, TP(H,G) * HH(H))
                                         - SUM(GI, PIT(GI,H)  * Y(H))
                                         - SUM(G, TAUH(G,H)  * HH(H));

CHEQ(I,H).. CH(I,H)      =E= CH0(I,H)
                                 * ((YD(H) / YD0(H)) / ( CPI(H) / CPI0(H)))**(BETA(I,H))
                                 * PROD(J, ((P(J)*( 1 + SUM(GS, TAUC(GS,J))))
                                 / (P0(J)*(1 + SUM(GS, TAUQ(GS,J)))))** (LAMBDA(J,I)));


SHEQ(H).. S(H)           =E= YD(H) - SUM(I, P(I) * CH(I,H) * ( 1 + SUM(GS, TAUC(GS,I))));

PVAEQ(I).. PVA(I)        =E= PD(I) - SUM(J, AD(J,I) * P(J) * (1 + SUM(GS, TAUQ(GS, J))));

*PFEQ(I)..DS(I)           =E= GAMMA(I)*(SUM(F, ALPHA(F,I)*(FD(F,I))**(RHO(I)))**(1/RHO(I)));

*FDEQ(F,I).. R(F,I) * RA(F)*(1 + SUM(GF,TAUFX(GF,F,I)))* (FD(F,I))**(1-RHO(I))
*                         =E= PVA(I) * ALPHA(F,I)*(GAMMA(I)**RHO(I))*(DS(I)**(1-RHO(I)));

*FDEQ(F,I).. R(F,I) * RA(F) * (1 + SUM(GF,TAUFX(GF,F,I) ) )* (TT(F,I)* FD(F,I))
*                         =E= PVA(I) * DS(I) * ALPHA(F,I);
*CD
PFEQ(I)..DS(I) =E= DELTA(I)*PROD(F$ALPHA(F,I),(TT(F,I)*FD(F,I))**ALPHA(F,I));

   FDEQ(F,I).. R(F,I) * RA(F) * ( 1 + SUM(GF,TAUFX(GF,F,I) ) )*  FD(F,I)
           =E= PVA(I) * DS(I) * ALPHA(F,I);


* The following two equations are from Shelby

*PFEQ(I)..DS(I)           =E= GAMMA(I)*(SUM(F, ALPHA(F,I)*(FD(F,I)**(RHO(I)))))**(1/RHO(I));
*FDEQ(F,I).. (R(F,I) * RA(F)*(1 + SUM(GF,TAUFX(GF,F,I))))* (FD(F,I)**(1-RHO(I)))
*               =E= PVA(I)* ALPHA(F,I)*(GAMMA(I)**RHO(I))*(DS(I)**(1-RHO(I)));

VEQ(I).. V(I)            =E= SUM(J, AD(I,J) * DS(J) );

YFEQL(L).. Y(L)          =E= SUM(IG, R(L,IG)* TT(L,IG)* RA(L)*FD(L,IG));

YFEQK(K).. Y('KAP')      =E= SUM(IG, R('KAP',IG) * RA('KAP') * TT('KAP',IG) * FD('KAP',IG));

YFEQLA(LA).. Y('LAND')   =E= SUM(IG, R('LAND',IG) * RA('LAND') * FD('LAND',IG));

LANFOR(LA).. LNFOR(LA)   =E= LFOR(LA) * Y(LA);

KAPFOR(K).. KPFOR(K)     =E= KFOR(K) * Y(K);

*XEQ(I).. CX(I)           =E= CX0(I)*((PD(I))/(PWM0(I)))**(ETAE(I));

XEQ(I).. CX(I) =E= CX0(I)*( (PD(I)*(1+SUM(GS,TAUX(GS,I))))
                  /(PW0(I)*(1+SUM(GS,TAUQ(GS,I))))) **(ETAE(I));

DEQ(I)$PWM0(I).. D(I)    =E= D0(I) *(PD(I)/PWM0(I))**(ETAD(I));

PEQ(I)..  P(I)           =E= D(I) * PD(I) + ( 1 - D(I) ) * PWM0(I);

MEQ(I).. M(I)            =E= ( 1 - D(I) ) * DD(I);

NKIEQ.. NKI              =E= SUM(I, M(I) * PWM0(I) )
                                 - SUM(I, CX(I) * PD(I) )
                                 - SUM(H, PRIVRET(H)*HH(H))
                                 - SUM(LA, LNFOR(LA))
                                 - SUM(K, KPFOR(K))
                                 - SUM(G, GVFOR(G));

NEQ(K,I).. N(K,I)        =E= N0(K,I)*(R(K,I)/R0(K,I))**(ETAIX(K,I)*1);

CNEQ(I).. P(I)*(1 + SUM(GS, TAUN(GS,I)))*CN(I)
                         =E= SUM(IG, B(I,IG)*(SUM(K, N(K,IG))));

KSEQ(K,IG).. KS(K,IG)    =E= KS0(K,IG) * ( 1 - DEPR) + N(K,IG) ;

*LSEQ1(H).. HW(H)/HH(H)   =E= HW0(H)/HH0(H)*((SUM(L, RA(L) / RA0(L))/5)/ (CPI(H) / CPI0(H))
*                                 * (SUM((Z,L), FD(L,Z))/ (SUM(H1, HW(H1)* SUM(L, JOBCOR(H1,L)))))
*                                 * (SUM(G, TP(H,G)/ CPI(H)) / SUM(G, TP(H,G) / CPI0(H) ))**(ETAPT(H))
*                                 * ((SUM(GI, PIT0(GI,H)* HH0(H))+ SUM(G, TAUH0(G,H)*HH0(H)))
*                                 / (SUM(GI, PIT(GI,H)* HH(H))+ SUM(G, TAUH(G,H)*HH(H))))**(ETAPIT(H));


LSEQ1(H).. HW(H)/HH(H) =E= HW0(H)/HH0(H)   * ((SUM(L, RA(L) / RA0(L))/5)/ (CPI(H) / CPI0(H)))** (ETARA(H))
                  * ( SUM(G, TP(H,G) / CPI(H) )
                  / SUM(G, TP(H,G) / CPI0(H) )) ** ETAPT(H)
                  *  ((SUM(GI, PIT0(GI,H)* HH(H))+ SUM(G, TAUH0(G,H)*HH(H)))
                  /(SUM(GI, PIT(GI,H)* HH(H))+ SUM(G, TAUH(G,H)*HH(H))))**(ETAPIT(H)*1) ;

LASEQ1(LA,I).. LAS(LA,I) =E= LAS0(LA,I)*(R(LA, I)/R0(LA, I))**(ETAL(LA,I));

POPEQ(H).. HH(H)         =E= HH0(H) * NRPG(H)
*$ontext
                              + MI0(H) * ((YD(H)/HH(H))
                                         /(YD0(H)/HH0(H))
                                         /(CPI(H)/CPI0(H))) ** (ETAYDI(H))
                                         *((HN(H)/HH(H))
                                         /(HN0(H)/HH0(H))) ** (ETAUI(H))
                              - MO0(H) *((YD0(H)/HH0(H))
                                         /(YD(H)/HH(H))
                                         /(CPI0(H)/CPI(H))) ** (ETAYDO(H))
                                         *((HN0(H)/HH0(H))
                                         /(HN(H)/HH(H))) ** (ETAUO(H));
*$offtext

ANEQ(H).. HN(H)          =E= HH(H) - HW(H);

YGEQ(GX).. Y(GX)         =E=   SUM(I, TAUV(GX,I) * V(I) * P(I) )
                                 + SUM(I, TAUX(GX,I)* CX(I) *PD(I))
                                 + SUM((H,I), TAUC(GX,I) * CH(I,H) * P(I) )
                                 + SUM(I, TAUN(GX,I) * CN(I) * P(I) )
                                 + SUM((GN,I), TAUG(GX,I) * CG(I,GN) * P(I) )
                                 + SUM((F,I), TAUFX(GX,F,I) * RA(F) * R(F,I) * TT(F,I)*FD(F,I) )
                                 + SUM((F,GN), TAUFX(GX,F,GN) * RA(F) * R(F,GN) * FD(F,GN) )
                                 + SUM(F, TAUFH(GX,F) * (Y(F)))
                                 + SUM(H, PIT(GX,H) * Y(H) )
                                 + SUM(H, TAUH(GX,H) * HH(H) )
                                 + SUM(GX1, IGT(GX,GX1));

*YGEQ2(GT).. Y(GT)        =E= SUM(GX, IGT(GT,GX));
YGEQ2(cf).. Y(cf)        =E= SUM(GX, IGT(cf,GX));

YGEQ1(GNL).. Y(GNL)      =E= TAXS1(GNL)*Y('CYGF');




GOVFOR(G).. GVFOR(G)     =E= GFOR(G)*Y(G);

CGEQ(I,GN).. P(I)*(1 + SUM(GS, TAUG(GS,I))) * CG(I,GN)
                         =E= AG(I,GN) * (Y(GN)+ GFOR(GN)*Y(GN));

GFEQ(F,GN)..  FD(F,GN) * R(F,GN) * RA(F)*( 1 + SUM(GF, TAUFX(GF,F,GN)))
                         =E= AG(F,GN) * (Y(GN)+ GFOR(GN)*Y(GN));


GSEQL(GN).. S(GN)        =E= (Y(GN)+ GVFOR(GN))
                                 - SUM(I, CG(I,GN)*P(I)*(1 + SUM(GS, TAUG(GS,I))))
                                 - SUM(F, FD(F,GN)*R(F,GN)*RA(F)*(1 + SUM(GF, TAUFX(GF,F,GN))));

GSEQ(GX).. S(GX)         =E= (Y(GX) + GFOR(GX)*Y(GX)) - SUM(H, (TP(H,GX)*HH(H))) - SUM(G,IGT(G,GX));

*TDEQ(G,GX)$(IGTD(G,GX) EQ 1).. IGT(G,GX)=E= TAXS(G,GX)*(Y(GX) + GVFOR(GX)- SUM(H, (TP(H,GX)*HH(H))));
GSEQJ1('CYGF').. S('CYGF')=E= Y('CYGF') -  Y('CYGF');
TDEQ(G,GX)$(IGTD(G,GX) EQ 1).. IGT(G,GX) =E= TAXS(G,GX) * ( Y(GX) + GVFOR(GX)- SUM(H, (TP(H,GX) * HH(H)) ));

SPIEQ.. SPI              =E= SUM(H, Y(H)) + SUM((H,G), TP(H,G)*HH(H)) + SUM(H, PRIVRET(H)*HH(H));

LMEQ1(L).. SUM(H, HW(H)* JOBCOR(H, L)) =E= SUM(Z, FD(L ,Z) ) ;

KMEQ(K,IG).. KS(K,IG)    =E= FD(K,IG);

LAMEQ(LA,IG).. LAS(LA,IG)=E= FD(LA,IG);

GMEQ(I).. DS(I)          =E= DD(I) + CX(I) - M(I);

DDEQ(I).. DD(I)          =E= V(I) + SUM(H, CH(I,H) ) + SUM(G, CG(I,G) ) + CN(I);

*===============================================================================
* ECONOMY WIDE MARKET CONDITIONS
*===============================================================================

IGT.FX(G,GX)$(NOT IGT0(G,GX))    = 0;
IGT.FX(G,GX)$(IGTD(G,GX) EQ 2)   = IGT0(G,GX);
R.FX(L,Z)                        = R0(L,Z);
RA.FX(LA)                        = RA0(LA);
RA.FX(K)                         = RA0(K);

*===============================================================================
* DYNAMIC LOOP
*===============================================================================

MODEL JOPSMALL /ALL/;

*MODEL FTC0 /ALL/;

parameter
index;
index = 0;

loop(t,
         index = index+1;
         LOOP(SM$(ORD(SM) GT 1),
                 IF ((ORD(SM)) >2,
                         if(index >= 1,

*===============================================================================
* DYNAMIC CAPITAL STOCK EQUATION
*===============================================================================

                                 KS0(K,IG)        = KS.l(K,IG);

$ONTEXT
                                 IGT0(G,GX)$(NOT IGT.L(G,GX))   = 0;
                                 IGT0(G,GX)$(IGTD(G,GX) EQ 2)   = IGT.L(G,GX);
                                 R0(L,Z)                        = R.L(L,Z);
                                 RA0(K)                         = RA.L(K);
$OFFTEXT

* HARVEY: PLEASE CHECK IF TURNING THESE EQUATIONS ON MAKES ANY SIGNIFICANT DIFFERENCE
*$ONTEXT
                                 IGT.FX(G,GX)$(NOT IGT.L(G,GX))   = 0;
                                 IGT.FX(G,GX)$(IGTD(G,GX) EQ 2)   = IGT.L(G,GX);
                                 R.FX(L,Z)                        = R.L(L,Z);
                                 RA.FX(K)                         = RA.L(K);
*$OFFTEXT

                         if(index = 1,

*===============================================================================
* --------- PLACE SIMM BELOW ---------------------------------------------------
*===============================================================================

* gamma('goods')=gamma('goods')*1.015;

$ontext
* Investment Elasticity
*ETARA(H)         = MISCH(H,'ETARA')*0.01;
* Import elasticity
ETAM(IP)          = MISC(IP,'ETAM')*0.01;
* Export elasticity
ETAE(IP)          = MISC(IP,'ETAE')*0.0667;
*ETAE(IP)          = -1.5;

ETAIX('KAP',IG)  = 0.01;
ETAI(IG)         = 0.01;
ETAL('LAND',IG)  = 0.01;
*ETAIX('KAP',IG)  = 0.01*ETAIX('KAP',IG);

* Migration elasticity w.r.t. disposable income
*ETAYDO(H)         = 0.5;
*ETAYDI(H)         = 0.4;
* Migration elasticity w.r.t. unemployment
*ETAUI(H)          = -0.5;
*ETAUO(H)          = -0.4;

MI0(H)           = 0.04;
MO0(H)           = 0.04;

ECOMI(L)         = 1;
ECOMO(CM)         = 1;
$offtext
* EXWGEO(CM)= EXWGEO(CM)*1.02;
$ontext
KS0(K,'HS1')     = KS0(K,'HS1')*0.675;
KS0(K,'HS2')     = KS0(K,'HS2')*0.739;
KS0(K,'HS3')     = KS0(K,'HS3')*0.958;
KS0(K,'GOODS')   = KS0(K,'GOODS')*0.658;
KS0(K,'TRADE')   = KS0(K,'TRADE')*0.961;
KS0(K,'OTHER')   = KS0(K,'OTHER')*0.673;
$offtext
*  pw0(I)=pw0(I)*1.01;
*  nrpg(h)=nrpg(h)*1.05;
*  gamma(I) = gamma(I)*1.01;
* N0(K,I)          = N0(K,I)*1.01;

*Current Value of N0 used in simulations
*N0(K,I)          = N0(K,I)*2.17;
*N0(K,I)          = N0(K,I)*2.0;

*Maximum  N0
*N0(K,I)          = N0(K,I)*2.55;

KS0(K,I)         = KS0(K,I)*0.9;


);


                         if(index = 2,
* Normal Growth

*Current Value of N0 used in simulations
*    N0(K,I)          = N0(K,I)/2.17;
*    N0(K,I)          = N0(K,I)*2.17;
*  N0(K,I)          = N0(K,I)/2.55;
*  pw0(I)=pw0(I)/1.01;
****
);

if(index = 3,
*  N0(K,I)          = N0(K,I)/1.8;
*  N0(K,I)          = N0(K,I)/2.17 ;

*gamma(I) = gamma(I)*1.01;
);
if(index = 4,
* N0(K,I)          = N0(K,I)/2.205 ;
*  N0(K,I)          = N0(K,I)/1.11 ;

*gamma(I) = gamma(I)*1.01;
);

if(index = 5,

*  N0(K,I)          = N0(K,I)/1.11 ;

*gamma(I) = gamma(I)*1.01;
);

)

)

*===============================================================================
* MODEL SOLVE STATEMENT
*===============================================================================

OPTION NLP               = MINOS5;
JOPSMALL.OPTFILE         = 0;
OPTION SYSOUT            = ON;

SOLVE JOPSMALL MAXIMIZING SPI USING NLP;

ABORT$(JOPSMALL.MODELSTAT <> 2) "Model not normally completed", JOPSMALL.MODELSTAT;

$ontext
OPTION NLP=MINOS5;
FTC0.scaleopt = 1;
FTC0.OPTFILE = 0;
OPTION SYSOUT = ON;
SOLVE FTC0 MAXIMIZING SPI USING NLP;


OPTION NLP=MINOS5;
OPTION SYSOUT = ON;

*$onecho > minos5.opt
major damping parameter = 0.1
minor damping parameter = 0.01
*$offecho

* TO USE OPTIONS SET Opt.File = 1
*ftc0.OptFile = 0;
*FTC0.scaleopt = 1;
*$offtext

*SOLVE FTC0 MAXIMIZING SPI USING NLP;
$offtext

*===============================================================================
* OUTPUT VARIABLES
*===============================================================================

R2('M-STAT',SM)  = JOPSMALL.MODELSTAT;
R2('S-STAT',SM)  = JOPSMALL.SOLVESTAT;
R1('GFSAV',SM)   = S.L('CYGF');

);

DFCG.L(I,G)      = CG.L(I,G)-CG0(I,G);
DFFD.L(F,Z)      = FD.L(F,Z)-FD0(F,Z);
DK.L(K,Z)        = FD.L(K,Z)-FD0(K,Z);
DY.L(Z)          = Y.L(Z)-Y0(Z);
DM.L(I)          = M.L(I)-M0(I);
DDS.L(I)         = DS.L(I)-DS0(I);
TAXB.L(H)        = SUM((I,GX), TAUC(GX,I) * CH0(I,H) * P0(I));
DDD.L(I)         = DD.L(I) - DD0(I);
DCX.L(I)         = CX.L(I) -CX0(I);
GCP1.L(I)        = SUM(H, CH.L(I,H))+ CN.L(I)+ SUM(GN, CG.L(I,GN))+ CX.L(I)-M.L(I);
DGCP1.L(I)       = GCP1.L(I) - GCP10(I);
DCH.L(I,H)       = CH.L(I,H) - CH0(I,H);
GCP.L            = SUM((I,H), (CH.L(I,H)))+ SUM(I, CN.L(I))+ SUM((I,GN), (CG.L(I,GN)))+ SUM(I, CX.L(I))-SUM(I, M.L(I));
DGCP.L           = GCP.L-GCP0;
DRR.L(F,Z)       = R.L(F,Z)-R0(F,Z);
DV.L(I)          = V.L(I) - V0(I);
DW.L(F,I)          = R.L(F,I) * RA.L(F) * (1 + SUM(GF,TAUFX(GF,F,I) ) )* (FD.L(F,I))- (R0(F,I) * RA0(F) * (1 + SUM(GF,TAUFX(GF,F,I) ) )* (FD0(F,I)));

fstore(z,f,t)    = dffd.l(f,z);
dystore(Z,t)     = dy.l(z);
cpistore(h,t)    = cpi.l(h);
hhstore(H,t)     = HH.L(H);
dsstore(I,t)     = dds.l(I);
ksstore(k,i,t)    =ks.l(k,i);
dmstore(i,t)     = DM.L(I);
dvstore(i,t)     = DV.l(I);
dfstore(f,i,t)   = DW.L(F,I);
Nstore(k,i,t)    = N.l(k,i);

*===============================================================================
* DISPLAY RESULTS
*===============================================================================

OPTION DECIMALS=6;
DISPLAY
index,
CG0, CG.L, CH0, CH.L, CN0, CN.L, CPI0, CPI.L, CX0, CX.L, D0, D.L, DD0, DD.L,
DS0, DS.L, FD0, FD.L, HH0, HH.L, HN0, HN.L, HW0, HW.L, IGT0, IGT.L,
KS0, KS.L, LAS0, LAS.L, M0, M.L, N0, N.L, NKI0, NKI.L,
LNFOR0, LNFOR.L, KPFOR0, KPFOR.L, GVFOR0, GVFOR.L,
P0, P.L, PD0, PD.L, PVA0, PVA.L, PWM0, RA0, RA.L, R0, R.L, S0, S.L, SPI0, SPI.L,
TP, V0, V.L, Y0, Y.L, YD0, YD.L,
DFCG.L, DFFD.L, DY.L, DDS.L, DM.L, DDD.L, DCX.L, DRR.L, DGCP1.L, GCP1.L, dgcp.L,
GCP.L, GCP0, gvfor0, gvfor.l,
pit, etad, privret, alpha, DK.L, TAXB.L, dch.l, TT, DRR.l
;

*===============================================================================
* END
*===============================================================================

);

*execute_unload "results.gdx" , fstore,dystore, cpistore, hhstore, dsstore ksstore dmstore dvstore dfstore Nstore;
*execute 'gdxxrw.exe results.gdx o=sophiec.xls par=fstore rng=sheet1!a1';
*execute 'gdxxrw.exe results.gdx o=sophiec.xls par=dystore rng=sheet1!a34';
*execute 'gdxxrw.exe results.gdx o=sophiec.xls par=cpistore rng=sheet1!a60';
*execute 'gdxxrw.exe results.gdx o=sophiec.xls par=hhstore rng=sheet1!a68';
*execute 'gdxxrw.exe results.gdx o=sophiec.xls par=dsstore rng=sheet1!a76';
*execute 'gdxxrw.exe results.gdx o=sophiec.xls par=ksstore rng=sheet1!a84';
*execute 'gdxxrw.exe results.gdx o=sophiec.xls par=dmstore rng=sheet1!a94';
*execute 'gdxxrw.exe results.gdx o=sophiec.xls par=dvstore rng=sheet1!a100';
*execute 'gdxxrw.exe results.gdx o=sophiec.xls par=dfstore rng=sheet1!a110';
*execute 'gdxxrw.exe results.gdx o=sophiec.xls par=Nstore rng=sheet1!a138';