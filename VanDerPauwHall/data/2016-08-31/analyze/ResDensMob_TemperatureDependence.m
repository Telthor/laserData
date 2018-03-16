
files = {
    %'../../2016-08-30/003*.mat'
    %'../001*.mat'
    %'../002*.mat'
    '../003*.mat'
    '../004*.mat'
    '../005*.mat'
    '../006*.mat'
    '../007*.mat'
    '../008*.mat'
    '../009*.mat'
    '../010*.mat'
    '../011*.mat'
    '../012*.mat'
    '../013*.mat'
    '../014*.mat'
    %'../015*.mat'
    %'../016*.mat'
    '../017*.mat'
    %'../018b*.mat'
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
    
    T=1./EXPT.Temperature;
    rho = EXPT.resistivity;
    mu = EXPT.carrier_mobility_cm2perVs;
    n = EXPT.carrier_density;
    
    figure(hfig1)
    plot([T,T],abs(rho),'kx')
    hold on
    figure(hfig2)
    plot(T,abs(n),'kx')
    hold on
    figure(hfig3)
    plot(T,abs(mu),'kx')
    hold on
end

figure(hfig1)
axis tight
xlabel('Temperature (K)')
ylabel('Resistivity (Ohm cm)')
ax=gca;
ax.YScale = 'log';
figure(hfig2)
axis tight
xlabel('Temperature (K)')
ylabel('Carrier Density (cm^-3)')
ax=gca;
ax.YScale = 'log';
figure(hfig3)
axis tight
xlabel('Temperature (K)')
ylabel('Mobility (cm^2/(V s))')
ax=gca;
ax.YScale = 'log';
ax.YLim= [1e3, 1e5];

