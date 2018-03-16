Temperature = 300; %K
Bfield = 5000; %G

Npoints = 21;
IsourceMax = 500e-6;
Ksource_Vc = 0.2; % source voltage compliance
Kmeas_Vrange = 0.1;
NPLC=1;
t_wafer_cm = 0.053; % wafer thickness in cm

%% Preparations
% Add dependencies
root_path = 'C:\Users\Hannes\Desktop\GARII\';
addpath([root_path '.']);
addpath(genpath([root_path 'GUI functions']));

% Connections
if ~exist('Ksource'); Ksource = KEI2400Class;
Ksource.ID = '1';
Ksource.connect; 
Ksource.dev.write(':ROUT:TERM REAR'); end
if ~exist('Kmeas'); Kmeas = KEI6430Class; 
Kmeas.ID = '2';
Kmeas.connect; end

%% Definitions
Isource = linspace(-IsourceMax, IsourceMax, Npoints);

EX = [];
EX.Temperature = Temperature;

IsourceArrs = {'M1_I21', 'M2_I32', 'M3_I43', 'M4_I14',     'HallM1_I13p', 'HallM2_I42p', 'HallM3_I42n', 'HallM4_I13n' };
VmeasArrs2p = {'M1_V21', 'M2_V32', 'M3_V43', 'M4_V14',     'HallM1_V13p', 'HallM2_V42p', 'HallM3_V42n', 'HallM4_V13n' };
VmeasArrs4p = {'M1_V34', 'M2_V41', 'M3_V12', 'M4_V23',     'HallM1_V24p', 'HallM2_V13p', 'HallM3_V13n', 'HallM4_V24n' };
ResistanceArrs={'M1_R2134', 'M2_R3241', 'M3_R4312', 'M4_R1423', ...
    'HallM1_RH1324p', 'HallM2_RH4213p' 'HallM3_RH4213n', 'HallM4_RH1324n'};
EX.Bfields = {0, 0, 0, 0, Bfield, Bfield, -Bfield, -Bfield, };
EX.K2400High = {   'C2', 'C3', 'C4', 'C1',    'C1', 'C4', 'C4', 'C1'};
EX.K2400Low = {    'C1', 'C2', 'C3', 'C4',    'C3', 'C2', 'C2', 'C3'};
EX.K6430High = {   'C3', 'C4', 'C1', 'C2',    'C2', 'C1', 'C1', 'C2'};
EX.K6430Low = {    'C4', 'C1', 'C2', 'C3',    'C4', 'C3', 'C3', 'C4'};

% Figures
hfigIV = figure(33);clf(33);
hfigIVmeas = figure(34);clf(34);
hfigRmeas = figure(35);clf(35);

for ct_meas = 1:8

% Sheet resistance Measurement 1
EX.(IsourceArrs{ct_meas}) = Isource;
EX.(VmeasArrs2p{ct_meas}) = nan*zeros(size(Isource));
EX.(VmeasArrs4p{ct_meas}) = nan*zeros(size(Isource));
EX.(ResistanceArrs{ct_meas}) = struct;
%% Runtime sheet resistance measurement:
%
result = '';
while ~strcmpi(result, 'ok')
    msg = ['\nSheet resistance measurement: B=%iG, Connect'...
        '\nK2400 High -> %s'...
        '\nK2400 Low -> %s'...
        '\nK6430 High -> %s'...
        '\nK6430 Low -> %s'...
        '\nWhen done enter "ok" and press Enter\n'];
    msg = sprintf(msg, EX.Bfields{ct_meas}, EX.K2400High{ct_meas}, EX.K2400Low{ct_meas}, EX.K6430High{ct_meas}, EX.K6430Low{ct_meas} );
    result = input(msg, 's');
end

Ksource.set_output_status(0);
Kmeas.set_output_status(0);

Ksource.set_source_type('I')
Ksource.set_measure_voltage('on')
Ksource.set_source_current_range(IsourceMax)
Ksource.set_compliance_voltage(Ksource_Vc)
Ksource.set_measure_voltage_range(Ksource_Vc);
Ksource.set_integration_time_PLC(NPLC)

Kmeas.set_source_type('I')
Kmeas.set_measure_voltage('on')
Kmeas.set_source_current_range(IsourceMax)
Kmeas.set_compliance_voltage(Ksource_Vc)
Kmeas.set_measure_voltage_range(0.01);
Kmeas.set_source_current(0)
Kmeas.set_integration_time_PLC(NPLC)
Kmeas.set_filter_auto(1);

for ct = 1:numel(EX.(IsourceArrs{ct_meas}))
    Ksource.set_source_current(EX.(IsourceArrs{ct_meas})(ct))
    if ct ==1
        Ksource.set_output_status(1)
        Kmeas.set_output_status(1)
    end
    EX.(VmeasArrs2p{ct_meas})(ct) = Ksource.measure_voltage_singleShot();
    EX.(VmeasArrs4p{ct_meas})(ct) = Kmeas.measure_voltage_singleShot();
end    

Kmeas.set_output_status(0);
Ksource.set_output_status(0);

%% Analyze resistivity:
[ R, offset ] = fit_Resistance( EX.(VmeasArrs4p{ct_meas}), EX.(IsourceArrs{ct_meas}) );
EX.(ResistanceArrs{ct_meas}).R = R;
EX.(ResistanceArrs{ct_meas}).offset = offset;
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
legend(ResistanceArrs{1:ct_meas});

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

if ct_meas == 4
%% Calclulate sheet resistance
EX.Rsheet = [];
for ct_Rsheet = 1:2
    Rs0 = EX.(ResistanceArrs{2*ct_Rsheet-1}).R;
    R1 = EX.(ResistanceArrs{2*ct_Rsheet-1}).R;
    R2 = EX.(ResistanceArrs{2*ct_Rsheet}).R;
    minfunc = @(Rs) abs(exp(-pi*R1/Rs) + exp(-pi*R2/Rs) - 1);
    EX.Rsheet(ct_Rsheet) = fminsearch(minfunc, Rs0);
end
EX.t_wafer_cm =  t_wafer_cm;
EX.resistivity = EX.Rsheet*EX.t_wafer_cm;

disp(sprintf('\n\n\----> Wafer resistivity: %.2g & %.2g < ----', EX.resistivity(1),EX.resistivity(2)))
end

if ct_meas==8
    EX.RH_average = (EX.('HallM1_RH1324p').R+EX.('HallM2_RH4213p').R-EX.('HallM3_RH4213n').R-EX.('HallM4_RH1324n').R)/4;
    if EX.RH_average >=0
        EX.carrier_type = 'n';
    else
        EX.carrier_type = 'p';
    end
    q=1.60217662e-19;
    EX.carrier_density_sheet_cm2 = (Bfield*1e-4)/q/abs(EX.RH_average)*1e-4;
    EX.carrier_density = EX.carrier_density_sheet_cm2/EX.t_wafer_cm;
    EX.carrier_mobility_cm2perVs = (q*EX.carrier_density_sheet_cm2 * mean(EX.Rsheet))^-1;
    disp(sprintf('\n--> Wafer resistivity: %.2g Ohm,\n-->Carrier type: %s type,\n-->Carrier density: %.2g cm^-3,\n-->Carrier mobility: %.2g cm^2/V/s',...
        mean(EX.resistivity),EX.carrier_type, EX.carrier_density, EX.carrier_mobility_cm2perVs));
end


end


%% Saving

EX.script = fileread([mfilename('fullpath') '.m']);
save_expt(EX);
