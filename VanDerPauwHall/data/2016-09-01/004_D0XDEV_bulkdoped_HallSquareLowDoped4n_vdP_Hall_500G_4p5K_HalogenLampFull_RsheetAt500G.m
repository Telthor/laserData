%%%%% HALL MEASUREMENT FOLLOWING THE VAN DER PAUW METHOD %%%%%%%%%
% Measures resistivity, carrier density, carrier type and mobility
%
% - follows closely: www.nist.gov/pml/div683/hall_resistivity.cfm and the
% workshee linked therein. (Careful though: Carrier type definition wrong)
% - also a good read, especially for carrier type definition:
% courses.washington.edu/phys431/hall_effect/hall_effect.pdf
%

% This script will first do four 4-point resistance measurement of the
% sample, ideally at B=0G. After that it does 4 Hall measurements, two in
% positive magnetic field, two with negative magnetic field.
%
% CONTACT LAYOUT:
% The contact should be labelled counterclockwise from C1 to C4:
% For a Hall square with contact face up this would look top down like
%
%       ___________                
%    C2 | /      \ | C3
%       |/        \|
%       |          |     With positive magnetic field direction should be up                                  
%       |\        /|     i.e Sample should be mounted such that the positive                                          
%    C1 |_\______/_| C4  B field  facing up when looking down at sample
%                           surface.
%
% The naming convention is: 
% I21: Nominal (i.e. not physical) Current injected into C2 and taken out 
% on C1, i.e C2 is connected to the high of the source meter, C1 to the low.
% V43 = V3-V4: C3 is connected to high of voltmeter, C4 to the low.
% R2143 = V43/I21.
%
% This script leads the user through a van der Pauw Hall measurement. At
% each step it tells the user to set a specific magnetic field and  to 
% connect which connector to the source meter (here a Keithley 2400) and 
% which to the voltmeter (here a Keithley 6430). 
% Before starting the measurement, it waits until the user confirms the
% magnetic field and connections are set up by entering "ok" into the user
% prompt.

%% Settings
Exp_Comment = 'Halogen Lamp fully on (5), Aligned';
Temperature = 4.5; %K Sample temperature
Bfield_Hall = 500; %G Magnetic field at which the Hall measurement will be caried out
Bfield_Rsheet = 500; %G

Npoints = 21; % Number of points for the IV curve of the Hall measurement
IsourceMax = 1e-6; % Source current will be linspace(-IsourceMax, IsourceMax, Npoints)
Ksource_Vc = 2; % Source voltage compliance
Kmeas_Vrange = 2; % Measurement voltage range of voltmeter
NPLC=2; % Integration time. 
t_wafer_cm = 0.0525; % wafer thickness in cm D0XDEV_bulkdoped: 0.0525;

%% Preparations
% Add dependencies
root_path = 'C:\Users\Hannes\Desktop\GARII\';
addpath([root_path '.']);
addpath(genpath([root_path 'GUI functions']));

% Connect source meter Ksource and voltmeter Kmeas
if ~exist('Ksource'); Ksource = KEI2400Class;
Ksource.ID = '1';
Ksource.connect; 
Ksource.dev.write(':ROUT:TERM REAR'); end
if ~exist('Kmeas'); Kmeas = KEI6430Class; 
Kmeas.ID = '2';
Kmeas.connect; end

%% Definitions
Isource = linspace(-IsourceMax, IsourceMax, Npoints); % Source current values

EX = []; % The experiment structure. All important data is saved here.
EX.Temperature = Temperature;

% Naming convention for the different measurement. 
% Sheet resistance measurements: M1 to M4
% Hall measurementes HallM1 to HallM4
% I21, V43, R2143 explained on top.
IsourceArrs = {'M1_I21', 'M2_I32', 'M3_I43', 'M4_I14',     'HallM1_I13p', 'HallM2_I42p', 'HallM3_I42n', 'HallM4_I13n' };
VmeasArrs2p = {'M1_V21', 'M2_V32', 'M3_V43', 'M4_V14',     'HallM1_V13p', 'HallM2_V42p', 'HallM3_V42n', 'HallM4_V13n' };
VmeasArrs4p = {'M1_V34', 'M2_V41', 'M3_V12', 'M4_V23',     'HallM1_V24p', 'HallM2_V13p', 'HallM3_V13n', 'HallM4_V24n' };
ResistanceArrs={'M1_R2134', 'M2_R3241', 'M3_R4312', 'M4_R1423', ...
    'HallM1_RH1324p', 'HallM2_RH4213p' 'HallM3_RH4213n', 'HallM4_RH1324n'};
EX.Bfields = {Bfield_Rsheet, Bfield_Rsheet, Bfield_Rsheet, Bfield_Rsheet,...
    Bfield_Hall, Bfield_Hall, -Bfield_Hall, -Bfield_Hall, };
EX.K2400High = {   'C2', 'C3', 'C4', 'C1',    'C1', 'C4', 'C4', 'C1'};
EX.K2400Low = {    'C1', 'C2', 'C3', 'C4',    'C3', 'C2', 'C2', 'C3'};
EX.K6430High = {   'C3', 'C4', 'C1', 'C2',    'C2', 'C1', 'C1', 'C2'};
EX.K6430Low = {    'C4', 'C1', 'C2', 'C3',    'C4', 'C3', 'C3', 'C4'};

% Figures
hfigIV = figure(33);clf(33);
hfigIVmeas = figure(34);clf(34);
hfigRmeas = figure(35);clf(35);

for ct_meas = 1:8

% Preperation of the measurement arrays
EX.(IsourceArrs{ct_meas}) = Isource;
EX.(VmeasArrs2p{ct_meas}) = nan*zeros(size(Isource));
EX.(VmeasArrs4p{ct_meas}) = nan*zeros(size(Isource));
EX.(ResistanceArrs{ct_meas}) = struct;

%% Runtime sheet resistance measurement:
result = '';
while ~strcmpi(result, 'ok')
    % Message for Bfield and next connections
    msg = ['\nSet: B=%iG, then connect'...
        '\nK2400 High -> %s'...
        '\nK2400 Low -> %s'...
        '\nK6430 High -> %s'...
        '\nK6430 Low -> %s'...
        '\nWhen done enter "ok" and press Enter\n'];
    msg = sprintf(msg, EX.Bfields{ct_meas}, EX.K2400High{ct_meas}, EX.K2400Low{ct_meas}, EX.K6430High{ct_meas}, EX.K6430Low{ct_meas} );
    result = input(msg, 's'); %Waiting for input and when ok the routine starts
end

Ksource.set_output_status(0);
Kmeas.set_output_status(0);

% Setup source meter
Ksource.set_source_type('I')
Ksource.set_measure_voltage('on')
Ksource.set_source_current_range(IsourceMax)
Ksource.set_compliance_voltage(Ksource_Vc)
Ksource.set_measure_voltage_range(Ksource_Vc);
Ksource.set_integration_time_PLC(NPLC)

% Setup voltmeter
Kmeas.set_source_type('I')
Kmeas.set_measure_voltage('on')
Kmeas.set_source_current_range(IsourceMax)
Kmeas.set_compliance_voltage(Ksource_Vc)
Kmeas.set_measure_voltage_range(Kmeas_Vrange);
Kmeas.set_source_current(0) %Use as voltmeter
Kmeas.set_integration_time_PLC(NPLC)
Kmeas.set_filter_auto(1);

% Measure the IV curve
for ct = 1:numel(EX.(IsourceArrs{ct_meas}))
    Ksource.set_source_current(EX.(IsourceArrs{ct_meas})(ct)) %Set current
    if ct ==1
        Ksource.set_output_status(1)
        Kmeas.set_output_status(1)
        pause(1)
    end
    EX.(VmeasArrs2p{ct_meas})(ct) = Ksource.measure_voltage_singleShot(); % Measure 2pt resistance
    EX.(VmeasArrs4p{ct_meas})(ct) = Kmeas.measure_voltage_singleShot(); % Measure 4t resistance
end    

Kmeas.set_output_status(0);
Ksource.set_output_status(0);

%% Analyze resistivity:
% Fit a straight line to the IV curve with offset. Ignore offset voltage of
% the voltmeter later on.
[ R, offset ] = fit_Resistance( EX.(VmeasArrs4p{ct_meas}), EX.(IsourceArrs{ct_meas}) );
EX.(ResistanceArrs{ct_meas}).R = R;
EX.(ResistanceArrs{ct_meas}).offset = offset;
% Calculate sheet resistance from the simple formula for a square contact
% layout as used by the D0XDEV Hall squares. Otherwise this sheetR is not
% useful and the sheet resistance can only be calculated as described
% below.
EX.(ResistanceArrs{ct_meas}).sheetR = pi*R/log(2)*t_wafer_cm;
status_report = sprintf('R(S12, M43)=%.1fOhm, Offset=%.1e, Rsheet(S12,M43)=%.2fOhm cm.\n',...
    EX.(ResistanceArrs{ct_meas}).R, EX.(ResistanceArrs{ct_meas}).offset, EX.(ResistanceArrs{ct_meas}).sheetR);
disp(status_report)

%% Plotting
figure(hfigIV)
plot(EX.(VmeasArrs2p{ct_meas}),EX.(IsourceArrs{ct_meas}))
axis tight; hold on;
xlabel('Vsource (V)');ylabel('Isource (A)')
title('Sourcing IV')
legend(ResistanceArrs{1:ct_meas},'Location', 'best');

figure(hfigIVmeas)
plot((EX.(IsourceArrs{ct_meas})),(EX.(VmeasArrs4p{ct_meas})))
axis tight; hold on;
ylabel('Vmeas (V)');xlabel('Isource (A)')
title('Measure IV')

figure(hfigRmeas)
plot(EX.(IsourceArrs{ct_meas}), EX.(VmeasArrs4p{ct_meas})./EX.(IsourceArrs{ct_meas}))
axis tight; hold on;
ax = gca;
plot(EX.(IsourceArrs{ct_meas}),R*ones(size(EX.(IsourceArrs{ct_meas}))),'--','color',ax.ColorOrder(ax.ColorOrderIndex-1,:) )
ax.ColorOrderIndex = ct_meas+1;
ylabel('R_4ptmeas (Ohm)');xlabel('Isource (A)')
title('Measure Resistance')

%% Calclulate sheet resistance from the 4 resistance measurements
% This follows the formula give in the NIST website: 
% abs(exp(-pi*R1/Rs) + exp(-pi*R2/Rs) = 1 for R1 and R2 perpendicular
% measurements and Rs the sheet resistance.
if ct_meas == 4
EX.Rsheet = [];
for ct_Rsheet = 1:2
    Rs0 = EX.(ResistanceArrs{2*ct_Rsheet-1}).R;
    R1 = EX.(ResistanceArrs{2*ct_Rsheet-1}).R;
    R2 = EX.(ResistanceArrs{2*ct_Rsheet}).R;
    minfunc = @(Rs) abs(exp(-pi*R1/Rs) + exp(-pi*R2/Rs) - 1);
    EX.Rsheet(ct_Rsheet) = fminsearch(minfunc, Rs0);
end
EX.t_wafer_cm =  t_wafer_cm;
EX.resistivity = EX.Rsheet*EX.t_wafer_cm; %in Ohm cm

disp(sprintf('\n\n----> Wafer resistivity: %.2g & %.2g < ----', EX.resistivity(1),EX.resistivity(2)))
end

%% Analyze the Hall measurement. 
if ct_meas==8
    % Deviates slightly from the method described on the NIST site. See
    % notes of Philipp's notebook (31.8.16). Essentially, instead of basing
    % the formula on VH and using a constant I, we use a kind of Hall
    % resistance RH = V_perpendicular/I_longitudinal
    % Take the average of the two different Hall measurements each at
    % positive and negative field.
    EX.RH_average = (EX.('HallM1_RH1324p').R+EX.('HallM2_RH4213p').R-EX.('HallM3_RH4213n').R-EX.('HallM4_RH1324n').R)/4;
    % Charge carrier type definition. NIST website is wrong, follow
    % Philipp's notebook and 2nd link at top of this script.
    if EX.RH_average >=0
        EX.carrier_type = 'n';
    else
        EX.carrier_type = 'p';
    end
    
    % Calculate carrier density and mobility.
    q=1.60217662e-19;
    EX.carrier_density_sheet_cm2 = (Bfield_Hall*1e-4)/q/abs(EX.RH_average)*1e-4;
    EX.carrier_density = EX.carrier_density_sheet_cm2/EX.t_wafer_cm;
    EX.carrier_mobility_cm2perVs = (q*EX.carrier_density_sheet_cm2 * mean(EX.Rsheet))^-1;
    % Display report. 
    EX.report = sprintf('\n--> Wafer resistivity: %.2g Ohm cm\n-->Carrier type: %s type,\n-->Carrier density: %.2g cm^-3,\n-->Carrier mobility: %.2g cm^2/V/s',...
        mean(EX.resistivity),EX.carrier_type, EX.carrier_density, EX.carrier_mobility_cm2perVs);
    disp(EX.report);
end
end

%% Saving
EX.script = fileread([mfilename('fullpath') '.m']);
save_expt(EX);
