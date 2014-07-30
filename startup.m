% Execute these commands at startup
%
% Note: this has to be a hard link or in the Matlab directory.

%% path changes

% restore default path
restoredefaultpath

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
