# Stephen Holtz's .zshrc
# on osx run $ chsh -s /bin/zsh to set as default

autoload -U colors && colors

# Set environmental variables
export EDITOR="vim" # Set vim as default editor
export PAGER="less" # set less as default pager (vs more)

# use the emacs keymap by default 
bindkey -e 

# set some options
setopt nobeep # turn off the beep
setopt extended_glob # turn on advanced globbing

# set variables
# use history file here with 1000 lines
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Make a left and right prompt
PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg_no_bold[yellow]%}%1~ %{$reset_color%}%#"" "
RPROMPT="[%{$fg_no_bold[yellow]%}%?%{$reset_color%}]"

# Set up common aliases
alias clc='echo use \^l or clear dumbass'

# matlab specific
alias matlab='. /Applications/MATLAB_R2014b.app/bin/matlab'
alias matlabcl='echo Opening MATLAB 2014b with -nosplash -nodesktop; /Applications/MATLAB_R2014b.app/bin/matlab -nosplash -nodesktop'

# cdpath/path setup
export CDPATH=:$HOME/personal_repos/:$HOME/grad_repos/:$HOME/
export PATH=/usr/local/bin:/usr/local/sbin:/Applications/MATLAB_R2013a.app/bin/maci64:$PATH

source /Users/stephenholtz/.iterm2_shell_integration.zsh
