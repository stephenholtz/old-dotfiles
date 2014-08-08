# Link configuration files to home directory
#TODO: make this less silly
echo '>>> Linking configuration files and folders'
echo ''

HERE=$(dirname $0)
echo '>>> sym-linking config files' $HERE 'to' $HOME
rm -r $HOME/{.vimrc,.zshrc,.tmux.conf,.bash_profile,.taskrc,.tmuxinator}
ln -sv $HERE/{.vimrc,.zshrc,.tmux.conf,.bash_profile,.taskrc,.tmuxinator} $HOME
echo ''

# links not in home directory
# Elinks conf
echo '>>> sym-linking elinks.conf'
rm $HOME/.elinks/elinks.conf
ln -sv $HERE/elinks.conf $HOME/.elinks/elinks.conf
echo ''

# weechat scripts and conf (ignore the log files), 
# pride: rewrite this later to be less silly
echo '>>> sym-linking weechat folder (maintaining log files)'
mv $HOME/.weechat/logs $HOME/temp-logs/
mv $HOME/.weechat/weechat.log $HOME/temp-weechat.log
mv $HOME/.weechat/irc.conf $HOME/temp-irc.conf
rm -r $HOME/.weechat/
mkdir $HOME/.weechat/
ln -sv $HERE/.weechat/* $HOME/.weechat
mkdir $HOME/.weechat/logs
mv $HOME/temp-logs/ $HOME/.weechat/logs
mv $HOME/temp-weechat.log $HOME/.weechat/weechat.log
mv $HOME/temp-irc.conf $HOME/.weechat/irc.conf
echo ''

# link bitlbee conf file goes to homebrew cellar
echo '>>> sym-linking bitlbee.conf '
rm /usr/local/Cellar/bitlbee/3.2.2/etc/bitlbee/bitlbee.conf
ln -sv $HERE/bitlbee.conf /usr/local/Cellar/bitlbee/3.2.2/etc/bitlbee/bitlbee.conf
echo ''

# matlab startup file
echo '>>> sym-linking matlab startup'
rm $HOME/Documents/MATLAB/startup.m
ln -sv $HERE/startup.m $HOME/Documents/MATLAB/startup.m
echo ''

# vifm (greatest file browser ever made) link, don't link
# or overwrite history, Trash, help files etc.,
echo '>>> sym-linking vifm files'
rm -rf $HOME/.vifm/colors
ln -sv $HERE/.vifm/colors $HOME/.vifm/colors
rm -rf $HOME/.vifm/vifmrc
ln -sv $HERE/.vifm/vifmrc $HOME/.vifm/vifmrc
echo ''

# update my vim bundles
#echo '>>> Updating vim bundles'
#vim +BundleInstall! +BundleClean
#echo ''
