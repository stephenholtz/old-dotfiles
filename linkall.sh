# Link configuration files to home directory

HERE=$(dirname $0)
echo 'sym-linking config files' $HERE 'to' $HOME
rm $HOME/{.vimrc,.zshrc,.tmux.conf,.bash_profile,.taskrc}
ln -sv $HERE/{.vimrc,.zshrc,.tmux.conf,.bash_profile,.taskrc} $HOME

# Link matlab startup file for correct startup config
rm $HOME/Documents/MATLAB/startup.m
ln -sv $HERE/startup.m $HOME/Documents/MATLAB/startup.m

# update my vim bundles
vim +BundleInstall! +BundleClean

# link my irssi scripts
mkdir -p $HOME/.irssi/scripts/autorun
ln -sv $HERE/irssi_autorun/{spell.pl,nicklist.pl} $HOME/.irssi/scripts/autorun
