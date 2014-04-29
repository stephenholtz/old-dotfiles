echo 'Linking github dotfiles to home directory'
rm ~/{.vimrc,.zshrc,.tmux.conf,.bash_profile,.taskrc}
sp=$(dirname $0)
ln -vfs $sp/{.vimrc,.zshrc,.tmux.conf,.bash_profile,.taskrc} ~/
