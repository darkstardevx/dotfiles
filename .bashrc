#!/usr/bin/env bash
#
# Project: Ultimate Bash (.bashrc file)
# Version: 4.1.2 (SemVer)
# Author: Darkstardevx <darkstardevx@gmail.com>
# Repository: https://github.com/darkstardevx/scripts
# Sources: Google Search (Custom), Other Sources (GitHub)
# Last Modified: Wed April 29 07:20 PST 2020
# License: GPLv3
#
# FILE LAYOUT SECTIONS
# ├── AUTHOR
# ├── License GNU GPLv3
# ├── Semantic Versioning (SemVer) 2.0.0
# ├── INFO/ABOUT SECTION
# ├── BASH VERSION CHECK
# ├── GENERAL OPTIONS
# ├── START CUSTOM SCRIPTS
# ├── CUSTOM PROMPT COLORS
# ├── MAN PAGE COLORS
# ├── XSERVER DISPLAY
# ├── CUSTOM SETTINGS
# ├── DIRECTORY NAVIGATION
# ├── HISTORY OPTIONS
# ├── FOLDER PATHS (EXPORT)
# ├── COLOR CHART
# ├── GREETING / MOTD
# ├── PROGRAMMABLE COMPLETION SECTION
# ├── LESSPIPE
# ├── PROMPT ESCAPES
# ├── PATHS (SYSTEM & CUSTOM)
# ├── DEVELOPMENT > ANDROID SDK & NDK
# ├── SHELL PROMPT
# ├── SYSTEM INFO TOOLS {neofetch, screenfetch, archey3}
# ├── NEOFETCH
# ├── SCREENFETCH
# ├── ARCHEY
# ├── TMUXINATOR
# ├── BASH GIT PROMPT
# ├── POWERLINE
# ├── STARSHIP SHELL PROMPT
# ├── LIQUIDPROMPT
# ├── BASH_IT SCRIPT
# ├── WAL (Colorscheme for use with i3wm)
# ├── GOOGLE CLOUD SDK (GCLOUD)
# ├── REQUIRED AT END (EOF)
# |___END OF FILE

###############################################################################################
# AUTHOR                                                                                      #
###############################################################################################
#
# Brett L. (Darkstardevx)  <darkstardevx@gmail.com>  # Original author
#
# See the BASHINFO.md file located in $HOME/Documents folder for a complete summary of features.
#
# Source: https://github.com/darkstardevx/scripts (.bashrc)
#
###############################################################################################
# License GNU GPLv3                                                                           #
###############################################################################################
#
# Copyright(C) 2020  DarkstarDevX (ElementXDesign)
#
# GPLv3 (GNU General Public License)
# https://www.gnu.org/licenses/gpl-3.0.en.html
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
###############################################################################################
# Semantic Versioning (SemVer) 2.0.0                                                          #
###############################################################################################
#
# Given a version number MAJOR.MINOR.PATCH, increment the:
#
# MAJOR version when you make incompatible API changes,
# MINOR version when you add functionality in a backwards-compatible manner, and
# PATCH version when you make backwards-compatible bug fixes.
# Additional labels for pre-release and build metadata are available as extensions to the MAJOR.MINOR.PATCH format.
#
###############################################################################################
# INFO/ABOUT SECTION                                                                          #
###############################################################################################
#
#  This file is normally read by interactive shells only.
#  Here is the place to define your aliases, functions and
#  other interactive features like your prompt.
#
#  The majority of the code here assumes you are on a GNU
#  system (most likely a Linux box) and is often based on code
#  found on Usenet or Internet.
#
#  The choice of colors was done for a shell with a dark background
#  (white on black), and this is usually also suited for pure text-mode
#  consoles (no X server available). If you use a white background,
#  you'll have to do some other choices for readability.
#
###############################################################################################
# BASH VERSION CHECK                                                                          #
###############################################################################################
#
if ((BASH_VERSINFO[0] < 4))
then
  echo "sensible.bash: Looks like you're running an older version of Bash."
  echo "sensible.bash: You need at least bash-4.0 or some options will not work correctly."
  echo "sensible.bash: Keep your software up-to-date!"
fi
#

###############################################################################################
# GENERAL OPTIONS                                                                             #
###############################################################################################
# Shell variables
# Set default command line text editor
export PATH=~/bin:$PATH
export VISUAL=nano
export EDITOR=nano
export CODEEDITOR="sublime-text-dev"
export PAGER="less"
export BROWSER='chromium'
export HOST='uname -n'
export TERMINAL="termite"
export READER="zathura"
export WM="bspwm"

export PATH="$PATH:/home/raven/.config/polybar/scripts/"

source virtualenvwrapper.sh
source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"

# Command Line EMOJIS
# declares an array with the emojis we want to support
#EMOJIS=(😺 😸 😹 😻 😼 😽 🙀 😿 😾)

# function that selects and return a random element from the EMOJIS set
#RANDOM_EMOJI() {
#  SELECTED_EMOJI=${EMOJIS[$RANDOM % ${#EMOJIS[@]}]};
#  echo $SELECTED_EMOJI;
#}

# declare the terminal prompt format
#export PS1='$(RANDOM_EMOJI)  [\u@\h \W]$ '

# TimeZone (/usr/share/zoneinfo/America/Los_Angeles)
export TZ=America/Los_Angeles

# Setting for the new UTF-8 terminal support in Lion
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Automatically trim long paths in the prompt (requires Bash 4.x)
PROMPT_DIRTRIM=2

# Disable BIOS beep on delete and backspace
xset -b

# Prevent file overwrite on stdout redirection
# Use `>|` to force redirection to an existing file
set -o noclobber

# Update window size after every command
shopt -s checkwinsize

# Messages
#fortune | cowsay -pn
#fortune | cowsay -f tux
#fortune | cowsay -f stegosaurus
#cowsay -f tux "Arch Linux Rocks! ..."

# Start tmux interactively
#if [[ $DISPLAY ]]; then
#    # If not running interactively, do not do anything
#    [[ $- != *i* ]] && return
#    [[ -z "$TMUX" ]] && exec tmux
#fi

###############################################################################################
# START CUSTOM SCRIPTS                                                                        #
###############################################################################################
#
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    #alias ls='ls --color=auto'
    alias ls='colorls --group-directories-first'
    alias ll='colorls -lA --sd --gs --group-directories-first'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    
    #ColorLS
    #source $(dirname $(gem which colorls))/tab_complete.sh
    
    #alias ls='els --els-icons=fontawesome'
    #alias la='els -laH --els-icons=fontawesome'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Bash Aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Bash Functions
if [ -e $HOME/.bash_functions ]; then
    source $HOME/.bash_functions
fi

# Source global definitions (if any)
if [ -f /etc/bashrc ]; then
      . /etc/bashrc   # --> Read /etc/bashrc, if present.
fi

# Sensible Bash
#if [ -f ~/bin/sensible.bash ]; then
#   source ~/bin/sensible.bash
#fi

# My Aliases (for future use)
#if [ -f ~/.myalias.sh ]; then
#    source ~/.myalias.sh
#fi

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# Qt Creator 5.X fix for high density screens
export QT_DEVICE_PIXEL_RATIO=2

###############################################################################################
# CUSTOM PROMPT COLORS                                                                       #
###############################################################################################
#
function aa_prompt_defaults ()
{
   local colors=`tput colors 2>/dev/null||echo -n 1` C=;

   if [[ $colors -ge 256 ]]; then
      C="`tput setaf 33 2>/dev/null`";
      AA_P='mf=x mt=x n=0; while [[ $n < 1 ]];do read a mt a; read a mf a; (( n++ )); done</proc/meminfo; export AA_PP="\033[38;5;2m"$((mf/1024))/"\033[38;5;89m"$((mt/1024))MB; unset -v mf mt n a';
   else
      C="`tput setaf 4 2>/dev/null`";
      AA_P='mf=x mt=x n=0; while [[ $n < 1 ]];do read a mt a; read a mf a; (( n++ )); done</proc/meminfo; export AA_PP="\033[92m"$((mf/1024))/"\033[32m"$((mt/1024))MB; unset -v mf mt n a';
   fi;

   eval $AA_P;

   PROMPT_COMMAND='stty echo; history -a; echo -en "\e[34h\e[?25h"; (($SECONDS % 2==0 )) && eval $AA_P; echo -en "$AA_PP";';
   SSH_TTY=${SSH_TTY:-`tty 2>/dev/null||readlink /proc/$$/fd/0 2>/dev/null`}

   PS1="\[\e[m\n\e[1;30m\][\$\$:\$PPID \j:\!\[\e[1;30m\]]\[\e[0;36m\] \T \d \[\e[1;30m\][${C}\u@\H\[\e[1;30m\]:\[\e[0;37m\]${SSH_TTY/\/dev\/} \[\e[0;32m\]+${SHLVL}\[\e[1;30m\]] \[\e[1;37m\]\w\[\e[0;37m\]\n\\$ ";

   export PS1 AA_P PROMPT_COMMAND SSH_TTY
}

###############################################################################################
# MAN PAGE COLORS                                                                            #
###############################################################################################
#
#export LESS_TERMCAP_mb=$'\e[1;35m'
#export LESS_TERMCAP_md=$'\e[1;35m'
#export LESS_TERMCAP_me=$'\e[0m'
#export LESS_TERMCAP_se=$'\e[0m'
#export LESS_TERMCAP_so=$'\e[01;31m'
#export LESS_TERMCAP_ue=$'\e[0m'
#export LESS_TERMCAP_us=$'\e[1;4;36m'

man() {
    LESS_TERMCAP_mb=$'\e[1;35m' \
    LESS_TERMCAP_md=$'\e[01;35m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;31m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;36m' \
    command man "$@"
}

###############################################################################################
# Xserver Display                                                                             #
###############################################################################################
#
if [ -z ${DISPLAY:=""} ]; then
    get_xserver
    if [[ -z ${XSERVER}  || ${XSERVER} == $(hostname) ||
       ${XSERVER} == "unix" ]]; then
          DISPLAY=":0.0"          # Display on local host.
    else
       DISPLAY=${XSERVER}:0.0     # Display on remote host.
    fi
fi

export DISPLAY

###############################################################################################
# CUSTOM SETTINGS                                                                             #
###############################################################################################
#
#set -o nounset     # These  two options are useful for debugging.
#set -o xtrace
alias debug="set -o nounset; set -o xtrace"

alias nano='edit'

ulimit -S -c 0      # Don't want coredumps.
set -o notify
set -o noclobber # prevent overwriting files with cat
set -o ignoreeof # stops ctrl+d from logging me out

# Better, faster directory navigation
shopt -s cdable_vars

shopt -s checkhash
shopt -s checkwinsize
shopt -s sourcepath
shopt -s no_empty_cmd_completion
shopt -s cmdhist
shopt -s histappend histreedit histverify
shopt -s extglob       # Necessary for programmable completion.

# Disable options:
shopt -u mailwarn
unset MAILCHECK        # Don't want my shell to warn me of incoming mail.
#
# Test connection type:
if [ -n "${SSH_CONNECTION}" ]; then
    CNX=${Green}        # Connected on remote machine, via ssh (good).
elif [[ "${DISPLAY%%:0*}" != "" ]]; then
    CNX=${ALERT}        # Connected on remote machine, not via ssh (bad).
else
    CNX=${BCyan}        # Connected on local machine.
fi

###############################################################################################
# DIRECTORY NAVIGATION                                                                        #
###############################################################################################
#
## BETTER DIRECTORY NAVIGATION ##
# Better, faster directory navigation

# Prepend cd to directory names automatically
shopt -s autocd 2> /dev/null

# Correct spelling errors during tab-completion
shopt -s dirspell 2> /dev/null

# Correct spelling errors in arguments supplied to cd
shopt -s cdspell 2> /dev/null

# Automatically expand directory globs and fix directory name typos whilst completing. Note, this works in #conjuction with the cdspell option listed above.
shopt -s direxpand dirspell

#Enable the ** globstar recursive pattern in file and directory expansions.
shopt -s globstar

# Append to history rather than overwrite
shopt -s histappend histverify

# Check window after each command
shopt -s checkwinsize

# files beginning with . to be returned in the results of path-name expansion.
shopt -s dotglob

# This defines where cd looks for targets
# Add the directories you want to have fast access to, separated by colon
# Ex: CDPATH=".:~:~/projects" will look for targets in the current working directory, in home and in the ~/projects folder
CDPATH="."

# This allows you to bookmark your favorite places across the file system
# Define a variable containing a path and you will be able to cd into it regardless of the directory you're in
shopt -s cdable_vars

#Automatically shorten deep paths in the prompt. The \w option in PS1 controls whether to display the path or #not.
PROMPT_DIRTRIM=4

# NNN - File Manager (POSIX Compliant)
export NNN_BMS='d:~/Documents;n:/home/raven/notes Uploads;D:~/Downloads/'
export NNN_USE_EDITOR=1                                                   # use the $EDITOR when opening text files
export NNN_SSHFS_OPTS="sshfs -o reconnect,idmap=user,cache_timeout=3600"  # make sshfs follow symlinks on the remote
export NNN_RCLONE='rclone mount --read-only --no-checksum'                # pass additional options to rclone command
export NNN_COLORS="2136"                                                  # use a different color for each context
export NNN_TRASH=1                                                        # trash (needs trash-cli) instead of delete

# color codes: 0-black, 1-red, 2-green, 3-yellow, 4-blue (default), 5-magenta, 6-cyan, 7-white

###############################################################################################
# HISTORY OPTIONS                                                                             #
###############################################################################################
#
#History can be very useful, but by default on most distributions your history is blown away by each shell #exiting, and it doesn't hold much to begin with. It's best to have a minimum of 10,000 lines of history:
#
#History length settings see bash(1) in man bash
# Ignore duplicates, ls without options and builtin commands

# Better History
export HISTCONTROL="erasedups:ignoreboth"
export HISTSIZE=500000
export HISTFILESIZE=100000

# Don't record some commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"
#export HISTIGNORE="&:ls:ll:la:l.:pwd:exit:clear"
#export HISTIGNORE="&:ls:[bf]g:exit"

# Record each line as it gets issued
export PROMPT_COMMAND='history -a'

# Useful timestamp format
# Use standard ISO 8601 timestamp
# %F equivalent to %Y-%m-%d
# %T equivalent to %H:%M:%S (24-hours format)
export HISTTIMEFORMAT='%F %T '

# Append to the history file, don't overwrite it
shopt -s histappend

# Combine multiline commands into one in history
shopt -s cmdhist

# Enable history expansion with space
# E.g. typing !!<space> will replace the !! with your last command
bind Space:magic-space

# Record each line as it gets issued
PROMPT_COMMAND='history -a'

###############################################################################################
# FOLDER PATHS (EXPORT)                                                                       #
###############################################################################################
#
#With this option set, we can then define and export variables containing paths to our most important #directories and cd into them from our prompt, thus enabling a simple, effective and hack-free bookmarking #system:
#
# Don't use ~ to define your home here, it won't work.
#
export android="$HOME/android"
export backgrounds="$HOME/backgrounds"
export bash="$HOME/bash"
export bin="$HOME/bin"
export build="$HOME/build"
export cheatsheets="$HOME/cheatsheets"
export code="$HOME/code"
export colors="$HOME/colors"
export colorschemes="$HOME/colorschemes"
export development="$HOME/development"
export devspace="$HOME/devspace"
export Documents="$HOME/Documents"
export dotfiles="$HOME/dotfiles"
export Downloads="$HOME/Downloads"
export dropbox="$HOME/Dropbox"
export git="$HOME/git"
export gitlab="$HOME/gitlab"
export gitsync="$HOME/gitsync"
export GoogleDrive="$HOME/GoogleDrive"
export go_projects="$HOME/go_projects"
export icons="$HOME/icons"
export ide="$HOME/ide"
export kernel="$HOME/kernel"
export libs="$HOME/libs"
export links="$HOME/links"
export linux="$HOME/linux"
export Mail="$HOME/Mail"
export media="$HOME/media"
export MEGAsync="$HOME/MEGAsync"
export multimedia="$HOME/multimedia"
export Music="$HOME/Music"
#export nano-backups="$HOME/nano-backups"
export node_modules="$HOME/node_modules"
export notes="$HOME/notes"
export OneDrive="$HOME/OneDrive"
export pCloudDrive="$HOME/pCloudDrive"
export Pictures="$HOME/Pictures"
export pkgbuilds="$HOME/pkgbuilds"
export Postman="$HOME/Postman"
export projects="$HOME/projects"
export Public="$HOME/Public"
export reference="$HOME/reference"
export repos="$HOME/repos"
export sandbox="$HOME/sandbox"
export saved="$HOME/saved"
export screencasts="$HOME/screencasts"
export scripts="$HOME/scripts"
export secure="$HOME/secure"
export shared="$HOME/shared"
export sites="$HOME/sites"
export sync="$HOME/sync"
export temp="$HOME/temp"
export Templates="$HOME/Templates"
export themes="$HOME/themes"
export tools="$HOME/tools"
export venv="$HOME/venv"
#export Videos="$HOME/Videos"
export wallpapers="$HOME/wallpapers"
export webdev="$HOME/webdev"
export workspace="$HOME/workspace"
export YandexDisk="$HOME/YandexDisk"

# Other Paths (/media/SSDX/)
export ssdx="/media/SSDX/"
export backup="/media/SSDX/backup"
export global="/media/SSDX/global"
export iso="/media/SSDX/iso"

# Storage Volumes (mnt)
export storage="/mnt/storage/" #Data Storage Volumes

export vol01="/mnt/storage/vol01" # Volume 01
export vol02="/mnt/storage/vol02" # Volume 02
export vol03="/mnt/storage/vol03" # Volume 03
export vol04="/mnt/storage/vol04" # Volume 04
export vol05="/mnt/storage/vol05" # Volume 05
export vol06="/mnt/storage/vol06" # Volume 06
export vol07="/mnt/storage/vol07" # Volume 07
export vol08="/mnt/storage/vol08" # Volume 08
#

###############################################################################################
# COLOR CHART                                                                                 #
###############################################################################################
#
txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset
#

###############################################################################################
# GREETING / MOTD                                                                             #
###############################################################################################
#
# Color definitions (taken from Color Bash Prompt HowTo).
# Some colors might look different on some terminals.


# Normal Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

NC="\e[m"               # Color Reset


ALERT=${BWhite}${On_Red} # Bold White on red background


# Displays the BASH version.
#echo -e "${BCyan}This is BASH ${BPurple}${BASH_VERSION%.*}${BCyan}\
#- DISPLAY on ${BPurple}$DISPLAY${NC}\n"

# Displays the date in the upper left corner.
#date

# Makes our day a bit more fun.... :-)
#if [ -x /usr/bin/fortune ]; then
#    /usr/bin/fortune -s
#fi

# Function to run upon exit of shell. (exit message)
#function _exit()
#{
#   echo -e "${BPurple}Hasta la vista, baby${NC}"
#}
trap _exit EXIT
#

###############################################################################################
#  PROGRAMMABLE COMPLETION SECTION                                                            #
#  Most are taken from the bash 2.05 documentation and from Ian McDonald's                    #
# 'Bash completion' package (http://www.caliban.org/bash/#completion)                         #
#  You will in fact need bash more recent then 3.0 for some features.                         #
#                                                                                             #
#  Note that most linux distributions now provide many completions                            # 
# 'out of the box' - however, you might need to make your own one day,                        #
#  so I kept those here as examples.                                                          #
###############################################################################################

if [ "${BASH_VERSION%.*}" \< "3.0" ]; then
    echo "You will need to upgrade to version 3.0 for full \
          programmable completion features"
    return
fi

shopt -s extglob        # Necessary.

complete -A hostname   rsh rcp telnet rlogin ftp ping disk
complete -A export     printenv
complete -A variable   export local readonly unset
complete -A enabled    builtin
complete -A alias      alias unalias
complete -A function   function
complete -A user       su mail finger

complete -A helptopic  help     # Currently same as builtins.
complete -A shopt      shopt
complete -A stopped -P '%' bg
complete -A job -P '%'     fg jobs disown

complete -A directory  mkdir rmdir
complete -A directory   -o default cd

# Compression
complete -f -o default -X '*.+(zip|ZIP)'  zip
complete -f -o default -X '!*.+(zip|ZIP)' unzip
complete -f -o default -X '*.+(z|Z)'      compress
complete -f -o default -X '!*.+(z|Z)'     uncompress
complete -f -o default -X '*.+(gz|GZ)'    gzip
complete -f -o default -X '!*.+(gz|GZ)'   gunzip
complete -f -o default -X '*.+(bz2|BZ2)'  bzip2
complete -f -o default -X '!*.+(bz2|BZ2)' bunzip2
complete -f -o default -X '!*.+(zip|ZIP|z|Z|gz|GZ|bz2|BZ2)' extract


# Documents - Postscript,pdf,dvi.....
complete -f -o default -X '!*.+(ps|PS)'  gs ghostview ps2pdf ps2ascii
complete -f -o default -X \
'!*.+(dvi|DVI)' dvips dvipdf xdvi dviselect dvitype
complete -f -o default -X '!*.+(pdf|PDF)' acroread pdf2ps
complete -f -o default -X '!*.@(@(?(e)ps|?(E)PS|pdf|PDF)?\
(.gz|.GZ|.bz2|.BZ2|.Z))' gv ggv
complete -f -o default -X '!*.texi*' makeinfo texi2dvi texi2html texi2pdf
complete -f -o default -X '!*.tex' tex latex slitex
complete -f -o default -X '!*.lyx' lyx
complete -f -o default -X '!*.+(htm*|HTM*)' lynx html2ps
complete -f -o default -X \
'!*.+(doc|DOC|xls|XLS|ppt|PPT|sx?|SX?|csv|CSV|od?|OD?|ott|OTT)' soffice

# Multimedia
complete -f -o default -X \
'!*.+(gif|GIF|jp*g|JP*G|bmp|BMP|xpm|XPM|png|PNG)' xv gimp ee gqview
complete -f -o default -X '!*.+(mp3|MP3)' mpg123 mpg321
complete -f -o default -X '!*.+(ogg|OGG)' ogg123
complete -f -o default -X \
'!*.@(mp[23]|MP[23]|ogg|OGG|wav|WAV|pls|\
m3u|xm|mod|s[3t]m|it|mtm|ult|flac)' xmms
complete -f -o default -X '!*.@(mp?(e)g|MP?(E)G|wma|avi|AVI|\
asf|vob|VOB|bin|dat|vcd|ps|pes|fli|viv|rm|ram|yuv|mov|MOV|qt|\
QT|wmv|mp3|MP3|ogg|OGG|ogm|OGM|mp4|MP4|wav|WAV|asx|ASX)' xine

complete -f -o default -X '!*.pl'  perl perl5

###############################################################################################
# LESSPIPE                                                                                    #
###############################################################################################
#
# lesspipe (https://github.com/wofr06/lesspipe)
# lesspipe.sh, a preprocessor for less
# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

alias more='less'
export PAGER=less
export LESSCHARSET='latin1'
export LESSOPEN='|/usr/bin/lesspipe.sh %s 2>&-'
                # Use this if lesspipe.sh exists.
export LESS='-i -N -w  -z-4 -g -e -M -X -F -R -P%t?f%f \
:stdin .?pb%pb\%:?lbLine %lb:?bbByte %bb:-...'

export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline
# and so on

# less wrapper function
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}

# Aliases that use xtitle
alias top='xtitle Processes on $HOST && top'
alias make='xtitle Making $(basename $PWD) ; make'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
#alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

###############################################################################################
# PROMPT ESCAPES                                                                              #
###############################################################################################
#
# Bash allows these prompt strings to be customized by inserting a
# number of backslash-escaped special characters that are
# decoded as follows:
#
#  \a         an ASCII bell character (07)
#  \d         the date in "Weekday Month Date" format (e.g., "Tue May 26")
#  \D{format} the format is passed to strftime(3) and the result
#             is inserted into the prompt string an empty format
#             results in a locale-specific time representation.
#             The braces are required
#  \e         an ASCII escape character (033)
#  \h         the hostname up to the first `.'
#  \H         the hostname
#  \j         the number of jobs currently managed by the shell
#  \l         the basename of the shell's terminal device name
#  \n         newline
#  \r         carriage return
#  \s         the name of the shell, the basename of $0 (the portion following
#             the final slash)
#  \t         the current time in 24-hour HH:MM:SS format
#  \T         the current time in 12-hour HH:MM:SS format
#  \@         the current time in 12-hour am/pm format
#  \A         the current time in 24-hour HH:MM format
#  \u         the username of the current user
#  \v         the version of bash (e.g., 2.00)
#  \V         the release of bash, version + patch level (e.g., 2.00.0)
#  \w         the current working directory, with $HOME abbreviated with a tilde
#  \W         the basename of the current working directory, with $HOME
#             abbreviated with a tilde
#  \!         the history number of this command
#  \#         the command number of this command
#  \$         if the effective UID is 0, a #, otherwise a $
#  \nnn       the character corresponding to the octal number nnn
#  \\         a backslash
#  \[         begin a sequence of non-printing characters, which could be used
#             to embed a terminal control sequence into the prompt
#  \]         end a sequence of non-printing characters
#

###############################################################################################
# PATHS (SYSTEM & CUSTOM)                                                                     #
###############################################################################################
#
# Vim Configuration File PATH
PATH=$PATH:~/.vimrc
export PATH

# Nano Configuration File PATH
PATH=$PATH:~/.nanorc
export PATH

# Git Configuration File PATH
PATH=$PATH:/usr/bin/git
PATH=$PATH:~/.gitconfig
export PATH

# Java PATH
export JAVA_HOME=/usr/lib/jvm/default
export PATH=$PATH:$JAVA_HOME/bin
export JAVA_HOME=/usr/lib/jvm/java-8-jre/jre/bin/java
export JAVA_HOME=/usr/lib/jvm/java-8-jdk/bin/java
export PATH=$PATH:$JAVA_HOME/bin:$PATH
export PATH=$PATH:/usr/lib/jvm/java-14-jdk/bin
#export CLASSPATH=.:JAVA_HOME/lib/dt.jar:JAVA_HOME/lib/tools.jar

# Python PATH
# Python alias default is python2.7, use python3.6 for other apps that
# require it. Remarkable markdown editor uses python3.6
alias python='/usr/bin/python3.8'
#alias python='/usr/bin/python2.7'

# Pyenv - Simple python version management
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# Perl PATH
PATH="/home/raven/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/raven/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/raven/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/raven/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/raven/perl5"; export PERL_MM_OPT;

# Kotlin is a statically-typed programming language
# that runs on the Java virtual machine and also can
# be compiled to JavaScript source code or use theme
# LLVM compiler infastructure. It's primary development
# is from JetBrains programmers

# Kotlin PATH
export KOTLIN=/usr/bin/kotlin

# Scala is a general-purpose programming language
# providing support for functional programming
# and a strong static type system
# Filename Extensions: .scala, .sc

# Scala Path
export PATH="$PATH":/usr/bin/scala
export PATH=/usr/bin/scala:$PATH

# Golang PATH
GOPATH=/usr/local/go
export GOPATH="$HOME/go_projects"
export GOBIN="$GOPATH/bin"
export PATH=$PATH:/usr/local/go

# Flutter PATH
export PATH=$HOME/flutter/bin:$PATH

# Dart SDK PATH
export PATH="$PATH":/opt/dart-sdk/bin/dart
export PATH=/usr/bin/dart:$PATH

# Lua PATH
export LUA_PATH=$/usr/bin/lua

# Cabal PATH
export PATH="$HOME/usr/bin/cabal:$PATH"

# Crystal Language PATH
export PATH="$PATH:/usr/bin/crystal"

# CARGO PATH (Rust Package Manager)    # Rust toolchains
export PATH="$HOME/.cargo/bin:$PATH"

# KomodoEdit 12
#export PATH="/opt/komodo-edit/lib/mozilla/komodo"

# Aptana Studio 3
#PATH=$PATH:/usr/local/bin/Aptana_Studio_3

# tmux
export PATH="$PATH:/usr/bin/tmux"

###############################################################################################
# DEVELOPMENT > ANDROID SDK & NDK                                                             #
###############################################################################################
#
# Android Development PATH | Software Development Kit (SDK)
export ANDROID_HOME=/home/raven/android/sdk
export PATH=$PATH:$JAVA_HOME/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# Android Development PATH | Native Development Kit (NDK)
export ANDROID_HOME_DEV=/home/raven/android/ndk
export PATH=$PATH:$ANDROID_HOME_DEV/toolchains:$ANDROID_HOME_DEV/toolchains

# CCACHE
export USE_CCACHE=1

# DEVELOPMENT PATHS > WEBDEV | DEVSPACE | CODE | SANDBOX
# Paths to frequently used development folders

# Bin PATH
export BIN=/home/raven/bin
export PATH=$PATH:$BIN/home/raven/bin/

# Code PATH
export CODE=/home/raven/code
export PATH=$PATH:$CODE/home/raven/code/

# Development PATH
export DEVELOPMENT=/home/raven/development
export PATH=$PATH:$DEVELOPMENT/home/raven/development/

# Devspace PATH
export DEVSPACE=/home/raven/devspace
export PATH=$PATH:$DEVSPACE/home/raven/devspace/

# GitSYNC PATH - All cloned sources are located in
# the gitsync folder
export GITSYNC=/home/raven/gitsync
export PATH=$PATH:$GITSYNC/home/raven/gitsync/

# Library PATH (bash scripting)
#export LIBRARY=/home/raven/libs/
#export PATH=$PATH:$LIBRARY/home/raven/libs/

# Projects PATH
export PROJECTS=/home/raven/projects
export PATH=$PATH:$PROJECTS/home/raven/projects/

# Sandbox PATH
export SANDBOX=/home/raven/sandbox
export PATH=$PATH:$SANDBOX/home/raven/sandbox/

# Scripts PATH
export SCRIPTS=/home/raven/scripts
export PATH=$PATH:$SCRIPTS/home/raven/scripts/

# Sites PATH
export SITES=/home/raven/sites
export PATH=$PATH:$SITES/home/raven/sites/

# Toolbox PATH
export TOOLBOX=/home/raven/toolbox
export PATH=$PATH:$TOOLBOX/home/raven/toolbox/

# WebDev PATH
export WEBDEV=/home/raven/webdev
export PATH=$PATH:$WEBDEV/home/raven/webdev/

# Color-Scripts PATH
#export CSCRIPTS=/home/raven/bin/color-scripts
#export PATH=$PATH:$CSCRIPTS/home/raven/bin/color-scripts/

# Package Management

# Bower PATH
export PATH="$PATH:/usr/lib/node_modules/bower/bin/bower"

# Yarn PATH
#export PATH="$PATH:/usr/bin/yarn"

#export PATH="$PATH:`yarn global bin`"

# NPM (Node Package Manager)
export PATH="$PATH:./node_modules/.bin"

# PHP Coding Standards Fixer
export PATH="$PATH:$HOME/.config/composer/vendor/bin"

# Depot Tools Git
# Build tools for working with Chromium development, include gclient
export PATH="${PATH}:/opt/depot_tools"

# NVM (Node Version Manager)
#source /usr/share/nvm/init-nvm.sh

# Gitignore.io (https://github.com/joeblau/gitignore.io)
function gi() { curl -L -s https://www.gitignore.io/api/$@ ;}

###############################################################################################
# SHELL PROMPT                                                                                #
###############################################################################################
#
#-------------------------------------------------------------
# Shell Prompt - for many examples, see:
#       http://www.debian-administration.org/articles/205
#       http://www.askapache.com/linux/bash-power-prompt.html
#       http://tldp.org/HOWTO/Bash-Prompt-HOWTO
#       https://github.com/nojhan/liquidprompt
#-------------------------------------------------------------
# Current Format: [TIME USER@HOST PWD] >
# TIME:
#    Green     == machine load is low
#    Orange    == machine load is medium
#    Red       == machine load is high
#    ALERT     == machine load is very high
# USER:
#    Cyan      == normal user
#    Orange    == SU to user
#    Red       == root
# HOST:
#    Cyan      == local session
#    Green     == secured remote connection (via ssh)
#    Red       == unsecured remote connection
# PWD:
#    Green     == more than 10% free disk space
#    Orange    == less than 10% free disk space
#    ALERT     == less than 5% free disk space
#    Red       == current user does not have write privileges
#    Cyan      == current filesystem is size zero (like /proc)
# >:
#    White     == no background or suspended jobs in this shell
#    Cyan      == at least one background job in this shell
#    Orange    == at least one suspended job in this shell
#
#    Command is added to the history file each time you hit enter,
#    so it's available to all shells (using 'history -a').
#
# System Uptime
#echo "Uptime: $(( `sed 's/^\([0-9]*\).*/\1/g' /proc/uptime` / 86400 )) days. Load: $(</proc/loadavg)"

###############################################################################################
# SYSTEM INFO TOOLS {neofetch, screenfetch, archey3}                                          #
###############################################################################################

###############################################################################################
# NEOFETCH                                                                                    #
###############################################################################################

# Neofetch | A command-line system information tool written in bash 3.2+
# https://github.com/dylanaraps/neofetch

# Neofetch is a command-line system information tool written in bash 3.2+. 
# Neofetch displays information about your operating system, software and 
# hardware in an aesthetic and visually pleasing way.

# ENABLE NEOFETCH
# neofetch

#Options:
#    --disable infoname          Allows you to disable an info line from appearing
#                                in the output. 'infoname' is the function name from the
#                                'print_info()' function inside the config file.
#                                For example: 'info "Memory" memory' would be '--disable memory'
#
#                                NOTE: You can supply multiple args. eg. 'neofetch --disable cpu gpu'
#
#    --title_fqdn on/off         Hide/Show Fully Qualified Domain Name in title.
#    --package_managers on/off   Hide/Show Package Manager names . (on, tiny, off)
#    --os_arch on/off            Hide/Show OS architecture.
#    --speed_type type           Change the type of cpu speed to display.
#                                Possible values: current, min, max, bios,
#                                scaling_current, scaling_min, scaling_max
#
#                                NOTE: This only supports Linux with cpufreq.
#
#    --speed_shorthand on/off    Whether or not to show decimals in CPU speed.
#
#                                NOTE: This flag is not supported in systems with CPU speed less than
#                                1 GHz.
#
#    --cpu_brand on/off          Enable/Disable CPU brand in output.
#    --cpu_cores type            Whether or not to display the number of CPU cores
#                                Possible values: logical, physical, off
#
#                                NOTE: 'physical' doesn't work on BSD.
#
#    --cpu_speed on/off          Hide/Show cpu speed.
#    --cpu_temp C/F/off          Hide/Show cpu temperature.
#
#                                NOTE: This only works on Linux and BSD.
#
#                                NOTE: For FreeBSD and NetBSD-based systems, you need to enable
#                                coretemp kernel module. This only supports newer Intel processors.
#
#    --distro_shorthand on/off   Shorten the output of distro (on, tiny, off)
#
#                                NOTE: This option won't work in Windows (Cygwin)
#
#    --kernel_shorthand on/off   Shorten the output of kernel
#
#                                NOTE: This option won't work in BSDs (except PacBSD and PC-BSD)
#
#    --uptime_shorthand on/off   Shorten the output of uptime (on, tiny, off)
#    --refresh_rate on/off       Whether to display the refresh rate of each monitor
#                                Unsupported on Windows
#    --gpu_brand on/off          Enable/Disable GPU brand in output. (AMD/NVIDIA/Intel)
#    --gpu_type type             Which GPU to display. (all, dedicated, integrated)
#
#                                NOTE: This only supports Linux.
#
#    --de_version on/off         Show/Hide Desktop Environment version
#    --gtk_shorthand on/off      Shorten output of gtk theme/icons
#    --gtk2 on/off               Enable/Disable gtk2 theme/font/icons output
#    --gtk3 on/off               Enable/Disable gtk3 theme/font/icons output
#    --shell_path on/off         Enable/Disable showing $SHELL path
#    --shell_version on/off      Enable/Disable showing $SHELL version
#    --disk_show value           Which disks to display.
#                                Possible values: '/', '/dev/sdXX', '/path/to/mount point'
#
#                                NOTE: Multiple values can be given. (--disk_show '/' '/dev/sdc1')
#
#    --disk_subtitle type        What information to append to the Disk subtitle.
#                                Takes: name, mount, dir, none
#
#                                'name' shows the disk's name (sda1, sda2, etc)
#
#                                'mount' shows the disk's mount point (/, /mnt/Local Disk, etc)
#
#                                'dir' shows the basename of the disks's path. (/, Local Disk, etc)
#
#                                'none' shows only 'Disk' or the configured title.
#
#    --disk_percent on/off       Hide/Show disk percent.
#
#    --ip_host url               URL to query for public IP
#    --ip_timeout int            Public IP timeout (in seconds).
#    --song_format format        Print the song data in a specific format (see config file).
#    --song_shorthand on/off     Print the Artist/Album/Title on separate lines.
#    --memory_percent on/off     Display memory percentage.
#    --music_player player-name  Manually specify a player to use.
#                                Available values are listed in the config file
#
#TEXT FORMATTING:
#    --colors x x x x x x        Changes the text colors in this order:
#                                title, @, underline, subtitle, colon, info
#    --underline on/off          Enable/Disable the underline.
#    --underline_char char       Character to use when underlining title
#    --bold on/off               Enable/Disable bold text
#    --separator string          Changes the default ':' separator to the specified string.
#
#COLOR BLOCKS:
#    --color_blocks on/off       Enable/Disable the color blocks
#    --col_offset auto/num      Left-padding of color blocks
#    --block_width num           Width of color blocks in spaces
#    --block_height num          Height of color blocks in lines
#    --block_range num num       Range of colors to print as blocks
#
#BARS:
#    --bar_char 'elapsed char' 'total char'
#                                Characters to use when drawing bars.
#    --bar_border on/off         Whether or not to surround the bar with '[]'
#    --bar_length num            Length in spaces to make the bars.
#    --bar_colors num num        Colors to make the bar.
#                                Set in this order: elapsed, total
#    --cpu_display mode          Bar mode.
#                                Possible values: bar, infobar, barinfo, off
#    --memory_display mode       Bar mode.
#                                Possible values: bar, infobar, barinfo, off
#    --battery_display mode      Bar mode.
#                                Possible values: bar, infobar, barinfo, off
#    --disk_display mode         Bar mode.
#                                Possible values: bar, infobar, barinfo, off
#
#IMAGE BACKEND:
#    --backend backend           Which image backend to use.
#                                Possible values: 'ascii', 'caca', 'chafa', 'jp2a', 'iterm2',
#                                'off', 'sixel', 'tycat', 'w3m', 'kitty'
#    --source source             Which image or ascii file to use.
#                                Possible values: 'auto', 'ascii', 'wallpaper', '/path/to/img',
#                                '/path/to/ascii', '/path/to/dir/', 'command output' [ascii]
#
#    --ascii source              Shortcut to use 'ascii' backend.
#
#                                NEW: neofetch --ascii "$(fortune | cowsay -W 30)"
#
#    --caca source               Shortcut to use 'caca' backend.
#    --chafa source              Shortcut to use 'chafa' backend.
#    --iterm2 source             Shortcut to use 'iterm2' backend.
#    --jp2a source               Shortcut to use 'jp2a' backend.
#    --kitty source              Shortcut to use 'kitty' backend.
#    --pixterm source            Shortcut to use 'pixterm' backend.
#    --sixel source              Shortcut to use 'sixel' backend.
#    --termpix source            Shortcut to use 'termpix' backend.
#    --tycat source              Shortcut to use 'tycat' backend.
#    --w3m source                Shortcut to use 'w3m' backend.
#    --off                       Shortcut to use 'off' backend (Disable ascii art).
#
#    NOTE: 'source; can be any of the following: 'auto', 'ascii', 'wallpaper', '/path/to/img',
#    '/path/to/ascii', '/path/to/dir/'
#
#ASCII:
#    --ascii_colors x x x x x x  Colors to print the ascii art
#    --ascii_distro distro       Which Distro's ascii art to print
#
#                                NOTE: AIX, Alpine, Anarchy, Android, Antergos, antiX, AOSC,
#                                Apricity, ArcoLinux, ArchBox, ARCHlabs, ArchStrike,
#                                XFerience, ArchMerge, Arch, Artix, Arya, Bedrock, Bitrig,
#                                BlackArch, BLAG, BlankOn, BlueLight, bonsai, BSD,
#                                BunsenLabs, Calculate, Carbs, CentOS, Chakra, ChaletOS,
#                                Chapeau, Chrom, Cleanjaro, ClearOS, Clear_Linux, Clover,
#                                Condres, Container_Linux, CRUX, Cucumber, Debian, Deepin,
#                                DesaOS, Devuan, DracOS, DragonFly, Drauger, Elementary,
#                                EndeavourOS, Endless, EuroLinux, Exherbo, Fedora, Feren, FreeBSD,
#                                FreeMiNT, Frugalware, Funtoo, GalliumOS, Gentoo, Pentoo,
#                                gNewSense, GNU, GoboLinux, Grombyang, Guix, Haiku, Huayra,
#                                Hyperbola, janus, Kali, KaOS, KDE_neon, Kibojoe, Kogaion,
#                                Korora, KSLinux, Kubuntu, LEDE, LFS, Linux_Lite,
#                                LMDE, Lubuntu, Lunar, macos, Mageia, MagpieOS, Mandriva,
#                                Manjaro, Maui, Mer, Minix, LinuxMint, MX_Linux, Namib,
#                                Neptune, NetBSD, Netrunner, Nitrux, NixOS, Nurunner,
#                                NuTyX, OBRevenge, OpenBSD, OpenIndiana, OpenMandriva,
#                                OpenWrt, osmc, Oracle, PacBSD, Parabola, Pardus, Parrot,
#                                Parsix, TrueOS, PCLinuxOS, Peppermint, popos, Porteus,
#                                PostMarketOS, Proxmox, Puppy, PureOS, Qubes, Radix, Raspbian,
#                                Reborn_OS, Redstar, Redcore, Redhat, Refracted_Devuan, Regata,
#                                Rosa, sabotage, Sabayon, Sailfish, SalentOS, Scientific, Septor,
#                                SharkLinux, Siduction, Slackware, SliTaz, SmartOS, Solus,
#                                Source_Mage, Sparky, Star, SteamOS, SunOS, openSUSE_Leap,
#                                openSUSE_Tumbleweed, openSUSE, SwagArch, Tails, Trisquel,
#                                Ubuntu-Budgie, Ubuntu-GNOME, Ubuntu-MATE, Ubuntu-Studio, Ubuntu,
#                                Void, Obarun, windows10, Windows7, Xubuntu, Zorin, and IRIX
#                                have ascii logos
#
#                                NOTE: Arch, Ubuntu, Redhat, and Dragonfly have 'old' logo variants.
#
#                                NOTE: Use '{distro name}_old' to use the old logos.
#
#                                NOTE: Ubuntu has flavor variants.
#
#                                NOTE: Change this to Lubuntu, Kubuntu, Xubuntu, Ubuntu-GNOME,
#                                Ubuntu-Studio, Ubuntu-Mate  or Ubuntu-Budgie to use the flavors.
#
#                                NOTE: Arcolinux, Dragonfly, Fedora, Alpine, Arch, Ubuntu,
#                                CRUX, Debian, Gentoo, FreeBSD, Mac, NixOS, OpenBSD, android,
#                                Antrix, CentOS, Cleanjaro, ElementaryOS, GUIX, Hyperbola,
#                                Manjaro, MXLinux, NetBSD, Parabola, POP_OS, PureOS,
#                                Slackware, SunOS, LinuxLite, OpenSUSE, Raspbian,
#                                postmarketOS, and Void have a smaller logo variant.
#
#                                NOTE: Use '{distro name}_small' to use the small variants.
#
#    --ascii_bold on/off         Whether or not to bold the ascii logo.
#    -L, --logo                  Hide the info text and only show the ascii logo.
#
#IMAGE:
#    --loop                      Redraw the image constantly until Ctrl+C is used. This fixes issues
#                                in some terminals emulators when using image mode.
#    --size 00px | --size 00%    How to size the image.
#                                Possible values: auto, 00px, 00%, none
#    --crop_mode mode            Which crop mode to use
#                                Takes the values: normal, fit, fill
#    --crop_offset value         Change the crop offset for normal mode.
#                                Possible values: northwest, north, northeast,
#                                west, center, east, southwest, south, southeast
#
#    --xoffset px                How close the image will be to the left edge of the
#                                window. This only works with w3m.
#    --yoffset px                How close the image will be to the top edge of the
#                                window. This only works with w3m.
#    --bg_color color            Background color to display behind transparent image.
#                                This only works with w3m.
#    --gap num                   Gap between image and text.
#
#                                NOTE: --gap can take a negative value which will move the text
#                                closer to the left side.
#
#    --clean                     Delete cached files and thumbnails.
#
#OTHER:
#    --config /path/to/config    Specify a path to a custom config file
#    --config none               Launch the script without a config file
#    --no_config                 Don't create the user config file.
#    --print_config              Print the default config file to stdout.
#    --stdout                    Turn off all colors and disables any ASCII/image backend.
#    --help                      Print this text and exit
#    --version                   Show neofetch version
#    -v                          Display error messages.
#    -vv                         Display a verbose log for error reporting.

###############################################################################################
# SCREENFETCH                                                                                 #
###############################################################################################

# Screenfetch | The Bash Screenshot Information Tool
# https://github.com/KittyKatt/screenFetch

# Fetches system/theme information in terminal for Linux desktop screenshots.
# screenFetch is a "Bash Screenshot Information Tool". This handy Bash script can be used 
# to generate one of those nifty terminal theme information + ASCII distribution logos you 
# see in everyone's screenshots nowadays. It will auto-detect your distribution and display 
# an ASCII version of that distribution's logo and some valuable information to the right. 
# There are options to specify no ASCII art, colors, taking a screenshot upon displaying 
# info, and even customizing the screenshot command! This script is very easy to add to and 
# can easily be extended.

# ENABLE SCREENFETCH
# screenfetch

#Options:
#   -v                 Verbose output.
#   -o 'OPTIONS'       Allows for setting script variables on the
#                      command line. Must be in the following format...
#                      'OPTION1="OPTIONARG1";OPTION2="OPTIONARG2"'
#   -d '+var;-var;var' Allows for setting what information is displayed
#                      on the command line. You can add displays with +var,var. You
#                      can delete displays with -var,var. Setting without + or - will
#                      set display to that explicit combination. Add and delete statements
#                      may be used in conjunction by placing a ; between them as so:
#                      +var,var,var;-var,var. See above to find supported display names.
#   -n                 Do not display ASCII distribution logo.
#   -L                 Display ASCII distribution logo only.
#   -N                 Strip all color from output.
#   -w                 Wrap long lines.
#   -t                 Truncate output based on terminal width (Experimental!).
#   -p                 Portrait output.
#   -s [-u IMGHOST]    Using this flag tells the script that you want it
#                      to take a screenshot. Use the -u flag if you would like
#                      to upload the screenshots to one of the pre-configured
#                      locations. These include: teknik, imgur, mediacrush and hmp.
#   -c string          You may change the outputted colors with -c. The format is
#                      as follows: [0-9][0-9],[0-9][0-9]. The first argument controls the
#                      ASCII logo colors and the label colors. The second argument
#                      controls the colors of the information found. One argument may be
#                      used without the other. For terminals supporting 256 colors argument
#                      may also contain other terminal control codes for bold, underline etc.
#                      separated by semicolon. For example -c "4;1,1;2" will produce bold
#                      blue and dim red.
#   -a 'PATH'          You can specify a custom ASCII art by passing the path
#                      to a Bash script, defining `startline` and `fulloutput`
#                      variables, and optionally `labelcolor` and `textcolor`.
#                      See the `asciiText` function in the source code for more
#                      information on the variables format.
#   -S 'COMMAND'       Here you can specify a custom screenshot command for
#                      the script to execute. Surrounding quotes are required.
#   -D 'DISTRO'        Here you can specify your distribution for the script
#                      to use. Surrounding quotes are required.
#   -A 'DISTRO'        Here you can specify the distribution art that you want
#                      displayed. This is for when you want your distro
#                      detected but want to display a different logo.
#   -E                 Suppress output of errors.
#   -V, --version      Display current script version.
#   -h, --help         Display this help.

###############################################################################################
# ARCHEY                                                                                      #
###############################################################################################

# Archey3
# https://github.com/bluepeppers/archey3
# https://wiki.archlinux.org/index.php/Archey3

# Simple python script to print the Archlinux logo with basic system information.
# Archey3 is a customisable system information printer aimed at people wishing to take 
# screenshots of their desktops.

# COLORS: {black, red, green, yellow, blue, magenta, cyan, and white}
# CONFIG: Archey3's configuration file is stored at ~/.config/archey3.cfg by default.

# ENABLE ARCHEY3
# archey3

#Options:
#  --version             show program's version number and exit
#  -h, --help            show this help message and exit
#  -c COLOR, --color=COLOR
#                        choose a color: black, red, green, yellow, blue,
#                        magenta,            cyan, white [Default: blue]
#  -s, --screenshot      Take a screenshot
#  --config=CONFIG       Set the location of the config file to load.
#  --debug=LOG_LEVEL     The level of errors you wish to display. Choices are
#                        NOTSET, DEBUG, INFO, WARNING, ERROR, and CRITICAL.
#                        CRITICAL is the default.

###############################################################################################
# TMUXINATOR                                                                                  #
###############################################################################################
#
# Tmuxinator - Create and manage tmux sessions easily.
# https://github.com/tmuxinator/tmuxinator
# Install: gem install tmuxinator
source ~/.bin/tmuxinator.bash

###############################################################################################
# BASH GIT PROMPT                                                                             #
# https://github.com/magicmonty/bash-git-prompt                                               #
###############################################################################################
#
GIT_PROMPT_ONLY_IN_REPO=1
source ~/.bash-git-prompt/gitprompt.sh

# GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status
# GIT_PROMPT_IGNORE_SUBMODULES=1 # uncomment to avoid searching for changed files in submodules
# GIT_PROMPT_WITH_VIRTUAL_ENV=0 # uncomment to avoid setting virtual environment infos for node/python/conda environments

GIT_PROMPT_SHOW_UPSTREAM=1 # uncomment to show upstream tracking branch
GIT_PROMPT_SHOW_UNTRACKED_FILES=normal # can be no, normal or all; determines counting of untracked files

# GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=0 # uncomment to avoid printing the number of changed files

# GIT_PROMPT_STATUS_COMMAND=gitstatus_pre-1.7.10.sh # uncomment to support Git older than 1.7.10

# GIT_PROMPT_START=...    # uncomment for custom prompt start sequence
# GIT_PROMPT_END=...      # uncomment for custom prompt end sequence

# as last entry source the gitprompt script
# GIT_PROMPT_THEME=Custom # use custom theme specified in file GIT_PROMPT_THEME_FILE (default ~/.git-prompt-colors.sh)
GIT_PROMPT_THEME_FILE=~/.git-prompt-colors.sh
GIT_PROMPT_THEME=Solarized # use theme optimized for solarized color scheme
source ~/.bash-git-prompt/gitprompt.sh

###############################################################################################
# OH MY GIT PROMPT                                                                            #
# An opinionated git prompt for bash and zsh                                                  #
# https://github.com/arialdomartini/oh-my-git                                                 #
###############################################################################################
#
#source $HOME/.oh-my-git/prompt.sh

###############################################################################################
# POWERLINE                                                                                   #
###############################################################################################
#

#if [ -f `which powerline-daemon` ]; then
#  powerline-daemon -q
#  POWERLINE_BASH_CONTINUATION=1
#  POWERLINE_BASH_SELECT=1
#  . /usr/share/powerline/bindings/bash/powerline.sh
#fi

###############################################################################################
# STARSHIP SHELL PROMPT                                                                       #
###############################################################################################
#
#eval "$(starship init bash)"

###############################################################################################
# LIQUIDPROMPT                                                                                #
# https://github.com/nojhan/liquidprompt                                                      #
#                                                                                             #
# git clone https://github.com/nojhan/liquidprompt.git                                        #
# source liquidprompt/liquidprompt                                                            #
# Start a shell, add the following lines to your .bashrc                                      #
# Only load Liquid Prompt in interactive shells, not from a script or from scp                #
# [[ $- = *i* ]] && source ~/liquidprompt/liquidprompt                                        #
# CONFIGURATION                                                                               #  
# cp ~/liquidprompt/liquidpromptrc-dist ~/.config/liquidpromptrc                              #
###############################################################################################

###############################################################################################
# BASH_IT SCRIPT                                                                              #
# https://github.com/Bash-it/bash-it                                                          #
#                                                                                             #
# Bash-it is a collection of community Bash commands and scripts for Bash 3.2+.               #
# (And a shameless ripoff of oh-my-zsh smiley)                                                #
#                                                                                             #
# INSTALLATION:                                                                               #
# git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it                       #
# Run ~/.bash_it/install.sh (it automatically backs up your ~/.bash_profile                   #
# or ~/.bashrc, depending on your OS)                                                         #
# Edit your modified config (~/.bash_profile or ~/.bashrc) file in order to customize Bash-it.#
#                                                                                             #
# INSTALL OPTIONS:                                                                            #
# The install script can take the following options:                                          #
# --interactive: Asks the user which aliases, completions and plugins to enable.              #
# --silent: Ask nothing and install using default settings.                                   #
# --no-modify-config: Do not modify the existing config file (~/.bash_profile or ~/.bashrc).  #
#                                                                                             #
# UPDATING:                                                                                   #
# To update Bash-it to the latest version, simply run:                                        #
# bash-it update                                                                              #
#                                                                                             #
# HELP SCREENS:                                                                               #
#                                                                                             #
# bash-it show aliases        # shows installed and available aliases                         #
# bash-it show completions    # shows installed and available completions                     #
# bash-it show plugins        # shows installed and available plugins                         #
# bash-it help aliases        # shows help for installed aliases                              #
# bash-it help completions    # shows help for installed completions                          #
# bash-it help plugins        # shows help for installed plugins                              #
#                                                                                             #
# SEARCH:                                                                                     #
# bash-it search term1 [[-]term2] [[-]term3]....                                              #
# bash-it search ruby rake gem bundle irb rails                                               #
###############################################################################################
#
# Path to the bash it configuration
export BASH_IT="/home/raven/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='atomic'

# (Advanced): Change this to the name of your remote repo if you
# cloned bash-it with a remote other than origin such as `bash-it`.
# export BASH_IT_REMOTE='bash-it'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='hexchat'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

THEME_SHOW_PYTHON=true

THEME_SHOW_RUBY=true

# Set Xterm/screen/Tmux title with only a short hostname.
# Uncomment this (or set SHORT_HOSTNAME to something else),
# Will otherwise fall back on $HOSTNAME.
#export SHORT_HOSTNAME=$(hostname -s)

# Set Xterm/screen/Tmux title with only a short username.
# Uncomment this (or set SHORT_USER to something else),
# Will otherwise fall back on $USER.
#export SHORT_USER=${USER:0:8}

# Set Xterm/screen/Tmux title with shortened command and directory.
# Uncomment this to set.
#export SHORT_TERM_LINE=true

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/djl/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# (Advanced): Uncomment this to make Bash-it reload itself automatically
# after enabling or disabling aliases, plugins, and completions.
# export BASH_IT_AUTOMATIC_RELOAD_AFTER_CONFIG_CHANGE=1

# Load Bash It
source "$BASH_IT"/bash_it.sh

###############################################################################################
# WAL (Colorscheme for use with i3wm)                                                         #
###############################################################################################
#
# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
#(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
#cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
#source ~/.cache/wal/colors-tty.sh

###############################################################################################
# GOOGLE CLOUD SDK (GCLOUD)                                                                   #
###############################################################################################
#
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/raven/GoogleCloud/google-cloud-sdk/path.bash.inc' ]; then . '/home/raven/GoogleCloud/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/raven/GoogleCloud/google-cloud-sdk/completion.bash.inc' ]; then . '/home/raven/GoogleCloud/google-cloud-sdk/completion.bash.inc'; fi

###############################################################################################
# FILES REQUIRED TO BE AT THE END OF THE SCRIPT TO WORK PROPERLY                              #
###############################################################################################
#
### Bashhub.com Installation.
### This Should be at the EOF. https://bashhub.com/docs
if [ -f ~/.bashhub/bashhub.sh ]; then
    source ~/.bashhub/bashhub.sh
fi

# NVM - Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/raven/.sdkman"
[[ -s "/home/raven/.sdkman/bin/sdkman-init.sh" ]] && source "/home/raven/.sdkman/bin/sdkman-init.sh"

# Electron Forge
# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[ -f /home/raven/.cache/yay/httptoolkit/src/httptoolkit/node_modules/tabtab/.completions/electron-forge.bash ] && . /home/raven/.cache/yay/httptoolkit/src/httptoolkit/node_modules/tabtab/.completions/electron-forge.bash

wal -r && clear

function reload_gtk_theme() {
  theme=$(gsettings get org.gnome.desktop.interface gtk-theme)
  gsettings set org.gnome.desktop.interface gtk-theme ''
  sleep 1
  gsettings set org.gnome.desktop.interface gtk-theme $theme
}
