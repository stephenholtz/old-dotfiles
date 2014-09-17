# ~/dotfiles/ 
autoload -U colors && colors

# Set environmental variables
export EDITOR="vim"
export PAGER="less"

# use the emacs keymap by default 
bindkey -e 

# set some options
setopt nobeep
setopt extended_glob 

# set variables
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

## Aliases

# reload zsh
alias zsh_reload=". ~/.zshrc && echo 'zsh reloaded from ~/.zshrc'"

# matlab specific
alias matlab='. /Applications/MATLAB_R2014b.app/bin/matlab'
alias matlabcl='echo Opening MATLAB 2014b with -nosplash -nodesktop; /Applications/MATLAB_R2014b.app/bin/matlab -nosplash -nodesktop'
alias clc='echo use \^l or clear dumbass' # break my terrible habit

# Anaconda / Python (ipython should be from anaconda)
if [ -d $HOME/anaconda ]; then
    alias anaconda="$HOME/anaconda/bin/python"
    alias anaconda3="$HOME/anaconda/bin/python3"
    alias ipython="$HOME/anaconda/bin/ipython"
    alias ipy=ipython
fi

# Mathmatica notebook is very self contained
if [ -d /Applications/Mathematica.app ]; then
    alias mathematica="/Applications/Mathematica.app/Contents/MacOS/Mathematica"
    alias mathscript="/Applications/Mathematica.app/Contents/MacOS/MathematicaScript"
    alias mathcl="/Applications/Mathematica.app/Contents/MacOS/MathKernel"
fi

# git
alias g='git'

# taskwarrior (some already from zsh plugins)
# NOTE: tX is also aliased to a number of tmux actions
alias t='task'
alias ttp='task project'
alias ttl='task list'
alias tta='task add'
alias ttd='task done'

## PATH
# brew commands 
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
# matlab
export PATH="/Applications/MATLAB_R2013a.app/bin/maci64:$PATH"
# go
export PATH="$PATH:/usr/local/opt/go/libexec/bin"
# cdpath
export CDPATH="$HOME:$HOME/code/personal:$HOME/code/grad:"
source /Users/stephenholtz/.iterm2_shell_integration.zsh

# Make the terminal pretty with 256 colors
# required for tmux / vim to work properly as configured
export TERM="screen-256color"

# Use Tmuxinator for managing tmux sessions (gem install tmuxinator)
source ~/.tmuxinator/tmuxinator.zsh

# Powerline, add python to path pip by default sticks installs here
# TODO find a better way
if [ -d "$HOME/Library/Python/2.7/bin" ]; then
    PATH="$HOME/Library/Python/2.7/bin:$PATH"
fi

# For homebrew, explicitly set the applications directory
export HOMEBREW_CASK_OPTS="--appdir=/Applications --caskroom=/opt/homebrew-cask/Caskroom"

# use rbenv to manage different ruby installs
export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then 
    eval "$(rbenv init -)" 
fi

# use anaconda as my python environment
if [ -d $HOME/anaconda ]; then
    export PATH="$PATH:$HOME/anaconda/bin/"
fi

## ANTIGEN
# similar to vundle, only for zsh 
export ANTIGEN_DEFAULT_REPO_URL=https://github.com/robbyrussell/oh-my-zsh.git
export ADOTDIR=$HOME/.antigen
source ~/dotfiles/antigen/antigen.zsh
# Use the oh-my-zsh library (lots of themes collected)
antigen use oh-my-zsh

# Set bundles
antigen bundles <<EOBUNDLES
# tools
pip
git
brew
gem
taskwarrior
# python pep8 and pylint completions
python
autopep8
# tmux
tmux
tmuxinator
# vim
vundle
# Useful guessing
command-not-found
# have more completions
zsh-users/zsh-completions src
# zsh port of fish
zsh-users/zsh-history-substring-search
# Very nice syntax highlighting
zsh-users/zsh-syntax-highlighting
# have my man pages colored
colored-man
# MPB
battery
EOBUNDLES

# Use a zsh theme
antigen theme robbyrussell/oh-my-zsh themes/candy

# Apply all settings
antigen apply
