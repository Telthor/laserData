    
files = {
    '../001*.mat'
    '../002*.mat'
    '../003*.mat'
    '../004*.mat'
    '../005*.mat'
    '../006*.mat'
    };

[nFiles,~] = size(files);


hfig1=21; figure(hfig1);clf(hfig1)
hfig2=22; figure(hfig2);clf(hfig2)
hfig3=23; figure(hfig3);clf(hfig3)

for ct = 1:nFiles
    fullFileName = dir(files{ct,1});
    [folder, filename] = fileparts(files{ct,1});
    filepath = [folder,'/',fullFileName.name];

    load(filepath);
    
    Bfield = EXPT.Bfields{1};
    rho = EXPT.resistivity;
    mu = EXPT.carrier_mobility_cm2perVs;
    n = EXPT.carrier_density;
    
    figure(hfig1)
    plot([Bfield,Bfield],abs(rho),'kx-')
    hold on
    figure(hfig2)
    plot(Bfield,abs(n),'kx-')
    hold on
    figure(hfig3)
    plot(Bfield,abs(mu),'kx-')
    hold on
end

figure(hfig1)
axis tight
xlabel('B (G)')
ylabel('Resistivity (Ohm cm)')
ax=gca;
ax.YScale = 'log';
figure(hfig2)
axis tight
xlabel('B (G)')
ylabel('Carrier Density (cm^-3)')
ax=gca;
ax.YScale = 'lin';
figure(hfig3)
axis tight
xlabel('B (G)')
ylabel('Mobility (cm^2/(V s))')
ax=gca;
ax.YScale = 'lin';
%ax.YLim= [1e3, 1e5];

