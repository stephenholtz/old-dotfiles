% Execute these commands at startup
%
% Note: this has to be a hard link or in the actual directory.

%% restore default path
restoredefaultpath

%% Add my utilities etc.,
% addpath(genpath('XmegaController_Matlab_V13'))
addpath(genpath('/Users/stephenholtz/matlab-utils'))
addpath(genpath('~/grad_repos/calcium-processing'))

% Old paths
%addpath(genpath('~/grad_repos/culled-andermann-code-dump'))

%% Remind myself that this script runs
disp('ran startup.m');
