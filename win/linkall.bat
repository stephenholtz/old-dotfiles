rem Run to link windows files from dotfiles to relevant windows directories.
rem Should run as an administrator

rem make the keyboard work better over synergy 
mklink %0\macbook_keyboard.ahk %UserProfile%\Documents\macbook_keyboard.ahk
rem give matlab a startup file
mklink %0\startup.m %UserProfile%\Documents\startup.m
