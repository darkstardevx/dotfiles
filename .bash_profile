#!/bin/sh
#
###############################################################################################
# Bash Profile                                                                                # 
# Darkstardevx [darkstardevx@gmail.com]                                                       #
# https://github.com/darkstardevx/scripts                                                     #
############################################################################################### 
#
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Bashrc
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# Bash Functions
if [ -e $HOME/.bash_functions ]; then
    source $HOME/.bash_functions
fi

# Docker Aliases
if [ -f ~/.docker_aliases ]; then
  . ~/.docker_aliases
fi

# Git Aliases
if [ -f ~/.git_aliases ]; then
  . ~/.git_aliases
fi

# Cargo Path
export PATH="$HOME/.cargo/bin:$PATH"

# Pyenv
if command -v pyenv 1>/dev/null 2>&1; then
 eval "$(pyenv init -)"
fi
