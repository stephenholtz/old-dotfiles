# Stephen Holtz's .zshrc
#
# should be linked to ~/.zshrc
# on osx run $ chsh -s /bin/zsh to set as default

export EDITOR="vim"

autoload -U colors && colors

setopt CORRECT_ALL

# Make a left and right prompt
PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg_no_bold[yellow]%}%1~ %{$reset_color%}%#"" "
RPROMPT="[%{$fg_no_bold[yellow]%}%?%{$reset_color%}]"

# Set up common aliases
alias la='ls -aG'
alias ls='ls -G'
alias ll='ls -lG'
alias clc='echo use ^l dumbass'
alias matlab='. /Applications/MATLAB_R2013a.app/bin/matlab'

export PATH=/usr/local/bin:/usr/local/sbin:$PATH

