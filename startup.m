% Execute these commands at startup
%
% File location (hard linked to my ~/dotfiles/startup.m)
%   mac:  /Applications/MATLAB_R2013a.app/toolbox/local/startup.m
%
% Note: this has to be a hard link or in the actual directory.

% Matlab expects to load this matlab.mat file,
% create one if it doesn't exist
cwd = fileparts(mfilename('fullpath'));
files = dir(fullfile(cwd,'matlab.mat'));
if isempty(files)
    save(fullfile(cwd,'matlab.mat'),'cwd');
end

% Changes the ridiculous way matlab starts up
userpath('clear');
switch computer
    case 'MACI64'
        [~,user]=system('whoami','-echo');
        % Strip the last character from the output
        userpath(fullfile('/Users',user(1:end-1)));
    otherwise
        % Add in other OSs when needed
        disp('Path not set, edit startup.m')
end

% clear system output
clc; clear;

% Add my utilities to the path every time
addpath(genpath('/Users/stephenholtz/matlab-utils'))
addpath(genpath('XmegaController_Matlab_V13'))

% Remind myself that this script runs
disp('ran startup.m');
