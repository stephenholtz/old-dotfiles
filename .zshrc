# Stephen Holtz's .zshrc
#
# on osx run $ chsh -s /bin/zsh to set as default

export EDITOR="vim"

autoload -U colors && colors

setopt CORRECT_ALL

# Make a left and right prompt
PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg_no_bold[yellow]%}%1~ %{$reset_color%}%#"" "
RPROMPT="[%{$fg_no_bold[yellow]%}%?%{$reset_color%}]"

# Set up common aliases
alias la='ls -aG'
alias ll='ls -lG'
alias clc='echo use ^l dumbass'

# matlab specific
alias matlab='. /Applications/MATLAB_R2013a.app/bin/matlab'
alias MATLAB='matlab'

# cdpath/path setup
export CDPATH=:$HOME/personal_repos/:$HOME/grad_repos/:$HOME/
export PATH=/usr/local/bin:/usr/local/sbin:/Applications/MATLAB_R2013a.app/bin/maci64:$PATH

