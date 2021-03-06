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
/ BASE, TODAY/

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
$INCLUDE C:\Users\Zhisheng\Desktop\GMS_seaside_CD\SAM SeasideKC.csv
$OFFDELIM
$INCLUDE C:\Users\Zhisheng\Desktop\GMS_seaside_CD\Seaside Misc.prn
*$offdelim

TABLE BB(I,IG) CAPITAL COMP
$ONDELIM
*$INCLUDE C:\Dropbox\CGE_Modeling\Models\GAMS_Models\Joplin\JOP_SMALL\Run_Files\CAPCOMjop.CSV
$INCLUDE C:\Users\Zhisheng\Desktop\GMS_seaside_CD\Seaside Capcom.CSV
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

PVA0(I)          = PD0(I) - SUM(J, AD(J,I) * P0(J)*(1 + SUM(GS, TAUQ(GS, J))));


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

SPI0, R0, RA0, TP, A, AD
;
CG('CONST1','USSOCL1')=0.0000000;
CG('CONST1','USSOCL2')=0.0000000;
CG('CONST1','USSOCL3')=0.0000000;
CG('CONST1','USSOCL4')=0.0000000;
CG('CONST1','USSOCL5')=0.0000000;
CG('CONST1','STPIT')=0.0000000;
CG('CONST1','LOCTAX')=0.0000000;
CG('CONST1','PROPTX')=0.0000000;
CG('CONST1','ACCTAX')=0.0000000;
CG('CONST1','CYGF')=0.0000000;
CG('CONST1','FED')=25.7173740;
CG('RETAIL1','USSOCL1')=0.0000000;
CG('RETAIL1','USSOCL2')=0.0000000;
CG('RETAIL1','USSOCL3')=0.0000000;
CG('RETAIL1','USSOCL4')=0.0000000;
CG('RETAIL1','USSOCL5')=0.0000000;
CG('RETAIL1','STPIT')=0.0000000;
CG('RETAIL1','LOCTAX')=0.0000000;
CG('RETAIL1','PROPTX')=0.0000000;
CG('RETAIL1','ACCTAX')=0.0000000;
CG('RETAIL1','CYGF')=0.0000000;
CG('RETAIL1','FED')=25.1049675;
CG('SERV1','USSOCL1')=0.0000000;
CG('SERV1','USSOCL2')=0.0000000;
CG('SERV1','USSOCL3')=0.0000000;
CG('SERV1','USSOCL4')=0.0000000;
CG('SERV1','USSOCL5')=0.0000000;
CG('SERV1','STPIT')=0.0000000;
CG('SERV1','LOCTAX')=0.0000000;
CG('SERV1','PROPTX')=0.0000000;
CG('SERV1','ACCTAX')=0.0000000;
CG('SERV1','CYGF')=0.0000000;
CG('SERV1','FED')=25.3541315;
CG('HC1','USSOCL1')=0.0000000;
CG('HC1','USSOCL2')=0.0000000;
CG('HC1','USSOCL3')=0.0000000;
CG('HC1','USSOCL4')=0.0000000;
CG('HC1','USSOCL5')=0.0000000;
CG('HC1','STPIT')=0.0000000;
CG('HC1','LOCTAX')=0.0000000;
CG('HC1','PROPTX')=0.0000000;
CG('HC1','ACCTAX')=0.0000000;
CG('HC1','CYGF')=0.0000000;
CG('HC1','FED')=25.4815047;
CG('ACCOM1','USSOCL1')=0.0000000;
CG('ACCOM1','USSOCL2')=0.0000000;
CG('ACCOM1','USSOCL3')=0.0000000;
CG('ACCOM1','USSOCL4')=0.0000000;
CG('ACCOM1','USSOCL5')=0.0000000;
CG('ACCOM1','STPIT')=0.0000000;
CG('ACCOM1','LOCTAX')=0.0000000;
CG('ACCOM1','PROPTX')=0.0000000;
CG('ACCOM1','ACCTAX')=0.0000000;
CG('ACCOM1','CYGF')=0.0000000;
CG('ACCOM1','FED')=27.9648756;
CG('REST1','USSOCL1')=0.0000000;
CG('REST1','USSOCL2')=0.0000000;
CG('REST1','USSOCL3')=0.0000000;
CG('REST1','USSOCL4')=0.0000000;
CG('REST1','USSOCL5')=0.0000000;
CG('REST1','STPIT')=0.0000000;
CG('REST1','LOCTAX')=0.0000000;
CG('REST1','PROPTX')=0.0000000;
CG('REST1','ACCTAX')=0.0000000;
CG('REST1','CYGF')=0.0000000;
CG('REST1','FED')=25.5634165;
CG('AG2','USSOCL1')=0.0000000;
CG('AG2','USSOCL2')=0.0000000;
CG('AG2','USSOCL3')=0.0000000;
CG('AG2','USSOCL4')=0.0000000;
CG('AG2','USSOCL5')=0.0000000;
CG('AG2','STPIT')=0.0000000;
CG('AG2','LOCTAX')=0.0000000;
CG('AG2','PROPTX')=0.0000000;
CG('AG2','ACCTAX')=0.0000000;
CG('AG2','CYGF')=0.0000000;
CG('AG2','FED')=26.5616812;
CG('CONST2','USSOCL1')=0.0000000;
CG('CONST2','USSOCL2')=0.0000000;
CG('CONST2','USSOCL3')=0.0000000;
CG('CONST2','USSOCL4')=0.0000000;
CG('CONST2','USSOCL5')=0.0000000;
CG('CONST2','STPIT')=0.0000000;
CG('CONST2','LOCTAX')=0.0000000;
CG('CONST2','PROPTX')=0.0000000;
CG('CONST2','ACCTAX')=0.0000000;
CG('CONST2','CYGF')=0.0000000;
CG('CONST2','FED')=25.2895960;
CG('MANUF2','USSOCL1')=0.0000000;
CG('MANUF2','USSOCL2')=0.0000000;
CG('MANUF2','USSOCL3')=0.0000000;
CG('MANUF2','USSOCL4')=0.0000000;
CG('MANUF2','USSOCL5')=0.0000000;
CG('MANUF2','STPIT')=0.0000000;
CG('MANUF2','LOCTAX')=0.0000000;
CG('MANUF2','PROPTX')=0.0000000;
CG('MANUF2','ACCTAX')=0.0000000;
CG('MANUF2','CYGF')=0.0000000;
CG('MANUF2','FED')=25.6241357;
CG('RETAIL2','USSOCL1')=0.0000000;
CG('RETAIL2','USSOCL2')=0.0000000;
CG('RETAIL2','USSOCL3')=0.0000000;
CG('RETAIL2','USSOCL4')=0.0000000;
CG('RETAIL2','USSOCL5')=0.0000000;
CG('RETAIL2','STPIT')=0.0000000;
CG('RETAIL2','LOCTAX')=0.0000000;
CG('RETAIL2','PROPTX')=0.0000000;
CG('RETAIL2','ACCTAX')=0.0000000;
CG('RETAIL2','CYGF')=0.0000000;
CG('RETAIL2','FED')=25.2923178;
CG('SERV2','USSOCL1')=0.0000000;
CG('SERV2','USSOCL2')=0.0000000;
CG('SERV2','USSOCL3')=0.0000000;
CG('SERV2','USSOCL4')=0.0000000;
CG('SERV2','USSOCL5')=0.0000000;
CG('SERV2','STPIT')=0.0000000;
CG('SERV2','LOCTAX')=0.0000000;
CG('SERV2','PROPTX')=0.0000000;
CG('SERV2','ACCTAX')=0.0000000;
CG('SERV2','CYGF')=0.0000000;
CG('SERV2','FED')=25.0770938;
CG('HC2','USSOCL1')=0.0000000;
CG('HC2','USSOCL2')=0.0000000;
CG('HC2','USSOCL3')=0.0000000;
CG('HC2','USSOCL4')=0.0000000;
CG('HC2','USSOCL5')=0.0000000;
CG('HC2','STPIT')=0.0000000;
CG('HC2','LOCTAX')=0.0000000;
CG('HC2','PROPTX')=0.0000000;
CG('HC2','ACCTAX')=0.0000000;
CG('HC2','CYGF')=0.0000000;
CG('HC2','FED')=25.7242606;
CG('ACCOM2','USSOCL1')=0.0000000;
CG('ACCOM2','USSOCL2')=0.0000000;
CG('ACCOM2','USSOCL3')=0.0000000;
CG('ACCOM2','USSOCL4')=0.0000000;
CG('ACCOM2','USSOCL5')=0.0000000;
CG('ACCOM2','STPIT')=0.0000000;
CG('ACCOM2','LOCTAX')=0.0000000;
CG('ACCOM2','PROPTX')=0.0000000;
CG('ACCOM2','ACCTAX')=0.0000000;
CG('ACCOM2','CYGF')=0.0000000;
CG('ACCOM2','FED')=25.7721955;
CG('REST2','USSOCL1')=0.0000000;
CG('REST2','USSOCL2')=0.0000000;
CG('REST2','USSOCL3')=0.0000000;
CG('REST2','USSOCL4')=0.0000000;
CG('REST2','USSOCL5')=0.0000000;
CG('REST2','STPIT')=0.0000000;
CG('REST2','LOCTAX')=0.0000000;
CG('REST2','PROPTX')=0.0000000;
CG('REST2','ACCTAX')=0.0000000;
CG('REST2','CYGF')=0.0000000;
CG('REST2','FED')=25.2670804;
CG('AG3','USSOCL1')=0.0000000;
CG('AG3','USSOCL2')=0.0000000;
CG('AG3','USSOCL3')=0.0000000;
CG('AG3','USSOCL4')=0.0000000;
CG('AG3','USSOCL5')=0.0000000;
CG('AG3','STPIT')=0.0000000;
CG('AG3','LOCTAX')=0.0000000;
CG('AG3','PROPTX')=0.0000000;
CG('AG3','ACCTAX')=0.0000000;
CG('AG3','CYGF')=0.0000000;
CG('AG3','FED')=32.5511361;
CG('UTIL','USSOCL1')=0.0000000;
CG('UTIL','USSOCL2')=0.0000000;
CG('UTIL','USSOCL3')=0.0000000;
CG('UTIL','USSOCL4')=0.0000000;
CG('UTIL','USSOCL5')=0.0000000;
CG('UTIL','STPIT')=0.0000000;
CG('UTIL','LOCTAX')=0.0000000;
CG('UTIL','PROPTX')=0.0000000;
CG('UTIL','ACCTAX')=0.0000000;
CG('UTIL','CYGF')=0.0000000;
CG('UTIL','FED')=25.8620520;
CG('CONST3','USSOCL1')=0.0000000;
CG('CONST3','USSOCL2')=0.0000000;
CG('CONST3','USSOCL3')=0.0000000;
CG('CONST3','USSOCL4')=0.0000000;
CG('CONST3','USSOCL5')=0.0000000;
CG('CONST3','STPIT')=0.0000000;
CG('CONST3','LOCTAX')=0.0000000;
CG('CONST3','PROPTX')=0.0000000;
CG('CONST3','ACCTAX')=0.0000000;
CG('CONST3','CYGF')=0.0000000;
CG('CONST3','FED')=24.6389063;
CG('RETAIL3','USSOCL1')=0.0000000;
CG('RETAIL3','USSOCL2')=0.0000000;
CG('RETAIL3','USSOCL3')=0.0000000;
CG('RETAIL3','USSOCL4')=0.0000000;
CG('RETAIL3','USSOCL5')=0.0000000;
CG('RETAIL3','STPIT')=0.0000000;
CG('RETAIL3','LOCTAX')=0.0000000;
CG('RETAIL3','PROPTX')=0.0000000;
CG('RETAIL3','ACCTAX')=0.0000000;
CG('RETAIL3','CYGF')=0.0000000;
CG('RETAIL3','FED')=25.7348892;
CG('SERV3','USSOCL1')=0.0000000;
CG('SERV3','USSOCL2')=0.0000000;
CG('SERV3','USSOCL3')=0.0000000;
CG('SERV3','USSOCL4')=0.0000000;
CG('SERV3','USSOCL5')=0.0000000;
CG('SERV3','STPIT')=0.0000000;
CG('SERV3','LOCTAX')=0.0000000;
CG('SERV3','PROPTX')=0.0000000;
CG('SERV3','ACCTAX')=0.0000000;
CG('SERV3','CYGF')=0.0000000;
CG('SERV3','FED')=25.0720397;
CG('HC3','USSOCL1')=0.0000000;
CG('HC3','USSOCL2')=0.0000000;
CG('HC3','USSOCL3')=0.0000000;
CG('HC3','USSOCL4')=0.0000000;
CG('HC3','USSOCL5')=0.0000000;
CG('HC3','STPIT')=0.0000000;
CG('HC3','LOCTAX')=0.0000000;
CG('HC3','PROPTX')=0.0000000;
CG('HC3','ACCTAX')=0.0000000;
CG('HC3','CYGF')=0.0000000;
CG('HC3','FED')=0.0000000;
CG('HS1','USSOCL1')=0.0000000;
CG('HS1','USSOCL2')=0.0000000;
CG('HS1','USSOCL3')=0.0000000;
CG('HS1','USSOCL4')=0.0000000;
CG('HS1','USSOCL5')=0.0000000;
CG('HS1','STPIT')=0.0000000;
CG('HS1','LOCTAX')=0.0000000;
CG('HS1','PROPTX')=0.0000000;
CG('HS1','ACCTAX')=0.0000000;
CG('HS1','CYGF')=0.0000000;
CG('HS1','FED')=0.0000000;
CG('HS2','USSOCL1')=0.0000000;
CG('HS2','USSOCL2')=0.0000000;
CG('HS2','USSOCL3')=0.0000000;
CG('HS2','USSOCL4')=0.0000000;
CG('HS2','USSOCL5')=0.0000000;
CG('HS2','STPIT')=0.0000000;
CG('HS2','LOCTAX')=0.0000000;
CG('HS2','PROPTX')=0.0000000;
CG('HS2','ACCTAX')=0.0000000;
CG('HS2','CYGF')=0.0000000;
CG('HS2','FED')=0.0000000;
CG('HS3','USSOCL1')=0.0000000;
CG('HS3','USSOCL2')=0.0000000;
CG('HS3','USSOCL3')=0.0000000;
CG('HS3','USSOCL4')=0.0000000;
CG('HS3','USSOCL5')=0.0000000;
CG('HS3','STPIT')=0.0000000;
CG('HS3','LOCTAX')=0.0000000;
CG('HS3','PROPTX')=0.0000000;
CG('HS3','ACCTAX')=0.0000000;
CG('HS3','CYGF')=0.0000000;
CG('HS3','FED')=0.0000000;
CH('CONST1','HH1')=0.0000000;
CH('CONST1','HH2')=0.0000000;
CH('CONST1','HH3')=0.0000000;
CH('CONST1','HH4')=0.0000000;
CH('CONST1','HH5')=0.0000000;
CH('RETAIL1','HH1')=314.0757505;
CH('RETAIL1','HH2')=1674.6300242;
CH('RETAIL1','HH3')=5606.1196994;
CH('RETAIL1','HH4')=3095.4923329;
CH('RETAIL1','HH5')=12786.6358010;
CH('SERV1','HH1')=422.8500861;
CH('SERV1','HH2')=2008.0832120;
CH('SERV1','HH3')=7637.1650249;
CH('SERV1','HH4')=4317.1451370;
CH('SERV1','HH5')=16205.1997556;
CH('HC1','HH1')=524.4860616;
CH('HC1','HH2')=2870.3524754;
CH('HC1','HH3')=10822.7130853;
CH('HC1','HH4')=6092.8045794;
CH('HC1','HH5')=19411.6072905;
CH('ACCOM1','HH1')=54.0559096;
CH('ACCOM1','HH2')=224.1836214;
CH('ACCOM1','HH3')=1074.7362371;
CH('ACCOM1','HH4')=719.8521879;
CH('ACCOM1','HH5')=2539.1657133;
CH('REST1','HH1')=196.7171752;
CH('REST1','HH2')=816.0693974;
CH('REST1','HH3')=3910.6445904;
CH('REST1','HH4')=2619.0502808;
CH('REST1','HH5')=9244.3409682;
CH('AG2','HH1')=9.9726905;
CH('AG2','HH2')=53.1688963;
CH('AG2','HH3')=177.9566035;
CH('AG2','HH4')=98.2447100;
CH('AG2','HH5')=405.9906409;
CH('CONST2','HH1')=0.0000000;
CH('CONST2','HH2')=0.0000000;
CH('CONST2','HH3')=0.0000000;
CH('CONST2','HH4')=0.0000000;
CH('CONST2','HH5')=0.0000000;
CH('MANUF2','HH1')=732.2168072;
CH('MANUF2','HH2')=3780.9967482;
CH('MANUF2','HH3')=13499.8112135;
CH('MANUF2','HH4')=7708.3654279;
CH('MANUF2','HH5')=29811.3238781;
CH('RETAIL2','HH1')=759.7222962;
CH('RETAIL2','HH2')=4050.7005069;
CH('RETAIL2','HH3')=13561.3125607;
CH('RETAIL2','HH4')=7488.2717516;
CH('RETAIL2','HH5')=30928.5015151;
CH('SERV2','HH1')=1003.1722487;
CH('SERV2','HH2')=4764.1457440;
CH('SERV2','HH3')=18117.7258162;
CH('SERV2','HH4')=10241.3189980;
CH('SERV2','HH5')=38447.4943971;
CH('HC2','HH1')=1271.2655730;
CH('HC2','HH2')=6957.0960225;
CH('HC2','HH3')=26233.3708752;
CH('HC2','HH4')=14768.8188230;
CH('HC2','HH5')=47048.6087575;
CH('ACCOM2','HH1')=148.8978862;
CH('ACCOM2','HH2')=617.6576560;
CH('ACCOM2','HH3')=2960.1899428;
CH('ACCOM2','HH4')=1982.5907917;
CH('ACCOM2','HH5')=6996.4786878;
CH('REST2','HH1')=582.8040583;
CH('REST2','HH2')=2417.8559421;
CH('REST2','HH3')=11585.4913740;
CH('REST2','HH4')=7758.8753700;
CH('REST2','HH5')=27390.0040252;
CH('AG3','HH1')=1.9859883;
CH('AG3','HH2')=10.5829105;
CH('AG3','HH3')=35.5103482;
CH('AG3','HH4')=19.6294218;
CH('AG3','HH5')=80.7493937;
CH('UTIL','HH1')=316.6495965;
CH('UTIL','HH2')=2536.8958296;
CH('UTIL','HH3')=6311.7555379;
CH('UTIL','HH4')=3085.8155312;
CH('UTIL','HH5')=6797.4295468;
CH('CONST3','HH1')=0.0000000;
CH('CONST3','HH2')=0.0000000;
CH('CONST3','HH3')=0.0000000;
CH('CONST3','HH4')=0.0000000;
CH('CONST3','HH5')=0.0000000;
CH('RETAIL3','HH1')=193.4860899;
CH('RETAIL3','HH2')=468.8978500;
CH('RETAIL3','HH3')=1570.1480394;
CH('RETAIL3','HH4')=681.2842190;
CH('RETAIL3','HH5')=3579.9712558;
CH('SERV3','HH1')=250.7287186;
CH('SERV3','HH2')=1190.7299607;
CH('SERV3','HH3')=4528.1706555;
CH('SERV3','HH4')=2559.5833705;
CH('SERV3','HH5')=9609.4675078;
CH('HC3','HH1')=319.9213955;
CH('HC3','HH2')=1750.7531545;
CH('HC3','HH3')=6602.1797160;
CH('HC3','HH4')=3717.0301051;
CH('HC3','HH5')=11839.4794778;
CH('HS1','HH1')=143.0293646;
CH('HS1','HH2')=1771.5337321;
CH('HS1','HH3')=8041.5726439;
CH('HS1','HH4')=4892.1020013;
CH('HS1','HH5')=18700.0364890;
CH('HS2','HH1')=38.2875161;
CH('HS2','HH2')=475.9092823;
CH('HS2','HH3')=2134.5497325;
CH('HS2','HH4')=1291.3620445;
CH('HS2','HH5')=5040.9419732;
CH('HS3','HH1')=29.7973785;
CH('HS3','HH2')=370.3959982;
CH('HS3','HH3')=1665.7092282;
CH('HS3','HH4')=1009.3906054;
CH('HS3','HH5')=3919.7543972;
CN('CONST1')=40527.3527603;
CN('RETAIL1')=12047.9954063;
CN('SERV1')=29817.2460828;
CN('HC1')=4923.9902784;
CN('ACCOM1')=1504.2613162;
CN('REST1')=971.3941125;
CN('AG2')=1008.1799692;
CN('CONST2')=45912.9516239;
CN('MANUF2')=204771.8248095;
CN('RETAIL2')=11503.3047208;
CN('SERV2')=31268.8341223;
CN('HC2')=1518.7039360;
CN('ACCOM2')=1380.9658518;
CN('REST2')=959.2423220;
CN('AG3')=1324.7318984;
CN('UTIL')=38640.0997545;
CN('CONST3')=21502.1596891;
CN('RETAIL3')=0.0000000;
CN('SERV3')=29226.6501829;
CN('HC3')=1541.2049870;
CN('HS1')=0.0000000;
CN('HS2')=0.0000000;
CN('HS3')=0.0000000;
CPI('HH1')=1.0291404;
CPI('HH2')=1.0598096;
CPI('HH3')=1.0710116;
CPI('HH4')=1.0746811;
CPI('HH5')=1.0801912;
CX('CONST1')=3221.6021923;
CX('RETAIL1')=24356.6825948;
CX('SERV1')=135928.2556433;
CX('HC1')=8957.8483243;
CX('ACCOM1')=4130.4529806;
CX('REST1')=337526.6557412;
CX('AG2')=1082.4428371;
CX('CONST2')=8241.0088092;
CX('MANUF2')=17594.4991421;
CX('RETAIL2')=46944.4028021;
CX('SERV2')=36824.1600144;
CX('HC2')=15410.5832920;
CX('ACCOM2')=29078.2244435;
CX('REST2')=20873.6322846;
CX('AG3')=14709.3463600;
CX('UTIL')=64.5747298;
CX('CONST3')=13913.7469348;
CX('RETAIL3')=286.6548533;
CX('SERV3')=46988.0425380;
CX('HC3')=5374.1341862;
CX('HS1')=0.0000000;
CX('HS2')=0.0000000;
CX('HS3')=0.0000000;
D('CONST1')=0.1317042;
D('RETAIL1')=0.3670722;
D('SERV1')=0.5927069;
D('HC1')=0.5962015;
D('ACCOM1')=0.4787525;
D('REST1')=0.2951394;
D('AG2')=0.3789665;
D('CONST2')=0.5908837;
D('MANUF2')=0.3009437;
D('RETAIL2')=0.3790867;
D('SERV2')=0.5847922;
D('HC2')=0.1328983;
D('ACCOM2')=0.2592000;
D('REST2')=0.2637788;
D('AG3')=0.7300912;
D('UTIL')=0.1639878;
D('CONST3')=0.7896275;
D('RETAIL3')=0.1371425;
D('SERV3')=0.5846408;
D('HC3')=0.4159318;
D('HS1')=1.0000000;
D('HS2')=1.0000000;
D('HS3')=1.0000000;
DD('CONST1')=42883.3964125;
DD('RETAIL1')=64282.7775534;
DD('SERV1')=70655.1825348;
DD('HC1')=144960.2652672;
DD('ACCOM1')=43533.4472129;
DD('REST1')=22894.7568557;
DD('AG2')=9557.5370329;
DD('CONST2')=49670.7567985;
DD('MANUF2')=378268.9053057;
DD('RETAIL2')=92775.3112168;
DD('SERV2')=231803.6428226;
DD('HC2')=98805.3929980;
DD('ACCOM2')=19528.4789399;
DD('REST2')=52161.5967263;
DD('AG3')=8363.2613065;
DD('UTIL')=71221.1893329;
DD('CONST3')=23856.6756522;
DD('RETAIL3')=19940.9013363;
DD('SERV3')=53091.1725085;
DD('HC3')=67877.6742006;
DD('HS1')=33548.2742308;
DD('HS2')=8981.0505487;
DD('HS3')=6995.0476074;
DS('CONST1')=8873.2351635;
DS('RETAIL1')=47950.1724390;
DS('SERV1')=177807.0767810;
DS('HC1')=95383.0168836;
DS('ACCOM1')=24944.0951032;
DS('REST1')=344284.1586180;
DS('AG2')=4710.3701676;
DS('CONST2')=37584.7466243;
DS('MANUF2')=131434.8756911;
DS('RETAIL2')=82113.4039227;
DS('SERV2')=172381.0094159;
DS('HC2')=28529.1034157;
DS('ACCOM2')=34132.2612468;
DS('REST2')=34639.6190696;
DS('AG3')=20750.0239319;
DS('UTIL')=11722.6091428;
DS('CONST3')=32747.1908090;
DS('RETAIL3')=3018.6007913;
DS('SERV3')=78026.7730430;
DS('HC3')=33605.1770691;
DS('HS1')=33548.2742308;
DS('HS2')=8981.0505487;
DS('HS3')=6995.0476074;
FD('L1','CONST1')=10.8800638;
FD('L1','RETAIL1')=71.1955951;
FD('L1','SERV1')=91.4151745;
FD('L1','HC1')=59.5574960;
FD('L1','ACCOM1')=106.9615440;
FD('L1','REST1')=151.6198233;
FD('L1','AG2')=14.3887592;
FD('L1','CONST2')=33.3427429;
FD('L1','MANUF2')=114.6732516;
FD('L1','RETAIL2')=175.4517146;
FD('L1','SERV2')=107.1372996;
FD('L1','HC2')=24.9729467;
FD('L1','ACCOM2')=51.5702727;
FD('L1','REST2')=12.3038073;
FD('L1','AG3')=18.9135345;
FD('L1','UTIL')=26.7892555;
FD('L1','CONST3')=29.1208152;
FD('L1','RETAIL3')=2.4953761;
FD('L1','SERV3')=46.3872813;
FD('L1','HC3')=15.0011229;
FD('L1','HS1')=0.0000000;
FD('L1','HS2')=0.0000000;
FD('L1','HS3')=0.0000000;
FD('L1','L1')=0.0000000;
FD('L1','L2')=0.0000000;
FD('L1','L3')=0.0000000;
FD('L1','L4')=0.0000000;
FD('L1','L5')=0.0000000;
FD('L1','LAND')=0.0000000;
FD('L1','KAP')=0.0000000;
FD('L1','INVES')=0.0000000;
FD('L1','HH1')=0.0000000;
FD('L1','HH2')=0.0000000;
FD('L1','HH3')=0.0000000;
FD('L1','HH4')=0.0000000;
FD('L1','HH5')=0.0000000;
FD('L1','USSOCL1')=0.0000000;
FD('L1','USSOCL2')=0.0000000;
FD('L1','USSOCL3')=0.0000000;
FD('L1','USSOCL4')=0.0000000;
FD('L1','USSOCL5')=0.0000000;
FD('L1','STPIT')=0.0000000;
FD('L1','LOCTAX')=0.0000000;
FD('L1','PROPTX')=0.0000000;
FD('L1','ACCTAX')=0.0000000;
FD('L1','CYGF')=0.0000000;
FD('L1','FED')=85.9042465;
FD('L1','ROW')=0.0000000;
FD('L2','CONST1')=5.2250453;
FD('L2','RETAIL1')=59.7313569;
FD('L2','SERV1')=40.1242482;
FD('L2','HC1')=104.3496023;
FD('L2','ACCOM1')=284.2733532;
FD('L2','REST1')=67.0787645;
FD('L2','AG2')=1.0934265;
FD('L2','CONST2')=13.0255360;
FD('L2','MANUF2')=94.7056145;
FD('L2','RETAIL2')=144.8295352;
FD('L2','SERV2')=47.1274127;
FD('L2','HC2')=42.8264973;
FD('L2','ACCOM2')=133.6686009;
FD('L2','REST2')=5.5027037;
FD('L2','AG3')=2.9342364;
FD('L2','UTIL')=11.9397517;
FD('L2','CONST3')=10.3482448;
FD('L2','RETAIL3')=3.9163701;
FD('L2','SERV3')=20.4320415;
FD('L2','HC3')=24.7261673;
FD('L2','HS1')=0.0000000;
FD('L2','HS2')=0.0000000;
FD('L2','HS3')=0.0000000;
FD('L2','L1')=0.0000000;
FD('L2','L2')=0.0000000;
FD('L2','L3')=0.0000000;
FD('L2','L4')=0.0000000;
FD('L2','L5')=0.0000000;
FD('L2','LAND')=0.0000000;
FD('L2','KAP')=0.0000000;
FD('L2','INVES')=0.0000000;
FD('L2','HH1')=0.0000000;
FD('L2','HH2')=0.0000000;
FD('L2','HH3')=0.0000000;
FD('L2','HH4')=0.0000000;
FD('L2','HH5')=0.0000000;
FD('L2','USSOCL1')=0.0000000;
FD('L2','USSOCL2')=0.0000000;
FD('L2','USSOCL3')=0.0000000;
FD('L2','USSOCL4')=0.0000000;
FD('L2','USSOCL5')=0.0000000;
FD('L2','STPIT')=0.0000000;
FD('L2','LOCTAX')=0.0000000;
FD('L2','PROPTX')=0.0000000;
FD('L2','ACCTAX')=0.0000000;
FD('L2','CYGF')=0.0000000;
FD('L2','FED')=96.8476300;
FD('L2','ROW')=0.0000000;
FD('L3','CONST1')=19.6585110;
FD('L3','RETAIL1')=36.7350559;
FD('L3','SERV1')=99.3651227;
FD('L3','HC1')=107.4257161;
FD('L3','ACCOM1')=48.6204292;
FD('L3','REST1')=14.0764179;
FD('L3','AG2')=19.4640707;
FD('L3','CONST2')=53.2242120;
FD('L3','MANUF2')=248.6094663;
FD('L3','RETAIL2')=89.3599630;
FD('L3','SERV2')=115.9648675;
FD('L3','HC2')=43.7982704;
FD('L3','ACCOM2')=22.2569990;
FD('L3','REST2')=1.1019488;
FD('L3','AG3')=30.8166146;
FD('L3','UTIL')=104.1162377;
FD('L3','CONST3')=45.9031896;
FD('L3','RETAIL3')=0.0000000;
FD('L3','SERV3')=50.1123778;
FD('L3','HC3')=24.9985530;
FD('L3','HS1')=0.0000000;
FD('L3','HS2')=0.0000000;
FD('L3','HS3')=0.0000000;
FD('L3','L1')=0.0000000;
FD('L3','L2')=0.0000000;
FD('L3','L3')=0.0000000;
FD('L3','L4')=0.0000000;
FD('L3','L5')=0.0000000;
FD('L3','LAND')=0.0000000;
FD('L3','KAP')=0.0000000;
FD('L3','INVES')=0.0000000;
FD('L3','HH1')=0.0000000;
FD('L3','HH2')=0.0000000;
FD('L3','HH3')=0.0000000;
FD('L3','HH4')=0.0000000;
FD('L3','HH5')=0.0000000;
FD('L3','USSOCL1')=0.0000000;
FD('L3','USSOCL2')=0.0000000;
FD('L3','USSOCL3')=0.0000000;
FD('L3','USSOCL4')=0.0000000;
FD('L3','USSOCL5')=0.0000000;
FD('L3','STPIT')=0.0000000;
FD('L3','LOCTAX')=0.0000000;
FD('L3','PROPTX')=0.0000000;
FD('L3','ACCTAX')=0.0000000;
FD('L3','CYGF')=0.0000000;
FD('L3','FED')=291.1151717;
FD('L3','ROW')=0.0000000;
FD('L4','CONST1')=7.1875053;
FD('L4','RETAIL1')=2.7678851;
FD('L4','SERV1')=28.9836608;
FD('L4','HC1')=46.5076157;
FD('L4','ACCOM1')=0.0000000;
FD('L4','REST1')=0.0000000;
FD('L4','AG2')=1.5278582;
FD('L4','CONST2')=20.2155998;
FD('L4','MANUF2')=91.3974801;
FD('L4','RETAIL2')=7.0824666;
FD('L4','SERV2')=33.4410799;
FD('L4','HC2')=20.2059698;
FD('L4','ACCOM2')=0.0000000;
FD('L4','REST2')=0.0000000;
FD('L4','AG3')=1.9928187;
FD('L4','UTIL')=0.0000000;
FD('L4','CONST3')=17.3918394;
FD('L4','RETAIL3')=0.0000000;
FD('L4','SERV3')=14.3297771;
FD('L4','HC3')=10.9929192;
FD('L4','HS1')=0.0000000;
FD('L4','HS2')=0.0000000;
FD('L4','HS3')=0.0000000;
FD('L4','L1')=0.0000000;
FD('L4','L2')=0.0000000;
FD('L4','L3')=0.0000000;
FD('L4','L4')=0.0000000;
FD('L4','L5')=0.0000000;
FD('L4','LAND')=0.0000000;
FD('L4','KAP')=0.0000000;
FD('L4','INVES')=0.0000000;
FD('L4','HH1')=0.0000000;
FD('L4','HH2')=0.0000000;
FD('L4','HH3')=0.0000000;
FD('L4','HH4')=0.0000000;
FD('L4','HH5')=0.0000000;
FD('L4','USSOCL1')=0.0000000;
FD('L4','USSOCL2')=0.0000000;
FD('L4','USSOCL3')=0.0000000;
FD('L4','USSOCL4')=0.0000000;
FD('L4','USSOCL5')=0.0000000;
FD('L4','STPIT')=0.0000000;
FD('L4','LOCTAX')=0.0000000;
FD('L4','PROPTX')=0.0000000;
FD('L4','ACCTAX')=0.0000000;
FD('L4','CYGF')=0.0000000;
FD('L4','FED')=64.7582629;
FD('L4','ROW')=0.0000000;
FD('L5','CONST1')=4.3460923;
FD('L5','RETAIL1')=4.6521775;
FD('L5','SERV1')=26.2009225;
FD('L5','HC1')=40.1874682;
FD('L5','ACCOM1')=0.0000000;
FD('L5','REST1')=0.0000000;
FD('L5','AG2')=9.2424966;
FD('L5','CONST2')=10.1916777;
FD('L5','MANUF2')=34.8332865;
FD('L5','RETAIL2')=13.2620695;
FD('L5','SERV2')=30.8309909;
FD('L5','HC2')=17.2300119;
FD('L5','ACCOM2')=0.0000000;
FD('L5','REST2')=0.0000000;
FD('L5','AG3')=14.0558764;
FD('L5','UTIL')=16.2233688;
FD('L5','CONST3')=8.7688064;
FD('L5','RETAIL3')=0.0000000;
FD('L5','SERV3')=13.5484240;
FD('L5','HC3')=9.8492479;
FD('L5','HS1')=0.0000000;
FD('L5','HS2')=0.0000000;
FD('L5','HS3')=0.0000000;
FD('L5','L1')=0.0000000;
FD('L5','L2')=0.0000000;
FD('L5','L3')=0.0000000;
FD('L5','L4')=0.0000000;
FD('L5','L5')=0.0000000;
FD('L5','LAND')=0.0000000;
FD('L5','KAP')=0.0000000;
FD('L5','INVES')=0.0000000;
FD('L5','HH1')=0.0000000;
FD('L5','HH2')=0.0000000;
FD('L5','HH3')=0.0000000;
FD('L5','HH4')=0.0000000;
FD('L5','HH5')=0.0000000;
FD('L5','USSOCL1')=0.0000000;
FD('L5','USSOCL2')=0.0000000;
FD('L5','USSOCL3')=0.0000000;
FD('L5','USSOCL4')=0.0000000;
FD('L5','USSOCL5')=0.0000000;
FD('L5','STPIT')=0.0000000;
FD('L5','LOCTAX')=0.0000000;
FD('L5','PROPTX')=0.0000000;
FD('L5','ACCTAX')=0.0000000;
FD('L5','CYGF')=0.0000000;
FD('L5','FED')=26.0920378;
FD('L5','ROW')=0.0000000;
FD('LAND','CONST1')=0.1219645;
FD('LAND','RETAIL1')=28.0578621;
FD('LAND','SERV1')=11.2890171;
FD('LAND','HC1')=3.2536507;
FD('LAND','ACCOM1')=4.7394248;
FD('LAND','REST1')=16.1508420;
FD('LAND','AG2')=0.1991374;
FD('LAND','CONST2')=6.9279502;
FD('LAND','MANUF2')=10.9164201;
FD('LAND','RETAIL2')=20.7840636;
FD('LAND','SERV2')=78.8672481;
FD('LAND','HC2')=6.6061254;
FD('LAND','ACCOM2')=11.9466557;
FD('LAND','REST2')=11.4423380;
FD('LAND','AG3')=3.2084959;
FD('LAND','UTIL')=2.8759701;
FD('LAND','CONST3')=5.2987525;
FD('LAND','RETAIL3')=0.6983987;
FD('LAND','SERV3')=162.0392509;
FD('LAND','HC3')=22.4371056;
FD('LAND','HS1')=178.5726913;
FD('LAND','HS2')=33.7939307;
FD('LAND','HS3')=66.4906961;
FD('LAND','L1')=0.0000000;
FD('LAND','L2')=0.0000000;
FD('LAND','L3')=0.0000000;
FD('LAND','L4')=0.0000000;
FD('LAND','L5')=0.0000000;
FD('LAND','LAND')=0.0000000;
FD('LAND','KAP')=0.0000000;
FD('LAND','INVES')=0.0000000;
FD('LAND','HH1')=0.0000000;
FD('LAND','HH2')=0.0000000;
FD('LAND','HH3')=0.0000000;
FD('LAND','HH4')=0.0000000;
FD('LAND','HH5')=0.0000000;
FD('LAND','USSOCL1')=0.0000000;
FD('LAND','USSOCL2')=0.0000000;
FD('LAND','USSOCL3')=0.0000000;
FD('LAND','USSOCL4')=0.0000000;
FD('LAND','USSOCL5')=0.0000000;
FD('LAND','STPIT')=0.0000000;
FD('LAND','LOCTAX')=0.0000000;
FD('LAND','PROPTX')=0.0000000;
FD('LAND','ACCTAX')=0.0000000;
FD('LAND','CYGF')=0.0000000;
FD('LAND','FED')=0.0000000;
FD('LAND','ROW')=0.0000000;
FD('KAP','CONST1')=9847.2580787;
FD('KAP','RETAIL1')=137165.8460177;
FD('KAP','SERV1')=614096.1454365;
FD('KAP','HC1')=286665.1404927;
FD('KAP','ACCOM1')=36152.6622759;
FD('KAP','REST1')=1614219.1999402;
FD('KAP','AG2')=2386.3547244;
FD('KAP','CONST2')=28434.0961331;
FD('KAP','MANUF2')=11753.6580332;
FD('KAP','RETAIL2')=186014.8104695;
FD('KAP','SERV2')=743587.3031570;
FD('KAP','HC2')=51838.7529224;
FD('KAP','ACCOM2')=177564.0158741;
FD('KAP','REST2')=136989.7972200;
FD('KAP','AG3')=2683.4041953;
FD('KAP','UTIL')=1035.4833699;
FD('KAP','CONST3')=41148.9792559;
FD('KAP','RETAIL3')=2344.5135321;
FD('KAP','SERV3')=391748.8101281;
FD('KAP','HC3')=54180.6417366;
FD('KAP','HS1')=163983.1570322;
FD('KAP','HS2')=92348.9299212;
FD('KAP','HS3')=86909.9371237;
FD('KAP','L1')=0.0000000;
FD('KAP','L2')=0.0000000;
FD('KAP','L3')=0.0000000;
FD('KAP','L4')=0.0000000;
FD('KAP','L5')=0.0000000;
FD('KAP','LAND')=0.0000000;
FD('KAP','KAP')=0.0000000;
FD('KAP','INVES')=0.0000000;
FD('KAP','HH1')=0.0000000;
FD('KAP','HH2')=0.0000000;
FD('KAP','HH3')=0.0000000;
FD('KAP','HH4')=0.0000000;
FD('KAP','HH5')=0.0000000;
FD('KAP','USSOCL1')=0.0000000;
FD('KAP','USSOCL2')=0.0000000;
FD('KAP','USSOCL3')=0.0000000;
FD('KAP','USSOCL4')=0.0000000;
FD('KAP','USSOCL5')=0.0000000;
FD('KAP','STPIT')=0.0000000;
FD('KAP','LOCTAX')=0.0000000;
FD('KAP','PROPTX')=0.0000000;
FD('KAP','ACCTAX')=0.0000000;
FD('KAP','CYGF')=0.0000000;
FD('KAP','FED')=0.0000000;
FD('KAP','ROW')=0.0000000;
HH('HH1')=476.6307265;
HH('HH2')=864.8686356;
HH('HH3')=1349.2453899;
HH('HH4')=479.5940865;
HH('HH5')=799.2414060;
HN('HH1')=373.6819347;
HN('HH2')=386.0797713;
HN('HH3')=421.7847801;
HN('HH4')=81.2365377;
HN('HH5')=48.5087629;
HW('HH1')=102.9487918;
HW('HH2')=478.7888643;
HW('HH3')=927.4606098;
HW('HH4')=398.3575487;
HW('HH5')=750.7326431;
IGT('USSOCL1','USSOCL1')=0.0000000;
IGT('USSOCL1','USSOCL2')=0.0000000;
IGT('USSOCL1','USSOCL3')=-0.0000000;
IGT('USSOCL1','USSOCL4')=-0.0000000;
IGT('USSOCL1','USSOCL5')=-0.0000000;
IGT('USSOCL1','STPIT')=-0.0000000;
IGT('USSOCL1','LOCTAX')=-0.0000000;
IGT('USSOCL1','PROPTX')=-0.0000000;
IGT('USSOCL1','ACCTAX')=-0.0000000;
IGT('USSOCL2','USSOCL1')=0.0000000;
IGT('USSOCL2','USSOCL2')=0.0000000;
IGT('USSOCL2','USSOCL3')=-0.0000000;
IGT('USSOCL2','USSOCL4')=0.0000000;
IGT('USSOCL2','USSOCL5')=0.0000000;
IGT('USSOCL2','STPIT')=0.0000000;
IGT('USSOCL2','LOCTAX')=-0.0000000;
IGT('USSOCL2','PROPTX')=-0.0000000;
IGT('USSOCL2','ACCTAX')=-0.0000000;
IGT('USSOCL3','USSOCL1')=0.0000000;
IGT('USSOCL3','USSOCL2')=0.0000000;
IGT('USSOCL3','USSOCL3')=0.0000000;
IGT('USSOCL3','USSOCL4')=0.0000000;
IGT('USSOCL3','USSOCL5')=0.0000000;
IGT('USSOCL3','STPIT')=0.0000000;
IGT('USSOCL3','LOCTAX')=0.0000000;
IGT('USSOCL3','PROPTX')=0.0000000;
IGT('USSOCL3','ACCTAX')=0.0000000;
IGT('USSOCL4','USSOCL1')=0.0000000;
IGT('USSOCL4','USSOCL2')=0.0000000;
IGT('USSOCL4','USSOCL3')=-0.0000000;
IGT('USSOCL4','USSOCL4')=0.0000000;
IGT('USSOCL4','USSOCL5')=0.0000000;
IGT('USSOCL4','STPIT')=0.0000000;
IGT('USSOCL4','LOCTAX')=0.0000000;
IGT('USSOCL4','PROPTX')=0.0000000;
IGT('USSOCL4','ACCTAX')=0.0000000;
IGT('USSOCL5','USSOCL1')=0.0000000;
IGT('USSOCL5','USSOCL2')=0.0000000;
IGT('USSOCL5','USSOCL3')=-0.0000000;
IGT('USSOCL5','USSOCL4')=0.0000000;
IGT('USSOCL5','USSOCL5')=0.0000000;
IGT('USSOCL5','STPIT')=0.0000000;
IGT('USSOCL5','LOCTAX')=-0.0000000;
IGT('USSOCL5','PROPTX')=-0.0000000;
IGT('USSOCL5','ACCTAX')=-0.0000000;
IGT('STPIT','USSOCL1')=0.0000000;
IGT('STPIT','USSOCL2')=0.0000000;
IGT('STPIT','USSOCL3')=-0.0000000;
IGT('STPIT','USSOCL4')=0.0000000;
IGT('STPIT','USSOCL5')=0.0000000;
IGT('STPIT','STPIT')=0.0000000;
IGT('STPIT','LOCTAX')=-0.0000000;
IGT('STPIT','PROPTX')=-0.0000000;
IGT('STPIT','ACCTAX')=-0.0000000;
IGT('LOCTAX','USSOCL1')=-0.0000000;
IGT('LOCTAX','USSOCL2')=-0.0000000;
IGT('LOCTAX','USSOCL3')=-0.0000000;
IGT('LOCTAX','USSOCL4')=-0.0000000;
IGT('LOCTAX','USSOCL5')=-0.0000000;
IGT('LOCTAX','STPIT')=-0.0000000;
IGT('LOCTAX','LOCTAX')=-0.0000000;
IGT('LOCTAX','PROPTX')=-0.0000000;
IGT('LOCTAX','ACCTAX')=-0.0000000;
IGT('PROPTX','USSOCL1')=-0.0000000;
IGT('PROPTX','USSOCL2')=-0.0000000;
IGT('PROPTX','USSOCL3')=-0.0000000;
IGT('PROPTX','USSOCL4')=-0.0000000;
IGT('PROPTX','USSOCL5')=-0.0000000;
IGT('PROPTX','STPIT')=-0.0000000;
IGT('PROPTX','LOCTAX')=-0.0000000;
IGT('PROPTX','PROPTX')=-0.0000000;
IGT('PROPTX','ACCTAX')=-0.0000000;
IGT('ACCTAX','USSOCL1')=-0.0000000;
IGT('ACCTAX','USSOCL2')=-0.0000000;
IGT('ACCTAX','USSOCL3')=-0.0000000;
IGT('ACCTAX','USSOCL4')=-0.0000000;
IGT('ACCTAX','USSOCL5')=-0.0000000;
IGT('ACCTAX','STPIT')=-0.0000000;
IGT('ACCTAX','LOCTAX')=-0.0000000;
IGT('ACCTAX','PROPTX')=-0.0000000;
IGT('ACCTAX','ACCTAX')=-0.0000000;
IGT('CYGF','USSOCL1')=-12763.8973830;
IGT('CYGF','USSOCL2')=-16522.0914116;
IGT('CYGF','USSOCL3')=10526.5885596;
IGT('CYGF','USSOCL4')=5054.3792194;
IGT('CYGF','USSOCL5')=7337.9878032;
IGT('CYGF','STPIT')=16148.3613939;
IGT('CYGF','LOCTAX')=1470.2871928;
IGT('CYGF','PROPTX')=3992.5355152;
IGT('CYGF','ACCTAX')=694.4370534;
IGT('FED','USSOCL1')=0.0000000;
IGT('FED','USSOCL2')=0.0000000;
IGT('FED','USSOCL3')=-0.0000000;
IGT('FED','USSOCL4')=0.0000000;
IGT('FED','USSOCL5')=0.0000000;
IGT('FED','STPIT')=0.0000000;
IGT('FED','LOCTAX')=-0.0000000;
IGT('FED','PROPTX')=-0.0000000;
IGT('FED','ACCTAX')=-0.0000000;
KS('KAP','CONST1')=9847.2580787;
KS('KAP','RETAIL1')=137165.8460177;
KS('KAP','SERV1')=614096.1454365;
KS('KAP','HC1')=286665.1404927;
KS('KAP','ACCOM1')=36152.6622759;
KS('KAP','REST1')=1614219.1999402;
KS('KAP','AG2')=2386.3547244;
KS('KAP','CONST2')=28434.0961331;
KS('KAP','MANUF2')=11753.6580332;
KS('KAP','RETAIL2')=186014.8104695;
KS('KAP','SERV2')=743587.3031570;
KS('KAP','HC2')=51838.7529224;
KS('KAP','ACCOM2')=177564.0158741;
KS('KAP','REST2')=136989.7972200;
KS('KAP','AG3')=2683.4041953;
KS('KAP','UTIL')=1035.4833699;
KS('KAP','CONST3')=41148.9792559;
KS('KAP','RETAIL3')=2344.5135321;
KS('KAP','SERV3')=391748.8101281;
KS('KAP','HC3')=54180.6417366;
KS('KAP','HS1')=163983.1570322;
KS('KAP','HS2')=92348.9299212;
KS('KAP','HS3')=86909.9371237;
KS('KAP','FED')=0.0000000;
LAS('LAND','CONST1')=0.1219644;
LAS('LAND','RETAIL1')=28.0578621;
LAS('LAND','SERV1')=11.2890171;
LAS('LAND','HC1')=3.2536507;
LAS('LAND','ACCOM1')=4.7394248;
LAS('LAND','REST1')=16.1508420;
LAS('LAND','AG2')=0.1991374;
LAS('LAND','CONST2')=6.9279502;
LAS('LAND','MANUF2')=10.9164201;
LAS('LAND','RETAIL2')=20.7840636;
LAS('LAND','SERV2')=78.8672481;
LAS('LAND','HC2')=6.6061254;
LAS('LAND','ACCOM2')=11.9466557;
LAS('LAND','REST2')=11.4423380;
LAS('LAND','AG3')=3.2084959;
LAS('LAND','UTIL')=2.8759701;
LAS('LAND','CONST3')=5.2987525;
LAS('LAND','RETAIL3')=0.6983987;
LAS('LAND','SERV3')=162.0392509;
LAS('LAND','HC3')=22.4371056;
LAS('LAND','HS1')=178.5726913;
LAS('LAND','HS2')=33.7939307;
LAS('LAND','HS3')=66.4906961;
LAS('LAND','FED')=0.0000000;
M('CONST1')=37231.7634413;
M('RETAIL1')=40689.2877092;
M('SERV1')=28776.3613971;
M('HC1')=58535.0967079;
M('ACCOM1')=22719.8050903;
M('REST1')=16137.2539789;
M('AG2')=5929.6097024;
M('CONST2')=20327.0189834;
M('MANUF2')=264428.5287566;
M('RETAIL2')=57606.3100963;
M('SERV2')=96246.7934212;
M('HC2')=85686.8728743;
M('ACCOM2')=14474.4421366;
M('REST2')=38395.6099414;
M('AG3')=2322.5837346;
M('UTIL')=59563.1549199;
M('CONST3')=5023.2317780;
M('RETAIL3')=17208.9553983;
M('SERV3')=22052.4420035;
M('HC3')=39646.6313177;
M('HS1')=0.0000000;
M('HS2')=0.0000000;
M('HS3')=0.0000000;
N('KAP','CONST1')=1016.5168479;
N('KAP','RETAIL1')=13605.9434785;
N('KAP','SERV1')=61338.6338300;
N('KAP','HC1')=28897.2761143;
N('KAP','ACCOM1')=4684.0805831;
N('KAP','REST1')=160872.3286493;
N('KAP','AG2')=247.6979967;
N('KAP','CONST2')=2843.0653213;
N('KAP','MANUF2')=1185.5321343;
N('KAP','RETAIL2')=18600.9448906;
N('KAP','SERV2')=73976.6730812;
N('KAP','HC2')=5388.1260827;
N('KAP','ACCOM2')=19371.5259051;
N('KAP','REST2')=13195.3097708;
N('KAP','AG3')=285.8437089;
N('KAP','UTIL')=117.6518130;
N('KAP','CONST3')=4098.1096641;
N('KAP','RETAIL3')=257.5103532;
N('KAP','SERV3')=38751.1264803;
N('KAP','HC3')=5510.4352029;
N('KAP','HS1')=15233.2751831;
N('KAP','HS2')=7380.5680667;
N('KAP','HS3')=6302.7806442;
N('KAP','FED')=0.0000000;
NKI=497203.1458523;
LNFOR(LA)=-146736.5832330;
KPFOR(K)=-259208.4556809;
GVFOR('USSOCL1')=0.0000000;
GVFOR('USSOCL2')=0.0000000;
GVFOR('USSOCL3')=0.0000000;
GVFOR('USSOCL4')=0.0000000;
GVFOR('USSOCL5')=0.0000000;
GVFOR('STPIT')=0.0000000;
GVFOR('LOCTAX')=0.0000000;
GVFOR('PROPTX')=0.0000000;
GVFOR('ACCTAX')=0.0000000;
GVFOR('CYGF')=0.0000000;
GVFOR('FED')=16091.2222366;
P('CONST1')=0.9960639;
P('RETAIL1')=1.0213595;
P('SERV1')=1.0103578;
P('HC1')=1.0052651;
P('ACCOM1')=0.9071172;
P('REST1')=1.0018413;
P('AG2')=0.9645391;
P('CONST2')=1.0128888;
P('MANUF2')=0.9993864;
P('RETAIL2')=1.0136205;
P('SERV2')=1.0226381;
P('HC2')=0.9958796;
P('ACCOM2')=0.9821345;
P('REST2')=1.0149314;
P('AG3')=0.7638867;
P('UTIL')=0.9903169;
P('CONST3')=1.0405176;
P('RETAIL3')=0.9954300;
P('SERV3')=1.0227997;
P('HC3')=0.9892438;
P('HS1')=1.4775795;
P('HS2')=2.1109701;
P('HS3')=2.2362314;
PD('CONST1')=0.9692139;
PD('RETAIL1')=1.0570450;
PD('SERV1')=1.0174521;
PD('HC1')=1.0088203;
PD('ACCOM1')=0.7869688;
PD('REST1')=1.0062265;
PD('AG2')=0.8992556;
PD('CONST2')=1.0216384;
PD('MANUF2')=0.9979555;
PD('RETAIL2')=1.0353928;
PD('SERV2')=1.0386128;
PD('HC2')=0.9684812;
PD('ACCOM2')=0.9292510;
PD('REST2')=1.0553707;
PD('AG3')=0.6516147;
PD('UTIL')=0.9379379;
PD('CONST3')=1.0510880;
PD('RETAIL3')=0.9640503;
PD('SERV3')=1.0388796;
PD('HC3')=0.9739637;
PD('HS1')=1.4775795;
PD('HS2')=2.1109701;
PD('HS3')=2.2362314;
PVA('CONST1')=0.5775457;
PVA('RETAIL1')=0.4886948;
PVA('SERV1')=0.5677815;
PVA('HC1')=0.6136081;
PVA('ACCOM1')=5.6269394;
PVA('REST1')=0.6768877;
PVA('AG2')=0.7629446;
PVA('CONST2')=0.3682106;
PVA('MANUF2')=0.2997725;
PVA('RETAIL2')=0.7036400;
PVA('SERV2')=0.6868539;
PVA('HC2')=0.8578092;
PVA('ACCOM2')=1.8824404;
PVA('REST2')=0.5401858;
PVA('AG3')=0.7083255;
PVA('UTIL')=0.7886984;
PVA('CONST3')=0.3619686;
PVA('RETAIL3')=0.3707254;
PVA('SERV3')=0.6551755;
PVA('HC3')=0.4144334;
PVA('HS1')=0.5857838;
PVA('HS2')=0.1746623;
PVA('HS3')=0.1013783;
RA('L1')=1.0468203;
RA('L2')=1.3607977;
RA('L3')=1.1597711;
RA('L4')=0.9875967;
RA('L5')=0.9793698;
RA('LAND')=0.9999995;
RA('KAP')=0.9999999;
R('L1','CONST1')=4.6714160;
R('L1','RETAIL1')=5.2151150;
R('L1','SERV1')=6.0066200;
R('L1','HC1')=7.0979545;
R('L1','ACCOM1')=11.3742517;
R('L1','REST1')=6.4947473;
R('L1','AG2')=11.0551500;
R('L1','CONST2')=4.6714160;
R('L1','MANUF2')=3.9245232;
R('L1','RETAIL2')=5.2151151;
R('L1','SERV2')=6.0066200;
R('L1','HC2')=7.0979545;
R('L1','ACCOM2')=11.3742517;
R('L1','REST2')=6.4947473;
R('L1','AG3')=2.2110300;
R('L1','UTIL')=1.2116572;
R('L1','CONST3')=4.6714160;
R('L1','RETAIL3')=5.2151150;
R('L1','SERV3')=6.0066200;
R('L1','HC3')=7.0979545;
R('L1','HS1')=1.0000000;
R('L1','HS2')=1.0000000;
R('L1','HS3')=1.0000000;
R('L1','L1')=1.0000000;
R('L1','L2')=1.0000000;
R('L1','L3')=1.0000000;
R('L1','L4')=1.0000000;
R('L1','L5')=1.0000000;
R('L1','LAND')=1.0000000;
R('L1','KAP')=1.0000000;
R('L1','INVES')=1.0000000;
R('L1','HH1')=1.0000000;
R('L1','HH2')=1.0000000;
R('L1','HH3')=1.0000000;
R('L1','HH4')=1.0000000;
R('L1','HH5')=1.0000000;
R('L1','USSOCL1')=1.0000000;
R('L1','USSOCL2')=1.0000000;
R('L1','USSOCL3')=1.0000000;
R('L1','USSOCL4')=1.0000000;
R('L1','USSOCL5')=1.0000000;
R('L1','STPIT')=1.0000000;
R('L1','LOCTAX')=1.0000000;
R('L1','PROPTX')=1.0000000;
R('L1','ACCTAX')=1.0000000;
R('L1','CYGF')=1.0000000;
R('L1','FED')=6.6126514;
R('L1','ROW')=1.0000000;
R('L2','CONST1')=22.5244501;
R('L2','RETAIL1')=23.7244048;
R('L2','SERV1')=23.4683615;
R('L2','HC1')=25.3632640;
R('L2','ACCOM1')=25.4591971;
R('L2','REST1')=23.0287388;
R('L2','AG2')=22.7201998;
R('L2','CONST2')=22.5244501;
R('L2','MANUF2')=24.0371415;
R('L2','RETAIL2')=23.7244048;
R('L2','SERV2')=23.4683615;
R('L2','HC2')=25.3632640;
R('L2','ACCOM2')=25.4591971;
R('L2','REST2')=23.0287388;
R('L2','AG3')=204.4817979;
R('L2','UTIL')=15.6037500;
R('L2','CONST3')=22.5244501;
R('L2','RETAIL3')=23.7244048;
R('L2','SERV3')=23.4683615;
R('L2','HC3')=25.3632640;
R('L2','HS1')=1.0000000;
R('L2','HS2')=1.0000000;
R('L2','HS3')=1.0000000;
R('L2','L1')=1.0000000;
R('L2','L2')=1.0000000;
R('L2','L3')=1.0000000;
R('L2','L4')=1.0000000;
R('L2','L5')=1.0000000;
R('L2','LAND')=1.0000000;
R('L2','KAP')=1.0000000;
R('L2','INVES')=1.0000000;
R('L2','HH1')=1.0000000;
R('L2','HH2')=1.0000000;
R('L2','HH3')=1.0000000;
R('L2','HH4')=1.0000000;
R('L2','HH5')=1.0000000;
R('L2','USSOCL1')=1.0000000;
R('L2','USSOCL2')=1.0000000;
R('L2','USSOCL3')=1.0000000;
R('L2','USSOCL4')=1.0000000;
R('L2','USSOCL5')=1.0000000;
R('L2','STPIT')=1.0000000;
R('L2','LOCTAX')=1.0000000;
R('L2','PROPTX')=1.0000000;
R('L2','ACCTAX')=1.0000000;
R('L2','CYGF')=1.0000000;
R('L2','FED')=27.4150999;
R('L2','ROW')=1.0000000;
R('L3','CONST1')=52.2030672;
R('L3','RETAIL1')=49.8756040;
R('L3','SERV1')=49.2237092;
R('L3','HC1')=50.8608035;
R('L3','ACCOM1')=46.8255000;
R('L3','REST1')=37.8810000;
R('L3','AG2')=49.8870909;
R('L3','CONST2')=52.2030672;
R('L3','MANUF2')=55.0521566;
R('L3','RETAIL2')=49.8756040;
R('L3','SERV2')=49.2237092;
R('L3','HC2')=50.8608035;
R('L3','ACCOM2')=46.8255000;
R('L3','REST2')=37.8810000;
R('L3','AG3')=2.7715051;
R('L3','UTIL')=45.1519799;
R('L3','CONST3')=52.2030672;
R('L3','RETAIL3')=1.0000000;
R('L3','SERV3')=49.2237092;
R('L3','HC3')=50.8608035;
R('L3','HS1')=1.0000000;
R('L3','HS2')=1.0000000;
R('L3','HS3')=1.0000000;
R('L3','L1')=1.0000000;
R('L3','L2')=1.0000000;
R('L3','L3')=1.0000000;
R('L3','L4')=1.0000000;
R('L3','L5')=1.0000000;
R('L3','LAND')=1.0000000;
R('L3','KAP')=1.0000000;
R('L3','INVES')=1.0000000;
R('L3','HH1')=1.0000000;
R('L3','HH2')=1.0000000;
R('L3','HH3')=1.0000000;
R('L3','HH4')=1.0000000;
R('L3','HH5')=1.0000000;
R('L3','USSOCL1')=1.0000000;
R('L3','USSOCL2')=1.0000000;
R('L3','USSOCL3')=1.0000000;
R('L3','USSOCL4')=1.0000000;
R('L3','USSOCL5')=1.0000000;
R('L3','STPIT')=1.0000000;
R('L3','LOCTAX')=1.0000000;
R('L3','PROPTX')=1.0000000;
R('L3','ACCTAX')=1.0000000;
R('L3','CYGF')=1.0000000;
R('L3','FED')=49.8500245;
R('L3','ROW')=1.0000000;
R('L4','CONST1')=85.1699302;
R('L4','RETAIL1')=85.5513000;
R('L4','SERV1')=86.4925125;
R('L4','HC1')=84.5764219;
R('L4','ACCOM1')=1.0000000;
R('L4','REST1')=1.0000000;
R('L4','AG2')=111.7200000;
R('L4','CONST2')=85.1699303;
R('L4','MANUF2')=82.7215976;
R('L4','RETAIL2')=85.5513000;
R('L4','SERV2')=86.4925125;
R('L4','HC2')=84.5764218;
R('L4','ACCOM2')=1.0000000;
R('L4','REST2')=1.0000000;
R('L4','AG3')=782.0400000;
R('L4','UTIL')=1.0000000;
R('L4','CONST3')=85.1699302;
R('L4','RETAIL3')=1.0000000;
R('L4','SERV3')=86.4925125;
R('L4','HC3')=84.5764219;
R('L4','HS1')=1.0000000;
R('L4','HS2')=1.0000000;
R('L4','HS3')=1.0000000;
R('L4','L1')=1.0000000;
R('L4','L2')=1.0000000;
R('L4','L3')=1.0000000;
R('L4','L4')=1.0000000;
R('L4','L5')=1.0000000;
R('L4','LAND')=1.0000000;
R('L4','KAP')=1.0000000;
R('L4','INVES')=1.0000000;
R('L4','HH1')=1.0000000;
R('L4','HH2')=1.0000000;
R('L4','HH3')=1.0000000;
R('L4','HH4')=1.0000000;
R('L4','HH5')=1.0000000;
R('L4','USSOCL1')=1.0000000;
R('L4','USSOCL2')=1.0000000;
R('L4','USSOCL3')=1.0000000;
R('L4','USSOCL4')=1.0000000;
R('L4','USSOCL5')=1.0000000;
R('L4','STPIT')=1.0000000;
R('L4','LOCTAX')=1.0000000;
R('L4','PROPTX')=1.0000000;
R('L4','ACCTAX')=1.0000000;
R('L4','CYGF')=1.0000000;
R('L4','FED')=85.7211600;
R('L4','ROW')=1.0000000;
R('L5','CONST1')=170.2926818;
R('L5','RETAIL1')=157.9533333;
R('L5','SERV1')=159.4693750;
R('L5','HC1')=158.7566111;
R('L5','ACCOM1')=1.0000000;
R('L5','REST1')=1.0000000;
R('L5','AG2')=139.8911538;
R('L5','CONST2')=170.2926818;
R('L5','MANUF2')=166.4738437;
R('L5','RETAIL2')=157.9533333;
R('L5','SERV2')=159.4693750;
R('L5','HC2')=158.7566111;
R('L5','ACCOM2')=1.0000000;
R('L5','REST2')=1.0000000;
R('L5','AG3')=759.4091209;
R('L5','UTIL')=132.6675000;
R('L5','CONST3')=170.2926818;
R('L5','RETAIL3')=1.0000000;
R('L5','SERV3')=159.4693750;
R('L5','HC3')=158.7566111;
R('L5','HS1')=1.0000000;
R('L5','HS2')=1.0000000;
R('L5','HS3')=1.0000000;
R('L5','L1')=1.0000000;
R('L5','L2')=1.0000000;
R('L5','L3')=1.0000000;
R('L5','L4')=1.0000000;
R('L5','L5')=1.0000000;
R('L5','LAND')=1.0000000;
R('L5','KAP')=1.0000000;
R('L5','INVES')=1.0000000;
R('L5','HH1')=1.0000000;
R('L5','HH2')=1.0000000;
R('L5','HH3')=1.0000000;
R('L5','HH4')=1.0000000;
R('L5','HH5')=1.0000000;
R('L5','USSOCL1')=1.0000000;
R('L5','USSOCL2')=1.0000000;
R('L5','USSOCL3')=1.0000000;
R('L5','USSOCL4')=1.0000000;
R('L5','USSOCL5')=1.0000000;
R('L5','STPIT')=1.0000000;
R('L5','LOCTAX')=1.0000000;
R('L5','PROPTX')=1.0000000;
R('L5','ACCTAX')=1.0000000;
R('L5','CYGF')=1.0000000;
R('L5','FED')=117.8190000;
R('L5','ROW')=1.0000000;
R('LAND','CONST1')=6412.1636176;
R('LAND','RETAIL1')=178.7513063;
R('LAND','SERV1')=2207.5250422;
R('LAND','HC1')=1550.8217365;
R('LAND','ACCOM1')=15702.2986367;
R('LAND','REST1')=4511.7256816;
R('LAND','AG2')=1320.5949076;
R('LAND','CONST2')=471.2599230;
R('LAND','MANUF2')=285.2181961;
R('LAND','RETAIL2')=1181.3448455;
R('LAND','SERV2')=382.6244769;
R('LAND','HC2')=1092.2943865;
R('LAND','ACCOM2')=995.4441851;
R('LAND','REST2')=820.9136207;
R('LAND','AG3')=75.2719140;
R('LAND','UTIL')=135.4935650;
R('LAND','CONST3')=242.1291918;
R('LAND','RETAIL3')=485.5672949;
R('LAND','SERV3')=53.0955332;
R('LAND','HC3')=94.3296739;
R('LAND','HS1')=69.8904936;
R('LAND','HS2')=23.6028303;
R('LAND','HS3')=4.9608962;
R('LAND','L1')=1.0000000;
R('LAND','L2')=1.0000000;
R('LAND','L3')=1.0000000;
R('LAND','L4')=1.0000000;
R('LAND','L5')=1.0000000;
R('LAND','LAND')=1.0000000;
R('LAND','KAP')=1.0000000;
R('LAND','INVES')=1.0000000;
R('LAND','HH1')=1.0000000;
R('LAND','HH2')=1.0000000;
R('LAND','HH3')=1.0000000;
R('LAND','HH4')=1.0000000;
R('LAND','HH5')=1.0000000;
R('LAND','USSOCL1')=1.0000000;
R('LAND','USSOCL2')=1.0000000;
R('LAND','USSOCL3')=1.0000000;
R('LAND','USSOCL4')=1.0000000;
R('LAND','USSOCL5')=1.0000000;
R('LAND','STPIT')=1.0000000;
R('LAND','LOCTAX')=1.0000000;
R('LAND','PROPTX')=1.0000000;
R('LAND','ACCTAX')=1.0000000;
R('LAND','CYGF')=1.0000000;
R('LAND','FED')=1.2142960;
R('LAND','ROW')=1.0000000;
R('KAP','CONST1')=0.1416602;
R('KAP','RETAIL1')=0.0911317;
R('KAP','SERV1')=0.0987179;
R('KAP','HC1')=0.1092899;
R('KAP','ACCOM1')=1.3481221;
R('KAP','REST1')=0.0962711;
R('KAP','AG2')=0.1501866;
R('KAP','CONST2')=0.0998057;
R('KAP','MANUF2')=0.1100150;
R('KAP','RETAIL2')=0.0999021;
R('KAP','SERV2')=0.0943907;
R('KAP','HC2')=0.1529728;
R('KAP','ACCOM2')=0.2537241;
R('KAP','REST2')=0.0649057;
R('KAP','AG3')=0.1960034;
R('KAP','UTIL')=0.3932387;
R('KAP','CONST3')=0.0954228;
R('KAP','RETAIL3')=0.2573242;
R('KAP','SERV3')=0.0885146;
R('KAP','HC3')=0.1204922;
R('KAP','HS1')=0.0414587;
R('KAP','HS2')=0.0001032;
R('KAP','HS3')=0.0001000;
R('KAP','L1')=1.0000000;
R('KAP','L2')=1.0000000;
R('KAP','L3')=1.0000000;
R('KAP','L4')=1.0000000;
R('KAP','L5')=1.0000000;
R('KAP','LAND')=1.0000000;
R('KAP','KAP')=1.0000000;
R('KAP','INVES')=1.0000000;
R('KAP','HH1')=1.0000000;
R('KAP','HH2')=1.0000000;
R('KAP','HH3')=1.0000000;
R('KAP','HH4')=1.0000000;
R('KAP','HH5')=1.0000000;
R('KAP','USSOCL1')=1.0000000;
R('KAP','USSOCL2')=1.0000000;
R('KAP','USSOCL3')=1.0000000;
R('KAP','USSOCL4')=1.0000000;
R('KAP','USSOCL5')=1.0000000;
R('KAP','STPIT')=1.0000000;
R('KAP','LOCTAX')=1.0000000;
R('KAP','PROPTX')=1.0000000;
R('KAP','ACCTAX')=1.0000000;
R('KAP','CYGF')=1.0000000;
R('KAP','FED')=1.2098305;
R('KAP','ROW')=1.0000000;
S('CONST1')=0.0000000;
S('RETAIL1')=0.0000000;
S('SERV1')=0.0000000;
S('HC1')=0.0000000;
S('ACCOM1')=0.0000000;
S('REST1')=0.0000000;
S('AG2')=0.0000000;
S('CONST2')=0.0000000;
S('MANUF2')=0.0000000;
S('RETAIL2')=0.0000000;
S('SERV2')=0.0000000;
S('HC2')=0.0000000;
S('ACCOM2')=0.0000000;
S('REST2')=0.0000000;
S('AG3')=0.0000000;
S('UTIL')=0.0000000;
S('CONST3')=0.0000000;
S('RETAIL3')=0.0000000;
S('SERV3')=0.0000000;
S('HC3')=0.0000000;
S('HS1')=0.0000000;
S('HS2')=0.0000000;
S('HS3')=0.0000000;
S('L1')=0.0000000;
S('L2')=0.0000000;
S('L3')=0.0000000;
S('L4')=0.0000000;
S('L5')=0.0000000;
S('LAND')=0.0000000;
S('KAP')=0.0000000;
S('INVES')=0.0000000;
S('HH1')=376.4750156;
S('HH2')=3482.5338869;
S('HH3')=14438.3496219;
S('HH4')=8311.6217698;
S('HH5')=29136.4268419;
S('USSOCL1')=-868.5319486;
S('USSOCL2')=-136.9259072;
S('USSOCL3')=627.7976850;
S('USSOCL4')=-400.0630142;
S('USSOCL5')=-34.1261773;
S('STPIT')=340.3295284;
S('LOCTAX')=-0.0000000;
S('PROPTX')=-0.0000000;
S('ACCTAX')=-0.0000000;
S('CYGF')=0.0000000;
S('FED')=0.0111596;
S('ROW')=0.0000000;
SPI=694939.1781377;
V('CONST1')=2330.3262781;
V('RETAIL1')=28732.7235716;
V('SERV1')=10222.1391049;
V('HC1')=100288.8299918;
V('ACCOM1')=37389.2273519;
V('REST1')=5110.9769147;
V('AG2')=7777.4618413;
V('CONST2')=3732.5155786;
V('MANUF2')=117938.7422856;
V('RETAIL2')=24458.2055478;
V('SERV2')=127935.8744026;
V('HC2')=981.8047502;
V('ACCOM2')=5415.9259282;
V('REST2')=1442.0565544;
V('AG3')=6857.5202096;
V('UTIL')=13506.6814845;
V('CONST3')=2329.8770568;
V('RETAIL3')=13421.3789931;
V('SERV3')=5700.7700728;
V('HC3')=42107.1053648;
V('HS1')=0.0000000;
V('HS2')=0.0000000;
V('HS3')=0.0000000;
Y('CONST1')=0.0000000;
Y('RETAIL1')=0.0000000;
Y('SERV1')=0.0000000;
Y('HC1')=0.0000000;
Y('ACCOM1')=0.0000000;
Y('REST1')=0.0000000;
Y('AG2')=0.0000000;
Y('CONST2')=0.0000000;
Y('MANUF2')=0.0000000;
Y('RETAIL2')=0.0000000;
Y('SERV2')=0.0000000;
Y('HC2')=0.0000000;
Y('ACCOM2')=0.0000000;
Y('REST2')=0.0000000;
Y('AG3')=0.0000000;
Y('UTIL')=0.0000000;
Y('CONST3')=0.0000000;
Y('RETAIL3')=0.0000000;
Y('SERV3')=0.0000000;
Y('HC3')=0.0000000;
Y('HS1')=0.0000000;
Y('HS2')=0.0000000;
Y('HS3')=0.0000000;
Y('L1')=8302.6093387;
Y('L2')=41408.9038459;
Y('L3')=83837.5212893;
Y('L4')=32321.6403147;
Y('L5')=50721.2612931;
Y('LAND')=293473.1664661;
Y('KAP')=518416.9113617;
Y('INVES')=0.0000000;
Y('HH1')=2758.2351510;
Y('HH2')=32643.5982046;
Y('HH3')=145977.2437849;
Y('HH4')=88712.6478160;
Y('HH5')=336845.4647706;
Y('USSOCL1')=1195.5757448;
Y('USSOCL2')=5962.8821537;
Y('USSOCL3')=12072.6030644;
Y('USSOCL4')=4654.3162052;
Y('USSOCL5')=7303.8616259;
Y('STPIT')=16488.6909223;
Y('LOCTAX')=1470.2871928;
Y('PROPTX')=3992.5355152;
Y('ACCTAX')=694.4370534;
Y('CYGF')=15938.5879430;
Y('FED')=15938.5879430;
Y('ROW')=0.0000000;
YD('HH1')=7908.9346270;
YD('HH2')=44644.1085617;
YD('HH3')=171142.6752285;
YD('HH4')=98931.8630602;
YD('HH5')=354319.6603634;





*===============================================================================
* EQUILIBRIUM EQUATIONS
*===============================================================================

CPIEQ(H) = CPI(H) - (SUM(I, P(I)  * ( 1 + SUM(GS, TAUC(GS,I) ) ) * CH(I,H) )
                                 / SUM(I, P0(I) * ( 1 + SUM(GS, TAUQ(GS,I) ) ) * CH(I,H) ));

YEQ(H) = Y(H)  - ( SUM(L,  A(H,L) * HW(H) / SUM(H1, A(H1,L) * HW(H1) )
                                 * Y(L) * ( 1 - SUM(G, TAUFL(G,L))))
                                 + SUM(LA,  A(H,LA) * HW(H) / SUM(H1, A(H1,LA) * HW(H1)) * (Y(LA)+ LNFOR(LA))*( 1 - SUM(G, TAUFLA(G,LA) ) ) )
                                 + SUM(K,  A(H,K) * HW(H) / SUM(H1, A(H1,K) * HW(H1)) * (Y(K) + KPFOR(K)) * ( 1 - SUM(G, TAUFK(G,K) ) ) ));


YDEQ(H) =  YD(H)  - (  Y(H) + (PRIVRET(H) * HH(H))
                                         + SUM(G, TP(H,G) * HH(H))
                                         - SUM(GI, PIT(GI,H)  * Y(H))
                                         - SUM(G, TAUH(G,H)  * HH(H)));

CHEQ(I,H) =  CH(I,H) - ( CH0(I,H)
                                 * ((YD(H) / YD0(H)) / ( CPI(H) / CPI0(H)))**(BETA(I,H))
                                 * PROD(J, ((P(J)*( 1 + SUM(GS, TAUC(GS,J))))
                                 / (P0(J)*(1 + SUM(GS, TAUQ(GS,J)))))** (LAMBDA(J,I))));


SHEQ(H) = S(H) - ( YD(H) - SUM(I, P(I) * CH(I,H) * ( 1 + SUM(GS, TAUC(GS,I)))));

PVAEQ(I) =  PVA(I) - ( PD(I) - SUM(J, AD(J,I) * P(J) * (1 + SUM(GS, TAUQ(GS, J)))));

*PFEQ(I)..DS(I)           =E= GAMMA(I)*(SUM(F, ALPHA(F,I)*(FD(F,I))**(RHO(I)))**(1/RHO(I)));

*FDEQ(F,I).. R(F,I) * RA(F)*(1 + SUM(GF,TAUFX(GF,F,I)))* (FD(F,I))**(1-RHO(I))
*                         =E= PVA(I) * ALPHA(F,I)*(GAMMA(I)**RHO(I))*(DS(I)**(1-RHO(I)));

*FDEQ(F,I).. R(F,I) * RA(F) * (1 + SUM(GF,TAUFX(GF,F,I) ) )* (TT(F,I)* FD(F,I))
*                         =E= PVA(I) * DS(I) * ALPHA(F,I);
*CD
PFEQ(I) = DS(I)- ( DELTA(I)*PROD(F$ALPHA(F,I),(TT(F,I)*FD(F,I))**ALPHA(F,I)));

   FDEQ(F,I) =  R(F,I) * RA(F) * ( 1 + SUM(GF,TAUFX(GF,F,I) ) )*  FD(F,I)
           - PVA(I) * DS(I) * ALPHA(F,I);


VEQ(I) = V(I)        - SUM(J, AD(I,J) * DS(J) );

YFEQL(L) = Y(L)       - SUM(IG, R(L,IG)* TT(L,IG)* RA(L)*FD(L,IG));

YFEQK(K) = Y('KAP')      - SUM(IG, R('KAP',IG) * RA('KAP') * TT('KAP',IG) * FD('KAP',IG));

YFEQLA(LA)= Y('LAND')   - SUM(IG, R('LAND',IG) * RA('LAND') * FD('LAND',IG));

LANFOR(LA)= LNFOR(LA)   - LFOR(LA) * Y(LA);

KAPFOR(K)= KPFOR(K)     - KFOR(K) * Y(K);

*XEQ(I)= CX(I)           =E= CX0(I)*((PD(I))/(PWM0(I)))**(ETAE(I));

XEQ(I)= CX(I) - CX0(I)*( (PD(I)*(1+SUM(GS,TAUX(GS,I))))
                  /(PW0(I)*(1+SUM(GS,TAUQ(GS,I))))) **(ETAE(I));

DEQ(I)$PWM0(I)= D(I)    - D0(I) *(PD(I)/PWM0(I))**(ETAD(I));

PEQ(I)=  P(I)           - (D(I) * PD(I) + ( 1 - D(I) ) * PWM0(I));

MEQ(I)= M(I)            - ( 1 - D(I) ) * DD(I);

NKIEQ= NKI              - (SUM(I, M(I) * PWM0(I) )
                                 - SUM(I, CX(I) * PD(I) )
                                 - SUM(H, PRIVRET(H)*HH(H))
                                 - SUM(LA, LNFOR(LA))
                                 - SUM(K, KPFOR(K))
                                 - SUM(G, GVFOR(G)));

NEQ(K,I)= N(K,I)        - N0(K,I)*(R(K,I)/R0(K,I))**(ETAIX(K,I)*1);

CNEQ(I)= P(I)*(1 + SUM(GS, TAUN(GS,I)))*CN(I)
                         - SUM(IG, B(I,IG)*(SUM(K, N(K,IG))));

KSEQ(K,IG)= KS(K,IG)    - (KS0(K,IG) * ( 1 - DEPR) + N(K,IG)) ;

*LSEQ1(H)= HW(H)/HH(H)   =E= HW0(H)/HH0(H)*((SUM(L, RA(L) / RA0(L))/5)/ (CPI(H) / CPI0(H))
*                                 * (SUM((Z,L), FD(L,Z))/ (SUM(H1, HW(H1)* SUM(L, JOBCOR(H1,L)))))
*                                 * (SUM(G, TP(H,G)/ CPI(H)) / SUM(G, TP(H,G) / CPI0(H) ))**(ETAPT(H))
*                                 * ((SUM(GI, PIT0(GI,H)* HH0(H))+ SUM(G, TAUH0(G,H)*HH0(H)))
*                                 / (SUM(GI, PIT(GI,H)* HH(H))+ SUM(G, TAUH(G,H)*HH(H))))**(ETAPIT(H));


LSEQ1(H)= HW(H)/HH(H) - ( HW0(H)/HH0(H)   * ((SUM(L, RA(L) / RA0(L))/5)/ (CPI(H) / CPI0(H)))** (ETARA(H))
                  * ( SUM(G, TP(H,G) / CPI(H) )
                  / SUM(G, TP(H,G) / CPI0(H) )) ** ETAPT(H)
                  *  ((SUM(GI, PIT0(GI,H)* HH(H))+ SUM(G, TAUH0(G,H)*HH(H)))
                  /(SUM(GI, PIT(GI,H)* HH(H))+ SUM(G, TAUH(G,H)*HH(H))))**(ETAPIT(H)*1)) ;

LASEQ1(LA,I)= LAS(LA,I) - LAS0(LA,I)*(R(LA, I)/R0(LA, I))**(ETAL(LA,I));

POPEQ(H)= HH(H)         - ( HH0(H) * NRPG(H)
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
                                         /(HN(H)/HH(H))) ** (ETAUO(H)));
*$offtext

ANEQ(H)= HN(H)          - ( HH(H) - HW(H));

YGEQ(GX)= Y(GX)         -(   SUM(I, TAUV(GX,I) * V(I) * P(I) )
                                 + SUM(I, TAUX(GX,I)* CX(I) *PD(I))
                                 + SUM((H,I), TAUC(GX,I) * CH(I,H) * P(I) )
                                 + SUM(I, TAUN(GX,I) * CN(I) * P(I) )
                                 + SUM((GN,I), TAUG(GX,I) * CG(I,GN) * P(I) )
                                 + SUM((F,I), TAUFX(GX,F,I) * RA(F) * R(F,I) * TT(F,I)*FD(F,I) )
                                 + SUM((F,GN), TAUFX(GX,F,GN) * RA(F) * R(F,GN) * FD(F,GN) )
                                 + SUM(F, TAUFH(GX,F) * (Y(F)))
                                 + SUM(H, PIT(GX,H) * Y(H) )
                                 + SUM(H, TAUH(GX,H) * HH(H) )
                                 + SUM(GX1, IGT(GX,GX1)));

*YGEQ2(GT)= Y(GT)        =E= SUM(GX, IGT(GT,GX));
YGEQ2(cf)= Y(cf)        -  SUM(GX, IGT(cf,GX));

YGEQ1(GNL)= Y(GNL)      - TAXS1(GNL)*Y('CYGF');




GOVFOR(G)= GVFOR(G)     - GFOR(G)*Y(G);

CGEQ(I,GN)= P(I)*(1 + SUM(GS, TAUG(GS,I))) * CG(I,GN)
                         - AG(I,GN) * (Y(GN)+ GFOR(GN)*Y(GN));

GFEQ(F,GN)=  FD(F,GN) * R(F,GN) * RA(F)*( 1 + SUM(GF, TAUFX(GF,F,GN)))
                         - AG(F,GN) * (Y(GN)+ GFOR(GN)*Y(GN));


GSEQL(GN)= S(GN)        - ((Y(GN)+ GVFOR(GN))
                                 - SUM(I, CG(I,GN)*P(I)*(1 + SUM(GS, TAUG(GS,I))))
                                 - SUM(F, FD(F,GN)*R(F,GN)*RA(F)*(1 + SUM(GF, TAUFX(GF,F,GN)))));

GSEQ(GX)= S(GX)         - ((Y(GX) + GFOR(GX)*Y(GX)) - SUM(H, (TP(H,GX)*HH(H))) - SUM(G,IGT(G,GX)));

*TDEQ(G,GX)$(IGTD(G,GX) EQ 1)= IGT(G,GX)=E= TAXS(G,GX)*(Y(GX) + GVFOR(GX)- SUM(H, (TP(H,GX)*HH(H))));
GSEQJ1('CYGF')= S('CYGF')- ( Y('CYGF') -  Y('CYGF'));
TDEQ(G,GX)$(IGTD(G,GX) EQ 1)= IGT(G,GX) - ( TAXS(G,GX) * ( Y(GX) + GVFOR(GX)- SUM(H, (TP(H,GX) * HH(H)) )));

SPIEQ= SPI              - ( SUM(H, Y(H)) + SUM((H,G), TP(H,G)*HH(H)) + SUM(H, PRIVRET(H)*HH(H)));

LMEQ1(L)= SUM(H, HW(H)* JOBCOR(H, L)) - SUM(Z, FD(L ,Z) ) ;

KMEQ(K,IG)= KS(K,IG)    - FD(K,IG);

LAMEQ(LA,IG)= LAS(LA,IG) - FD(LA,IG);

GMEQ(I)= DS(I)          - ( DD(I) + CX(I) - M(I) );

DDEQ(I)= DD(I)          - ( V(I) + SUM(H, CH(I,H) ) + SUM(G, CG(I,G) ) + CN(I));

DISPLAY
CPIEQ
YEQ
YDEQ
CHEQ
SHEQ
PVAEQ
FDEQ
VEQ
YFEQL
YFEQK
YFEQLA
LANFOR
KAPFOR
GOVFOR
XEQ
DEQ
MEQ
PEQ
NKIEQ
NEQ
CNEQ
KSEQ
LSEQ1
LASEQ1
POPEQ
ANEQ
YGEQ
CGEQ
GFEQ
GSEQL
GSEQ
TDEQ
YGEQ1
YGEQ2
SPIEQ
LMEQ1
KMEQ
LAMEQ
GMEQ
DDEQ
GSEQJ1