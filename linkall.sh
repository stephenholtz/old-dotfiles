# Link configuration files to home directory
echo 'Link configuration files'

HERE=$(dirname $0)
echo '  sym-linking config files' $HERE 'to' $HOME
rm $HOME/{.vimrc,.zshrc,.tmux.conf,.bash_profile,.taskrc}
ln -sv $HERE/{.vimrc,.zshrc,.tmux.conf,.bash_profile,.taskrc} $HOME

# links not in home directory

# Elinks conf
echo '  sym-linking elinks.conf'
rm $HOME/.elinks/elinks.conf
ln -sv $HERE/elinks.conf $HOME/.elinks/elinks.conf

# irssi scripts and conf
echo '  sym-linking irssi scripts'
mkdir -p $HOME/.irssi/scripts/autorun
ln -sv $HERE/irssi_autorun/{spell.pl,nicklist.pl} $HOME/.irssi/scripts/autorun

# matlab startup file
echo '  sym-linking matlab startup'
rm $HOME/Documents/MATLAB/startup.m
ln -sv $HERE/startup.m $HOME/Documents/MATLAB/startup.m

# update my vim bundles
echo 'Updating vim bundles'
vim +BundleInstall! +BundleClean

