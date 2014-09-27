# aliases.zsh

# Matlab
alias matlab='. /Applications/MATLAB_R2014b.app/bin/matlab'
alias matlabcl='echo Opening MATLAB 2014b with -nosplash -nodesktop; matlab -nosplash -nodesktop'

# Anaconda / Python (ipython should be from anaconda)
if [ -d $HOME/anaconda ]; then
    alias anaconda="$HOME/anaconda/bin/python"
    alias anaconda3="$HOME/anaconda/bin/python3"
    alias ipython="$HOME/anaconda/bin/ipython"
    alias ipy=ipython
fi

# Mathmatica
if [ -d /Applications/Mathematica.app ]; then
    alias mathematica="/Applications/Mathematica.app/Contents/MacOS/Mathematica"
    alias mathscript="/Applications/Mathematica.app/Contents/MacOS/MathematicaScript"
    alias mathcl="/Applications/Mathematica.app/Contents/MacOS/MathKernel"
fi

# git
alias g='git'

# taskwarrior (some already from zsh plugins)
alias t='task'
alias ttp='task project'
alias ttl='task list'
alias tta='task add'
alias ttd='task done'

# zsh
alias zsh_reload=". ~/.zshrc && echo 'zsh reloaded from ~/.zshrc'"
