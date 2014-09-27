# paths.zsh

# Homebrew binaries
PATH="/usr/local/sbin:$PATH"
PATH="/usr/local/bin:$PATH"

# Anaconda - python dist
if [ -d $HOME/anaconda ]; then
    export PATH="$PATH:$HOME/anaconda/bin"
fi

# Python
PATH="/usr/local/share/python:$PATH"
# for powerline, add python path pip by default installs 
#if [ -d "$HOME/Library/Python/2.7/bin" ]; then
#    PATH="$HOME/Library/Python/2.7/bin:$PATH"
#fi

# Ruby
PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then 
    eval "$(rbenv init -)" 
fi

# Go
if [ -f /usr/local/go ];then
    GOROOT=/usr/local/go
    GOPATH=$HOME/project/go
    PATH=$PATH:$GOPATH/bin
fi

# Matlab
PATH="$PATH:/Applications/MATLAB_R2013a.app/bin/maci64"

# Export all variables
export PATH
export PYTHONPATH=""
export GOROOT="/usr/local/go"
export CDPATH=":$HOME:$HOME/code/personal:$HOME/code/grad"
