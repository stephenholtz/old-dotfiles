# Link configuration files to home directory

sp=$(dirname $0)
cp=$(pwd)
echo 'sym-linking config files' $sp 'to' $HOME
rm $HOME/{.vimrc,.zshrc,.tmux.conf,.bash_profile,.taskrc}
ln -sv $sp/{.vimrc,.zshrc,.tmux.conf,.bash_profile,.taskrc} $HOME

# Link matlab startup file for correct startup config
rm $HOME/Documents/MATLAB/startup.m
ln -sv $sp/startup.m $HOME/Documents/MATLAB/startup.m
