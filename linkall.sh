# Link configuration files to home directory
echo '>>> Linking configuration files and folders'
echo ''

HERE=${HOME}/dotfiles/
echo '>>> sym-linking config files' $HERE 'to' $HOME
rm -r $HOME/{.vimrc,.zshrc,.tmux.conf,.bash_profile,.taskrc,.tmuxinator,.gitconfig}
ln -sv $HERE/{.vimrc,.zshrc,.tmux.conf,.bash_profile,.taskrc,.tmuxinator,.gitconfig} $HOME

# Link vundle 
echo '>>> sym-linking Vundle'
if [ ! -d $HOME/.vim/bundle/ ]; then
    mkdir -pv $HOME/.vim/bundle
else
    if [ -d $HOME/.vim/bundle/Vundle.vim ]; then
      rm -rf $HOME/.vim/bundle/Vundle.vim
    fi
fi
ln -sv $HERE/Vundle.vim $HOME/.vim/bundle/Vundle.vim

# Link antigen
echo '>>> sym-linking antigen'
rm -rf $HOME/.antigen
ln -sv $HERE/antigen $HOME/.antigen

# links not in home directory
# Elinks conf
echo '>>> sym-linking elinks.conf'
if [ ! -d $HOME/.elinks/ ]; then
  mkdir -pv $HOME/.elinks/
else
  rm -v $HOME/.elinks/elinks.conf
fi
ln -sv $HERE/elinks.conf $HOME/.elinks/elinks.conf

# weechat scripts and conf (ignore the log files), 
echo '>>> sym-linking weechat folder (maintaining log files)'
if [ -d $HOME/.weechat ]; then
    mv $HOME/.weechat/logs $HOME/temp-logs/
    mv $HOME/.weechat/weechat.log $HOME/temp-weechat.log
    mv $HOME/.weechat/irc.conf $HOME/temp-irc.conf
    rm -r $HOME/.weechat/
fi
mkdir -pv $HOME/.weechat/
ln -sv $HERE/.weechat/* $HOME/.weechat
mkdir $HOME/.weechat/logs
if [ -d $HOME/temp-weechat.log ]; then
    mv $HOME/temp-logs/ $HOME/.weechat/logs
    mv $HOME/temp-weechat.log $HOME/.weechat/weechat.log
    mv $HOME/temp-irc.conf $HOME/.weechat/irc.conf
fi

# link bitlbee conf file goes to homebrew cellar
echo '>>> sym-linking bitlbee.conf '
rm /usr/local/Cellar/bitlbee/3.2.2/etc/bitlbee/bitlbee.conf
ln -sv $HERE/bitlbee.conf /usr/local/Cellar/bitlbee/3.2.2/etc/bitlbee/bitlbee.conf

# matlab startup file
echo '>>> sym-linking matlab startup'
if [ ! -d $HOME/Documents/MATLAB ]; then
  mkdir -pv $HOME/Documents/MATLAB/
else
  rm -v $HOME/Documents/MATLAB/startup.m
fi
ln -sv $HERE/startup.m $HOME/Documents/MATLAB/startup.m

# vifm - don't link or overwrite history or Trash
echo '>>> sym-linking vifm files'
if [ ! -d $HOME/.vifm ]; then
    mkdir -pv $HOME/.vifm/
else
    rm -rf $HOME/.vifm/colors
    rm -rf $HOME/.vifm/vifmrc
fi
ln -sv $HERE/.vifm/vifmrc $HOME/.vifm/vifmrc
ln -sv $HERE/.vifm/colors $HOME/.vifm/colors
