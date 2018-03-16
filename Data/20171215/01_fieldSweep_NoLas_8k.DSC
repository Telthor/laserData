#DESC	1.2 * DESCRIPTOR INFORMATION ***********************
*
*	Dataset Type and Format:
*
DSRC	EXP
BSEQ	BIG
IKKF	CPLX
XTYP	IDX
YTYP	NODATA
ZTYP	NODATA
*
*	Item Formats:
*
IRFMT	D
IIFMT	D
*
*	Data Ranges and Resolutions:
*
XPTS	500
XMIN	3199.000000
XWID	50.000000
*
*	Documentational Text:
*
TITL	'01_fieldSweep_NoLas_8k'
IRNAM	'Intensity'
IINAM	'Intensity'
XNAM	'Field'
IRUNI	''
IIUNI	''
XUNI	'G'
*
************************************************************
*
#SPL	1.2 * STANDARD PARAMETER LAYER
*
OPER    xuser
DATE    12/15/17
TIME    14:27:25
CMNT    
SAMP    
SFOR    
STAG    C
EXPT    PLS
OXS1    TADC
AXS1    B0VL
AXS2    NONE
AXS3    
MWPW    6.411e-08
A1CT    0.3224
B0VL    0.3224
A1SW    0.005
MWFQ    9.670811e+09
AVGS    2
*
************************************************************
*
#DSL	1.0 * DEVICE SPECIFIC LAYER
*

.DVC     acqStart, 1.0


.DVC     cwBridge, 1.0

AcqFineTuning      Never
AcqScanFTuning     Off
AcqSliceFTuning    Off
BridgeCalib        100.0
Power              6.411e-05 mW
PowerAtten         60 dB
QValue             400

.DVC     endor, 1.0

EIEENDORFreq       14.9021800 MHz/3.5 kG
EIEIsotope         H1
EIERFSweepDir      Same
EIEStaticField     3480.000 G
EIEStaticRF        1.000 MHz
ENDORType          EIF
RF1Atten           60.000 dB
RF1FreqPos         1.000 MHz
RF1StartFreq       1.000 MHz
RF1SweepWidth      30.000 MHz
RF2Atten           60.000 dB
RF2FreqPos         1.000 MHz
RF2StartFreq       1.000 MHz
RF2SweepWidth      30.000 MHz
RFSrcMixing        Add
SumAtten           10.000 dB
SumAttenStart      6.000 dB
SumAttenWidth      74.000 dB

.DVC     fieldCtrl, 1.0

AllegroMode        False
CenterField        3224.00 G
Delay              0.0 s
FieldFlyback       On
FieldWait          Wait LED off
GFactor            2.000000
SetToSampleG       False
StaticFieldMon     3480.000 G
SweepDirection     Up
SweepWidth         50.0 G

.DVC     freqCounter, 1.0

FrequencyMon       9.670811 GHz
QMonitBridge       On

.DVC     ftBridge, 1.0

Attenuation        18.00 dB
VideoBW            200 MHz
VideoGain          33 dB

.DVC     ftEpr, 1.0

AutoTimeOut        True
AveragesPerScan    40
ELDORFreqStart     9.300000 GHz
ELDORFreqWidth     0.700000 GHz
FTAcqModeSlct      Run from PulseSPEL
PPExtTrg           False
PPExtTrgSlope      Rising
PlsSPELEXPSlct     2P ESE Field Sweep
PlsSPELGlbTxt      \
;\n\
;       Relaxation package\n\
;\n\
;     PulseSPEL general variables, definitions & conventions\n\
begin defs\n\
\n\
; Variables    ; Comments:\n\
\n\
p2   = 24     ; 90 pulse length selective\n\
p3   = 48     ; 180 pulse length selective\n\
p0   = 24      ; 90 pulse length non selective\n\
p1   = 48      ; 180 pulse length non selective\n\
\n\
;p4   = 14000    ; 90 RF pulse\n\
;p5   = 28000   ; 180 RF pulse  0-250 MHZ amplifier\n\
;p4   = 7500    ; 90 RF pulse\n\
;p5   = 15000   ; 180 RF pulse  0-250 MHZ amplifier\n\
p4   = 25000   \n\
p5   = 50000   \n\
\n\
pg   = 280     ; Integrator Gate Width (RESERVED)\n\
d0   = 300    ; Detection Trigger offset time\n\
\n\
d1   = 3000    ; tau (or initial delay for T2) \n\
\n\
d3   = 1000    ; initial dealy for after inversion pulse\n\
d4   = 20000000 ;\n\
d5   = 40000   ;\n\
\n\
p9   = 2000    ; LED trigger\n\
d9   = 0       ; DAF (Delay After Flash) delay pulse sequence until\n\
               ; after external event (eg. laser pulse)\n\
d8   = 10000000 \n\
\n\
d30  = 2000    ; 1st time scale increment (used for T2)\n\
;d31  = 400000  ; 2nd time scale increment (used for T1)\n\
d31  = 4500000 ; 2nd time scale increment (used for T1)\n\
d20  = 500     ;Nuclear echo increment\n\
d21  = 5000    ;Initial nuclear echo delay\n\
d11  = 0       \n\
\n\
df0  = 5924    ; RF start\n\
df1  = 200     ; RF width\n\
rf1  = 5924  \n\
;rf1 = 52475\n\
\n\
\n\
a    = 10     ; (RESERVED) number of transient averages (TRANS)\n\
               ; if greater than 1024, a must be a multiple of 1024\n\
h    = 40      ; (CONVENTION) number of shots per point (INTG and SPT)\n\
n    = 5      ; (CONVENTION) number of sweeps to accumulate\n\
\n\
srt  = 18000 * srtu ; (RESERVED) SRT - Shot Repetition Time (srtu=1.02 us)\n\
b    = 1       ; SRT increment for SRT Recovery\n\
r    = 10      ; Number of 180 pulses for CP-GM sequence\n\
s    = 1       ;\n\
t    = 1       ;\n\
\n\
w    = 800     ; (CONVENTION) Split point of sweeps (points)\n\
               ; i.e. pulse separation where TWT gate pulse can be split.\n\
dx   = 0       ; (RESERVED) 1st time scale starting value\n\
dy   = 0       ; (RESERVED) 2nd time scale starting value\n\
end defs\n\
\n\
; Note:\n\
;       Variables Marked 'RESERVED' = variable may be used for other times,\n\
;                                       however only this variable can change\n\
;                                        the indicated parameter.\n\
;                                       eg. only 'a' will change the number of\n\
;                                           transients averaged in SpecJet\n
PlsSPELLISTSlct    2-step
PlsSPELPhPrgEx     Normal
PlsSPELPrg         David/starkEffectSi29EC_DG.exp
PlsSPELPrgTxt      \
;\n\
;\n\
; T2 by 2-Pulse Echo Decay\n\
;\n\
;\n\
begin defs              ; dimension of data array [sx,sy]\n\
 dim s[512]             ;       for set-up\n\
 dim1 s[500]            ;       for fieldsweep\n\
 dim2 s[900]            ;       for echo decay\n\
 dim3 s[150]            ;       for ESR Rabi\n\
 dim4 s[90]            ;       for T1 inversion recovery measurement\n\
\n\
 dim5 s[51]            ;       for freqsweep Davies ENDOR\n\
 dim6 s[300]            ;       for Nuclear Rabi\n\
 \n\
 dim7 s[1024]          ;       for scheme B (trans)\n\
 dim8 s[1024]          ;       for scheme B REF (trans)\n\
\n\
 dim9 s[200]          ;       for SchemeB laser decoupling\n\
 \n\
 dim10 s[200]           ;       for scheme B sweep something\n\
\n\
 dim11 s[100]           ;       for Scheme A T2n\n\
 dim12 s[200]           ;       for Scheme A nuclear echo\n\
\n\
 dim13 s[8,10]        ;        for T2n longer than 1s with Scheme A\n\
\n\
 dim14 s[5,500]        ;        for Trigger test\n\
\n\
 dim15 s[4,50]        ;        for T2n longer than 1s with Scheme B\n\
end defs\n\
;\n\
;\n\
begin lists "none"\n\
 ph1 +x\n\
 ph2 +x\n\
 rfp1 0\n\
 asg1 +a\n\
 bsg1 +b\n\
end lists\n\
\n\
begin lists1 "2-step"\n\
 ph1 +x -x\n\
 ph2 +x +x\n\
 rfp1 0\n\
 asg1 +a -a\n\
 bsg1 +b -b\n\
end lists1\n\
\n\
begin lists2 "16-step"\n\
 ph1 +x -x +y -y  +x -x +y -y\n\
 ph2 +x -x +y -y  -x +x -y +y  +y -y -x +x  -y +y +x -x\n\
 rfp1 0\n\
 asg1 +a -a +b -b  +a -a +b -b  -a +a -b +b  -a +a -b +b\n\
 bsg1 +b -b -a +a  +b -b -a +a  -b +b +a -a  -b +b +a -a\n\
end lists2\n\
\n\
begin lists3 "SchemeA PC"\n\
 ph1 +x +x -x -x\n\
 ph2 +x +x +x +x\n\
 rfp1 0 180 0 180\n\
 asg1 -a +a +a -a\n\
 bsg1 -b +b +b -b\n\
end lists3\n\
\n\
begin lists4 "SchemeB PC"\n\
 ph1 +x +x\n\
 ph2 +x +x\n\
 rfp1 180 0\n\
 asg1 -a +a \n\
 bsg1 -b +b \n\
end lists4\n\
\n\
\n\
;\n\
; Standing Echo for 2-Pulse Set-Up\n\
;\n\
begin exp "2P ESE Setup" [TRANS QUAD]\n\
; QUAD detection of Transient\n\
   shot i=1 to a                ; accumulation loop\n\
    p9 [U1]\n\
    d9\n\
    p2 [+x]                    ; 1st pulse and phase program\n\
    d1\n\
    p3 [+x]                    ; 2nd pulse and phase program\n\
    d1\n\
    d0\n\
    dig [sg1]                   ; acquisition\n\
   next i                       ; end of accumulation loop\n\
\n\
end exp\n\
\n\
;\n\
; 2-Pulse Field Sweep\n\
;\n\
begin exp1 "2P ESE Field Sweep" [INTG QUAD]\n\
; QUAD detection with Integration\n\
\n\
 for k=1 to n                   ; averaging loop\n\
  totscans(n)                   ; output of total number of scans\n\
\n\
  bsweep x=1 to sx              ; field sweep loop\n\
   shot i=1 to h                ; accumulation loop \n\
    p9 [U1]\n\
    d9\n\
    p0 [ph1]                    ; 1st pulse and phase program\n\
    d1                          ; tau\n\
    p1 [ph2]                    ; 2nd pulse and phase program\n\
    d1\n\
    d0\n\
    acq [sg1]                   ; acquisition\n\
   next i                       ; end of accumulation loop\n\
\n\
  next x                        ; end of field sweep loop\n\
\n\
  scansdone(k)                  ; output of scans done\n\
 next k                         ; end of averaging loop\n\
\n\
end exp1\n\
\n\
;\n\
; 2-Pulse Echo Decay\n\
;\n\
begin exp2 "2P ESE Decay" [INTG QUAD]\n\
; QUAD detection with Integration\n\
\n\
d10 = 700       \n\
\n\
  totscans(n)                   ; output of total number of scans\n\
\n\
   d3=0                         ; recall starting tau value\n\
   dx=d1+d2                     ; starting tau and assignment of x-axis\n\
\n\
  sweep x=1 to sx               ; tau sweep loop\n\
   shot i=1 to h                ; accumulation loop\n\
    p9 [U1]\n\
    d9\n\
    p2 [ph1]                    ; 1st pulse and phase program\n\
    d1\n\
    d3                          ; tau\n\
    p3 [+x]                     ; 2nd pulse and phase program\n\
    d3\n\
    d1\n\
    d0\n\
    acq [sg1]                   ; acquisition    \n\
   next i                       ; end of accumulation loop\n\
\n\
   d3=d3+d10\n\
   dx=dx+d10                    ; x-axis measured from first pulse\n\
   dx=dx+d10\n\
  next x                        ; end of tau sweep loop\n\
\n\
end exp2\n\
\n\
begin exp3 "ESR Rabi" [INTG QUAD]\n\
; QUAD detection with Integration\n\
\n\
d10 = 12\n\
\n\
  totscans(n)                   ; output of total number of scans\n\
\n\
   p1=0                 ; recall starting tau value\n\
   dx=p1                        ; starting tau and assignment of x-axis\n\
\n\
  sweep x=1 to sx               ; tau sweep loop\n\
   shot i=1 to h                ; accumulation loop\n\
    p9 [U1]\n\
    d9\n\
    p1 [+x]\n\
    d1\n\
    dx\n\
    p2 [ph1]                    ; 1st pulse and phase program\n\
    d1                          ; tau\n\
    p3 [+x]                     ; 2nd pulse and phase program\n\
    d1\n\
    d0                          ; constant acquisition delay\n\
    acq [sg1]                   ; acquisition    \n\
   next i                       ; end of accumulation loop\n\
\n\
   p1=p1+d10\n\
   dx=dx+d10                    ; x-axis measured from first pulse\n\
  next x                        ; end of tau sweep loop\n\
\n\
end exp3\n\
\n\
;\n\
; T1 by inversion recovery\n\
;\n\
begin exp4 "T1 by Inv Rec" [INTG QUAD]\n\
; QUAD detection with Integration\n\
\n\
  d10 = 10000000                  ; store starting tau value\n\
  h = 1\n\
\n\
 for k=1 to n                   ; averaging loop\n\
  totscans(n)                   ; output of total number of scans\n\
\n\
   d3=0                         ; recall starting tau value\n\
   dx=d1                        ; starting tau and assignment of x-axis\n\
\n\
  sweep x=1 to sx               ; tau sweep loop\n\
   shot i=1 to h                ; accumulation loop\n\
    p9 [U1]\n\
    d9\n\
    p3 [+x]                     ; Inversion pulse\n\
    d3\n\
    d1\n\
    p2 [ph1]                    ; 1st pulse and phase program\n\
    d1                          ; tau\n\
    p3 [+x]                     ; 2nd pulse and phase program\n\
    d1\n\
    d0\n\
    acq [sg1]                   ; acquisition\n\
   next i                       ; end of accumulation loop\n\
\n\
   d3=d3+d10\n\
   dx=dx+d10                    ; x-axis measured from first pulse\n\
   next x                       ; end of tau sweep loop\n\
\n\
  scansdone(k)                  ; output of scans done\n\
 next k                         ; end of averaging loop\n\
\n\
end exp4\n\
\n\
\n\
begin exp5 "Davies ENDOR" [INTG QUAD]\n\
; QUAD detection with Integration\n\
\n\
 df0 = 5800                     ;start\n\
 df1 = 200                     ;sweep  \n\
 df3 = sx - 1\n\
 df2 = df1/df3                  ;step \n\
 \n\
 d3 = p5 + 3000\n\
\n\
 for k=1 to n                   ; averaging loop\n\
  totscans(n)                   ; output of total number of scans\n\
  \n\
  rf1 = df0\n\
  dx = df0\n\
\n\
  rfsweep x=1 to sx             ; RF freq sweep loop\n\
   shot i=1 to h                ; accumulation loop   \n\
    p9 [U1]\n\
    d9\n\
    p3 [+x]                     ; Inversion\n\
    d1\n\
    ;p5 [U1]\n\
    p5 [rf1]                    ; ENDOR pulse\n\
    d3\n\
    p2 [ph1]                    ; 1st pulse and phase program\n\
    d1                          ; tau\n\
    p3 [+x]                     ; 2nd pulse and phase program\n\
    d1                          ; tau\n\
    d0\n\
    acq [sg1]                   ; acquisition\n\
    d0\n\
    d1\n\
    p3 [+x]\n\
    d1\n\
    p2 [ph1]\n\
    d3\n\
    ;p5 [U1]\n\
    p5 [rf1]\n\
   next i                       ; end of accumulation loop\n\
\n\
   dx = dx + df2\n\
   rf1 = rf1 + df2\n\
  next x                        ; end of field sweep loop\n\
\n\
  scansdone(k)                  ; output of scans done\n\
 next k                         ; end of averaging loop\n\
\n\
end exp5\n\
\n\
\n\
begin exp6 "Nuclear Rabi" [INTG QUAD]\n\
; QUAD detection with Integration\n\
\n\
 for k=1 to n                   ; averaging loop\n\
  totscans(n)                   ; output of total number of scans\n\
  \n\
  p5 = 0\n\
  dx = p5\n\
  d10 = 500\n\
  d3 = d10*sx\n\
  d3 = d3 + 3000\n\
  d4 = -d0\n\
\n\
  sweep x=1 to sx               ; RF freq sweep loop\n\
   shot i=1 to h                ; accumulation loop   \n\
    p9 [U1]\n\
    d9\n\
    p3 [+x]                     ; Inversion\n\
    d1                          ; Delai after inversion\n\
    p5 [U1]\n\
    p5 [RF1]                    ; ENDOR pulse\n\
    d3\n\
    p2 [ph1]                    ; 1st pulse and phase program\n\
    d1                          ; tau\n\
    p3 [+x]                     ; 2nd pulse and phase program\n\
    d1                          ; tau\n\
    d0\n\
    acq [sg1]                   ; acquisition\n\
    d0\n\
    d1\n\
    p3 [+x]\n\
    d1\n\
    p2 [ph1]\n\
    d3\n\
    p5 [U1]\n\
    p5 [RF1]\n\
   next i                       ; end of accumulation loop\n\
\n\
  dx = dx + d10\n\
  p5 = p5 + d10\n\
  next x                        ; end of field sweep loop\n\
\n\
  scansdone(k)                  ; output of scans done\n\
 next k                         ; end of averaging loop\n\
\n\
end exp6\n\
\n\
\n\
begin exp7 "Scheme B trans" [TRANS QUAD]\n\
;Scheme B\n\
; QUAD detection with Integration\n\
\n\
d4 = 1500000\n\
d6 = p5 + 100\n\
d2 = p3\n\
d7 = p4\n\
\n\
 for k=1 to n                   ; averaging loop\n\
  totscans(n)                   ; output of total number of scans\n\
\n\
   shot i=1 to a                ; accumulation loop \n\
    p9 [U1]\n\
    d9\n\
    p2 [ph1]\n\
    d1\n\
    d6\n\
    p3 [+x]                     ; MW Inversion loop\n\
    d1\n\
    ;p5 [U1]\n\
    p5 [RF1, 0]                    ; RF pi\n\
    d6\n\
    d2 \n\
    p3 [+x]\n\
    d1\n\
    d4\n\
    d10\n\
    ;p5 [U1]\n\
    p5 [RF1, rfp1]                    ; RF pi refocusing\n\
    d10\n\
    d6\n\
    d4\n\
    p3 [+x]\n\
    d1   \n\
    d2\n\
    d7\n\
    ;p5 [U1]\n\
    p5 [RF1, 0]                     ; RF pi back to electron\n\
    d6\n\
    p3 [+x]                     ; MW pi\n\
    d1\n\
    d7\n\
    d6\n\
    d0\n\
    dig [sg1]\n\
   next i                       ; end of accumulation loop\n\
\n\
  scansdone(k)                  ; output of scans done\n\
 next k                         ; end of averaging loop\n\
end exp7\n\
\n\
begin exp8 "Scheme B REF" [TRANS QUAD]\n\
;Scheme B\n\
; QUAD detection with Integration\n\
\n\
d3 = 980;    ; Random number to avoid stimulated echo\n\
d4 = 8000\n\
d6 = p5+100     \n\
d8 = p1   \n\
d7 = 238000      \n\
\n\
 for k=1 to n                   ; averaging loop\n\
  totscans(n)                   ; output of total number of scans\n\
\n\
   shot i=1 to a                ; accumulation loop     \n\
    p1 [+x]\n\
    d7\n\
    d1\n\
    d6\n\
    d1\n\
    d6\n\
    d3\n\
    p1 [+x]                     ; MW Inversion loop\n\
    d1   \n\
    d6\n\
    d1\n\
    d6\n\
    d3\n\
    d0\n\
    d8\n\
    dig [sg1]                   ; acquisition\n\
    d1\n\
    p0 [+x]\n\
    d3\n\
    d1\n\
    p1 [+x]    \n\
   next i                       ; end of accumulation loop\n\
\n\
  scansdone(k)                  ; output of scans done\n\
 next k                         ; end of averaging loop\n\
end exp8\n\
\n\
\n\
begin exp9 "SchemeB laser decoupling" [INTG QUAD]\n\
d4 = 3100\n\
d6 = p5 + 100\n\
d2 = p3\n\
d7 = p4\n\
d10 = 10000000            ; step size\n\
\n\
d30 = 2\n\
d11 = 20160/d30\n\
d11 = d11*100\n\
d12 = d30*d11\n\
\n\
 for k=1 to n                   ; averaging loop\n\
  totscans(n)                   ; output of total number of scans\n\
\n\
  p8 = 0\n\
  d3 = d30*1000\n\
  dx = d30*d3\n\
\n\
 sweep x=1 to sx\n\
   shot i=1 to h                ; accumulation loop\n\
    p9 [U1]\n\
    d9\n\
    p2 [ph1]\n\
    d1\n\
    d6\n\
    p3 [+x]                     ; MW Inversion loop\n\
    d1\n\
    p5 [U1]\n\
    p5 [RF1]                    ; RF pi\n\
    d6\n\
    d2 \n\
    p3 [+x]\n\
    d1\n\
    d4\n\
\n\
    ;p8 [U1]\n\
\n\
    p1 [+y]\n\
    d3\n\
\n\
\n\
    ;d10\n\
\n\
    p5 [U1]\n\
    p5 [RF1]                    ; RF pi refocusing\n\
    d6\n\
\n\
    ;p8 [U1]\n\
    ;d10\n\
\n\
    p1 [+y]\n\
    d3\n\
\n\
    d4\n\
    p3 [+x]\n\
    d1   \n\
    d2\n\
    d7\n\
    p5 [U1]\n\
    p5 [RF1]                     ; RF pi back to electron\n\
    d6\n\
    p3 [+x]                     ; MW pi\n\
    d1\n\
    d7\n\
    d6\n\
    d0\n\
    acq [sg1]                   ; acquisition\n\
   next i                       ; end of accumulation loop\n\
\n\
   ;p8 = p8 + d11\n\
   ;dx = dx + d11\n\
   ;dx = dx + d11\n\
\n\
   dx = dx + d12\n\
   d3 = d3 + d11\n\
  \n\
   next x\n\
  scansdone(k)                  ; output of scans done\n\
 next k                         ; end of averaging loop\n\
end exp9\n\
\n\
begin exp10 "Scheme B sweep" [INTG QUAD]\n\
;Scheme B\n\
; QUAD detection with Integration\n\
d4 = 3100\n\
d6 = p5 + 100\n\
d2 = p3\n\
d7 = p4\n\
d11 = 2200000            ; step size\n\
\n\
 for k=1 to n                   ; averaging loop\n\
  totscans(n)                   ; output of total number of scans\n\
\n\
  d10 = 0                       ; starting value of d10\n\
  dx = d6+d2\n\
  dx = dx+d1\n\
  dx = dx+d4\n\
  dx = dx+d10\n\
  dx = 2*dx\n\
\n\
 sweep x=1 to sx\n\
   shot i=1 to h                ; accumulation loop\n\
    p9 [U1]\n\
    d9\n\
    p2 [ph1]\n\
    d1\n\
    d6\n\
    p3 [+x]                     ; MW Inversion loop\n\
    d1\n\
    p5 [U1]\n\
    p5 [RF1]                    ; RF pi\n\
    d6\n\
    d2 \n\
    p3 [+x]\n\
    d1\n\
    d4\n\
    d10\n\
    p5 [U1]\n\
    p5 [RF1]                    ; RF pi refocusing\n\
    d10\n\
    d6\n\
    d4\n\
    p3 [+x]\n\
    d1   \n\
    d2\n\
    d7\n\
    p5 [U1]\n\
    p5 [RF1]                     ; RF pi back to electron\n\
    d6\n\
    p3 [+x]                     ; MW pi\n\
    d1\n\
    d7\n\
    d6\n\
    d0\n\
    acq [sg1]                   ; acquisition\n\
   next i                       ; end of accumulation loop\n\
\n\
   d10 = d10 + d11\n\
   dx = dx + d11\n\
   dx = dx + d11\n\
   next x\n\
  scansdone(k)                  ; output of scans done\n\
 next k                         ; end of averaging loop\n\
end exp10\n\
\n\
begin exp11 "Scheme A T2n" [INTG QUAD]\n\
 d5 = p5 + 1000\n\
 d7 = p4\n\
 ;d7 = -10000\n\
 \n\
 d13 = 2                ;pi pulse number\n\
 d11 = 2200000\n\
 d12 = d13*d11\n\
\n\
 for k=1 to n                   ; averaging loop\n\
  totscans(n)                   ; output of total number of scans\n\
\n\
  ; t2n\n\
  d6 = 890000000\n\
  d10 = p5 + 15000\n\
  dx = d13*d10\n\
  d6 = d6-dx\n\
\n\
  sweep x=1 to sx\n\
   shot i=1 to h                ; accumulation loop     \n\
    p9 [U1]\n\
    d9\n\
    p3 [+x]\n\
    d1\n\
    p4 [U1]\n\
    p4 [RF1,rfp1]\n\
    ;d10\n\
    ;p5 [U1]\n\
    ;p5 [RF1,0]\n\
    ;d10\n\
    d10\n\
    p5 [U1]\n\
    p5 [RF1,0]\n\
    d10\n\
    d7    ;from nuc echo position\n\
    p4 [U1]\n\
    p4 [RF1,0]\n\
    d6\n\
    p2 [ph1]\n\
    d1\n\
    p3 [+x]\n\
    d1\n\
    d0\n\
    acq [sg1]\n\
    d0 \n\
    d1\n\
    p3 [+x]\n\
    d1\n\
    p2 [ph1]\n\
    d5\n\
    p4 [U1]\n\
    p4 [RF1,rfp1]\n\
   next i                       ; end of accumulation loop\n\
  dx = dx + d12\n\
  d10 = d10 + d11\n\
  d6 = d6 - d12\n\
\n\
  next x\n\
  scansdone(k)                  ; output of scans done\n\
 next k                         ; end of averaging loop\n\
end exp11\n\
\n\
begin exp12 "Scheme A NucEcho" [INTG QUAD]\n\
 d5 = p5 + 1000\n\
 d7 = 500000\n\
 \n\
 d11 = 5000   ;step\n\
\n\
 for k=1 to n                   ; averaging loop\n\
  totscans(n)                   ; output of total number of scans\n\
\n\
  d10 = p5 + 3000\n\
  dx = d10\n\
  d6 = 4000000\n\
\n\
  sweep x=1 to sx\n\
   shot i=1 to h                ; accumulation loop     \n\
    p9 [U1]\n\
    d9\n\
    p3 [+x]\n\
    d1\n\
    p4 [U1]\n\
    p4 [RF1,rfp1]\n\
    d5\n\
    d7\n\
    ;p5 [U1]\n\
    ;p5 [RF1,0]\n\
    ;d5\n\
    ;d7\n\
    ;d5\n\
    ;d7\n\
    p5 [U1]\n\
    p5 [RF1,0]\n\
    d10\n\
    p4 [U1]\n\
    p4 [RF1,0]\n\
    d6\n\
    p2 [ph1]\n\
    d1\n\
    p3 [+x]\n\
    d1\n\
    d0\n\
    acq [sg1]\n\
    d0 \n\
    d1\n\
    p3 [+x]\n\
    d1\n\
    p2 [ph1]\n\
    d5\n\
    p4 [U1]\n\
    p4 [RF1,rfp1]\n\
   next i                       ; end of accumulation loop\n\
  dx = dx + d11\n\
  d10 = d10 + d11\n\
  d6 = d6 - d11\n\
\n\
  next x\n\
  scansdone(k)                  ; output of scans done\n\
 next k                         ; end of averaging loop\n\
end exp12\n\
\n\
\n\
begin exp13 "Long T2n Scheme A" [INTG QUAD EXT]\n\
;Scheme B\n\
; QUAD detection with Integration\n\
srt = 10000*srtu\n\
d7 = 14000\n\
d9 = 30000\n\
\n\
d5 = p5 + 1000\n\
d3 = 500000;    ; Random number to avoid stimulated echo\n\
d4 = 3100\n\
d6 = p5 + 100\n\
d8 = p1\n\
d2 = p3\n\
d11 = 333            ; step size\n\
\n\
for k=1 to n                   ; averaging loop\n\
totscans(n)                   ; output of total number of scans\n\
  \n\
 h = 1\n\
 m = 2*sy\n\
 m = m + 1\n\
 dy = 4*d11\n\
\n\
 ;m = 1\n\
 ;dy = 0\n\
 for y = 1 to sy\n\
\n\
  ;LED relaxation\n\
   x = 1\n\
   shot i=1 to 2\n\
    p9 [U1]\n\
    d9\n\
    acq [sg1]\n\
   next i\n\
\n\
  ;Preparation: electron -> nuclear transfer\n\
  x = 2\n\
  shot i = 1 to 1\n\
    p3 [+x]\n\
    d1\n\
    p4 [U1]\n\
    p4 [RF1,0]\n\
    d5\n\
    acq [sg1]\n\
  next i\n\
\n\
  ;First wait SPP*tau\n\
  x = 3\n\
  shot i = 1 to h\n\
    acq [sg1] \n\
  next i\n\
\n\
  ;Refocusing pulse\n\
  x = 4\n\
  shot i = 1 to 1\n\
    d5\n\
    p5 [U1]\n\
    p5 [RF1]\n\
    d5\n\
    acq [sg1] \n\
  next i\n\
  \n\
  ;Second wait SPP*tau\n\
  x = 5\n\
  shot i = 1 to h\n\
    acq [sg1]  \n\
  next i\n\
\n\
  ;Measurement: nuclear -> electron transfer\n\
  x = 6\n\
  shot i=1 to 1\n\
    p4 [U1]\n\
    p4 [RF1,0]\n\
    d5\n\
    acq [sg1] \n\
  next i\n\
\n\
  x = 7\n\
  shot i = 1 to m\n\
    acq [sg1]  \n\
  next i\n\
\n\
  x = 8\n\
  shot i=1 to 1\n\
    p2 [ph1]\n\
    d1\n\
    p3 [+x]\n\
    d1\n\
    d0\n\
    acq [sg1]\n\
    d0 \n\
    d1\n\
    p3 [+x]\n\
    d1\n\
    p2 [ph1]\n\
    d5\n\
    p4 [U1]\n\
    p4 [RF1,rfp1]\n\
  next i\n\
\n\
  m = m - 2\n\
  h = h + 1\n\
  dy = dy + d11\n\
  dy = dy + d11\n\
\n\
  ;dy = dy + 3000\n\
 next y\n\
\n\
scansdone(k)                  ; output of scans done\n\
next k                         ; end of averaging loop\n\
end exp13\n\
\n\
begin exp14 "Trigger test" [INTG QUAD EXT]\n\
;Scheme B\n\
; QUAD detection with Integration\n\
srt = 10000*srtu\n\
d9 = 10000\n\
for k=1 to n                   ; averaging loop\n\
totscans(n)                   ; output of total number of scans\n\
  \n\
 for y = 1 to sy\n\
  \n\
  ;LED relaxation\n\
  x = 1\n\
   shot i=1 to 1\n\
    p9 [U1]\n\
    d9\n\
    acq [sg1]\n\
   next i\n\
\n\
  x = 2\n\
   shot i=1 to 1\n\
    p9 [U1]\n\
    d9\n\
    acq [sg1]\n\
   next i\n\
\n\
    x = 3\n\
   shot i=1 to 1\n\
    p9 [U1]\n\
    d9\n\
    acq [sg1]\n\
   next i\n\
\n\
  x = 4\n\
   shot i=1 to 1\n\
    p9 [U1]\n\
    d9\n\
    acq [sg1]\n\
   next i\n\
\n\
 x = 5\n\
   shot i=1 to 1\n\
    acq [sg1]\n\
   next i\n\
next y\n\
scansdone(k)                  ; output of scans done\n\
next k                         ; end of averaging loop\n\
end exp14\n\
\n\
\n\
begin exp15 "Long T2n Scheme B 2" [INTG QUAD EXT]\n\
;Scheme B\n\
; QUAD detection with Integration\n\
srt = 150000*srtu\n\
d7 = 14000\n\
h = 1;\n\
d9 = 6000000\n\
\n\
d3 = 500000;    ; Random number to avoid stimulated echo\n\
d4 = 3100\n\
d6 = p5 + 100\n\
d8 = p1\n\
d2 = p3\n\
d11 = 1100000            ; step size\n\
\n\
for k=1 to n                   ; averaging loop\n\
totscans(n)                   ; output of total number of scans\n\
  \n\
 dy = 0\n\
 for y = 1 to sy\n\
  \n\
  ;LED relaxation\n\
  x = 1\n\
   shot i=1 to 1\n\
    p9 [U1]\n\
    d9\n\
    acq [sg1]\n\
   next i\n\
\n\
  ;Preparation: electron -> nuclear transfer\n\
  x = 2\n\
  shot i = 1 to 1\n\
    p2 [ph1]\n\
    d1\n\
    d6\n\
    p3 [+x]                     ; MW Inversion loop\n\
    d1\n\
    p5 [U1]\n\
    p5 [RF1]                    ; RF pi\n\
    d6\n\
    d2 \n\
    p3 [+x]\n\
    d1\n\
    acq [sg1]\n\
  next i\n\
\n\
  ;Refocusing pulse\n\
  x = 3\n\
  shot i = 1 to 1\n\
    d10\n\
    d7\n\
    ;dy\n\
    p5 [U1]\n\
    p5 [RF1]\n\
    d5\n\
    acq [sg1] \n\
  next i\n\
\n\
  ;Measurement: nuclear -> electron transfer\n\
  x = 4\n\
  shot i=1 to 1\n\
    d10\n\
    p3 [+x]\n\
    d1   \n\
    d2\n\
    p5 [U1]\n\
    p5 [RF1]                     ; RF pi back to electron\n\
    d6\n\
    p3 [+x]                     ; MW pi\n\
    d1\n\
    d6\n\
    d0\n\
    acq [sg1]  \n\
  next i\n\
\n\
 d10 = d10 + d11\n\
 dy = dy + d11\n\
 dy = dy + d11\n\
 ;dy = dy + 1200\n\
 next y\n\
\n\
scansdone(k)                  ; output of scans done\n\
next k                         ; end of averaging loop\n\
end exp15\n\
\n
Psd1               0,0,268,3268,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,28,52,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd10              0,276,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd11              0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd12              0,276,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd13              0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd14              0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd15              0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd16              0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd17              0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd18              0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd19              0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd2               0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd20              0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd21              0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd22              0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd23              0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd24              0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd25              0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd26              0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd27              0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd28              0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd3               0,0,140,3140,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,724,748,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd4               0,0,8,3008,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,208,232,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd5               0,0,6300,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,280,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd6               0,276,3276,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,48,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd7               0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd8               0,276,276,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,24,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd9               0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
QuadDetect         True
RF1Prg             0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000
RF2Prg             0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000
ReplaceMode        Off
ShotRepTime        18360.00 us
ShotsPLoop         40
SptProgress        100 %
StochMode          False
SweepsPExp         5
TriggerTimeOut     413 s
XAxisQuant         Time
XSpecRes           500
YAxisQuant         Magnetic Field
YSpecRes           1

.DVC     recorder, 1.0

BaselineCorr       Off
NbScansAcc         2
NbScansDone        2
NbScansToDo        5
ReplaceMode        Off
SmoothMode         Auto
SmoothPoints       1

.DVC     routeTrg, 1.0


.DVC     sigChanSmall, 1.0


.DVC     transRec, 1.0


*
************************************************************
