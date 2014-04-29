# powerline (vim addon) directory
# . {repository_root}/powerline/bindings/bash/powerline.sh
# . ~/.vim/bundle/powerline/powerline/bindings/bash/powerline.sh

# some color definitions
BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
LIME_YELLOW=$(tput setaf 190)
YELLOW=$(tput setaf 3)
POWDER_BLUE=$(tput setaf 153)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
BRIGHT=$(tput bold)
NORMAL=$(tput sgr0)
BLINK=$(tput blink)
REVERSE=$(tput smso)
UNDERLINE=$(tput smul)

# change the color of the PS1
export PS1="\[${WHITE}\](\[${YELLOW}\]\u \W\[${WHITE}\])\[${NORMAL}\]$ "

# common command aliases
alias matlab='/Applications/MATLAB_R2013a_Student.app/bin/maci64/MATLAB.app'
alias la='ls -aG'
alias ls='ls -G'
alias ll='ls -lG'
alias t1='tree -L 1'
alias t2='tree -L 2'
alias t3='tree -L 3'
alias tree1='tree -L 1'
alias tree2='tree -L 2'
alias tree3='tree -L 3'
alias clc='echo it is ^l dumbass'
alias pg='ping www.google.com'
export PATH=usr/local/sbin:$PATH
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
