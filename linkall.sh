# Link configuration files to home directory
echo '>> Linking configuration files'
echo ''

HERE=$(dirname $0)
echo '>> sym-linking config files' $HERE 'to' $HOME
rm $HOME/{.vimrc,.zshrc,.tmux.conf,.bash_profile,.taskrc}
ln -sv $HERE/{.vimrc,.zshrc,.tmux.conf,.bash_profile,.taskrc} $HOME
echo ''

# links not in home directory

# Elinks conf
echo '>> sym-linking elinks.conf'
rm $HOME/.elinks/elinks.conf
ln -sv $HERE/elinks.conf $HOME/.elinks/elinks.conf
echo ''

# weechat scripts and conf (ignore the log files), 
# pride: rewrite this later to be less silly
echo '>> sym-linking weechat folder (maintaining log files)'
mv $HOME/.weechat/logs $HOME/temp-logs/
mv $HOME/.weechat/weechat.log $HOME/temp-weechat.log
rm -r $HOME/.weechat/
mkdir $HOME/.weechat/
ln -sv $HERE/.weechat/* $HOME/.weechat
mkdir $HOME/.weechat/logs
mv $HOME/temp-logs/ $HOME/.weechat/logs
mv $HOME/temp-weechat.log $HERE/.weechat/weechat.log
echo ''

# matlab startup file
echo '>> sym-linking matlab startup'
rm $HOME/Documents/MATLAB/startup.m
ln -sv $HERE/startup.m $HOME/Documents/MATLAB/startup.m
echo ''

# update my vim bundles
#echo '>> Updating vim bundles'
#vim +BundleInstall! +BundleClean
#echo ''
