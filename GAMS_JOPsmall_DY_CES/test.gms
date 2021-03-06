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

*penalty parameter       = 200
major damping parameter = 0.01
minor damping parameter = 0.01
*scale all variables
$offecho

*===============================================================================
* SETS FOR SIMULATIONS
*===============================================================================
SETS
t        TIME PERIODS
*/ 1*50 /
/ 1*10 /

SM       SIMMLOOP
*/ BASE, TODAY /
/ BASE, TODAY/

*===============================================================================
* SET DECLARATION
*===============================================================================
SETS

Z  ALL ACCOUNTS IN SOCIAL ACCOUNTING MATRIX
/
GOODS
TRADE
OTHER
L1
L2
L3
KAP
LAND
HS1
HS2
HS3
HH1
HH2
HH3
HH4
HH5
INVES
USSOC1
USSOC2
USSOC3
PTAXJop
STAXJop
OTXJop
MISSTAX
MISITAX
USPIT
CYGF
FED
STATE
CITY
OUTNEW1
OUTNEW2
OUTNEW3
OUTJAS1
OUTJAS2
OUTJAS3
OUTOTH1
OUTOTH2
OUTOTH3
ROW
/

F(Z)     FACTORS
/
L1, L2, L3, LAND, KAP
/

CM(Z)    COMMUTERS OUT
/
OUTNEW1, OUTNEW2, OUTNEW3, OUTJAS1, OUTJAS2, OUTJAS3, OUTOTH1, OUTOTH2, OUTOTH3
/

CM1(CM)  COMMUTERS OUT 1
/
OUTNEW1, OUTJAS1, OUTOTH1
/

CM2(CM)  COMMUTERS OUT 2
/
OUTNEW2, OUTJAS2, OUTOTH2
/

CM3(CM)  COMMUTERS OUT 3
/
OUTNEW3, OUTJAS3, OUTOTH3
/

LT(Z)    All workers who live in J
/
L1, L2, L3,
OUTNEW1, OUTNEW2, OUTNEW3,
OUTJAS1, OUTJAS2, OUTJAS3,
OUTOTH1, OUTOTH2, OUTOTH3
/


L(F)     LABOR
/
L1, L2, L3
/

L1(L)
/ L1 /

L2(L)
/ L2 /

L3(L)
/L3 /

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
USSOC1, USSOC2, USSOC3,
PTAXJop, STAXJop, OTXJop,
MISSTAX, MISITAX, USPIT, CYGF,
FED, STATE, CITY
/

GN(G)    ENDOGENOUS GOVERNMENTS
/
FED, STATE, CITY
/

GNL(G)   LOCAL  ENDOGENOUS GOVERNMENTS
/
CITY
/

GX(G)    EXOGENOUS GOVERMENTS
/
USSOC1, USSOC2, USSOC3,
PTAXJop, STAXJop, OTXJop,
MISSTAX, MISITAX, USPIT
/

GS(G)    SALES OR EXCISE TAXES
/
STAXJop, OTXJop, MISSTAX
/

GL(G)    LAND TAXES
/
PTAXJop
/

GF(G)    FACTOR TAXES
/
USSOC1, USSOC2, USSOC3,
PTAXJop
/

GFUS(G)  SS PAYMENT
/
USSOC1, USSOC2, USSOC3
/

GFUSC(G) SS PAYMENT
/
USSOC1, USSOC2, USSOC3
/

GI(G)    INCOME TAX UNITS
/
MISITAX, USPIT
/

GH(G)    HOUSEHOLD TAX UNITS
/
PTAXJop, OTXJop
/

GY(G)    EXOGNOUS TRANSFER PMT
/
USSOC1, USSOC2, USSOC3,
PTAXJop, STAXJop, OTXJop,
MISSTAX, MISITAX,
USPIT,
FED, STATE
/

GT(G)    ENDOGENOUS TRANSFER PMT
/
CYGF, FED, STATE
/

H(Z)     HOUSEHOLDS
/
HH1, HH2, HH3, HH4, HH5
/

IG(Z)    I+G SECTORS
/
GOODS, TRADE, OTHER,
HS1, HS2, HS3,
FED, STATE, CITY
/

I(IG)    INDUSTRY SECTORS
/
GOODS, TRADE, OTHER,
HS1, HS2, HS3
/


IG2(IG)  ENDOGENOUS GOVERNMENTS
/
FED, STATE, CITY
/


IP(I)    PRODUCTION SECTORS
/
GOODS, TRADE, OTHER
/

FG(IG)   PRODUCTION GOV.
/
GOODS, TRADE, OTHER
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
GN, NKI, HH, W, W1, W2, W3, R,RL, L , K, HN, HW, GFSAV, LD,
CMO, CMI, HC, SSC, LAND, LAS
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
* SETS FOR MISC

 TABLES ONLY

HSSET(I)         HOUSING SERVICES
/
HS1, HS2, HS3
/

HS23SET(I)       HOUSING SERVICES 2 & 3
/
HS2, HS3
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
(HD, HD1), (IP,JP), (IG,JG),(GY,GY1), (GT,GT1), (GY, GY2),
(GNL, GNL1)
;

*===============================================================================

TABLE EMPLOY0(Z,F) FACTOR DEMAND

                                    L1      L2      L3     Land          KAP
GOODS                              449     3282    3013  21903.17        614.9
TRADE                              2729    4360    1851  9185.686        238.4
OTHER                              6306   12396    5444  9900.878        480.5
HS1                                 0       0       0      56.04         484.5746235
HS2                                 0       0       0      32.06         289.9727085
HS3                                 0       0       0      59.48         555.3674719
FED                                 6       39      28      0            0
STATE                               15      98      70      0            0
CITY                                61     402     286      0            0 ;

TABLE EMPLOY(Z,F) FACTOR DEMAND

                                    L1      L2      L3     Land     KAP
GOODS                              449     3282    3013    980.8    508.997
TRADE                              2729    4360    1851    561.2    175.377
OTHER                              6306   12396    5444    1262.1   461.809
HS1                                 0       0       0      810.4    1793.086
HS2                                 0       0       0      2362.3   2127.482
HS3                                 0       0       0      51.5     189.265
FED                                 6       39      28      0        0
STATE                               15      98      70      0        0
CITY                                61     402     286      0        0     ;

TABLE HHTABLE(H,*) MISC.  HH DATA

                  HH0     HW0     HHOUT0    HHN0      HHJOP0
HH1               3611    1238     724      2373      514
HH2               5997    4245     1649     1752      2596
HH3               7544    6965     2863     579       4102
HH4               2394    2363     996      31        1367
HH5               793     753      276      40        477;

TABLE JOBCR(H,L)

                L1               L2                 L3
HH1        1.134087237            0                  0
HH2        0.403062426        0.853710247            0
HH3        0.367408471        0.830581479        0.317444365
HH4        0.3842573          1.089293271        1.365636902
HH5        0.268260292        1.075697211        0.879150066 ;

TABLE JOBCR1(H, L)
            L1                L2                 L3
HH1        1.13424125        0.00000000        0.00000000
HH2        0.42758089        0.82935285        0.00000000
HH3        0.39663579        0.82788883        0.29083374
HH4        0.43745428        1.15215801        1.24945135
HH5        0.30188679        1.14255765        0.77987421;

TABLE OUTCR(H, CM)

               OUTNEW1           OUTNEW2            OUTNEW3            OUTJAS1           OUTJAS2            OUTJAS3            OUTOTH1           OUTOTH2              OUTOTH3
HH1        0.065428110        0.000000000        0.000000000        0.112277868        0.000000000        0.000000000        0.485460420        0.000000000        0.000000000
HH2        0.033215548        0.072084806        0.000000000        0.053945819        0.141107185        0.000000000        0.054416961        0.133333333        0.000000000
HH3        0.030294329        0.065039483        0.024982053        0.044651831        0.126920316        0.056855707        0.058865757        0.151040919        0.064321608
HH4        0.031316124        0.088446890        0.156580618        0.047820567        0.166314008        0.231062209        0.052052476        0.168006771        0.255184088
HH5        0.018592297        0.086321381        0.106241700        0.035856574        0.163346614        0.167330677        0.022576361        0.102257636        0.111553785  ;





*===============================================================================
* ADDITIONAL RUN FILES
*===============================================================================

TABLE SAM(Z,Z1) SOCIAL ACCOUNTING MATRIX
$ONDELIM
*$INCLUDE C:\Dropbox\CGE_Modeling\Models\GAMS_Models\Joplin\JOP_SMALL\Run_Files\samJOP5HCT_Y1S.CSV
*$INCLUDE   C:\Users\hcutler\Dropbox\joplin 1\samjop5HCTF2.CSV
$Include C:\Users\Zhisheng\Desktop\JOPsmall_DY_CES\samjopT.CSV
$OFFDELIM

TABLE BB(I,IG) CAPITAL COMP
$ONDELIM
*$INCLUDE C:\Dropbox\CGE_Modeling\Models\GAMS_Models\Joplin\JOP_SMALL\Run_Files\CAPCOMjop.CSV
$INCLUDE C:\Users\Zhisheng\Desktop\JOPsmall_DY_CES\CAPCOMjop.CSV
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
CMOWAGE(CM)
CMIWAGE(L)
FCONST(F,I)
GAMMA(I)                 PRODUCTION FUNCTION SCALE
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
EXWGEO(CM)               EXTERNAL WAGE commuting out
EXWGEI(L)                EXTERNAL WAGE commuting in
ECOMI(L)                 ELASTICITY OF LABOR SUPPLY FOR IN COMMUTTERS
ECOMO(CM)                ELASTICITY OF LABOR SUPPLY FOR OUT COMMUTTERS
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
CMI0(L)                  REAL    NUMBER COMMUTING IN
CMO0(CM)                 REAL    NUMBER COMMUTING OUT
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

tmp1(F,I)
tmp2(H)

CG(I,G)   PUBLIC CONSUMPTION
CH(I,H)   PRIVATE CONSUMPTION
CMI(L)    COMMUTING IN
CMO(CM)   COMMUTING OUT JASPER
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
DCMI(L)
DCMO(CM)
DV(I)
DW(F,I)

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
LSEQ2a(CM1)      COMMUTING INSUPPLY 1
LSEQ2b(CM2)      COMMUTING INSUPPLY 2
LSEQ2c(CM3)      COMMUTING INSUPPLY 3
LSEQ3a           COMMUTING  OUTSUPPLY 1
LSEQ3b           COMMUTING  OUTSUPPLY 2
LSEQ3c           COMMUTING  OUTSUPPLY 3
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
YGEQ2 (GT)
SPIEQ            STATE PERSONAL INCOME - OBJECTIVE FUNCTION
LMEQ1            LABOR MARKET CLOSURE 1
LMEQ2            LABOR MARKET CLOSURE 2
LMEQ3            LABOR MARKET CLOSURE 3
KMEQ(K,IG)       CAPITAL MARKET CLEARING
LAMEQ(LA,IG)     LAND MARKET CLEARING
GMEQ(I)          GOODS MARKET CLEARING
DDEQ(I)          DEFINITION OF DOMESTIC DEMAND

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
;


*===============================================================================
* SIMPLIFYING TABLES AND DOING AWAY WITH MISC FILES
*===============================================================================

out(G1,G1)                       = 0;
OUT('CITY', 'CYGF')              = 1;

IGTD(G,G1)                       = 0;
IGTD('FED', GFUS)                = 1;
IGTD('FED', 'USPIT')             = 1;

IGTD('CYGF', 'PTAXJop')          = 1;
IGTD('CYGF', 'STAXJOP')          = 1;
IGTD('CYGF', 'OTXJOP')           = 1;

IGTD('STATE', 'MISSTAX')         = 1;
IGTD('STATE', 'MISITAX')         = 1;

TPC(H,G)                        = 0;
TPC(H,GFUS)                      = 1;

TAUFF(G,F)                       = 0;
TAUFF('USSOC1', 'L1')            = 1;
TAUFF('USSOC2', 'L2')            = 1;
TAUFF('USSOC3', 'L3')            = 1;
TAUFF('PTAXJOP', 'KAP')          = 1;

IOUT(G1, G1)                     = 0;
IOUT('CITY', 'CYGF')             = 1;

LANDCAP(IG, ETALANDCAP)          = 1;
LANDCAP('GOODS', 'ETAL1')        = 0.5;
LANDCAP('OTHER', 'ETAL1')        = 1.4;
LANDCAP(HS23SET, 'ETAL1')        = 2;
LANDCAP('TRADE', 'ETAI1')        = 2;
LANDCAP('OTHER', 'ETAI1')        = 2;


MISCH(H, ETAMISCH)               = 0;
MISCH(HH2, 'ETAPIT')             = -0.15;
MISCH(HH3, 'ETAPIT')             = -0.2;
MISCH(HH4, 'ETAPIT')             = -0.25;
MISCH(HH5, 'ETAPIT')             = -0.35;

MISCH(HH1, 'ETAPT')              = -0.5;

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

ECOMI(L)         = 1;
ECOMO(CM)        = 1;

* EXPERIMENTAL ELASTICITIES
*ECOMI(L)         = 0.75;
*ECOMO(CM)        = 1.5;


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

SIGMA(I)         = 0.4;


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

CMO0(CM)         = SUM(H, OUTCR(H, CM)*HW0(H));

SCALAR IN1, IN2, IN3;

IN1     = SUM(IG, FD0('L1', IG)) - SUM(H,JOBCOR(H,'L1')*HW0(H)) + SUM(CM1, CMO0(CM1));
IN2     = SUM(IG, FD0('L2', IG)) - SUM(H,JOBCOR(H,'L2')*HW0(H)) + SUM(CM2, CMO0(CM2));
IN3     = SUM(IG, FD0('L3', IG)) - SUM(H,JOBCOR(H,'L3')*HW0(H)) + SUM(CM3, CMO0(CM3));

CMI0('L1')       = IN1;
CMI0('L2')       = IN2;
CMI0('L3')       = IN3;

ECOMI(L)         = 1;
ECOMO(CM)        = 1;

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

IGT0(G,GX)       = SAM(G,GX);

PWM0(I)          = 1;
PW0(I)           = 1;
P0(I)            = 1;
PH0(HD)          = 1;
PD0(I)           = 1;
CPI0(H)          = 1;
CPIN0(H)         = 1;
CPIH0(H)         = 1;
TT(F,IG)         = 1;
EXWGEO(CM)       = 1;
EXWGEI(L)        = 1;
R0(F, Z)         = 1;
RA0(f)           = 1;

R0(F,IG)$EMPLOY(IG,F)    = SAM(F ,IG) / (EMPLOY(IG,F)) ;

CMOWAGE(CM)$CMO0(CM)     = SAM(CM, 'ROW')/CMO0(CM);
CMIWAGE(L)               =(-1)*(SAM(L,'ROW')/CMI0(L));


TP(H,G)          = 0;
TP(H,G)$(HH0(H)) = SAM(H,G) / ( HH0(H) );

KS0(K,IG)        = FD0(K,IG);
KSNEW0(K,IG)     = KS0(K,IG);
LAS0(LA,IG)      = FD0(LA ,IG);

DEPR             = SUM(IG, SAM(IG,'INVES') ) / (SUM((K,IG), KS0(K,IG)));

A(Z,Z1)          = SAM(Z,Z1) / Q0(Z1);

AGFS('L1',G)     = SAM('L1',G)+SAM('USSOC1',G);
AGFS('L2',G)     = SAM('L2',G)+SAM('USSOC2',G);
AGFS('L3',G)     = SAM('L3',G)+SAM('USSOC3',G);

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


RHO(I)           = (SIGMA(I) - 1)/SIGMA(I);

ALPHA1(F,I)      = 0;
ALPHA1(F,I)      = R0(F,I) * RA0(F)*(1 + SUM(GF,TAUFX(GF,F,I)))
                 *(FD0(F,I)**(1-RHO(I)));

ALPHA(F,I)$FD0(F,I) = ALPHA1(F,I)/(SUM(F1, R0(F1,I) * RA0(F1)
                 *(1 + SUM(GF,TAUFX(GF,F1,I)))*((FD0(F1,I))**(1-RHO(I)))));

GAMMA(I)         = DS0(I)/(SUM(F, ALPHA(F,I)*(FD0(F,I)**(RHO(I))))**(1/RHO(I)));

PRIVRET(H)       = SUM(Z,SAM(Z,H))
                         - (SUM(F, SAM(H,F))
                         + SUM(CM,SAM(H,CM))
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

A(H, CM)         = SAM(H, CM)/SUM(Z, SAM(Z, CM));

NKI0     = SUM(I, M0(I) * PWM0(I) ) - SUM(I, CX0(I) * PD0(I) )
                 - SUM(H, PRIVRET(H)*HH0(H)) - SUM(LA, LNFOR0(LA))
                 - SUM(K, KPFOR0(K)) - SUM(G, GVFOR0(G))
                 - SUM(CM,CMOWAGE(CM)*CMO0(CM))
                 + SUM(L,CMIWAGE(L)*CMI0(L));

Y0(H)    = SUM(L,  A(H,L) * HW0(H) / SUM(H1, A(H1,L) * HW0(H1) )
                 * (Y0(L) - (CMIWAGE(L)*CMI0(L))) * ( 1 - SUM(G, TAUFL(G,L))))
                 + SUM(CM, A(H,CM)*CMOWAGE(CM)*CMO0(CM))
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


*tmp1(F,I) = PVA0(I) * ALPHA(F,I)*(GAMMA(I)**RHO(I))*(DS0(I)**(1-RHO(I)));
*tmp1(F,I) = PVA0(I) * ALPHA(F,I);


*===============================================================================

OPTION DECIMALS = 8;
DISPLAY
Q0, Q10, DQ0, ECOMI, ECOMO, EXWGEI, EXWGEO,

BETA, BETAH, LAMBDA, LAMBDAH, ETAE, ETAM, ETAPIT, ETAPT, NRPG,

ETAI, ETAIX, ETALB, ETAD, DEPR, ALPHA,

TAUQ, TAUC, TAUV, TAUN, TAUG, TAUX, TAUF, TAUFX, TAUH,

TAUFH, TAUFF, TAUFL, TAUFK, TAXS, TAXS1,

HH0, HW0, HN0, CMI0, CMO0, JOBCOR, FD0, KS0, DS0,

AGFS, IGT0, M0, V0, V0T, CH0, CH0T, CG0, CN0, CX0,

KPFOR0, GVFOR0, KFOR, GFOR, PRIVRET, YD0, Y0, S0, CMOWAGE, CMIWAGE, PIT, PIT0,

SPI0, R0, RA0, TP, A, AD, RHO, TAUF
;
CG('GOODS','USSOC1')=0.0000000;
CG('GOODS','USSOC2')=0.0000000;
CG('GOODS','USSOC3')=0.0000000;
CG('GOODS','PTAXJop')=0.0000000;
CG('GOODS','STAXJop')=0.0000000;
CG('GOODS','OTXJop')=0.0000000;
CG('GOODS','MISSTAX')=0.0000000;
CG('GOODS','MISITAX')=0.0000000;
CG('GOODS','USPIT')=0.0000000;
CG('GOODS','CYGF')=0.0000000;
CG('GOODS','FED')=0.5435621;
CG('GOODS','STATE')=0.4502691;
CG('GOODS','CITY')=1.5102878;
CG('TRADE','USSOC1')=0.0000000;
CG('TRADE','USSOC2')=0.0000000;
CG('TRADE','USSOC3')=0.0000000;
CG('TRADE','PTAXJop')=0.0000000;
CG('TRADE','STAXJop')=0.0000000;
CG('TRADE','OTXJop')=0.0000000;
CG('TRADE','MISSTAX')=0.0000000;
CG('TRADE','MISITAX')=0.0000000;
CG('TRADE','USPIT')=0.0000000;
CG('TRADE','CYGF')=0.0000000;
CG('TRADE','FED')=0.0577393;
CG('TRADE','STATE')=0.1566187;
CG('TRADE','CITY')=0.2509790;
CG('OTHER','USSOC1')=0.0000000;
CG('OTHER','USSOC2')=0.0000000;
CG('OTHER','USSOC3')=0.0000000;
CG('OTHER','PTAXJop')=0.0000000;
CG('OTHER','STAXJop')=0.0000000;
CG('OTHER','OTXJop')=0.0000000;
CG('OTHER','MISSTAX')=0.0000000;
CG('OTHER','MISITAX')=0.0000000;
CG('OTHER','USPIT')=0.0000000;
CG('OTHER','CYGF')=0.0000000;
CG('OTHER','FED')=0.1410933;
CG('OTHER','STATE')=0.7796330;
CG('OTHER','CITY')=4.5522600;
CG('HS1','USSOC1')=0.0000000;
CG('HS1','USSOC2')=0.0000000;
CG('HS1','USSOC3')=0.0000000;
CG('HS1','PTAXJop')=0.0000000;
CG('HS1','STAXJop')=0.0000000;
CG('HS1','OTXJop')=0.0000000;
CG('HS1','MISSTAX')=0.0000000;
CG('HS1','MISITAX')=0.0000000;
CG('HS1','USPIT')=0.0000000;
CG('HS1','CYGF')=0.0000000;
CG('HS1','FED')=0.0000000;
CG('HS1','STATE')=0.0000000;
CG('HS1','CITY')=0.0000000;
CG('HS2','USSOC1')=0.0000000;
CG('HS2','USSOC2')=0.0000000;
CG('HS2','USSOC3')=0.0000000;
CG('HS2','PTAXJop')=0.0000000;
CG('HS2','STAXJop')=0.0000000;
CG('HS2','OTXJop')=0.0000000;
CG('HS2','MISSTAX')=0.0000000;
CG('HS2','MISITAX')=0.0000000;
CG('HS2','USPIT')=0.0000000;
CG('HS2','CYGF')=0.0000000;
CG('HS2','FED')=0.0000000;
CG('HS2','STATE')=0.0000000;
CG('HS2','CITY')=0.0000000;
CG('HS3','USSOC1')=0.0000000;
CG('HS3','USSOC2')=0.0000000;
CG('HS3','USSOC3')=0.0000000;
CG('HS3','PTAXJop')=0.0000000;
CG('HS3','STAXJop')=0.0000000;
CG('HS3','OTXJop')=0.0000000;
CG('HS3','MISSTAX')=0.0000000;
CG('HS3','MISITAX')=0.0000000;
CG('HS3','USPIT')=0.0000000;
CG('HS3','CYGF')=0.0000000;
CG('HS3','FED')=0.0000000;
CG('HS3','STATE')=0.0000000;
CG('HS3','CITY')=0.0000000;
CH('GOODS','HH1')=1.3883481;
CH('GOODS','HH2')=4.5377363;
CH('GOODS','HH3')=7.8122747;
CH('GOODS','HH4')=6.8109021;
CH('GOODS','HH5')=4.2324075;
CH('TRADE','HH1')=31.2012445;
CH('TRADE','HH2')=82.3993067;
CH('TRADE','HH3')=140.2829932;
CH('TRADE','HH4')=117.8830237;
CH('TRADE','HH5')=70.6879283;
CH('OTHER','HH1')=20.0835126;
CH('OTHER','HH2')=55.8564676;
CH('OTHER','HH3')=119.2515712;
CH('OTHER','HH4')=131.3953556;
CH('OTHER','HH5')=78.7905263;
CH('HS1','HH1')=19.3843764;
CH('HS1','HH2')=58.5990140;
CH('HS1','HH3')=151.6146518;
CH('HS1','HH4')=0.0000000;
CH('HS1','HH5')=0.0000000;
CH('HS2','HH1')=0.0000000;
CH('HS2','HH2')=0.0000000;
CH('HS2','HH3')=0.0000000;
CH('HS2','HH4')=166.4925021;
CH('HS2','HH5')=100.1837650;
CH('HS3','HH1')=4.1441411;
CH('HS3','HH2')=7.1027653;
CH('HS3','HH3')=8.3149867;
CH('HS3','HH4')=1.5328980;
CH('HS3','HH5')=0.9223928;
CN('GOODS')=192.1018116;
CN('TRADE')=175.3518532;
CN('OTHER')=141.6040134;
CN('HS1')=0.0000000;
CN('HS2')=0.0000000;
CN('HS3')=0.0000000;
CPI('HH1')=0.9990273;
CPI('HH2')=0.9989894;
CPI('HH3')=0.9988213;
CPI('HH4')=0.9993626;
CPI('HH5')=0.9993622;
CX('GOODS')=446.6214647;
CX('TRADE')=154.7127467;
CX('OTHER')=588.3806907;
CX('HS1')=0.0000000;
CX('HS2')=0.0000000;
CX('HS3')=0.0000000;
D('GOODS')=0.3829038;
D('TRADE')=0.4745442;
D('OTHER')=0.6958682;
D('HS1')=1.0000000;
D('HS2')=1.0000000;
D('HS3')=1.0000000;
DD('GOODS')=617.3061282;
DD('TRADE')=680.7613041;
DD('OTHER')=1110.6142365;
DD('HS1')=229.5980423;
DD('HS2')=266.6762670;
DD('HS3')=22.0171838;
DS('GOODS')=682.9903211;
DS('TRADE')=477.7640862;
DS('OTHER')=1361.2218363;
DS('HS1')=229.5980423;
DS('HS2')=266.6762670;
DS('HS3')=22.0171838;
FD('L1','GOODS')=449.2991168;
FD('L1','TRADE')=2729.1763678;
FD('L1','OTHER')=6308.0432747;
FD('L1','L1')=0.0000000;
FD('L1','L2')=0.0000000;
FD('L1','L3')=0.0000000;
FD('L1','KAP')=0.0000000;
FD('L1','LAND')=0.0000000;
FD('L1','HS1')=0.0000000;
FD('L1','HS2')=0.0000000;
FD('L1','HS3')=0.0000000;
FD('L1','HH1')=0.0000000;
FD('L1','HH2')=0.0000000;
FD('L1','HH3')=0.0000000;
FD('L1','HH4')=0.0000000;
FD('L1','HH5')=0.0000000;
FD('L1','INVES')=0.0000000;
FD('L1','USSOC1')=0.0000000;
FD('L1','USSOC2')=0.0000000;
FD('L1','USSOC3')=0.0000000;
FD('L1','PTAXJop')=0.0000000;
FD('L1','STAXJop')=0.0000000;
FD('L1','OTXJop')=0.0000000;
FD('L1','MISSTAX')=0.0000000;
FD('L1','MISITAX')=0.0000000;
FD('L1','USPIT')=0.0000000;
FD('L1','CYGF')=0.0000000;
FD('L1','FED')=5.9822269;
FD('L1','STATE')=14.9904839;
FD('L1','CITY')=61.0371338;
FD('L1','OUTNEW1')=0.0000000;
FD('L1','OUTNEW2')=0.0000000;
FD('L1','OUTNEW3')=0.0000000;
FD('L1','OUTJAS1')=0.0000000;
FD('L1','OUTJAS2')=0.0000000;
FD('L1','OUTJAS3')=0.0000000;
FD('L1','OUTOTH1')=0.0000000;
FD('L1','OUTOTH2')=0.0000000;
FD('L1','OUTOTH3')=0.0000000;
FD('L1','ROW')=0.0000000;
FD('L2','GOODS')=3284.0598166;
FD('L2','TRADE')=4359.9561203;
FD('L2','OTHER')=12399.1307765;
FD('L2','L1')=0.0000000;
FD('L2','L2')=0.0000000;
FD('L2','L3')=0.0000000;
FD('L2','KAP')=0.0000000;
FD('L2','LAND')=0.0000000;
FD('L2','HS1')=0.0000000;
FD('L2','HS2')=0.0000000;
FD('L2','HS3')=0.0000000;
FD('L2','HH1')=0.0000000;
FD('L2','HH2')=0.0000000;
FD('L2','HH3')=0.0000000;
FD('L2','HH4')=0.0000000;
FD('L2','HH5')=0.0000000;
FD('L2','INVES')=0.0000000;
FD('L2','USSOC1')=0.0000000;
FD('L2','USSOC2')=0.0000000;
FD('L2','USSOC3')=0.0000000;
FD('L2','PTAXJop')=0.0000000;
FD('L2','STAXJop')=0.0000000;
FD('L2','OTXJop')=0.0000000;
FD('L2','MISSTAX')=0.0000000;
FD('L2','MISITAX')=0.0000000;
FD('L2','USPIT')=0.0000000;
FD('L2','CYGF')=0.0000000;
FD('L2','FED')=38.8684567;
FD('L2','STATE')=97.9113821;
FD('L2','CITY')=402.1465001;
FD('L2','OUTNEW1')=0.0000000;
FD('L2','OUTNEW2')=0.0000000;
FD('L2','OUTNEW3')=0.0000000;
FD('L2','OUTJAS1')=0.0000000;
FD('L2','OUTJAS2')=0.0000000;
FD('L2','OUTJAS3')=0.0000000;
FD('L2','OUTOTH1')=0.0000000;
FD('L2','OUTOTH2')=0.0000000;
FD('L2','OUTOTH3')=0.0000000;
FD('L2','ROW')=0.0000000;
FD('L3','GOODS')=3014.0980821;
FD('L3','TRADE')=1850.4951321;
FD('L3','OTHER')=5443.9435877;
FD('L3','L1')=0.0000000;
FD('L3','L2')=0.0000000;
FD('L3','L3')=0.0000000;
FD('L3','KAP')=0.0000000;
FD('L3','LAND')=0.0000000;
FD('L3','HS1')=0.0000000;
FD('L3','HS2')=0.0000000;
FD('L3','HS3')=0.0000000;
FD('L3','HH1')=0.0000000;
FD('L3','HH2')=0.0000000;
FD('L3','HH3')=0.0000000;
FD('L3','HH4')=0.0000000;
FD('L3','HH5')=0.0000000;
FD('L3','INVES')=0.0000000;
FD('L3','USSOC1')=0.0000000;
FD('L3','USSOC2')=0.0000000;
FD('L3','USSOC3')=0.0000000;
FD('L3','PTAXJop')=0.0000000;
FD('L3','STAXJop')=0.0000000;
FD('L3','OTXJop')=0.0000000;
FD('L3','MISSTAX')=0.0000000;
FD('L3','MISITAX')=0.0000000;
FD('L3','USPIT')=0.0000000;
FD('L3','CYGF')=0.0000000;
FD('L3','FED')=27.8873564;
FD('L3','STATE')=69.8907836;
FD('L3','CITY')=285.9164585;
FD('L3','OUTNEW1')=0.0000000;
FD('L3','OUTNEW2')=0.0000000;
FD('L3','OUTNEW3')=0.0000000;
FD('L3','OUTJAS1')=0.0000000;
FD('L3','OUTJAS2')=0.0000000;
FD('L3','OUTJAS3')=0.0000000;
FD('L3','OUTOTH1')=0.0000000;
FD('L3','OUTOTH2')=0.0000000;
FD('L3','OUTOTH3')=0.0000000;
FD('L3','ROW')=0.0000000;
FD('KAP','GOODS')=509.0000705;
FD('KAP','TRADE')=175.3752903;
FD('KAP','OTHER')=461.8073843;
FD('KAP','L1')=0.0000000;
FD('KAP','L2')=0.0000000;
FD('KAP','L3')=0.0000000;
FD('KAP','KAP')=0.0000000;
FD('KAP','LAND')=0.0000000;
FD('KAP','HS1')=1793.0251455;
FD('KAP','HS2')=2127.4516626;
FD('KAP','HS3')=189.2613464;
FD('KAP','HH1')=0.0000000;
FD('KAP','HH2')=0.0000000;
FD('KAP','HH3')=0.0000000;
FD('KAP','HH4')=0.0000000;
FD('KAP','HH5')=0.0000000;
FD('KAP','INVES')=0.0000000;
FD('KAP','USSOC1')=0.0000000;
FD('KAP','USSOC2')=0.0000000;
FD('KAP','USSOC3')=0.0000000;
FD('KAP','PTAXJop')=0.0000000;
FD('KAP','STAXJop')=0.0000000;
FD('KAP','OTXJop')=0.0000000;
FD('KAP','MISSTAX')=0.0000000;
FD('KAP','MISITAX')=0.0000000;
FD('KAP','USPIT')=0.0000000;
FD('KAP','CYGF')=0.0000000;
FD('KAP','FED')=0.0000000;
FD('KAP','STATE')=0.0000000;
FD('KAP','CITY')=0.0000000;
FD('KAP','OUTNEW1')=0.0000000;
FD('KAP','OUTNEW2')=0.0000000;
FD('KAP','OUTNEW3')=0.0000000;
FD('KAP','OUTJAS1')=0.0000000;
FD('KAP','OUTJAS2')=0.0000000;
FD('KAP','OUTJAS3')=0.0000000;
FD('KAP','OUTOTH1')=0.0000000;
FD('KAP','OUTOTH2')=0.0000000;
FD('KAP','OUTOTH3')=0.0000000;
FD('KAP','ROW')=0.0000000;
FD('LAND','GOODS')=980.9350640;
FD('LAND','TRADE')=561.0418709;
FD('LAND','OTHER')=1261.9786714;
FD('LAND','L1')=0.0000000;
FD('LAND','L2')=0.0000000;
FD('LAND','L3')=0.0000000;
FD('LAND','KAP')=0.0000000;
FD('LAND','LAND')=0.0000000;
FD('LAND','HS1')=809.5952852;
FD('LAND','HS2')=2361.1496074;
FD('LAND','HS3')=51.4661209;
FD('LAND','HH1')=0.0000000;
FD('LAND','HH2')=0.0000000;
FD('LAND','HH3')=0.0000000;
FD('LAND','HH4')=0.0000000;
FD('LAND','HH5')=0.0000000;
FD('LAND','INVES')=0.0000000;
FD('LAND','USSOC1')=0.0000000;
FD('LAND','USSOC2')=0.0000000;
FD('LAND','USSOC3')=0.0000000;
FD('LAND','PTAXJop')=0.0000000;
FD('LAND','STAXJop')=0.0000000;
FD('LAND','OTXJop')=0.0000000;
FD('LAND','MISSTAX')=0.0000000;
FD('LAND','MISITAX')=0.0000000;
FD('LAND','USPIT')=0.0000000;
FD('LAND','CYGF')=0.0000000;
FD('LAND','FED')=0.0000000;
FD('LAND','STATE')=0.0000000;
FD('LAND','CITY')=0.0000000;
FD('LAND','OUTNEW1')=0.0000000;
FD('LAND','OUTNEW2')=0.0000000;
FD('LAND','OUTNEW3')=0.0000000;
FD('LAND','OUTJAS1')=0.0000000;
FD('LAND','OUTJAS2')=0.0000000;
FD('LAND','OUTJAS3')=0.0000000;
FD('LAND','OUTOTH1')=0.0000000;
FD('LAND','OUTOTH2')=0.0000000;
FD('LAND','OUTOTH3')=0.0000000;
FD('LAND','ROW')=0.0000000;
HH('HH1')=3611.8706988;
HH('HH2')=5997.5748281;
HH('HH3')=7553.0357179;
HH('HH4')=2383.7767243;
HH('HH5')=794.1104575;
HN('HH1')=2372.8832315;
HN('HH2')=1747.3587496;
HN('HH3')=567.8917550;
HN('HH4')=32.4948077;
HN('HH5')=39.4008635;
HW('HH1')=1238.9874673;
HW('HH2')=4250.2160785;
HW('HH3')=6985.1439629;
HW('HH4')=2351.2819167;
HW('HH5')=754.7095940;
IGT('USSOC1','USSOC1')=-0.0000000;
IGT('USSOC1','USSOC2')=-0.0000000;
IGT('USSOC1','USSOC3')=-0.0000000;
IGT('USSOC1','PTAXJop')=-0.0000000;
IGT('USSOC1','STAXJop')=-0.0000000;
IGT('USSOC1','OTXJop')=-0.0000000;
IGT('USSOC1','MISSTAX')=-0.0000000;
IGT('USSOC1','MISITAX')=-0.0000000;
IGT('USSOC1','USPIT')=-0.0000000;
IGT('USSOC1','CYGF')=0.0000000;
IGT('USSOC1','FED')=0.0000000;
IGT('USSOC1','STATE')=0.0000000;
IGT('USSOC1','CITY')=0.0000000;
IGT('USSOC2','USSOC1')=-0.0000000;
IGT('USSOC2','USSOC2')=-0.0000000;
IGT('USSOC2','USSOC3')=-0.0000000;
IGT('USSOC2','PTAXJop')=-0.0000000;
IGT('USSOC2','STAXJop')=-0.0000000;
IGT('USSOC2','OTXJop')=-0.0000000;
IGT('USSOC2','MISSTAX')=-0.0000000;
IGT('USSOC2','MISITAX')=-0.0000000;
IGT('USSOC2','USPIT')=-0.0000000;
IGT('USSOC2','CYGF')=0.0000000;
IGT('USSOC2','FED')=0.0000000;
IGT('USSOC2','STATE')=0.0000000;
IGT('USSOC2','CITY')=0.0000000;
IGT('USSOC3','USSOC1')=-0.0000000;
IGT('USSOC3','USSOC2')=-0.0000000;
IGT('USSOC3','USSOC3')=-0.0000000;
IGT('USSOC3','PTAXJop')=-0.0000000;
IGT('USSOC3','STAXJop')=-0.0000000;
IGT('USSOC3','OTXJop')=-0.0000000;
IGT('USSOC3','MISSTAX')=-0.0000000;
IGT('USSOC3','MISITAX')=-0.0000000;
IGT('USSOC3','USPIT')=-0.0000000;
IGT('USSOC3','CYGF')=0.0000000;
IGT('USSOC3','FED')=0.0000000;
IGT('USSOC3','STATE')=0.0000000;
IGT('USSOC3','CITY')=0.0000000;
IGT('PTAXJop','USSOC1')=-0.0000000;
IGT('PTAXJop','USSOC2')=-0.0000000;
IGT('PTAXJop','USSOC3')=-0.0000000;
IGT('PTAXJop','PTAXJop')=-0.0000000;
IGT('PTAXJop','STAXJop')=-0.0000000;
IGT('PTAXJop','OTXJop')=-0.0000000;
IGT('PTAXJop','MISSTAX')=-0.0000000;
IGT('PTAXJop','MISITAX')=-0.0000000;
IGT('PTAXJop','USPIT')=-0.0000000;
IGT('PTAXJop','CYGF')=0.0000000;
IGT('PTAXJop','FED')=0.0000000;
IGT('PTAXJop','STATE')=0.0000000;
IGT('PTAXJop','CITY')=0.0000000;
IGT('STAXJop','USSOC1')=-0.0000000;
IGT('STAXJop','USSOC2')=-0.0000000;
IGT('STAXJop','USSOC3')=-0.0000000;
IGT('STAXJop','PTAXJop')=-0.0000000;
IGT('STAXJop','STAXJop')=-0.0000000;
IGT('STAXJop','OTXJop')=-0.0000000;
IGT('STAXJop','MISSTAX')=-0.0000000;
IGT('STAXJop','MISITAX')=-0.0000000;
IGT('STAXJop','USPIT')=-0.0000000;
IGT('STAXJop','CYGF')=0.0000000;
IGT('STAXJop','FED')=0.0000000;
IGT('STAXJop','STATE')=0.0000000;
IGT('STAXJop','CITY')=0.0000000;
IGT('OTXJop','USSOC1')=-0.0000000;
IGT('OTXJop','USSOC2')=-0.0000000;
IGT('OTXJop','USSOC3')=-0.0000000;
IGT('OTXJop','PTAXJop')=-0.0000000;
IGT('OTXJop','STAXJop')=-0.0000000;
IGT('OTXJop','OTXJop')=-0.0000000;
IGT('OTXJop','MISSTAX')=-0.0000000;
IGT('OTXJop','MISITAX')=-0.0000000;
IGT('OTXJop','USPIT')=-0.0000000;
IGT('OTXJop','CYGF')=0.0000000;
IGT('OTXJop','FED')=0.0000000;
IGT('OTXJop','STATE')=0.0000000;
IGT('OTXJop','CITY')=0.0000000;
IGT('MISSTAX','USSOC1')=-0.0000000;
IGT('MISSTAX','USSOC2')=-0.0000000;
IGT('MISSTAX','USSOC3')=-0.0000000;
IGT('MISSTAX','PTAXJop')=-0.0000000;
IGT('MISSTAX','STAXJop')=-0.0000000;
IGT('MISSTAX','OTXJop')=-0.0000000;
IGT('MISSTAX','MISSTAX')=-0.0000000;
IGT('MISSTAX','MISITAX')=-0.0000000;
IGT('MISSTAX','USPIT')=-0.0000000;
IGT('MISSTAX','CYGF')=0.0000000;
IGT('MISSTAX','FED')=0.0000000;
IGT('MISSTAX','STATE')=0.0000000;
IGT('MISSTAX','CITY')=0.0000000;
IGT('MISITAX','USSOC1')=-0.0000000;
IGT('MISITAX','USSOC2')=-0.0000000;
IGT('MISITAX','USSOC3')=-0.0000000;
IGT('MISITAX','PTAXJop')=-0.0000000;
IGT('MISITAX','STAXJop')=-0.0000000;
IGT('MISITAX','OTXJop')=-0.0000000;
IGT('MISITAX','MISSTAX')=-0.0000000;
IGT('MISITAX','MISITAX')=-0.0000000;
IGT('MISITAX','USPIT')=-0.0000000;
IGT('MISITAX','CYGF')=0.0000000;
IGT('MISITAX','FED')=0.0000000;
IGT('MISITAX','STATE')=0.0000000;
IGT('MISITAX','CITY')=0.0000000;
IGT('USPIT','USSOC1')=-0.0000000;
IGT('USPIT','USSOC2')=-0.0000000;
IGT('USPIT','USSOC3')=-0.0000000;
IGT('USPIT','PTAXJop')=-0.0000000;
IGT('USPIT','STAXJop')=-0.0000000;
IGT('USPIT','OTXJop')=-0.0000000;
IGT('USPIT','MISSTAX')=-0.0000000;
IGT('USPIT','MISITAX')=-0.0000000;
IGT('USPIT','USPIT')=-0.0000000;
IGT('USPIT','CYGF')=0.0000000;
IGT('USPIT','FED')=0.0000000;
IGT('USPIT','STATE')=0.0000000;
IGT('USPIT','CITY')=0.0000000;
IGT('CYGF','USSOC1')=-0.0000000;
IGT('CYGF','USSOC2')=-0.0000000;
IGT('CYGF','USSOC3')=-0.0000000;
IGT('CYGF','PTAXJop')=0.7834700;
IGT('CYGF','STAXJop')=31.2069728;
IGT('CYGF','OTXJop')=2.8865072;
IGT('CYGF','MISSTAX')=-0.0000000;
IGT('CYGF','MISITAX')=-0.0000000;
IGT('CYGF','USPIT')=-0.0000000;
IGT('CYGF','CYGF')=0.0000000;
IGT('CYGF','FED')=0.0000000;
IGT('CYGF','STATE')=0.0000000;
IGT('CYGF','CITY')=0.0000000;
IGT('FED','USSOC1')=-52.8359781;
IGT('FED','USSOC2')=17.0855118;
IGT('FED','USSOC3')=56.8718438;
IGT('FED','PTAXJop')=-0.0000000;
IGT('FED','STAXJop')=-0.0000000;
IGT('FED','OTXJop')=-0.0000000;
IGT('FED','MISSTAX')=-0.0000000;
IGT('FED','MISITAX')=-0.0000000;
IGT('FED','USPIT')=128.4104451;
IGT('FED','CYGF')=0.0000000;
IGT('FED','FED')=0.0000000;
IGT('FED','STATE')=0.0000000;
IGT('FED','CITY')=0.0000000;
IGT('STATE','USSOC1')=-0.0000000;
IGT('STATE','USSOC2')=-0.0000000;
IGT('STATE','USSOC3')=-0.0000000;
IGT('STATE','PTAXJop')=-0.0000000;
IGT('STATE','STAXJop')=-0.0000000;
IGT('STATE','OTXJop')=-0.0000000;
IGT('STATE','MISSTAX')=64.7915517;
IGT('STATE','MISITAX')=29.0823600;
IGT('STATE','USPIT')=-0.0000000;
IGT('STATE','CYGF')=0.0000000;
IGT('STATE','FED')=0.0000000;
IGT('STATE','STATE')=0.0000000;
IGT('STATE','CITY')=0.0000000;
IGT('CITY','USSOC1')=0.0000000;
IGT('CITY','USSOC2')=0.0000000;
IGT('CITY','USSOC3')=0.0000000;
IGT('CITY','PTAXJop')=0.0000000;
IGT('CITY','STAXJop')=0.0000000;
IGT('CITY','OTXJop')=0.0000000;
IGT('CITY','MISSTAX')=0.0000000;
IGT('CITY','MISITAX')=0.0000000;
IGT('CITY','USPIT')=0.0000000;
IGT('CITY','CYGF')=0.0000000;
IGT('CITY','FED')=0.0000000;
IGT('CITY','STATE')=0.0000000;
IGT('CITY','CITY')=0.0000000;
KS('KAP','GOODS')=509.0000705;
KS('KAP','TRADE')=175.3752903;
KS('KAP','OTHER')=461.8073843;
KS('KAP','HS1')=1793.0251455;
KS('KAP','HS2')=2127.4516626;
KS('KAP','HS3')=189.2613464;
KS('KAP','FED')=0.0000000;
KS('KAP','STATE')=0.0000000;
KS('KAP','CITY')=0.0000000;
LAS('LAND','GOODS')=980.9350640;
LAS('LAND','TRADE')=561.0418709;
LAS('LAND','OTHER')=1261.9786714;
LAS('LAND','HS1')=809.5952852;
LAS('LAND','HS2')=2361.1496074;
LAS('LAND','HS3')=51.4661209;
LAS('LAND','FED')=0.0000000;
LAS('LAND','STATE')=0.0000000;
LAS('LAND','CITY')=0.0000000;
M('GOODS')=380.9372717;
M('TRADE')=357.7099646;
M('OTHER')=337.7730909;
M('HS1')=0.0000000;
M('HS2')=0.0000000;
M('HS3')=0.0000000;
N('KAP','GOODS')=50.9027750;
N('KAP','TRADE')=17.5359919;
N('KAP','OTHER')=46.1792884;
N('KAP','HS1')=179.2477614;
N('KAP','HS2')=212.7178815;
N('KAP','HS3')=18.9228481;
N('KAP','FED')=0.0000000;
N('KAP','STATE')=0.0000000;
N('KAP','CITY')=0.0000000;
NKI=425.1074812;
LNFOR(LA)=-34.8941598;
KPFOR(K)=-136.4070052;
GVFOR('USSOC1')=-0.0000000;
GVFOR('USSOC2')=-0.0000000;
GVFOR('USSOC3')=-0.0000000;
GVFOR('PTAXJop')=-0.0000000;
GVFOR('STAXJop')=-0.0000000;
GVFOR('OTXJop')=-0.0000000;
GVFOR('MISSTAX')=-0.0000000;
GVFOR('MISITAX')=-0.0000000;
GVFOR('USPIT')=-0.0000000;
GVFOR('CYGF')=-0.0000000;
GVFOR('FED')=-146.1848817;
GVFOR('STATE')=-85.9846168;
GVFOR('CITY')=-0.8905864;
P('GOODS')=0.9999123;
P('TRADE')=0.9997608;
P('OTHER')=0.9996721;
P('HS1')=0.9971994;
P('HS2')=0.9988051;
P('HS3')=0.9982953;
PD('GOODS')=0.9997708;
PD('TRADE')=0.9994960;
PD('OTHER')=0.9995288;
PD('HS1')=0.9971994;
PD('HS2')=0.9988051;
PD('HS3')=0.9982953;
PVA('GOODS')=0.5369274;
PVA('TRADE')=0.6410413;
PVA('OTHER')=0.6294406;
PVA('HS1')=0.9011437;
PVA('HS2')=0.9027494;
PVA('HS3')=0.9022396;
RA('L1')=0.9988643;
RA('L2')=0.9990490;
RA('L3')=0.9997059;
RA('KAP')=1.0000000;
RA('LAND')=1.0000000;
R('L1','GOODS')=0.0064828;
R('L1','TRADE')=0.0079740;
R('L1','OTHER')=0.0068466;
R('L1','L1')=1.0000000;
R('L1','L2')=1.0000000;
R('L1','L3')=1.0000000;
R('L1','KAP')=1.0000000;
R('L1','LAND')=1.0000000;
R('L1','HS1')=1.0000000;
R('L1','HS2')=1.0000000;
R('L1','HS3')=1.0000000;
R('L1','HH1')=1.0000000;
R('L1','HH2')=1.0000000;
R('L1','HH3')=1.0000000;
R('L1','HH4')=1.0000000;
R('L1','HH5')=1.0000000;
R('L1','INVES')=1.0000000;
R('L1','USSOC1')=1.0000000;
R('L1','USSOC2')=1.0000000;
R('L1','USSOC3')=1.0000000;
R('L1','PTAXJop')=1.0000000;
R('L1','STAXJop')=1.0000000;
R('L1','OTXJop')=1.0000000;
R('L1','MISSTAX')=1.0000000;
R('L1','MISITAX')=1.0000000;
R('L1','USPIT')=1.0000000;
R('L1','CYGF')=1.0000000;
R('L1','FED')=0.0008314;
R('L1','STATE')=0.0008308;
R('L1','CITY')=0.0008762;
R('L1','OUTNEW1')=1.0000000;
R('L1','OUTNEW2')=1.0000000;
R('L1','OUTNEW3')=1.0000000;
R('L1','OUTJAS1')=1.0000000;
R('L1','OUTJAS2')=1.0000000;
R('L1','OUTJAS3')=1.0000000;
R('L1','OUTOTH1')=1.0000000;
R('L1','OUTOTH2')=1.0000000;
R('L1','OUTOTH3')=1.0000000;
R('L1','ROW')=1.0000000;
R('L2','GOODS')=0.0259691;
R('L2','TRADE')=0.0255701;
R('L2','OTHER')=0.0248561;
R('L2','L1')=1.0000000;
R('L2','L2')=1.0000000;
R('L2','L3')=1.0000000;
R('L2','KAP')=1.0000000;
R('L2','LAND')=1.0000000;
R('L2','HS1')=1.0000000;
R('L2','HS2')=1.0000000;
R('L2','HS3')=1.0000000;
R('L2','HH1')=1.0000000;
R('L2','HH2')=1.0000000;
R('L2','HH3')=1.0000000;
R('L2','HH4')=1.0000000;
R('L2','HH5')=1.0000000;
R('L2','INVES')=1.0000000;
R('L2','USSOC1')=1.0000000;
R('L2','USSOC2')=1.0000000;
R('L2','USSOC3')=1.0000000;
R('L2','PTAXJop')=1.0000000;
R('L2','STAXJop')=1.0000000;
R('L2','OTXJop')=1.0000000;
R('L2','MISSTAX')=1.0000000;
R('L2','MISITAX')=1.0000000;
R('L2','USPIT')=1.0000000;
R('L2','CYGF')=1.0000000;
R('L2','FED')=0.0270193;
R('L2','STATE')=0.0268602;
R('L2','CITY')=0.0279395;
R('L2','OUTNEW1')=1.0000000;
R('L2','OUTNEW2')=1.0000000;
R('L2','OUTNEW3')=1.0000000;
R('L2','OUTJAS1')=1.0000000;
R('L2','OUTJAS2')=1.0000000;
R('L2','OUTJAS3')=1.0000000;
R('L2','OUTOTH1')=1.0000000;
R('L2','OUTOTH2')=1.0000000;
R('L2','OUTOTH3')=1.0000000;
R('L2','ROW')=1.0000000;
R('L3','GOODS')=0.0618627;
R('L3','TRADE')=0.0707015;
R('L3','OTHER')=0.0737546;
R('L3','L1')=1.0000000;
R('L3','L2')=1.0000000;
R('L3','L3')=1.0000000;
R('L3','KAP')=1.0000000;
R('L3','LAND')=1.0000000;
R('L3','HS1')=1.0000000;
R('L3','HS2')=1.0000000;
R('L3','HS3')=1.0000000;
R('L3','HH1')=1.0000000;
R('L3','HH2')=1.0000000;
R('L3','HH3')=1.0000000;
R('L3','HH4')=1.0000000;
R('L3','HH5')=1.0000000;
R('L3','INVES')=1.0000000;
R('L3','USSOC1')=1.0000000;
R('L3','USSOC2')=1.0000000;
R('L3','USSOC3')=1.0000000;
R('L3','PTAXJop')=1.0000000;
R('L3','STAXJop')=1.0000000;
R('L3','OTXJop')=1.0000000;
R('L3','MISSTAX')=1.0000000;
R('L3','MISITAX')=1.0000000;
R('L3','USPIT')=1.0000000;
R('L3','CYGF')=1.0000000;
R('L3','FED')=0.0494236;
R('L3','STATE')=0.0493846;
R('L3','CITY')=0.0512681;
R('L3','OUTNEW1')=1.0000000;
R('L3','OUTNEW2')=1.0000000;
R('L3','OUTNEW3')=1.0000000;
R('L3','OUTJAS1')=1.0000000;
R('L3','OUTJAS2')=1.0000000;
R('L3','OUTJAS3')=1.0000000;
R('L3','OUTOTH1')=1.0000000;
R('L3','OUTOTH2')=1.0000000;
R('L3','OUTOTH3')=1.0000000;
R('L3','ROW')=1.0000000;
R('KAP','GOODS')=0.1000604;
R('KAP','TRADE')=0.0999027;
R('KAP','OTHER')=0.0999649;
R('KAP','L1')=1.0000000;
R('KAP','L2')=1.0000000;
R('KAP','L3')=1.0000000;
R('KAP','KAP')=1.0000000;
R('KAP','LAND')=1.0000000;
R('KAP','HS1')=0.0996611;
R('KAP','HS2')=0.0998575;
R('KAP','HS3')=0.0998072;
R('KAP','HH1')=1.0000000;
R('KAP','HH2')=1.0000000;
R('KAP','HH3')=1.0000000;
R('KAP','HH4')=1.0000000;
R('KAP','HH5')=1.0000000;
R('KAP','INVES')=1.0000000;
R('KAP','USSOC1')=1.0000000;
R('KAP','USSOC2')=1.0000000;
R('KAP','USSOC3')=1.0000000;
R('KAP','PTAXJop')=1.0000000;
R('KAP','STAXJop')=1.0000000;
R('KAP','OTXJop')=1.0000000;
R('KAP','MISSTAX')=1.0000000;
R('KAP','MISITAX')=1.0000000;
R('KAP','USPIT')=1.0000000;
R('KAP','CYGF')=1.0000000;
R('KAP','FED')=500.0005050;
R('KAP','STATE')=500.0005050;
R('KAP','CITY')=500.0005050;
R('KAP','OUTNEW1')=1.0000000;
R('KAP','OUTNEW2')=1.0000000;
R('KAP','OUTNEW3')=1.0000000;
R('KAP','OUTJAS1')=1.0000000;
R('KAP','OUTJAS2')=1.0000000;
R('KAP','OUTJAS3')=1.0000000;
R('KAP','OUTOTH1')=1.0000000;
R('KAP','OUTOTH2')=1.0000000;
R('KAP','OUTOTH3')=1.0000000;
R('KAP','ROW')=1.0000000;
R('LAND','GOODS')=0.0244957;
R('LAND','TRADE')=0.0146628;
R('LAND','OTHER')=0.0088067;
R('LAND','L1')=1.0000000;
R('LAND','L2')=1.0000000;
R('LAND','L3')=1.0000000;
R('LAND','KAP')=1.0000000;
R('LAND','LAND')=1.0000000;
R('LAND','HS1')=0.0348397;
R('LAND','HS2')=0.0119857;
R('LAND','HS3')=0.0189471;
R('LAND','HH1')=1.0000000;
R('LAND','HH2')=1.0000000;
R('LAND','HH3')=1.0000000;
R('LAND','HH4')=1.0000000;
R('LAND','HH5')=1.0000000;
R('LAND','INVES')=1.0000000;
R('LAND','USSOC1')=1.0000000;
R('LAND','USSOC2')=1.0000000;
R('LAND','USSOC3')=1.0000000;
R('LAND','PTAXJop')=1.0000000;
R('LAND','STAXJop')=1.0000000;
R('LAND','OTXJop')=1.0000000;
R('LAND','MISSTAX')=1.0000000;
R('LAND','MISITAX')=1.0000000;
R('LAND','USPIT')=1.0000000;
R('LAND','CYGF')=1.0000000;
R('LAND','FED')=500.0005050;
R('LAND','STATE')=500.0005050;
R('LAND','CITY')=500.0005050;
R('LAND','OUTNEW1')=1.0000000;
R('LAND','OUTNEW2')=1.0000000;
R('LAND','OUTNEW3')=1.0000000;
R('LAND','OUTJAS1')=1.0000000;
R('LAND','OUTJAS2')=1.0000000;
R('LAND','OUTJAS3')=1.0000000;
R('LAND','OUTOTH1')=1.0000000;
R('LAND','OUTOTH2')=1.0000000;
R('LAND','OUTOTH3')=1.0000000;
R('LAND','ROW')=1.0000000;
S('GOODS')=0.0000000;
S('TRADE')=0.0000000;
S('OTHER')=0.0000000;
S('L1')=0.0000000;
S('L2')=0.0000000;
S('L3')=0.0000000;
S('KAP')=0.0000000;
S('LAND')=0.0000000;
S('HS1')=0.0000000;
S('HS2')=0.0000000;
S('HS3')=0.0000000;
S('HH1')=-0.0759302;
S('HH2')=-0.2157119;
S('HH3')=50.1822884;
S('HH4')=47.4286351;
S('HH5')=28.4796653;
S('INVES')=0.0000000;
S('USSOC1')=-0.0000000;
S('USSOC2')=-0.0000000;
S('USSOC3')=0.0000000;
S('PTAXJop')=0.0000000;
S('STAXJop')=-0.0000000;
S('OTXJop')=-0.0000000;
S('MISSTAX')=-0.0000000;
S('MISITAX')=-0.0000000;
S('USPIT')=-0.0000000;
S('CYGF')=0.0000000;
S('FED')=0.0000001;
S('STATE')=-0.0000093;
S('CITY')=0.0000002;
S('OUTNEW1')=0.0000000;
S('OUTNEW2')=0.0000000;
S('OUTNEW3')=0.0000000;
S('OUTJAS1')=0.0000000;
S('OUTJAS2')=0.0000000;
S('OUTJAS3')=0.0000000;
S('OUTOTH1')=0.0000000;
S('OUTOTH2')=0.0000000;
S('OUTOTH3')=0.0000000;
S('ROW')=0.0000000;
SPI=1703.8757339;
V('GOODS')=397.9185287;
V('TRADE')=62.4896176;
V('OTHER')=558.1598034;
V('HS1')=0.0000000;
V('HS2')=0.0000000;
V('HS3')=0.0000000;
Y('GOODS')=0.0000000;
Y('TRADE')=0.0000000;
Y('OTHER')=0.0000000;
Y('L1')=67.8575727;
Y('L2')=519.3840900;
Y('L3')=738.0800203;
Y('KAP')=524.6423275;
Y('LAND')=100.8501730;
Y('HS1')=0.0000000;
Y('HS2')=0.0000000;
Y('HS3')=0.0000000;
Y('HH1')=12.2216053;
Y('HH2')=139.7857899;
Y('HH3')=406.9863651;
Y('HH4')=436.2235699;
Y('HH5')=182.9371578;
Y('INVES')=0.0000000;
Y('USSOC1')=6.0529973;
Y('USSOC2')=44.6652139;
Y('USSOC3')=60.1064322;
Y('PTAXJop')=0.7834700;
Y('STAXJop')=31.2069728;
Y('OTXJop')=2.8865072;
Y('MISSTAX')=64.7915517;
Y('MISITAX')=29.0823600;
Y('USPIT')=128.4104451;
Y('CYGF')=34.8769500;
Y('FED')=149.5318226;
Y('STATE')=93.8739118;
Y('CITY')=34.8769500;
Y('OUTNEW1')=0.0000000;
Y('OUTNEW2')=0.0000000;
Y('OUTNEW3')=0.0000000;
Y('OUTJAS1')=0.0000000;
Y('OUTJAS2')=0.0000000;
Y('OUTJAS3')=0.0000000;
Y('OUTOTH1')=0.0000000;
Y('OUTOTH2')=0.0000000;
Y('OUTOTH3')=0.0000000;
Y('ROW')=0.0000000;
YD('HH1')=77.9808320;
YD('HH2')=213.2287902;
YD('HH3')=486.0846281;
YD('HH4')=479.4000807;
YD('HH5')=288.0117781;
CMO('OUTNEW1')=521.5923764;
CMO('OUTNEW2')=1033.9833629;
CMO('OUTNEW3')=624.1835473;
CMO('OUTJAS1')=819.9312016;
CMO('OUTJAS2')=2000.9029449;
CMO('OUTJAS3')=1068.3141478;
CMO('OUTOTH1')=1383.5713204;
CMO('OUTOTH2')=2093.9914727;
CMO('OUTOTH3')=1135.3338565;
CMI('L1')=5502.6324919;
CMI('L2')=12907.1785933;
CMI('L3')=7423.4063576;




$ontext
KS0(K,'HS1')     = KS0(K,'HS1')*0.675;
KS0(K,'HS2')     = KS0(K,'HS2')*0.739;
KS0(K,'HS3')     = KS0(K,'HS3')*0.958;
KS0(K,'GOODS')   = KS0(K,'GOODS')*0.658;
KS0(K,'TRADE')   = KS0(K,'TRADE')*0.961;
KS0(K,'OTHER')   = KS0(K,'OTHER')*0.673;
$offtext

tmp1(F,I) =  PVA(I) * ALPHA(F,I)*(GAMMA(I)**RHO(I))*(DS(I)**(1-RHO(I)));

CPIEQ(H) = CPI(H)- (SUM(I, P(I)  * ( 1 + SUM(GS, TAUC(GS,I) ) ) * CH(I,H) )
                                 / SUM(I, P0(I) * ( 1 + SUM(GS, TAUQ(GS,I) ) ) * CH(I,H) ));

tmp2(H) =  SUM(CM, A(H,CM)*CMOWAGE(CM)*CMO(CM));
YEQ(H) = Y(H)-(SUM(L,  A(H,L) * HW(H) / SUM(H1, A(H1,L) * HW(H1) )
                                 * (Y(L) - (CMIWAGE(L)*CMI(L))) * ( 1 - SUM(G, TAUFL(G,L))))
                                 + SUM(CM, A(H,CM)*CMOWAGE(CM)*CMO(CM))
                                 + SUM(LA,  A(H,LA) * HW(H) / SUM(H1, A(H1,LA) * HW(H1)) * (Y(LA)+ LNFOR(LA))*( 1 - SUM(G, TAUFLA(G,LA) ) ) )
                                 + SUM(K,  A(H,K) * HW(H) / SUM(H1, A(H1,K) * HW(H1)) * (Y(K) + KPFOR(K)) * ( 1 - SUM(G, TAUFK(G,K) ) ) ));


YDEQ(H) = YD(H)-(Y(H) + (PRIVRET(H) * HH(H))
                                         + SUM(G, TP(H,G) * HH(H))
                                         - SUM(GI, PIT(GI,H)  * Y(H))
                                         - SUM(G, TAUH(G,H)  * HH(H)));

CHEQ(I,H) = CH(I,H)- ( CH0(I,H)
                                 * ((YD(H) / YD0(H)) / ( CPI(H) / CPI0(H)))**(BETA(I,H))
                                 * PROD(J, ((P(J)*( 1 + SUM(GS, TAUC(GS,J))))
                                 / (P0(J)*(1 + SUM(GS, TAUQ(GS,J)))))** (LAMBDA(J,I))));


SHEQ(H) = S(H) - (YD(H) - SUM(I, P(I) * CH(I,H) * ( 1 + SUM(GS, TAUC(GS,I)))));

PVAEQ(I) = PVA(I) - (PD(I) - SUM(J, AD(J,I) * P(J) * (1 + SUM(GS, TAUQ(GS, J)))));

PFEQ(I) = DS(I) - GAMMA(I)*(SUM(F, ALPHA(F,I)*(FD(F,I))**(RHO(I)))**(1/RHO(I)));

FDEQ(F,I) = R(F,I) * RA(F)*(1 + SUM(GF,TAUFX(GF,F,I)))* (FD(F,I))**(1-RHO(I))
                 - PVA(I) * ALPHA(F,I)*(GAMMA(I)**RHO(I))*(DS(I)**(1-RHO(I)));

VEQ(I)= V(I)            - SUM(J, AD(I,J) * DS(J) );

YFEQL(L)= Y(L)          - SUM(IG, R(L,IG)* TT(L,IG)* RA(L)*FD(L,IG));

YFEQK(K)= Y('KAP')      - SUM(IG, R('KAP',IG) * RA('KAP') * TT('KAP',IG) * FD('KAP',IG));

YFEQLA(LA)= Y('LAND')   - SUM(IG, R('LAND',IG) * RA('LAND') * FD('LAND',IG));

LANFOR(LA)= LNFOR(LA)   - LFOR(LA) * Y(LA);

KAPFOR(K)= KPFOR(K)     - KFOR(K) * Y(K);

XEQ(I)= CX(I)           - CX0(I)*((PD(I))/(PW0(I)))**(ETAE(I));

DEQ(I)$PWM0(I)= D(I)    - D0(I) *(PD(I)/PWM0(I))**(ETAD(I));

PEQ(I)=  P(I)           - (D(I) * PD(I) + ( 1 - D(I) ) * PWM0(I));

MEQ(I)= M(I)            - ( 1 - D(I) ) * DD(I);

NKIEQ= NKI              -( SUM(I, M(I) * PWM0(I) )
                                 - SUM(I, CX(I) * PD(I) )
                                 - SUM(H, PRIVRET(H)*HH(H))
                                 - SUM(LA, LNFOR(LA))
                                 - SUM(K, KPFOR(K))
                                 - SUM(G, GVFOR(G))
                                 - SUM(CM,CMOWAGE(CM)*CMO(CM))
                                 + SUM(L,CMIWAGE(L)*CMI(L)));

NEQ(K,I)= N(K,I)        - N0(K,I)*(R(K,I)/R0(K,I))**(ETAIX(K,I));

CNEQ(I)= P(I)*(1 + SUM(GS, TAUN(GS,I)))*CN(I)
                         - SUM(IG, B(I,IG)*(SUM(K, N(K,IG))));

KSEQ(K,IG)= KS(K,IG)    - (KS0(K,IG) * ( 1 - DEPR) + N(K,IG) );

LSEQ1(H)= HW(H)/HH(H)   - (HW0(H)/HH0(H)*((SUM(L, RA(L) / RA0(L))/3)/ (CPI(H) / CPI0(H))
                                 * (SUM((Z,L), FD(L,Z))/ (SUM(H1, HW(H1)* SUM(L, JOBCOR(H1,L))) + SUM(L,CMI(L))))
                                 + SUM((CM,L), EXWGEO(CM)/RA(L))/27
                                 * (SUM(CM, CMO(CM))/(SUM(H1, HW(H1)* SUM(L,JOBCOR(H1,L))) + SUM(L,CMI(L)))))** (ETARA(H))
                                 * (SUM(G, TP(H,G)/ CPI(H)) / SUM(G, TP(H,G) / CPI0(H) ))**(ETAPT(H))
                                 * ((SUM(GI, PIT0(GI,H)* HH0(H))+ SUM(G, TAUH0(G,H)*HH0(H)))
                                 / (SUM(GI, PIT(GI,H)* HH(H))+ SUM(G, TAUH(G,H)*HH(H))))**(ETAPIT(H)));


LSEQ2a(CM1)= CMO(CM1)   - CMO0(CM1)* (((EXWGEO(CM1) /RA('L1') ))** ECOMO(CM1));
LSEQ2b(CM2)= CMO(CM2)   - CMO0(CM2)* (((EXWGEO(CM2) /RA('L2') ))** ECOMO(CM2));
LSEQ2c(CM3)= CMO(CM3)   - CMO0(CM3)* (((EXWGEO(CM3) /RA('L3') ))** ECOMO(CM3));



LSEQ3a= CMI('L1')       - CMI0('L1')* (((RA('L1')/(SUM( H, CPI(H))/5)/EXWGEI('L1')))** ECOMI('L1'));
LSEQ3b= CMI('L2')       - CMI0('L2')* (((RA('L2')/(SUM( H, CPI(H))/5)/EXWGEI('L2')))** ECOMI('L2'));
LSEQ3c= CMI('L3')       - CMI0('L3')* (((RA('L3')/(SUM( H, CPI(H))/5)/EXWGEI('L3')))** ECOMI('L3'));

LASEQ1(LA,I)= LAS(LA,I) - LAS0(LA,I)*(R(LA, I)/R0(LA, I))**(ETAL(LA,I));

POPEQ(H)= HH(H)         - (HH0(H) * NRPG(H)
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

ANEQ(H)= HN(H)          - (HH(H) - HW(H));


YGEQ(GX)= Y(GX)         -   (SUM(I, TAUV(GX,I) * V(I) * P(I) )
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


YGEQ2(GT)= Y(GT)        - SUM(GX, IGT(GT,GX));

YGEQ1(GNL)= Y(GNL)      - TAXS1(GNL)*Y('CYGF');

GOVFOR(G)= GVFOR(G)     - GFOR(G)*Y(G);

CGEQ(I,GN)= P(I)*(1 + SUM(GS, TAUG(GS,I))) * CG(I,GN)
                         - AG(I,GN) * (Y(GN)+ GFOR(GN)*Y(GN));

GFEQ(F,GN)=  FD(F,GN) * R(F,GN) * RA(F)*( 1 + SUM(GF, TAUFX(GF,F,GN)))
                         - AG(F,GN) * (Y(GN)+ GFOR(GN)*Y(GN));


GSEQL(GN)= S(GN)        -( (Y(GN)+ GVFOR(GN))
                                 - SUM(I, CG(I,GN)*P(I)*(1 + SUM(GS, TAUG(GS,I))))
                                 - SUM(F, FD(F,GN)*R(F,GN)*RA(F)*(1 + SUM(GF, TAUFX(GF,F,GN)))));

GSEQ(GX)= S(GX)         - ( (Y(GX) + GFOR(GX)*Y(GX)) - SUM(H, (TP(H,GX)*HH(H))) - SUM(G,IGT(G,GX)));

TDEQ(G,GX)$(IGTD(G,GX) EQ 1)= IGT(G,GX)
                         - TAXS(G,GX)*(Y(GX) + GVFOR(GX)- SUM(H, (TP(H,GX)*HH(H))));

SPIEQ= SPI              - (SUM(H, Y(H)) + SUM((H,G), TP(H,G)*HH(H)) + SUM(H, PRIVRET(H)*HH(H)));


LMEQ1= SUM(H, HW(H)* JOBCOR(H,'L1')) + CMI('L1') - (SUM(Z, FD('L1',Z)) + SUM(CM1, SUM(H, HW(H)*OUTCR(H, CM1))));
LMEQ2= SUM(H, HW(H)* JOBCOR(H,'L2')) + CMI('L2') - (SUM(Z, FD('L2',Z)) + SUM(CM2, SUM(H, HW(H)*OUTCR(H, CM2))));
LMEQ3= SUM(H, HW(H)* JOBCOR(H,'L3')) + CMI('L3') - (SUM(Z, FD('L3',Z)) + SUM(CM3, SUM(H, HW(H)*OUTCR(H, CM3))));

KMEQ(K,IG)= KS(K,IG)    - TT(K,IG)*FD(K,IG);

LAMEQ(LA,IG)= LAS(LA,IG)- TT(LA,IG)*FD(LA,IG);

GMEQ(I)= DS(I)          - (DD(I) + CX(I) - M(I));

DDEQ(I)= DD(I)          - (V(I) + SUM(H, CH(I,H) ) + SUM(G, CG(I,G) ) + CN(I));

display CPIEQ
YEQ
YDEQ
CHEQ
SHEQ
PVAEQ
PFEQ
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
LSEQ2a
LSEQ2b
LSEQ2c
LSEQ3a
LSEQ3b
LSEQ3c
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
LMEQ2
LMEQ3
KMEQ
LAMEQ
GMEQ
DDEQ
ETAYDI
ETAUI
ETAYDO
ETAUO
ETAPT
ETAPIT
ETARA
MI0
MO0
HH0
YD0
CPI0
ETAPT
EXWGEO
JOBCOR
PIT
PIT0
ETAL
LFOR
LAS0
ALPHA
PVA0
DS0
IGTD
TAXS
DEPR
tmp1
tmp2