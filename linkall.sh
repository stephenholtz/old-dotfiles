# Link all of my configuration files from repo to ~
echo 'sym linking github config files to home directory'
rm ~/{.vimrc,.zshrc,.tmux.conf,.bash_profile,.taskrc}
sp=$(dirname $0)
ln -sv $sp/{.vimrc,.zshrc,.tmux.conf,.bash_profile,.taskrc} ~/

# Link matlab startup file for correct startup config
#ln -sv $sp/startup.m ~/Documents/MATLAB/
