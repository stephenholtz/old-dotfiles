dotfiles
=======================================================================
#### features
- zsh with [antigen](https://github.com/zsh-users/antigen)
- vim with [vundle](https://github.com/gmarik/Vundle.vim)
- tmux with [tmuxinator](https://github.com/tmuxinator/tmuxinator)
- tmux, vim, ipython configured to use [powerline](https://github.com/Lokaltog/powerline)

#### iTerm2 
- settings saved under ./iterm2 
- iTerm Preferences > [Check] Load preferences from custom folder or URL
- add powerline patched fonts to OSX from ./fonts using `Font Book.app`
- iTerm Profiles > Text > Change Font to powerline patched font

#### link files
- linkall.sh has mostly hard-coded linking from $HOME/dotfiles/{dotless_path_name} to $HOME/{standard_path_name}
- sh ~/dotfiles/linkall.sh
#### change colorscheme
- required to do so in vimrc, zshrc, and iterm2 perferences
