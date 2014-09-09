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

# reload zsh
alias zsh_reload=". ~/.zshrc && echo 'zsh reloaded from ~/.zshrc'"

# matlab specific
alias matlab='. /Applications/MATLAB_R2014b.app/bin/matlab'
alias matlabcl='echo Opening MATLAB 2014b with -nosplash -nodesktop; /Applications/MATLAB_R2014b.app/bin/matlab -nosplash -nodesktop'
alias clc='echo use \^l or clear dumbass' # break my terrible habit

# git (duped from zsh plugins)
alias g='git'

# taskwarrior (some already from zsh plugins)
# NOTE: tX is also aliased to a number of tmux actions
alias tt='task'
alias ttp='task project'
alias ttl='task list'
alias tta='task add'
alias ttd='task done'

# cdpath/path setup
export CDPATH=:$HOME/personal_repos/:$HOME/grad_repos/:$HOME/
export PATH=/usr/local/bin:/usr/local/sbin:/Applications/MATLAB_R2013a.app/bin/maci64:$PATH

source /Users/stephenholtz/.iterm2_shell_integration.zsh

# Make the terminal pretty with 256 colors
# required for tmux / vim to work properly as configured
# NOTE: may break some ssh, change to xterm if fails
export TERM="screen-256color"

# Use Tmuxinator for managing tmux sessions (gem install tmuxinator)
source ~/.tmuxinator/tmuxinator.zsh

# Powerline, add path to let tmux and friends find it
if [ -d "$HOME/Library/Python/2.7/bin" ]; then
    PATH="$HOME/Library/Python/2.7/bin:$PATH"
fi
# Default powerline is a bit much -- need to tweak
#. /Users/stephenholtz/Library/Python/2.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh

# Antigen (similar to vundle, just for zsh) setup
#TODO: should be held in a hiden linked submodule of my dotfiles folder
export ANTIGEN_DEFAULT_REPO_URL=https://github.com/robbyrussell/oh-my-zsh.git
export ADOTDIR=$HOME/.antigen
source ~/dotfiles/antigen/antigen.zsh

# Use the oh-my-zsh library (lots of themes collected) (default above)
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
#antigen theme robbyrussell/zshrc themes/af-magic
antigen theme robbyrussell/oh-my-zsh themes/candy

# Apply all settings
antigen apply
