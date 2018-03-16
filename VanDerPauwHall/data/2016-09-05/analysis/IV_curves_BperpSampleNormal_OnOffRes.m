idx_plot = [3,6];% 9000G
%idx_plot = [2,5];% 3000G
%idx_plot = [1,4];% 0G

files = {
    '../001*.mat', 'offRes', 0
    '../002a*.mat', 'offRes', 3000
    '../004*.mat', 'offRes', 9000
    '../006*.mat', 'onRes', 0
    '../007*.mat', 'onRes', 3000
    '../008*.mat', 'onRes', 9000
    };

[nFiles,~] = size(files);

hfig1=21; figure(hfig1);clf(hfig1)
hfig2=22; figure(hfig2);clf(hfig2)
hfig3=23; figure(hfig3);clf(hfig3)
hfig4=24; figure(hfig4);clf(hfig4)
hfig5=25; figure(hfig5);clf(hfig5)
hfig6=26; figure(hfig6);clf(hfig6)
for ct = idx_plot
    
    fullFileName = dir(files{ct,1});
    [folder, filename] = fileparts(files{ct,1});
    filepath = [folder,'/',fullFileName.name];
    load(filepath);
    
    if strcmpi(files{ct,2},'onRes')
        linestyle = '--';
    else
        linestyle = '-';
    end
    
    figure(hfig1)
    ax = gca;
    ax.ColorOrderIndex = 1;
    plot(EXPT.M1_V21, EXPT.M1_I21, linestyle);
    hold on
    plot(EXPT.M2_V32, EXPT.M2_I32, linestyle);
    plot(EXPT.M3_V43, EXPT.M3_I43, linestyle);
    plot(EXPT.M4_V14, EXPT.M4_I14, linestyle);
    
    figure(hfig2)
    ax = gca;
    ax.ColorOrderIndex = 1;
    plot(EXPT.M1_V21, EXPT.M1_I21./EXPT.M1_V21, linestyle);
    hold on
    plot(EXPT.M2_V32, EXPT.M2_I32./EXPT.M2_V32, linestyle);
    plot(EXPT.M3_V43, EXPT.M3_I43./EXPT.M3_V43, linestyle);
    plot(EXPT.M4_V14, EXPT.M4_I14./EXPT.M4_V14, linestyle);
    
    figure(hfig3)
    ax = gca;
    ax.ColorOrderIndex = 1;
    plot(EXPT.M1_V34, EXPT.M1_I21, linestyle);
    hold on
    plot(EXPT.M2_V41, EXPT.M2_I32, linestyle);
    plot(EXPT.M3_V12, EXPT.M3_I43,  linestyle);
    plot(EXPT.M4_V23, EXPT.M4_I14, linestyle);
    
    figure(hfig4)
    ax = gca;
    ax.ColorOrderIndex = 1;
    plot(EXPT.M1_I21, 1./EXPT.M1_R2134.R*ones(size(EXPT.M1_I21)), linestyle);
    hold on
    plot(EXPT.M2_I32, 1./EXPT.M2_R3241.R*ones(size(EXPT.M1_I21)), linestyle);
    plot(EXPT.M3_I43, 1./EXPT.M3_R4312.R*ones(size(EXPT.M1_I21)), linestyle);
    plot(EXPT.M4_I14, 1./EXPT.M4_R1423.R*ones(size(EXPT.M1_I21)), linestyle);
    
    figure(hfig5)
    ax = gca;
    ax.ColorOrderIndex = 1;
    plot(EXPT.HallM1_V24p, EXPT.HallM1_I13p, linestyle);
    hold on
    plot(EXPT.HallM2_V13p, EXPT.HallM2_I42p, linestyle);
    plot(EXPT.HallM3_V13n, EXPT.HallM3_I42n,  linestyle);
    plot(EXPT.HallM4_V24n, EXPT.HallM4_I13n, linestyle);
    
    figure(hfig6)
    ax = gca;
    ax.ColorOrderIndex = 1;
    plot(EXPT.M1_I21, 1./EXPT.HallM1_RH1324p.R*ones(size(EXPT.M1_I21)), linestyle);
    hold on
    plot(EXPT.M2_I32, 1./EXPT.HallM2_RH4213p.R*ones(size(EXPT.M1_I21)), linestyle);
    plot(EXPT.M3_I43, 1./EXPT.HallM3_RH4213n.R*ones(size(EXPT.M1_I21)), linestyle);
    plot(EXPT.M4_I14, 1./EXPT.HallM4_RH1324n.R*ones(size(EXPT.M1_I21)), linestyle);
end

figure(hfig1)
legendstr = {'I21, V21','I32, V32','I43, V43','I14, V14',};
legend(legendstr)
xlabel('Source-drain voltage (V)')
ylabel('Source-drain current (A)')


figure(hfig2)
legendstr = {'I21, V21','I32, V32','I43, V43','I14, V14',};
legend(legendstr)
xlabel('Source-drain voltage (V)')
ylabel('Source-drain conductance (Ohm^{-1})')


figure(hfig3)
legendstr = {'I21, V34','I32, V41','I43, V12','I14, V23',};
legend(legendstr)
ylabel('Source-drain current (A)')
xlabel('4pt Voltage (V)')


figure(hfig4)
legendstr = {'I21, V34','I32, V41','I43, V12','I14, V23',};
legend(legendstr)
xlabel('Source-drain current (A)')
ylabel('4pt conductance (Ohm)')
grid on

figure(hfig5)
legendstr = {'B+, I13, V24','B+ I42, V13','B- I42, V13','B-, I13, V24'};
legend(legendstr)
ylabel('Source-drain current (A)')
xlabel('Hall Voltage (V)')

figure(hfig6)
legendstr = {'B+, I13, V24','B+ I42, V13','B- I42, V13','B-, I13, V24'};
legend(legendstr)
xlabel('Source-drain current (A)')
ylabel('Hall conductance (Ohm)')
grid on