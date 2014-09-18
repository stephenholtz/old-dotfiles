% Execute these commands at startup
%
% Note: this has to be a hard link or in the Matlab directory.

%% Change plotting defaults (at the root level)
% Probably best to still specify in each figure-making script, useful for quick hack plots
% http://www.mathworks.com/help/matlab/creating_plots/setting-default-property-values.html
set(0,  'DefaultFigureColor',[1 1 1],...
        'DefaultAxesColor',[1 1 1],...
        'DefaultAxesBox','off',...
        'DefaultTextFontSize',15,...
        'DefaultAxesFontSize',15,...
        'DefaultAxesFontWeight','demi',...
        'DefaultAxesTickDirMode','Manual',...
        'DefaultAxesTickDir','out');
% NOTE: not all of these work for some reason

%% Path changes

% reset the toolboxcache
% TODO: determine how matlab detects a stale cache and wrap this call
rehash toolboxcache

% restore default path
restoredefaultpath; 
% save as default to avoid path not found warnings
savepath;

% Add paths
pathsToAdd = {  '/Users/stephenholtz/matlab-utils',...
                '/Users/stephenholtz/grad-repos/monkeylogic-running',...
                '/Users/stephenholtz/grad-repos/andermann-daq-camera-acquisition',...
                '/Users/stephenholtz/grad-repos/andermann-mouse-behavior-analysis'};

% Remind myself that this script runs
fprintf('Running: %s\nRestored default Matlab path (restoredefaultpath).\nRecursively adding files from:\n',  mfilename('fullpath'))
for path = pathsToAdd
    fprintf('\t%s\n',path{1})
    addpath(genpath(path{1}));
end

% Clean up
clear pathsToAdd startupLoc path

% Turn off the obnoxious beep (works in OSX, maybe not others)
beep off

