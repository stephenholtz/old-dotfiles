# powerline (vim addon) directory
# . {repository_root}/powerline/bindings/bash/powerline.sh
#. ~/.vim/bundle/powerline/powerline/bindings/bash/powerline.sh

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
alias la='ls -aG'
alias ls='ls -G'
alias ll='ls -lG'
