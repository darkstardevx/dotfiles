#!/bin/sh
#
###############################################################################################
# Awesome Bash Functions                                                                      # 
# Darkstardevx [darkstardevx@gmail.com]                                                       #
# https://github.com/darkstardevx/scripts                                                     #
############################################################################################### 
#
function cl() {
    DIR="$*";
        # if no DIR given, go home
        if [ $# -lt 1 ]; then
                DIR=$HOME;
    fi;
    builtin cd "${DIR}" && \
    # use your preferred ls command
        ls -F --color=auto
}

# Add colors to cat
function catc(){
    cat "$@" > /tmp/.tmp
    pygmentize -g /tmp/.tmp
    rm /tmp/.tmp
}

# GTK Reload Theme
function reload_gtk_theme() {
  theme=$(gsettings get org.gnome.desktop.interface gtk-theme)
  gsettings set org.gnome.desktop.interface gtk-theme ''
  sleep 1
  gsettings set org.gnome.desktop.interface gtk-theme $theme
}

###############################################################################################
# FILES & FOLDERS                                                                             #
###############################################################################################
#
# Count number of files in a directory
function numfiles() { 
    N="$(ls $1 | wc -l)"; 
    echo "$N files in $1";
}

# Make a folder and cd into it
function mkcd()
{
  mkdir -p -- "$1" && cd -P -- "$1"
}

###############################################################################################
# TERMINALS {xcfe4, terminator, deepin, gnome, tilix, urxvt, st}                              #
###############################################################################################
#
# Adds some text in the rxvt / urxvt terminal frame (if applicable).
function xtitle()
{
    case "$TERM" in
    *term* | rxvt)
        echo -en  "\e]0;$*\a" ;;
    *)  ;;
    esac
}

###############################################################################################
# PROCESSES                                                                                   #
###############################################################################################
#
# Kill a process
kp () {
  ps aux | grep $1 > /dev/null
  mypid=$(pidof $1)
  if [ "$mypid" != "" ]; then
    kill -9 $(pidof $1)
    if [[ "$?" == "0" ]]; then
      echo "PID $mypid ($1) killed."
    fi
  else
    echo "None killed."
  fi
  return;
}

# Returns a color indicating system load.
function load_color()
{
    local SYSLOAD=$(load)
    if [ ${SYSLOAD} -gt ${XLOAD} ]; then
        echo -en ${ALERT}
    elif [ ${SYSLOAD} -gt ${MLOAD} ]; then
        echo -en ${Red}
    elif [ ${SYSLOAD} -gt ${SLOAD} ]; then
        echo -en ${BRed}
    else
        echo -en ${Green}
    fi
}

# Returns a color according to free disk space in $PWD.
function disk_color()
{
    if [ ! -w "${PWD}" ] ; then
        echo -en ${Red}
        # No 'write' privilege in the current directory.
    elif [ -s "${PWD}" ] ; then
        local used=$(command df -P "$PWD" |
                   awk 'END {print $5} {sub(/%/,"")}')
        if [ ${used} -gt 95 ]; then
            echo -en ${ALERT}           # Disk almost full (>95%).
        elif [ ${used} -gt 90 ]; then
            echo -en ${BRed}            # Free disk space almost gone.
        else
            echo -en ${Green}           # Free disk space is ok.
        fi
    else
        echo -en ${Cyan}
        # Current directory is size '0' (like /proc, /sys etc).
    fi
}

# Returns a color according to running/suspended jobs.
function job_color()
{
    if [ $(jobs -s | wc -l) -gt "0" ]; then
        echo -en ${BRed}
    elif [ $(jobs -r | wc -l) -gt "0" ] ; then
        echo -en ${BCyan}
    fi
}

###############################################################################################
# SYSTEM UPTIME                                                                               #
###############################################################################################
#
# System Uptime
myuptime () {
  uptime | awk '{ print "Uptime:", $3, $4, $5 }' | sed 's/,//g'
  return;
}

###############################################################################################
# DISK INFO                                                                                   #
###############################################################################################
#
# SSD Disk Usage
ssd () {
  echo "Device         Total  Used  Free  Pct MntPoint"
  df -h | grep "/dev/sda"
  df -h | grep "/mnt/"
}

###############################################################################################
# FILE & FOLDER TOOLS                                                                         #
# (file extraction, compression tools & system commands)                                      #
###############################################################################################
#
# File Extraction / Archive Tools v1 (extract)
function extract() {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}

# File Extraction / Archive Tools v2 (archive)
function archive() {
    if [ -z ${1} ] || [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
        echo "Usage: extract <archive> [directory]"
        echo "Example: extract presentation.zip."
        echo "Valid archive types are:"
        echo "tar.bz2, tar.gz, tar.xz, tar, bz2, gz, tbz2,"
        echo "tbz, tgz, lzo, rar, zip, 7z, xz, txz, lzma and tlz"
    else
        case "$1" in
            *.tar.bz2|*.tbz2|*.tbz)         tar xvjf "$1" ;;
            *.tgz)                          tar zxvf "$1" ;;
            *.tar.gz)                       tar xvzf "$1" ;;
            *.tar.xz)                       tar xvJf "$1" ;;
            *.tar)                          tar xvf "$1" ;;
            *.rar)                          7z x "$1" ;;
            *.zip)                          unzip "$1" ;;
            *.7z)                           7z x "$1" ;;
            *.lzo)                          lzop -d  "$1" ;;
            *.gz)                           gunzip "$1" ;;
            *.bz2)                          bunzip2 "$1" ;;
            *.Z)                            uncompress "$1" ;;
            *.xz|*.txz|*.lzma|*.tlz)        xz -d "$1" ;;
            *) echo "Sorry, '$1' could not be decompressed." ;;
        esac
    fi
}

# Creates an archive (*.tar.gz) from given directory.
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }
#
# create .tar.gz 
function targz() { tar -zcvf $1.tar.gz $1; rm -r $1; }
#
# extra .tar.gz
function untargz() { tar -zxvf $1; rm -r $1; }
#
# Create a ZIP archive of a file or folder.
function makezip() { zip -r "${1%%/}.zip" "$1" ; }
#
# Make your directories and files access rights sane.
function sanitize() { chmod -R u=rwX,g=rX,o= "$@" ;}
#

###############################################################################################
# DISPLAY [XSERVER]                                                                           #
###############################################################################################
#
# Automatic setting of $DISPLAY (if not set already).
function get_xserver ()
{
    case $TERM in
        xterm )
            XSERVER=$(who am i | awk '{print $NF}' | tr -d ')''(' )
            # Ane-Pieter Wieringa suggests the following alternative:
            #  I_AM=$(who am i)
            #  SERVER=${I_AM#*(}
            #  SERVER=${SERVER%*)}
            XSERVER=${XSERVER%%:*}
            ;;
            aterm | rxvt)
            # Find some code that works here. ...
            ;;
    esac
}

###############################################################################################
# PASSWORD GENERATOR                                                                          #
###############################################################################################
#
# Generate Password
function genpasswd() {
	local l=$1
       	[ "$l" == "" ] && l=20
      	tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${l} | xargs
}

###############################################################################################
# IP ADDRESS                                                                                  #
###############################################################################################
#
 # Get My IP Address
function my_ip() # Get IP adress on ethernet.
{
    MY_IP=$(/sbin/ifconfig enp2s0 | awk '/inet/ { print $2 } ' |
      sed -e s/addr://)
    echo ${MY_IP:-"Not connected"}
}

# IP address lookup
alias whatismyip="whatsmyip"
function whatsmyip ()
{
	# Dumps a list of all IP addresses for every device
	# /sbin/ifconfig |grep -B1 "inet addr" |awk '{ if ( $1 == "inet" ) { print $2 } else if ( $2 == "Link" ) { printf "%s:" ,$1 } }' |awk -F: '{ print $1 ": " $3 }';

	# Internal IP Lookup
	echo -n "Internal IP: " ; /sbin/ifconfig enp2s0 | grep "inet addr" | awk -F: '{print $2}' | awk '{print $1}'

	# External IP Lookup
	echo -n "External IP: " ; wget http://smart-ip.net/myip -O - -q
}

# Show current network information
function netinfo ()
{
	echo "--------------- Network Information ---------------"
	/sbin/ifconfig | awk /'inet addr/ {print $2}'
	echo ""
	/sbin/ifconfig | awk /'Bcast/ {print $3}'
	echo ""
	/sbin/ifconfig | awk /'inet addr/ {print $4}'

	/sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
	echo "---------------------------------------------------"
}

###############################################################################################
# FILE & STRING FUNCTIONS                                                                     #
###############################################################################################
#
function swap()
{ # Swap 2 filenames around, if they exist (from Uzi's bashrc).
    local TMPFILE=tmp.$$

    [ $# -ne 2 ] && echo "swap: 2 arguments needed" && return 1
    [ ! -e $1 ] && echo "swap: $1 does not exist" && return 1
    [ ! -e $2 ] && echo "swap: $2 does not exist" && return 1

    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

#  Find a pattern in a set of files and highlight them:
#+ (needs a recent version of egrep).
function fstr()
{
    OPTIND=1
    local mycase=""
    local usage="fstr: find string in files.
Usage: fstr [-i] \"pattern\" [\"filename pattern\"] "
    while getopts :it opt
    do
        case "$opt" in
           i) mycase="-i " ;;
           *) echo "$usage"; return ;;
        esac
    done
    shift $(( $OPTIND - 1 ))
    if [ "$#" -lt 1 ]; then
        echo "$usage"
        return;
    fi
    find . -type f -name "${2:-*}" -print0 | \
xargs -0 egrep --color=always -sn ${case} "$1" 2>&- | more

}

# Find a file with a pattern in name:
function ff() { find . -type f -iname '*'"$*"'*' -ls ; }

# Find a file with pattern $1 in name and Execute $2 on it:
function fe() { find . -type f -iname '*'"${1:-}"'*' \
-exec ${2:-file} {} \;  ; }

###############################################################################################
# PACKAGE UPGRADES                                                                            #
###############################################################################################

# Hugo install or upgrade
function gethugo () {
    wget -q -P tmp/ https://github.com/gohugoio/hugo/releases/download/v"$@"/hugo_extended_"$@"_Linux-64bit.tar.gz
    tar xf tmp/hugo_extended_"$@"_Linux-64bit.tar.gz -C tmp/
    sudo mv -f tmp/hugo /usr/local/bin/
    rm -rf tmp/
    hugo version
}

# GO install or upgrade
function getgolang () {
    sudo rm -rf /usr/local/go
    wget -q -P tmp/ https://dl.google.com/go/go"$@".linux-amd64.tar.gz
    sudo tar -C /usr/local -xzf tmp/go"$@".linux-amd64.tar.gz
    rm -rf tmp/
    go version
}

# Get the name of our branch and put parenthesis around it
function gitBranch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Remote Origin URL for GitLab
function glab () {
    git remote set-url origin --add git@gitlab.com:"$@"/"${PWD##*/}".git
    git remote -v
}

# Remote Origin URL for GitHub
function ghub () {
    git remote set-url origin --add git@github.com:"$@"/"${PWD##*/}".git
    git remote -v
}

#With glab username, we can create a new origin URL for the current Git repository with our username on GitLab.com. Pushing to a new remote URL automatically creates a new private GitLab repository, so this is a useful shortcut for creating backups!

###############################################################################################
# WEB FUNCTIONS                                                                               #
###############################################################################################

# View Apache logs
function apachelog ()
{
	if [ -f /etc/httpd/conf/httpd.conf ]; then
		cd /var/log/httpd && ls -xAh && multitail --no-repeat -c -s 2 /var/log/httpd/*_log
	else
		cd /var/log/apache2 && ls -xAh && multitail --no-repeat -c -s 2 /var/log/apache2/*.log
	fi
}

# Edit the Apache configuration
function apacheconfig ()
{
	if [ -f /etc/httpd/conf/httpd.conf ]; then
		gedit /etc/httpd/conf/httpd.conf
	elif [ -f /etc/apache2/apache2.conf ]; then
		gedit /etc/apache2/apache2.conf
	else
		echo "Error: Apache config file could not be found."
		echo "Searching for possible locations:"
		sudo updatedb && locate httpd.conf && locate apache2.conf
	fi
}

# Edit the PHP configuration file
function phpconfig ()
{
	if [ -f /etc/php.ini ]; then
		gedit /etc/php.ini
	elif [ -f /etc/php/php.ini ]; then
		gedit /etc/php/php.ini
	elif [ -f /etc/php5/php.ini ]; then
		gedit /etc/php5/php.ini
	elif [ -f /usr/bin/php5/bin/php.ini ]; then
		gedit /usr/bin/php5/bin/php.ini
	elif [ -f /etc/php5/apache2/php.ini ]; then
		gedit /etc/php5/apache2/php.ini
	else
		echo "Error: php.ini file could not be found."
		echo "Searching for possible locations:"
		sudo updatedb && locate php.ini
	fi
}

# Edit the MySQL configuration file
function mysqlconfig ()
{
	if [ -f /etc/my.cnf ]; then
		gedit /etc/my.cnf
	elif [ -f /etc/mysql/my.cnf ]; then
		gedit /etc/mysql/my.cnf
	elif [ -f /usr/local/etc/my.cnf ]; then
		gedit /usr/local/etc/my.cnf
	elif [ -f /usr/bin/mysql/my.cnf ]; then
		gedit /usr/bin/mysql/my.cnf
	elif [ -f ~/my.cnf ]; then
		gedit ~/my.cnf
	elif [ -f ~/.my.cnf ]; then
		gedit ~/.my.cnf
	else
		echo "Error: my.cnf file could not be found."
		echo "Searching for possible locations:"
		sudo updatedb && locate my.cnf
	fi
}

###############################################################################################
# TERMINAL FUNCTIONS                                                                          #
###############################################################################################
# Adds some text in the terminal frame (if applicable).
function xtitle()
{
    case "$TERM" in
    *term* | rxvt)
        echo -en  "\e]0;$*\a" ;;
    *)  ;;
    esac
}

# .. and functions
function man()
{
    for i ; do
        xtitle The $(basename $1|tr -d .[:digit:]) manual
        command man -a "$i"
    done
}

###############################################################################################
# BACKGROUND SERVICES                                                                         #
###############################################################################################
function te()  # wrapper around xemacs/gnuserv
{
    if [ "$(gnuclient -batch -eval t 2>&-)" == "t" ]; then
       gnuclient -q "$@";
    else
       ( xemacs "$@" &);
    fi
}

function soffice() { command soffice "$@" & }
function firefox() { command firefox "$@" & }
function xpdf() { command xpdf "$@" & }
function chromium() { command chromium "$@" & }

###############################################################################################
# WEB SEARCH                                                                                  #
###############################################################################################
#
# Google search from command line
function encode() { echo -n $@ | perl -pe's/([^-_.~A-Za-z0-9])/sprintf("%%%02X", ord($1))/seg'; }
function google() { chrome http://www.google.com/search?hl=en#q="`encode $@`" ;}
function yahoo() { chrome http://search.yahoo.com/search?p="`encode $@`" ;}
function bing() { chrome http://www.bing.com/search?q="`encode $@`" ;}
function amazon() { chrome http://www.amazon.com/s/ref=nb_ss?field-keywords="`encode $@`" ;}
function wiki() { chrome http://en.wikipedia.org/w/index.php?search="`encode $@`" ;}
#

###############################################################################################
# SIMPLE NOTE TAKER                                                                           #
###############################################################################################
#
function note () {
    # if file doesn't exist, create it
    if [[ ! -f $HOME/.notes ]]; then
        touch "$HOME/.notes"
    fi

    if ! (($#)); then
        # no arguments, print file
        cat "$HOME/.notes"
    elif [[ "$1" == "-c" ]]; then
        # clear file
        printf "%s" > "$HOME/.notes"
    else
        # add all arguments to file
        printf "%s\n" "$*" >> "$HOME/.notes"
    fi
}

###############################################################################################
# SIMPLE TASK UTILITY                                                                         #
###############################################################################################
#
function todo() {
    if [[ ! -f $HOME/.todoapp ]]; then
        touch "$HOME/.todoapp"
    fi

    if ! (($#)); then
        cat "$HOME/.todoapp"
    elif [[ "$1" == "-l" ]]; then
        nl -b a "$HOME/.todoapp"
    elif [[ "$1" == "-c" ]]; then
        > $HOME/.todoapp
    elif [[ "$1" == "-r" ]]; then
        nl -b a "$HOME/.todoapp"
        eval printf %.0s- '{1..'"${COLUMNS:-$(tput cols)}"\}; echo
        read -p "Type a number to remove: " number
        sed -i ${number}d $HOME/.todoapp "$HOME/.todoapp"
    else
        printf "%s\n" "$*" >> "$HOME/.todoapp"
    fi
}

###############################################################################################
# IP INFO                                                                                     #
###############################################################################################
#
function ipif() { 
    if grep -P "(([1-9]\d{0,2})\.){3}(?2)" <<< "$1"; then
	 curl ipinfo.io/"$1"
    else
	ipawk=($(host "$1" | awk '/address/ { print $NF }'))
	curl ipinfo.io/${ipawk[1]}
    fi
    echo
}

function myip() {
    extIp=$(dig +short myip.opendns.com @resolver1.opendns.com)

    printf "Wireless IP: "
    MY_IP=$(/sbin/ifconfig wlp4s0 | awk '/inet/ { print $2 } ' |
      sed -e s/addr://)
    echo ${MY_IP:-"Not connected"}


    printf "Wired IP: "
    MY_IP=$(/sbin/ifconfig enp2so | awk '/inet/ { print $2 } ' |
      sed -e s/addr://)
    echo ${MY_IP:-"Not connected"}

    echo ""
    echo "WAN IP: $extIp"

}

###############################################################################################
# CALCULATOR                                                                                  #
###############################################################################################
#
function calc() {
    echo "scale=3;$@" | bc -l
}

###############################################################################################
# WEATHER                                                                                     #
###############################################################################################
#
### weather: pass your city or zip code, and it returns the weather!
### Usage: weather cleveland
###              OR
###         weather 44106
function weather() { 
      curl wttr.in/"$1"; 
}

###############################################################################################
# CUSTOM CONTENT                                                                              #
###############################################################################################
#
# News API
function getnews () {
  curl https://newsapi.org/v2/top-headlines -G \
    -d country=us \
    -d apiKey=c27ef8658ed9407a8650c31bbc98a8a9
}

# More News API
function morenews () {
  curl https://newsapi.org/v2/top-headlines -s -G \
    -d sources=$1 \
    -d apiKey=c27ef8658ed9407a8650c31bbc98a8a9 \
    | jq '.articles[] | .title'
}

function startmyday () {
echo "Good morning, $USER."
}

function clearterm() {
  clear
  echo 'Cleared the terminal'
}

#function get_name() {
#  echo "$USER"
#}
#
#echo "Logged in as: $(get_name)"

# MESSAGE
#Lets you set messages to display whenever you open a new terminal. Everything in ~/.message will be displayed. #Everything in ~/.message-oneshot will be displayed and then the file will be erased. Use message whatever to add #a new line to ~/.message, or message with no arguments to run it interactively and add multiple lines. Use #unremind to remove the last line from ~/.message (this requires moreutils to be installed).

if [ -f $HOME/.message ]; then
    cat $HOME/.message
fi

if [ -f $HOME/.message-oneshot ]; then
    cat $HOME/.message-oneshot
    rm $HOME/.message-oneshot
fi

function message() {
    if [ "$1" ]; then
        echo "$@" >> ~/.message
    else
        cat >> ~/.message
    fi
}

alias unremind='head -n-1 ~/.message | sponge ~/.message'
