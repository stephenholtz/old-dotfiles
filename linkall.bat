rem Run to link windows files from dotfiles to relevant windows directories.
rem Should run as an administrator
rem 

% make the keyboard work better over synergy 
mklink /D %0/win/macbook_keyboard.ahk / %UserProfile%/Documents 
% give matlab a startup file
mklink /D %0/win/startup.m %UserProfile%/Documents
