    
files = {
    '../006*.mat', 'off', '125mW' , 1
    %'../004*.mat', 'off', '125mW', 2 
    '../007*.mat', 'off', '125mW_ND1', 3  
    '../008*.mat', 'off', '125mW_ND2', 4
    '../009*.mat', 'off', '25mW_ND2' , 5
    '../010*.mat', 'off', '50mW_ND2' , 6
    '../011*.mat', 'off', '50mW_ND1' , 7
    '../012*.mat', 'off', '50mW'  , 8
    '../013*.mat', 'off', '125mW' , 2
    '../014*.mat', 'on', '125mW'  , 1
    '../015*.mat', 'on', '125mW_ND1' , 3
    '../016*.mat', 'on', '125mW_ND2' , 4
    '../017*.mat', 'on', '25mW_ND2'  , 5
    '../018*.mat', 'on', '50mW_ND2'  , 6
    '../019*.mat', 'on', '50mW_ND1'  , 7
    '../020*.mat', 'on', '50mW'  , 8
    '../021*.mat', 'on', '125mW' , 2
    '../022*.mat', 'on', '170mW' , 9
    '../023*.mat', 'off', '170mW' , 9
    '../024*.mat', 'off', '25mW' ,10
    '../025*.mat', 'on', '25mW' , 10
    };

[nFiles,~] = size(files);

LaserPowerArr = zeros(nFiles/2,1);
Resistivity_OnRes = zeros(nFiles/2,1);
Resistivity_OffRes = zeros(nFiles/2,1);
CarrierDensity_OnRes = zeros(nFiles/2,1);
CarrierDensity_OffRes = zeros(nFiles/2,1);
Mobility_OnRes = zeros(nFiles/2,1);
Mobility_OffRes = zeros(nFiles/2,1);


hfig1=21; figure(hfig1);clf(hfig1)
hfig2=22; figure(hfig2);clf(hfig2)
hfig3=23; figure(hfig3);clf(hfig3)
hfig4=24; figure(hfig4);clf(hfig4)
hfig5=25; figure(hfig5);clf(hfig5)
hfig6=26; figure(hfig6);clf(hfig6)

for ct = 1:nFiles
    fullFileName = dir(files{ct,1});
    [folder, filename] = fileparts(files{ct,1});
    filepath = [folder,'/',fullFileName.name];
    LaserPowerNumber = files{ct,4};
    onOffRes = files{ct,2};
    LaserPowerStr = files{ct,3};
    
    laserpower = 0;
    switch LaserPowerStr
        case '170mW'
            laserpower = 170e-3;
        case '125mW'
            laserpower = 125e-3;
        case '125mW_ND1'
            laserpower = 125e-3*0.1111;
        case '125mW_ND2'
            laserpower = 125e-3*0.0499;
        case '25mW'
            laserpower = 25e-3;
        case '25mW_ND2'
            laserpower = 25e-3*0.0499;
        case '50mW'
            laserpower = 50e-3;
        case '50mW_ND1'
            laserpower = 50e-3*0.1111;
        case '50mW_ND2'
            laserpower = 50e-3*0.0499;
    end
    load(filepath);
    
    Bfield = EXPT.Bfields{1};
    rho = EXPT.resistivity;
    mu = EXPT.carrier_mobility_cm2perVs;
    n = EXPT.carrier_density;
    
    if strcmpi(onOffRes, 'off')
        linestyle = 'ko-';
        LaserPowerArr(LaserPowerNumber) = laserpower;
        Resistivity_OffRes(LaserPowerNumber)=mean(rho);
        CarrierDensity_OffRes(LaserPowerNumber)=n;
        Mobility_OffRes(LaserPowerNumber)=mu;
    else
        linestyle = 'k*-';
        Resistivity_OnRes(LaserPowerNumber)=mean(rho);
        CarrierDensity_OnRes(LaserPowerNumber)=n;
        Mobility_OnRes(LaserPowerNumber)=mu;
    end
    figure(hfig1)
    plot([laserpower,laserpower],abs(rho),linestyle)
    hold on
    figure(hfig2)
    plot(laserpower,abs(n),linestyle)
    hold on
    figure(hfig3)
    plot(laserpower,abs(mu),linestyle)
    hold on
end

figure(hfig1)
axis tight
xlabel('1078 power (W)')
ylabel('Resistivity (Ohm cm)')
ax=gca;
ax.YScale = 'log';
ax.XScale = 'log';
figure(hfig2)
axis tight
xlabel('1078 power (W)')
ylabel('Carrier Density (cm^-3)')
ax=gca;
ax.YScale = 'log';
ax.XScale = 'log';
figure(hfig3)
axis tight
xlabel('1078 power (W)')
ylabel('Mobility (cm^2/(V s))')
ax=gca;
ax.YScale = 'lin';
ax.XScale = 'log';
%ax.YLim= [1e3, 1e5];

%% Ratio carrier density on/off resonance
figure(hfig4)

plot(LaserPowerArr,CarrierDensity_OnRes./CarrierDensity_OffRes,'d')
axis tight
xlabel('1078 power (W)')
ylabel('Ratio carrier density on/off resonance')
ax=gca;
ax.YScale = 'lin';
ax.XScale = 'log';


%% Ratio Mobility on/off resonance
figure(hfig5)

plot(LaserPowerArr,Mobility_OnRes./Mobility_OffRes,'d')
axis tight
xlabel('1078 power (W)')
ylabel('Ratio mobility on/off resonance')
ax=gca;
ax.YScale = 'lin';
ax.XScale = 'log';

%% Ratio Conductivity on/off resonance
figure(hfig6)

plot(LaserPowerArr,Resistivity_OffRes./Resistivity_OnRes,'d')
axis tight
xlabel('1078 power (W)')
ylabel('Ratio conductivity on/off resonance')
ax=gca;
ax.YScale = 'lin';
ax.XScale = 'log';

