function[] = save_expt(EXPT,varargin)
% all experimental data and setup should be saved as fields for the structure 'expt'.
% varargin should contain hadles for figures to be saved.

TITL=input('Please enter a short comment to be appended to the file name (hit return for none):\n','s');
TITL=['_',TITL];

todayFolder = sprintf('data\\%s',datestr(date,'yyyy-mm-dd'));
if (exist(todayFolder,'dir')==0)
    mkdir(todayFolder);
end

todayData = sprintf('%s\\*.mat',todayFolder);
listing = (dir(todayData));
numFiles = numel(listing);
nextData = sprintf('%s\\%03i',todayFolder,numFiles+1);
if (exist([nextData '.mat'],'file')==0)
    %the file doesn't exist, save it there
    fprintf('Saved data to \\%s\n',[nextData '.mat']);
else %the file exists, make it somewhere else. Keep counting until there's a digit free.
    fprintf('There was a problem with saving into the folder %s.\n',todayFolder);
    while(exist([nextData '.mat'],'file')~=0)
        numFiles = numFiles + 1;
        nextData = sprintf('%s\\%03i',todayFolder,numFiles+1);
    end
    fprintf('This was resolved by skipping some labels and saving the file as \\%s\n',[nextData '.mat']);
end
save([nextData,TITL, '.mat'], 'EXPT');

% save .m file used for the experiment
if isfield(EXPT,'script')
    dlmwrite(sprintf('%s\\%s%s.m',pwd,nextData,TITL),EXPT.script,'delimiter','','-append');
end

% to save figures:
if ~isempty(varargin)
    for i=1:1:length(varargin)
        ch=get(varargin{i},'children');
        % saveas(varargin{i},[sprintf('%s\\%s%s',pwd,nextData,TITL),'_',get(get(ch,'title'),'string')],'fig');
        saveas(varargin{i},[sprintf('%s%s',nextData,TITL),'_',get(get(ch,'title'),'string')],'fig');
    end
end