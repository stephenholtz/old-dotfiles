# Link configuration files to home directory
echo '>>> Linking configuration files and folders'

DOTFILES="${HOME}/dotfiles/"
echo '>>> sym-linking config files'
ln -sfv $DOTFILES/gitconfig $HOME/.gitconfig
ln -sfv $DOTFILES/tmux.conf $HOME/.tmux.conf
ln -sfv $DOTFILES/bash_profile $HOME/.bash_profile
ln -sfv $DOTFILES/taskrc $HOME/.taskrc
ln -sfv $DOTFILES/vimrc $HOME/.vimrc
ln -sfv $DOTFILES/zsh/zshrc $HOME/.zshrc
ln -sfv $DOTFILES/tmuxinator $HOME/.tmuxinator

# Link colors
echo '>>> sym-linking shell colors'
if [ -d $HOME/.colors/ ]; then
  rm -vrf $HOME/.colors/
fi
mkdir -vp $HOME/.colors/
ln -sv $DOTFILES/colors/* $HOME/.colors/

# Link vundle 
echo '>>> sym-linking Vundle'
if [ ! -d $HOME/.vim/bundle/ ]; then
    mkdir -pv $HOME/.vim/bundle
else
    if [ -e $HOME/.vim/bundle/Vundle.vim ]; then
      rm -rf $HOME/.vim/bundle/Vundle.vim
    fi
fi
ln -sv $DOTFILES/Vundle.vim $HOME/.vim/bundle/Vundle.vim

# Link antigen
echo '>>> sym-linking antigen'
rm -rf $HOME/.antigen
ln -sv $DOTFILES/antigen $HOME/.antigen

# links not in home directory
# Elinks conf
echo '>>> sym-linking elinks.conf'
if [ ! -d $HOME/.elinks/ ]; then
  mkdir -pv $HOME/.elinks/
else
  rm -v $HOME/.elinks/elinks.conf
fi
ln -sv $DOTFILES/elinks.conf $HOME/.elinks/elinks.conf

# weechat scripts and conf (ignore the log files), 
echo '>>> sym-linking weechat folder (preserve ~/.weechat/irc.conf)'
if [ -f $HOME/.weechat/irc.conf ]; then
    mv $HOME/.weechat/irc.conf $HOME/.temp.irc.conf
fi
if [ -d $HOME/.weechat/ ]; then
    rm -rv $HOME/.weechat/
fi
mkdir -vp $HOME/.weechat/
ln -sv $DOTFILES/weechat/* $HOME/.weechat/
if [ -f $DOTFILES/.temp.irc.conf ]; then
    mv $HOME/.temp.irc.conf $HOME/.weechat/irc.conf 
fi

# link bitlbee conf file goes to homebrew cellar
echo '>>> sym-linking bitlbee.conf '
BITLBEE_CONF_PATH=$( brew list bitlbee | grep '/etc\/bitlbee/bitlbee.conf' )
rm -rv $BITLBEE_CONF_PATH
ln -sv $DOTFILES/bitlbee.conf $BITLBEE_CONF_PATH

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
ln -sv $HERE/vifm/vifmrc $HOME/.vifm/vifmrc
ln -sv $HERE/vifm/colors $HOME/.vifm/colors
