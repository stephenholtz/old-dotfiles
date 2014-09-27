# Antigen - vundle for zsh 

# Use the oh-my-zsh library (lots of themes collected)
antigen use oh-my-zsh

## Set bundles
# tools/utilities
antigen bundle fasd
antigen bundle git
antigen bundle brew
antigen bundle rsync
antigen bundle taskwarrior
# javascript
antigen bundle node
antigen bundle npm
antigen bundle gem
# python pep8 and pylint completions
antigen bundle pip
antigen bundle python
antigen bundle autopep8
antigen bundle virtualenvwrapper
# tmux
antigen bundle tmux
antigen bundle tmuxinator
# vim
antigen bundle vundle
# Useful guessing
antigen bundle command-not-found
# have more completions
antigen bundle zsh-users/zsh-completions src
# Very nice syntax highlighting
antigen bundle zsh-users/zsh-syntax-highlighting
# have my man pages colored
antigen bundle colored-man
# MPB
antigen bundle battery
# Use a zsh theme
antigen theme robbyrussell/oh-my-zsh themes/candy
# Apply all settings
antigen apply
