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
XPTS	101
XMIN	10000.000000
XWID	800000.000000
*
*	Documentational Text:
*
TITL	'90_NatP_T2_20mW_1080.28_ND4.6_8k'
IRNAM	'Intensity'
IINAM	'Intensity'
XNAM	'Time'
IRUNI	''
IIUNI	''
XUNI	'ns'
*
************************************************************
*
#SPL	1.2 * STANDARD PARAMETER LAYER
*
OPER    xuser
DATE    01/03/18
TIME    18:17:07
CMNT    
SAMP    
SFOR    
STAG    C
EXPT    PLS
OXS1    TADC
AXS1    B0VL
AXS2    NONE
AXS3    
MWPW    3.944e-08
A1CT    0.32811
B0VL    0.328112
A1SW    0.001
MWFQ    9.78101e+09
AVGS    1
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
Power              3.944e-05 mW
PowerAtten         60 dB
QValue             300

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
CenterField        3281.10 G
Delay              0.0 s
FieldFlyback       On
FieldWait          Wait LED off
GFactor            2.000000
SetToSampleG       False
StaticFieldMon     3480.000 G
SweepDirection     Up
SweepWidth         10.0 G

.DVC     freqCounter, 1.0

FrequencyMon       9.781010 GHz
QMonitBridge       On

.DVC     ftBridge, 1.0

Attenuation        16.30 dB
VideoBW            200 MHz
VideoGain          42 dB

.DVC     ftEpr, 1.0

AutoTimeOut        True
AveragesPerScan    1
ELDORFreqStart     9.300000 GHz
ELDORFreqWidth     0.700000 GHz
FTAcqModeSlct      Run from PulseSPEL
PPExtTrg           False
PPExtTrgSlope      Rising
PlsSPELEXPSlct     2P ESE Decay
PlsSPELGlbTxt      \
;    \n\
; PulseSPEL general variables, definitions & convention\n\
;\n\
begin defs\n\
;                                                         Oct 2007, JJLM AMT\n\
; Variables    ; Comments:\n\
               ;\n\
p0   = 24      ; 90 pulse length\n\
p1   = 48      ; 180 pulse length  \n\
p2   = 4       ; 360 pulse length\n\
p10  = 6400   ; RF 90 pulse length\n\
p11  = 12800   ; RF 180pulse length\n\
p22  = 2000    ; Trigger pulse length\n\
d10  = 32000   ;\n\
               ;\n\
pg   = 208    ; Intergrator Gate Width\n\
               ;\n\
d0   = 300     ; data trigger offset time\n\
d1   = 5000     ; ESE tau for detection\n\
d2   = 10000     ; ESE tau for initiation\n\
               ;\n\
d3   = 1000000  ; Position of RF coh-transfer wrt ESE echo\n\
d4   = 1500000    ; Position of MW coh-transfer wrt RF\n\
               ;\n\
d5   = 100000  ; initial tau for nuclear echo\n\
d15  = 3200000 ; nuclear tau increment\n\
\n\
d12  = 10000 ; delay before RF pulse\n\
d21  = 1000 ; increment RF pulse for nuclear Rabi\n\
\n\
d29  = 4000       ; increment T1e inversion recovery tau\n\
d30  = 4000      ; increment T2e electron spin echo tau\n\
d31  = 400000     ; increment theta for instantaneous diffusion 400000, 15000\n\
\n\
\n\
d6   = 9000    ; nuclear echo detection offset\n\
d8   = 800     ; delay between MW transfer-back and RF\n\
d9   = 5000       ; No flash\n\
               ;\n\
dx   = 40      ; t2 time scale starting value\n\
dy   = 0       ; t1 time scale starting value\n\
d18  = 5000    \n\
d19  = 0       \n\
               ;\n\
;df1  = 125220  ; Resonance RF 52435/65173\n\
df11 = 6       \n\
df1  = 91500   \n\
; df final is 94.5MHz - 3MHz wide, 6kHz pp = 500pts, 30us pulse = 5p per \n\
     \n\
               ;\n\
h    = 1      ; number of shots/loop                     ( counter: I )\n\
n    = 1      ; number of sweeps to accumulate           ( counter: K )\n\
s    = 10000   ; Sweep length (n. of data really taken)   ( counter: X )\n\
t    = 100     ; second time axsis sweep length           ( counter: Y )\n\
m    = 7       ; number of pi pulses in CPMG sequence\n\
a    = 100     ; 30720 76800number of transient averages\n\
               \n\
srt  = 40000 * srtu ; shot repetition time, srtu = 1usec\n\
r    = 1       ;\n\
c    = 1       ;\n\
b    = 1       ;\n\
               ;\n\
w    = 800     ; Split point of sweeps (ns) ,i.e. pulse separatrion where\n\
               ; TWT gate pulse can be split.\n\
;\n\
end defs\n\
\n
PlsSPELLISTSlct    2-step
PlsSPELPhPrgEx     Normal
PlsSPELPrg         David/starkEffectPhosEndorCoherence.exp
PlsSPELPrgTxt      \
;\n\
;\n\
; Relaxation Experiments\n\
;\n\
;325\n\
begin defs		; dimension of data array [sx,sy]\n\
 dim s[2048]		; 	for set-up\n\
 dim1 s[101]		; 	for fieldsweep\n\
 dim2 s[101]		; 	for echo decay\n\
 dim3 s[512,128]	; 	for echo decay vs. field\n\
 dim4 s[101]		; 	inversion recovery\n\
 dim5 s[1000]             ;       flash delay\n\
 dim6 s[101]       ;       Nuclear Stark\n\
 dim7 s[100]            ;       T2 decay using XYXY\n\
 dim8 s[101]		; 	for stark integration\n\
 dim9 s[100]            ; four pulse\n\
 dim10 s[101]           ; Endor Frequency Sweep\n\
 dim11 s[101]           ; Nuclear Rabi\n\
 dim12 s[101]           ; Electron Rabi\n\
 dim13 s[101]           ; Nuc Ramsay  pulse\n\
 dim14 s[101]           ; Nuc Coherence Stark\n\
end defs\n\
;\n\
;\n\
begin lists "+x none" \n\
 ph1 +x \n\
 ph2 +x\n\
 ph3 u1 \n\
 asg1 +a \n\
 bsg1 +b \n\
end lists \n\
 \n\
begin lists1 "-x none" \n\
 ph1 -x \n\
 ph2 +x\n\
 ph3 u1 \n\
 asg1 -a \n\
 bsg1 -b \n\
end lists1 \n\
 \n\
begin lists2 "2-step" \n\
 ph1 +x -x \n\
 ph2 +x +x\n\
 ph3 u1 \n\
 asg1 +a -a \n\
 bsg1 +b -b \n\
end lists2 \n\
 \n\
begin lists3 "16-step" \n\
 ph1 +x -x +y -y  +x -x +y -y \n\
 ph2 +x -x +y -y  -x +x -y +y  +y -y -x +x  -y +y +x -x \n\
 asg1 +a -a +b -b  +a -a +b -b  -a +a -b +b  -a +a -b +b \n\
 bsg1 +b -b -a +a  +b -b -a +a  -b +b +a -a  -b +b +a -a \n\
end lists3 \n\
 \n\
begin lists4 "xyxy"\n\
 ph1 +x -x\n\
 asg1 -a +a\n\
 bsg1 -b +b\n\
end lists4\n\
\n\
 \n\
; \n\
; Standing Echo for 2-Pulse Set-Up \n\
; \n\
begin exp "2P ESE Setup" [TRANS QUAD ] \n\
	; QUAD detection of Transient \n\
 \n\
;d29=p29+1000 \n\
;d28=1200000 \n\
;p29=1000000 \n\
;rf2=df2 \n\
\n\
 for k=1 to n			; averaging loop \n\
  totscans(n)			; output of total number of scans \n\
    shot i=1 to a		; accumulation loop \n\
      p22 [u1]                  ; Trigger pulse\n\
      d9			; DAF (Delay After Flash) \n\
      p0 [ph1]			; 1st pulse and phase program\n\
      d1			; tau \n\
      p1 [ph2]			; 2nd pulse and phase program \n\
      d1			; tau \n\
      d0			; constant acquisition delay \n\
      dig [sg1]			; acquisition \n\
      ;d28			; laser delay \n\
      ;p29 [RF2]			; laser pulse \n\
      ;d29			; \n\
    next i			; end of accumulation loop \n\
 \n\
 scansdone(k)			; output of scans done \n\
 next k	\n\
end exp \n\
  \n\
; \n\
; Standing Echo for 4-Pulse Set-Up \n\
; \n\
\n\
\n\
begin exp8 "Stark Integration" [INTG QUAD] \n\
	; QUAD detection of Transient \n\
\n\
 for k=1 to n			; averaging loop \n\
  totscans(n)			; output of total number of scans \n\
 \n\
  dx=d9				; starting delay time and assignment of x-axis \n\
  ;d0=1500			; for FID detection \n\
 \n\
   sweep x=1 to sx		; time sweep loop \n\
    shot i=1 to h		; accumulation loop \n\
      ;d9			; DAF (Delay After Flash) \n\
      ;dx			; delay between inversion and detection\n\
      p22 [u1]         \n\
      p0 [ph1]			; detection sequence pulse 1 \n\
      d1			; tau \n\
      p1 [ph2]			; detection sequence pulse 2 \n\
      d1			; tau \n\
      d0			; constant acquisition delay \n\
      acq [sg1]			; acquisition\n\
      ;d9\n\
      ;dx \n\
    next i			; end of accumulation loop \n\
 \n\
    dx=dx+d31			; increment delay time\n\
     \n\
   next x			; end of time sweep loop \n\
 \n\
  scansdone(k)			; output of scans done \n\
 next k				; end of averaging loop \n\
 \n\
end exp8\n\
\n\
begin exp9 "Stark Integration 4 pulse" [INTG QUAD] \n\
	; QUAD detection of Transient \n\
\n\
 for k=1 to n			; averaging loop \n\
  totscans(n)			; output of total number of scans \n\
 \n\
  dx=d9				; starting delay time and assignment of x-axis \n\
  ;d0=1500			; for FID detection \n\
 \n\
   sweep x=1 to sx		; time sweep loop \n\
    shot i=1 to h		; accumulation loop \n\
      ;d9			; DAF (Delay After Flash) \n\
      ;dx			; delay between inversion and detection\n\
      ;p22 [u1]         \n\
      p0 [ph1]			; detection sequence pulse 1 \n\
      d1			; tau \n\
      p1 [+y]			; detection sequence pulse 2\n\
      p22 [u1]                  ; trigger pulse \n\
      d1			; tau\n\
      d1\n\
      p1 [+y]                  ; pi 2\n\
      ;p22 [u1]                  ;trigger pulse\n\
      d1                        ; tau\n\
      d1\n\
      p1 [+y]                  ; pi 3\n\
      p22 [u1]                  ; trigger pulse\n\
      d1                        ; tau\n\
      d1\n\
      p1 [+y]                  ; pi 4\n\
      ;p22 [u1]\n\
      d1                        ; tau \n\
      d0			; constant acquisition delay \n\
      acq [sg1]			; acquisition\n\
      ;d9\n\
      ;dx \n\
    next i			; end of accumulation loop \n\
 \n\
    dx=dx+d31			; increment delay time\n\
     \n\
   next x			; end of time sweep loop \n\
 \n\
  scansdone(k)			; output of scans done \n\
 next k				; end of averaging loop \n\
 \n\
end exp9\n\
\n\
; 2-Pulse Field Sweep \n\
; \n\
begin exp1 "2P ESE Field Sweep" [INTG QUAD ] \n\
	; QUAD detection with Integration \n\
 \n\
rf2=df2 \n\
 \n\
 for k=1 to n			; averaging loop \n\
  totscans(n)			; output of total number of scans \n\
 \n\
  bsweep x=1 to sx		; field sweep loop \n\
    shot i=1 to h		; accumulation loop \n\
      d9			; DAF (Delay After Flash) \n\
      p0 [ph1]			; 1st pulse and phase program\n\
      p22 [u1]                  ; Trigger pulse \n\
      d1			; tau \n\
      p1 [ph2]			; 2nd pulse and phase program \n\
      d1			; tau \n\
      d0			; constant acquisition delay \n\
      acq [sg1]			; acquisition \n\
      d28			; laser delay \n\
      p29 [RF2]			; laser pulse \n\
      d29			; \n\
    next i			; end of accumulation loop \n\
 \n\
   next x			; end of field sweep loop \n\
 \n\
  scansdone(k)			; output of scans done \n\
 next k				; end of averaging loop \n\
 \n\
end exp1 \n\
 \n\
; \n\
; 2-Pulse Echo Decay \n\
; \n\
begin exp2 "2P ESE Decay" [INTG QUAD ] \n\
	; QUAD detection with Integration \n\
 \n\
 ;rf2=df2 \n\
 \n\
 d2=d1				; store starting tau value \n\
 \n\
 for k=1 to n			; averaging loop \n\
  totscans(n)			; output of total number of scans \n\
 \n\
  d1=d2				; recall starting tau value \n\
  dx=d1				; starting tau and assignment of x-axis \n\
  dx=dx+d1 \n\
 \n\
   sweep x=1 to sx		; tau sweep loop \n\
    shot i=1 to h		; accumulation loop \n\
      d9			; DAF (Delay After Flash) \n\
      p0 [ph1]			; 1st pulse and phase program\n\
      p22 [u1]                  ; \n\
      d1			; tau \n\
      p1 [ph2]			; 2nd pulse and phase program \n\
      d1			; tau \n\
      d0			; constant acquisition delay \n\
      acq [sg1]			; acquisition \n\
    next i     			; end of accumulation loop \n\
 \n\
    d1=d1+d30 \n\
    dx=dx+d30			; x-axis measured from first pulse \n\
    dx=dx+d30 \n\
   next x			; end of tau sweep loop \n\
 \n\
  scansdone(k)			; output of scans done \n\
 next k				; end of averaging loop \n\
 \n\
end exp2 \n\
 \n\
; \n\
; 2-Pulse Echo Decay versus Magnetic Field \n\
; \n\
begin exp3 "2P ESE Decay vs. B0" [INTG QUAD] \n\
	; QUAD detection with Integration \n\
 \n\
 d2=d1				; store starting tau value \n\
 \n\
 for k=1 to n			; averaging loop \n\
  totscans(n)			; output of total number of scans \n\
 \n\
  bsweep y=1 to sy		; field sweep loop \n\
  d1=d2				; recall starting tau value \n\
  dx=d1				; starting tau and assignment of x-axis \n\
 \n\
   sweep x=1 to sx		; tau sweep loop \n\
    shot i=1 to h		; accumulation loop \n\
      d9			; DAF (Delay After Flash) \n\
      p0 [ph1]			; 1st pulse and phase program \n\
      d1			; tau \n\
      p1 [ph2]			; 2nd pulse and phase program \n\
      d1			; tau \n\
      d0			; constant acquisition delay \n\
      acq [sg1]			; acquisition \n\
    next i			; end of accumulation loop \n\
 \n\
    d1=d1+d30 \n\
    dx=dx+d30			; x-axis defined from first pulse \n\
    dx=dx+d30			; \n\
   next x			; end of tau sweep loop \n\
 \n\
  next y			; end of field sweep loop \n\
 \n\
  scansdone(k)			; output of scans done \n\
 next k				; end of averaging loop \n\
 \n\
end exp3 \n\
 \n\
begin exp4 "Inversion Recovery" [INTG QUAD ] \n\
	; QUAD detection with Integration \n\
 \n\
 for k=1 to n			; averaging loop \n\
  totscans(n)			; output of total number of scans \n\
 \n\
  dx=d2				; starting delay time and assignment of x-axis \n\
  ;d0=1500			; for FID detection \n\
 \n\
   sweep x=1 to sx		; time sweep loop \n\
    shot i=1 to h		; accumulation loop \n\
      d9			; DAF (Delay After Flash) \n\
      p1 [ph2]			; inversion pulse\n\
      p22 [u1]                  ; Trigger pulse \n\
      dx			; delay between inversion and detection \n\
      p0 [ph1]			; detection sequence pulse 1 \n\
      d1			; tau \n\
      p1 [+x]			; detection sequence pulse 2 \n\
      d1			; tau \n\
      d0			; constant acquisition delay \n\
      acq [sg1]			; acquisition \n\
    next i			; end of accumulation loop \n\
 \n\
    dx=dx+d31			; increment delay time \n\
   next x			; end of time sweep loop \n\
 \n\
  scansdone(k)			; output of scans done \n\
 next k				; end of averaging loop \n\
 \n\
end exp4 \n\
 \n\
begin exp5 "FlashDelay" [INTG QUAD EXT] \n\
	; QUAD detection with Integration \n\
 \n\
 for k=1 to n			; averaging loop \n\
  totscans(n)			; output of total number of scans \n\
 \n\
  dx=d2				; starting delay time and assignment of x-axis \n\
  ;d0=1500			; for FID detection \n\
 \n\
   sweep x=1 to sx		; time sweep loop \n\
    shot i=1 to h		; accumulation loop \n\
      d9			; DAF (Delay After Flash) \n\
      dx			; delay between inversion and detection \n\
      p0 [ph1]			; detection sequence pulse 1 \n\
      d1			; tau \n\
      p1 [ph2]			; detection sequence pulse 2 \n\
      d1			; tau \n\
      d0			; constant acquisition delay \n\
      acq [sg1]			; acquisition \n\
    next i			; end of accumulation loop \n\
 \n\
    dx=dx+d31			; increment delay time \n\
   next x			; end of time sweep loop \n\
 \n\
  scansdone(k)			; output of scans done \n\
 next k				; end of averaging loop \n\
 \n\
end exp5 \n\
 \n\
 \n\
; \n\
begin exp7 "2P ESE Decay XYXY" [INTG QUAD] \n\
	; QUAD detection with Integration \n\
 \n\
 ;rf2=df2 \n\
 \n\
 d2=d1				; store starting tau value \n\
 d31=d29*8 \n\
 \n\
 for k=1 to n			; averaging loop \n\
  totscans(n)			; output of total number of scans \n\
 \n\
  d1=d2				; recall starting tau value \n\
  dx=d1				; starting tau and assignment of x-axis \n\
  dx=dx+d1 \n\
 \n\
   sweep x=1 to sx		; tau sweep loop \n\
    shot i=1 to h		; accumulation loop \n\
      d9			; DAF (Delay After Flash) \n\
      p0 [ph1]			; 1st pulse and phase program \n\
      d1			; tau \n\
      p1 [+y]			; 2nd pulse and phase program \n\
      d1			; tau \n\
      d1			; tau \n\
      p1 [+y]			; 2nd pulse and phase program \n\
      d1			; tau \n\
      d1			; tau \n\
      p1 [+y]			; 2nd pulse and phase program \n\
      d1			; tau \n\
      d1			; tau \n\
      p1 [+y]			; 2nd pulse and phase program \n\
      d1			; tau \n\
 \n\
      d0			; constant acquisition delay \n\
      acq [sg1]			; acquisition \n\
 \n\
      ;d28			; laser delay \n\
      ;p29 [RF2]			; laser pulse \n\
      ;d29			 \n\
    next i     			; end of accumulation loop \n\
 \n\
    d1=d1+d29 \n\
    dx=dx+d31			; x-axis measured from first pulse \n\
   next x			; end of tau sweep loop \n\
 \n\
  scansdone(k)			; output of scans done \n\
 next k				; end of averaging loop \n\
 \n\
end exp7 \n\
\n\
begin exp10 "Endor Frequency Sweep" [INTG QUAD]\n\
\n\
df0 = 65050\n\
df1 = 200\n\
df3 = sx - 1\n\
df2 = df1/df3\n\
\n\
for k=1 to n			; averaging loop \n\
  totscans(n)			; output of total number of scans \n\
\n\
  rf1 = df0\n\
  dx = df0\n\
 \n\
 \n\
  \n\
 \n\
   rfsweep x=1 to sx		; time sweep loop \n\
    shot i=1 to h		; accumulation loop \n\
      d9			; DAF (Delay After Flash) \n\
      p1 [ph2]			; inversion pulse\n\
      p22 [u1]                  ; Trigger pulse\n\
      d12\n\
      p11 [RF1]                 ; RF Pulse \n\
      d2			; delay between inversion and detection \n\
      p0 [ph1]			; detection sequence pulse 1 \n\
      d1			; tau \n\
      p1 [+x]			; detection sequence pulse 2 \n\
      d1			; tau \n\
      d0			; constant acquisition delay \n\
      acq [sg1]			; acquisition \n\
      d12\n\
      p11 [RF1]\n\
    next i			; end of accumulation loop \n\
    \n\
    dx = dx +df2\n\
    rf1 = rf1 + df2\n\
 \n\
    \n\
   next x			; end of time sweep loop \n\
 \n\
  scansdone(k)			; output of scans done \n\
 next k				; end of averaging loop \n\
\n\
end exp10\n\
\n\
begin exp11 "Nuclear Rabi" [INTG QUAD]\n\
\n\
df0 = 65140\n\
;p11 = 0\n\
\n\
for k = 1 to n\n\
  totscans(n)\n\
\n\
  rf1 = df0\n\
  p11 = 0\n\
  dx = p11\n\
\n\
  sweep x = 1 to sx\n\
    shot i = 1 to h\n\
      d9\n\
      p1 [+x]\n\
      d12\n\
      p22 [u1]\n\
      p11 [RF1]\n\
      d2\n\
      p0 [ph1]\n\
      d1\n\
      p1 [+x]\n\
      d1\n\
      d0\n\
      acq [sg1]\n\
      d12\n\
      p11 [RF1]\n\
    next i\n\
\n\
    dx = dx + d21\n\
    p11 = p11 + d21\n\
\n\
  next x\n\
\n\
  scansdone(k)\n\
next k\n\
\n\
end exp11\n\
\n\
begin exp12 "Electron Rabi" [INTG QUAD]\n\
\n\
p2 = 4\n\
d2 = d30*sx\n\
d2 = d2+100\n\
d21 = p2\n\
\n\
for k = 1 to n\n\
  totscans(n)\n\
 \n\
  dx = d30\n\
  p2 = d21\n\
\n\
  sweep x = 1 to sx\n\
    shot i = 1 to h\n\
      p2 [+x]\n\
      d2\n\
      p0 [ph1]\n\
      d1\n\
      p1 [+x]\n\
      d1\n\
      d0\n\
      acq [sg1]\n\
    next i\n\
\n\
    dx = dx + d30\n\
    p2 = p2 + d30\n\
\n\
  next x\n\
\n\
  scansdone(k)\n\
next k\n\
\n\
end exp12 \n\
\n\
begin exp13 "Ramsay" [INTG QUAD]\n\
\n\
df0 = 65145\n\
d10 = p10\n\
\n\
for k = 1 to n\n\
  totscans(n)\n\
\n\
  rf1 = df0\n\
  dx = d2\n\
\n\
  sweep x = 1 to sx\n\
    shot i = 1 to h\n\
      d9\n\
      p1 [+x]\n\
      d12\n\
      p22 [u1]\n\
      p10 [RF1]\n\
      d10\n\
      d2\n\
      p10 [RF1]\n\
      d10\n\
      d3\n\
      p0 [ph1]\n\
      d1\n\
      p1 [+x]\n\
      d1\n\
      d0\n\
      acq [sg1]\n\
      d12\n\
      p11 [RF1]\n\
    next i\n\
\n\
    dx = dx + d21\n\
    d2 = d2 + d21\n\
    d3 = d3 - d21\n\
\n\
  next x\n\
\n\
  scansdone(k)\n\
next k\n\
\n\
end exp13\n\
\n\
begin exp14 "Nuc Coherent Stark" [INTG QUAD]\n\
\n\
df0 = 65142\n\
d10 = p10\n\
d11 = p11\n\
\n\
for k = 1 to n\n\
  totscans(n)\n\
\n\
  rf1 = df0\n\
  dx = 0\n\
\n\
  sweep x = 1 to sx\n\
    shot i = 1 to h\n\
      p0 [ph1]\n\
      d9\n\
      d11\n\
      p1 [+x]\n\
      d9\n\
      p11 [RF1]\n\
      d11\n\
      p1 [+x]\n\
      d9\n\
      p22 [u1]\n\
      d2\n\
      p11 [RF1]\n\
      d11\n\
      d2\n\
      p1 [+x]\n\
      d9\n\
      p11 [RF1]\n\
      d11\n\
      p1 [+x]\n\
      d9\n\
      d11\n\
      d0\n\
      acq [sg1]\n\
      d12\n\
      p11 [RF1]\n\
    next i\n\
\n\
    dx = dx + d31\n\
    \n\
  next x\n\
\n\
  scansdone(k)\n\
next k\n\
\n\
end exp14\n\
\n\
begin exp6 "Stark Why" [INTG QUAD]\n\
\n\
df0 = 65150\n\
d10 = p10\n\
;d11 = p11\n\
\n\
for k = 1 to n\n\
  totscans(n)\n\
\n\
  rf1 = df0\n\
  dx = 0\n\
\n\
  sweep x = 1 to sx\n\
    shot i = 1 to h\n\
      d9\n\
      p1 [+x]\n\
      d12\n\
      p22 [u1]\n\
      p10 [RF1]\n\
      d10\n\
      d4\n\
      p11 [RF1]\n\
      d11\n\
      d4\n\
      p10 [RF1]\n\
      d10\n\
      d3\n\
      p0 [ph1]\n\
      d1\n\
      p1 [+x]\n\
      d1\n\
      d0\n\
      acq [sg1]\n\
      d12\n\
      p11 [RF1]\n\
    next i\n\
\n\
    dx = dx + d31\n\
\n\
  next x\n\
\n\
  scansdone(k)\n\
next k\n\
\n\
end exp6\n
Psd1               0,0,5268,10268,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,28,52,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd10              0,276,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd11              0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd12              0,276,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd13              0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd14              0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd15              0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd16              0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd17              0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd18              0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd19              0,0,5000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
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
Psd3               0,0,5140,10140,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,724,748,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd4               0,0,5008,10008,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,208,232,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd5               0,0,15300,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,208,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4,0,8000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd6               0,276,10276,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,48,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,4000,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd7               0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd8               0,276,5276,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,24,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
Psd9               0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
QuadDetect         True
RF1Prg             0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000
RF2Prg             0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000,0.000
ReplaceMode        Off
ShotRepTime        40800.00 us
ShotsPLoop         1
SptProgress        100 %
StochMode          False
SweepsPExp         1
TriggerTimeOut     14 s
XAxisQuant         Time
XSpecRes           101
YAxisQuant         Magnetic Field
YSpecRes           1

.DVC     recorder, 1.0

BaselineCorr       Off
NbScansAcc         1
NbScansDone        1
NbScansToDo        1
ReplaceMode        Off
SmoothMode         Auto
SmoothPoints       1

.DVC     routeTrg, 1.0


.DVC     sigChanSmall, 1.0


.DVC     transRec, 1.0


*
************************************************************
