#!/usr/bin/env bash
#
###############################################################################################
# Ultimate Bash Aliases for Arch Linux                                                        #
# Collected from various sources                                                              #
# Darkstardevx [darkstardevx@gmail.com]                                                       #    
# https://github.com/darkstardevx/scripts                                                     #
###############################################################################################
#
#When setting up a new aliases file be sure to check for possible
#naming conflicts with other apps or bash files.
#
#Use xed, gedit or your favorite editor, or alter for ksh, sh, etc.
# ea - alias for editing aliases
#
# Aliases
# alias alias_name="command_to_run"
#
# The aliases should be named in a way that is easy to remember. Add comments for future reference.

alias ea='xed ~/.bash_aliases; source ~/.bash_aliases && source $HOME/.bash_aliases && echo "aliases sourced  --ok."'

# open bashrc & edit
alias bsh='xed ~/.bashrc; source ~/.bashrc && source $HOME/.bashrc && echo "Bash Sourced  --ok."'

# Source bash_profile
alias bashpsrc='source ~/.bash_profile && echo "Bash Sourced  --ok."'

## Refresh Sources ##
# Refresh .bashrc (source)
alias rebash='source ~/.bashrc'

# Refresh .bash_profile (source)
alias rebashp='source ~/.bash_profile'

# Refresh .bash_aliases (source)
alias rebasha='source ~/.bash_aliases'

# Refresh .bash_functions (source)
alias refunc='source ~/.bash_functions'

# Refresh .docker_aliases (source)
alias redock='source ~/.docker_aliases'

# Refresh .git_aliases (source)
alias regit='source ~/.git_aliases'

# Ccat (cat) colorize cat output
alias cat='ccat'

alias nf='neofetch'

# Edit Files
alias vimrc='xed ~/.vimrc'
alias nanorc='xed ~/.nanorc'
alias bashrc='xed ~/.bashrc'
alias dockra='xed ~/.docker_aliases'
alias gita='xed ~/.git_aliases'
alias bashfun='xed ~/.bash_functions'
alias inputrc='xed ~/.inputrc'
alias muttrc='xed ~/.muttrc'
alias alacr='xed ~/.config/alacritty/alacritty.yml'

# NNN (POSIX Terminal) Selection Alias
alias ncp="cat ${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.selection | tr '\0' '\n'"

# Ping Commands
alias pg="ping google.com -c 5"
alias pt="ping facebook.com -c 5"
alias ping="ping -c 5"
alias fastping="ping -c 100 -s.2"

# System State
alias reboot="sudo /sbin/reboot"
alias poweroff="sudo /sbin/poweroff"
alias halt="sudo /sbin/halt"
alias shutdown="sudo /sbin/shutdown"
alias flighton='sudo rfkill block all'
alias flightoff='sudo rfkill unblock all'

# Show Open Ports
alias ports='sudo netstat -tulanp'

# Free and Used
alias meminfo="free -m -l -t"

# Get top process eating memory
alias psmem="ps auxf | sort -nr -k 4"
alias psmem10="ps auxf | sort -nr -k 4 | head -10"

# Get top process eating cpu
alias pscpu="ps auxf | sort -nr -k 3"
alias pscpu10="ps auxf | sort -nr -k 3 | head -10"

# Get details of a process
alias paux='ps aux | grep'

# Get server cpu info
alias cpuinfo="lscpu"

# Grabs the disk usage in the current directory
alias usage='du -ch | grep total'

# Gets the total disk usage on your machine
alias totalusage='df -hl --total | grep total'

# Shows the individual partition usages without the temporary memory values
alias partusage='df -hlT --exclude-type=tmpfs --exclude-type=devtmpfs'

# Fortune
alias fort='fortune'

# Cowsay & Fortune
alias cowfor='cowthink $(fortune)'
alias cowfort='cowsay $(fortune -o)'
alias forsay='fortune -c | cowthink -f $(find /usr/share/cows -type f | shuf -n 1)'
alias forthink='fortune -a | fmt -80 -s | $(shuf -n 1 -e cowsay cowthink) -$(shuf -n 1 -e b d g p s t w y) -f $(shuf -n 1 -e $(cowsay -l | tail -n +2)) -n'

# Figlet & Lolcat
alias figar='figlet ArchLinux | lolcat'
alias figro='figlet ArchLinux Rocks! | lolcat'
alias figbox='figlet $HOSTNAME | lolcat'

# News
alias news='newsboat'

# Bashman (PacMan Guys Visual)
alias pacmen='bashman'

# Mkdocs Stuff
alias mkpush='mkdocs gh-deploy --clean'
alias mkdeploy='mkpush'
alias mkrun='mkdocs serve'

# Get internal and external IP address
alias ipi='ipconfig getifaddr enp2s0'
alias ipe='curl ipinfo.io/ip'

# Bluetooth Toggle
alias toggle-bluetooth='if ! systemctl status bluetooth.service ; then systemctl start bluetooth.service; else systemctl stop bluetooth.service; fi '

# Inxi System Information
alias infx='inxi -Fx'

# xrdb merge
alias xmerge='xrdb -merge ~/.Xdefaults'

# Confirm unsafe file operations.
# Make some possibly destructive commands more interactive.
# This will prompt to confirm when copying over, moving over or deleting a file.
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# Add some easy shortcuts for formatted directory listings and add a touch of color.
alias ll='ls -lF --color=auto'
alias la='ls -alF --color=auto'
alias ls='ls -F'
alias lt='ls --human-readable --size -1 -S --classify'
alias lls='ls -la --sort=size'
alias llt='ls -la --sort=time'

# Diff Color Output
alias diff='diff --color=auto'

# IP Color Output
alias ip='ip -color=auto'

# List all files larger than a given size.
# For example, llfs +10k will find and display all files larger than 10 kilobytes in the currect directory #hierarchy.
alias llfs='_f(){ find . -type f -size "$1" -exec ls --color --classify --human-readable -l {} \; ; }; _f'

# Alias for alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias for finding out what is taking so much space on your drives!
alias diskspace="du -S | sort -n -r |more"      # Disk usage

# Command line mplayer movie watching for the win.
alias mp="mplayer -fs"      # MPlayer custom alias

# Show the size (sorted) of only the folders in this directory
alias folders="find . -maxdepth 1 -type d -print | xargs du -sk | sort -rn"

# Make the ls command output in color
# This alias is overridden if using Bash_It or liquidprompt
alias ls="ls --color=auto"
#
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# -> Prevents accidentally clobbering files.
alias mkdir='mkdir -p'

alias h='history'
alias j='jobs -l'
alias which='type -a'

#The qmv Rename Utility
#
#The qmv utility is used to rename files by way of an auto-generated document of filenames that will be opened #in your editor ready for modification; the renames will be applied after the editor has exited. This utility is #especially useful for bulk renames where the power of editor substitution can be used to quickly specify the #desired renames.

#By default, qmv will use two editor columns, in my experience this consumes too much valuable real-estate for #little benefit, hence, I recommend the following Bash alias (force destination-only):
alias qmv='qmv -f do'

#Usage
#qmv **/*.JPG # rename to lowercase '.jpg' extension via substitution
#qmv *.old    # rename to '.BAK' extension also via substitution

#
# Pretty-print of some PATH variables:
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
#
alias du='du -kh'    # Makes a more readable output.
alias df='df -kTh'
#
# Add colors for filetype and  human-readable sizes by default on 'ls':
#alias ls='ls -h --color'
alias lx='ls -lXB'         #  Sort by extension.
alias lk='ls -lSr'         #  Sort by size, biggest last.
#alias lt='ls -ltr'         #  Sort by date, most recent last.
alias lc='ls -ltcr'        #  Sort by/show change time,most recent last.
alias lu='ls -ltur'        #  Sort by/show access time,most recent last.

# The ubiquitous 'll': directories first, with alphanumeric sorting:
#alias ll="ls -lv --group-directories-first"
alias lm='ll |more'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.
alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...

alias left='ls -t -1'

alias count='find . -type f | wc -l'

###############################################################################################
# Smarter Tab Completion                                                                      #
###############################################################################################
#
#The option completion-ignore-case tells Readline to perform filename completion in a case-insensitive fashion. #This is almost always what you want, and it comes in handy particularly on OS X, where system folders are #capitalized by default: I no longer need to press <Shift> when I want to cd into Documents, typing cd do<Tab> #will be enough.

#With completion-map-case, filename matching during completion will treat hyphens and underscores as equivalent. #Since in most keyboard layouts typing an underscore usually requires pressing <Shift>, that’s another keystroke #saved. This option requires completion-ignore-case to be enabled.

#Lastly, show-all-if-ambiguous will get Readline to display all possible matches for an ambiguous pattern at the #first <Tab> press instead of at the second. This is another small UX improvement you will get used to in no #time.

bind "set completion-ignore-case on"
bind "set completion-map-case on"
bind "set show-all-if-ambiguous on"

###############################################################################################
# Python Virtual Environment                                                                  #
###############################################################################################
#
#Running ve creates a new directory, called venv, containing the usual virtual environment filesystem for #Python3. The va alias activates the environment in your current shell:

#$ cd my-project
#$ ve
#$ va
#(venv) $

alias ve='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'

###############################################################################################
# Copy Progress Bar                                                                           #
###############################################################################################
#
alias cpv='rsync -ah --info=progress2'

###############################################################################################
# Trash                                                                                       #
###############################################################################################
#
# This simple alias provides a way to toss files into the Trash bin from your terminal.
# Trash is located at ~/.local/share/Trash
alias tcn='mv --force -t ~/.local/share/Trash '

###############################################################################################
# Mount Aliases                                                                               #
###############################################################################################
#
alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"

###############################################################################################
# Date & Time Aliases                                                                         #
###############################################################################################
#
alias now='date +"%T"'
alias curdate='date +"%d-%m-%Y"'

###############################################################################################
# Text Editor & IDE Aliases                                                                   #
###############################################################################################
#
# Sublime Text
alias sb='subl3 .'

# Atom Editor
alias at='atom'

# Android Studio
alias ast='android-studio'

# PyCharm
alias pyc='pycharm'

# Intellij Studio
alias intj='idea'

# Apache NetBeans
alias netb='netbeans'

# Brackets Editor
alias brackets='open -a Brackets'

# VSCodium
alias vsc='/usr/share/vscodium-bin/bin/codium'

# Eclipse
alias ecl='/home/raven/ide/eclipse/eclipse'

# Scala
alias scl='/home/raven/ide/scala/eclipse'

# Aptana Studio
alias apt='aptana-studio'

# Komodo Editor
alias kmd='komodo'

# KDevelop
alias kdev='kdevelop'

# Geany
alias gea='geany'

# Bluefish Editor
alias blu='bluefish'

###############################################################################################
# Web Dev Tools Aliases                                                                       #
###############################################################################################
#
# Postman
alias pstmn='postman'

# Koala
alias koa='koala'

# DevHelp
alias devh='devhelp'

###############################################################################################
# Markdown Aliases                                                                            #
###############################################################################################
#
# Remarkable
alias remark='remarkable'

# ReText
alias ret='retext'

# Typora
alias typ='typora'

# Ghostwriter
alias ghstw='ghostwriter'

###############################################################################################
# System Tools Aliases                                                                        #
###############################################################################################
#
# Cylon (Arch Maintenance Program)
alias cy='cylon'

# System Tools ($HOME/bin/)
alias sys='sysinop'
alias art='archtools'

# system info
alias inf='kinfocenter'

###############################################################################################
# Multimedia / Video Aliases                                                                  #
###############################################################################################
#
# youtube-dl-gui
alias ytg='youtube-dl-gui'

# youtube-dl
alias ytdl='youtube-dl --prefer-ffmpeg'

# youtube-dl playlist
alias ytdlpl='youtube-dl -t'

###############################################################################################
# NPM Aliases                                                                                 #
###############################################################################################
#
alias ni='npm install'
alias nis='npm install --save'

###############################################################################################
# Folder Aliases                                                                              #
###############################################################################################
#
alias dev='cd /home/raven/devspace/'

###############################################################################################
# Aliases                                                                                     #
###############################################################################################
#
# Clear the screen of your clutter
alias c='clear'

# Show history
alias h='history'

# History
alias hf='history | grep $1'

#
alias pf='ps -e | grep $1'

# Tree view
alias trv='tree'

# disk usage
alias du='du -d 1 -h'

# Show date
alias d='date'

# show users online
alias wh='w'

# who you are logged in as
alias who='whoami'

#Todo.txt
alias td='todo.sh list'

# Make sure dnstop only shows enp2s0 stats
alias dnstop='dnstop -l 5  enp2s0'

# Json tools (pipe unformatted to these to nicely format the JSON)
alias json='python3 -m json.tool'
alias jsonf='python3 -m json.tool'

# GREP Motifications 
alias grep='grep --color'
alias grepp='grep -P --color'

# ls command shortcuts 
alias l.='ls -d .* --color=tty'

# Simple X Image Viewer
alias pic='sxiv'

# Arch Linux system update - if user is not root, pass all commands via sudo
alias pacup='sudo pacman -Syyu'
alias yup='yaourt -Syyua'

alias supac='sudo pacman -S'

# superuser
alias super='sudo su'

# reload bashrc
alias reload='. /home/raven/.bashrc'

# reload bash_aliases
alias rba='. /home/raven/.bash_aliases'

# sudo history
alias sh='sudo "$BASH" -c "$(history -p !!)"'

# Make sure vnstat uses enp2s0 by default 
alias vnstat='vnstat -i enp2s0'

# Show kernel information
alias knl='uname -a'

# Clear System Cache
alias cc='sudo sh -c "sync; echo 3 > /proc/sys/vm/drop_caches"'

# Lock Screen Xfce4
alias xflk='xflock4'

# Gnome Search Tool
alias gst='gnome-search-tool &'

# CoreFreq CPU Tool
alias cfq='corefreq-cli'

# Use Shutter to take desktop screenshot
alias sshot='shutter -f -e -o ''Pictures/screenshots/%y%b%d-%H%M%S.jpg'

# system uptime
alias up='uptime'

# CPU temperature sensors
alias cps='sensors'

# report virtual memory statistics
alias vms='vmstat'

# console-based network traffic monitor
alias vns='vnstat'

# Android File Transfer (MTP)
alias aft='android-file-transfer'

# xcowsay
alias csay='xcowsay'

# Zenity Calendar
alias zencal='zenity --calendar'

# GColor2
alias gc2='gcolor2'

# root - run login shell as the target user; a command may also be specified
alias root='sudo -i'

# exit
alias x='exit'

# lsblock
alias lb='lsblk'

# blockid
alias blk='blkid'

# touch
alias tch='touch'

# VTClock
alias vtc='vtclock -1'

# tty-clock
alias tclock='tty-clock -cts -C4'

# pinfo - color manpages, etc
alias info='pinfo'

###############################################################################################
# Network Aliases                                                                             #
###############################################################################################

# Speedtest
alias spt='speedtest-cli'

# Cylon
alias cy='cylon'

# Pacman Cache (paccache)
alias pacrm='paccache -vr -k1'

# Liquid Prompt
alias lp='source liquidprompt/liquidprompt'

# Pacman List (w/ versions)
alias pacl='pacman -Q >> paclist'

# List packages (all info)
alias lpac='pacman -Qi >> packages'

# Make grep more user friendly by highlighting matches
# and exclude grepping through .svn folders.
alias grep='grep --color=auto --exclude-dir=\.svn'

# Shortcut for using the meld tool for svn diffs.
alias svnmeld='svn diff --diff-cmd meld'

###############################################################################################
# Browser Aliases                                                                             #
###############################################################################################
alias ffox='/usr/bin/firefox'
alias chm='/usr/bin/chromium'
alias chr='/opt/google/chrome/chrome'
alias pale='/usr/bin/palemoon'

# Default Browser
alias browser='chromium'

###############################################################################################
# Docker Aliases                                                                              #
###############################################################################################
#
## pass options to free ##
alias meminfo='free -m -l -t'
 
## get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
 
## get top process eating cpu ##
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
 
## get GPU ram on desktop / laptop##
alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'

###############################################################################################
# Docker Aliases                                                                              #
###############################################################################################
#
# Docker Refresh (docker-refresh)
alias docker-refresh='docker-compose down && docker-compose up'

###############################################################################################
# Functions                                                                                   #
###############################################################################################
#
# Scrape images with wget
# $1 = url
# Example: scrapeimages https://google.com/
function scrapeimages() {
  wget -nd -H -p -A jpg,jpeg,png,gif -e robots=off $1
}

# Remove audio from video
# $1 = source file
# $2 = destination
# Example: removeaudio myvideo.webm myvideo-silent.mp4
function removeaudio() {
  ffmpeg -i $1 -vcodec copy -an $2
}

###############################################################################################
# Utilities                                                                                   #
###############################################################################################
#
alias unrar='unrar x'
alias p7='p7zip'
alias wgetc='wget -c ' # resume download automatically

###############################################################################################
# Web Server Aliases (services)                                                               #
###############################################################################################
#
# Python HTTP Server (SimpleHTTPServer)
alias servedir='python3 -m http.server 7800' # Start Simple Server

#Note: If you already have something running on port 8000, you can choose another port by running the server #command followed by an alternative port number, e.g. python3 -m http.server 7800 (Python 3.x) or python -m #SimpleHTTPServer 7800 (Python 2.x). You can then access your content at localhost:7800.

# PHP Server
alias phps='php -S localhost:7900' # Start PHP Server

###############################################################################################
# My Custom Bash Aliases                                                                      #
###############################################################################################
#
# NGINX
alias nxrs='sudo systemctl restart nginx.service'
alias nxstat='sudo systemctl status nginx.service'
alias nginxconf='sudo xed /etc/nginx/nginx.conf'

# Apache (httpd)
alias ars='sudo systemctl restart httpd.service'
alias astat='sudo systemctl status httpd.service'
alias httpdconf='sudo xed /etc/httpd/conf/httpd.conf'

# PHP-FPM
alias fpm='sudo systemctl restart php-fpm.service'
alias fpmstat='sudo systemctl status php-fpm.service'

# MariaDB (mySQL)
alias mdb='sudo systemctl restart mariadb.service'
alias mdbstat='sudo systemctl status mariadb.service'

# Docker
alias dockr='sudo systemctl restart docker.service'
alias dockrstat='sudo systemctl status docker.service'

# MongoDB
alias mongodb='sudo systemctl restart mongodb.service'
alias mongodbstat='sudo systemctl status mongodb.service'

# Samba (smb)
alias smb='sudo systemctl restart smb.service'
alias smbstat='sudo systemctl status smb.service'
alias smbconf='sudo xed /etc/samba/smb.conf'

# Samba (nmb)
alias nmb='sudo systemctl restart nmb.service'
alias nmbstat='sudo systemctl status nmb.service'

# SSH (Secure Shell)
alias sshrs='sudo systemctl restart sshd.service'
alias sshrstat='sudo systemctl status sshd.service'
alias sshconf='sudo xed /etc/ssh/sshd_config'

# Privoxy
alias priv='sudo systemctl restart privoxy.service'
alias privstat='sudo systemctl status privoxy.service'
alias privoxyconf='sudo xed /etc/privoxy/config'

# Squid
alias sqd='sudo systemctl restart squid.service'
alias sqdstat='sudo systemctl status squid.service'
alias squidconf='sudo xed /etc/squid/squid.conf'

# Polipo
alias poli='sudo systemctl restart polipo.service'
alias polistat='sudo systemctl status polipo.service'
alias polipoconf='sudo xed /home/raven/.poliporc'

# HAProxy
alias hapx='sudo systemctl restart haproxy.service'
alias hapxstat='sudo systemctl status haproxy.service'
alias hapxconf='sudo xed /etc/haproxy/haproxy.cfg'

# Teamviewer
alias tview='sudo systemctl restart teamviewerd'
alias tviewstat='sudo systemctl status teamviewerd'

# DNSmasq
alias dnsm='sudo systemctl restart dnsmasq.service'
alias dnsmstat='sudo systemctl status dnsmasq.service'
alias dnsmasqconf='sudo xed /etc/dnsmasq.conf'

# DNScrypt
alias dnscp='sudo systemctl restart dnscrypt-proxy.service'
alias dnscpstat='sudo systemctl status dnscrypt-proxy.service'
alias dnscryptconf='sudo xed /etc/dnscrypt-proxy/dnscrypt-proxy.toml'

# Unbound
alias unbdn='sudo systemctl restart unbound.service'
alias undndstat='sudo systemctl status unbound.service'
alias unboundconf='sudo xed /etc/unbound/unbound.conf'

# TeamViewer
alias tvw='sudo systemctl restart teamviewerd.service'
alias tvwstat='sudo systemctl status teamviewerd.service'

# NetworkManager
alias netman='sudo systemctl restart NetworkManager.service'
alias netmanstat='sudo systemctl status NetworkManager.service'

# Plex
alias plexd='sudo systemctl restart plexmediaserver.service'
alias plexdstat='sudo systemctl status plexmediaserver.service'

###############################################################################################
# Bash Aliases                                                                                #
###############################################################################################
#
# Stop dhcpcd@*
alias stopnetd='sudo systemctl stop dhcpcd@*'

# FSTAB
alias fstab='sudo xed /etc/fstab'

# Get Current IP
alias getmyip='curl http://ipecho.net/plain; echo'

# Alias's to change the directory
alias httpa='cd /srv/http/'

# Alias's to change the directory
alias nginx='cd /usr/share/nginx/html/'

# Alias Chmod Commands
alias mx='chmod a+x'
alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias 777='chmod -R 777'

# Search running processes
alias p='ps aux | grep '
alias topcpu='/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10'

# Search files in the current folder
alias f='find . | grep '

# Count all files (recursively) in the current folder
alias countfiles='for t in files links directories; do echo \`find . -type \${t:0:1} | wc -l\` \$t; done 2> /dev/null'

# To see if a command is aliased, a file, or a built-in command
alias checkcommand='type -t'

# Show current network connections to the server
alias ipview="netstat -anpl | grep :80 | awk {'print \$5'} | cut -d\":\" -f1 | sort | uniq -c | sort -n | sed -e 's/^ *//' -e 's/ *\$//'"

# Show open ports
alias openports='netstat -nape --inet'

# Alias's for safe and forced reboots
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'

# Alias's to show disk space and space used in a folder
alias diskspace="du -S | sort -n -r |more"
alias folders='du -h --max-depth=1'
alias folderssort='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'
alias mountedinfo='df -hT'

###############################################################################################
# Alias's for Archives                                                                        #
###############################################################################################
#
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

# SHA1
alias sha1='openssl sha1'

# CPU
alias cpu="grep 'cpu ' /proc/stat | awk '{usage=(\$2+\$4)*100/(\$2+\$4+\$5)} END {print usage}' | awk '{printf(\"%.1f\n\", \$1)}'"

# Command line mplayer movie watching for the win.
alias mp='mplayer -fs'

# This is GOLD for finding out what is taking so much space on your drives!
alias diskspace='du -S | sort -n -r |more'

# Show me the size (sorted) of only the folders in this directory
alias folders='find . -maxdepth 1 -type d -print | xargs du -sk | sort -rn'

alias home='cd ~'
alias root='cd /'
alias dtop='cd ~/Desktop'
alias gdrive='cd ~/GoogleDrive'
alias oned='cd ~/OneDrive'
alias mega='cd ~/MEGAsync'

###############################################################################################
# Common Project Directories                                                                  #
###############################################################################################
#
alias goprojects='cd ~/go_projects/'
alias rustprojects='cd ~/projects/rust/'
alias pythonprojects='cd ~/projects/python/'
alias cppprojects='cd ~/projects/c++/'
alias nodeprojects='cd ~/projects/node/'
alias bashprojects='cd ~/projects/bash/'
alias goprojects='cd ~/projects/go/'
alias rubyprojects='cd ~/projects/ruby/'

###############################################################################################
# Update Aliases                                                                              #
###############################################################################################
#
# Upagrade Distro
alias upgradearch='sudo pacman -Syy && yay -Syua --noconfirm'

alias pacrepo='sudo reflector -c "US" -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist'
alias pacman='sudo pacman'
alias pacno='sudo pacman -Syu --noconfirm'
alias auru='yay -Syua --noconfirm'

# System Info Bash Aliases
alias ar3='archey3'            # Archey
alias sfetch='screenfetch'     # Screenfetch
alias neo='neofetch'           # Neofetch

# Some common shortcuts for tools
alias jb='jobs'
alias vi='vim'
alias gv='gvim'
alias ric='ri -f ansi'

###############################################################################################
# Log Aliases                                                                                 #
###############################################################################################
#
alias httpdlog='sudo tail -f -n 50 /var/log/httpd/error_log'		# HTTPD Error Log (Apache)
alias nginxlog='sudo tail -f -n 50 /var/log/nginx/access.log'		# NGINX Access Log
alias smblog='sudo tail -f -n 50 /var/log/samba/smb.log'			# Samba Log
alias squidalog='sudo tail -f -n 50 /var/log/squid/access.log'		# Squid Access Log
alias squidclog='sudo tail -f -n 50 /var/log/squid/cache.log'		# Squid Cache Log
alias zerolog='sudo tail -f -n 50 /var/log/zeronet/debug.log'		# Zeronet Log
alias mongolog='sudo tail -f -n 50 /var/log/mongodb/mongod.log'		# MongoDB Log
alias privoxylog='sudo tail -f -n 50 /var/log/privoxy/privoxy.log'  # Privoxy Log

alias paclog='sudo tail -f -n 50 /var/log/pacman.log'				# Pacman Log
alias authlog='sudo tail -f -n 50 /var/log/auth.log'				# Auth Log
alias cronlog='sudo tail -f -n 50 /var/log/crond.log'				# CRON Log
alias daemonlog='sudo tail -f -n 50 /var/log/daemon.log'			# Daemon Log
alias errorslog='sudo tail -f -n 50 /var/log/errors.log'			# Errors Log
alias everylog='sudo tail -f -n 50 /var/log/everything.log'			# Everything Log
alias faillog='sudo tail -f -n 50 /var/log/fail2ban.log'			# Fail2Ban Log
alias kernelog='sudo tail -f -n 50 /var/log/kernel.log'				# Kernel Log
alias lxdmlog='sudo tail -f -n 50 /var/log/lxdm.log'				# LXDM Log
alias messagelog='sudo tail -f -n 50 /var/log/messages.log'			# Messages Log
alias syslog='sudo tail -f -n 50 /var/log/syslog.log'				# Syslog Log
alias userlog='sudo tail -f -n 50 /var/log/user.log'				# User Log
alias xorglog='sudo tail -f -n 50 /var/log/Xorg.0.log'				# Xorg Log

###############################################################################################
# Pacaur Aliases                                                                              #
###############################################################################################
#
alias pain='pacaur -S'		                          # Install packages from the repositories
alias pains='pacaur -U'		                          # Install a package from a local file
alias painsd='pacaur -S --asdeps'		              # Install packages as dependencies of another package
alias paloc='pacaur -Qi'		                      # Display information about a package in the local database
alias palocs='pacaur -Qs'		              		  # Search for packages in the local database
alias palst='pacaur -Qe'		                      # List installed packages including from AUR (tagged as "local")
alias pamir='pacaur -Syy'		                      # Force refresh of all package lists after updating mirrorlist
alias paorph='pacaur -Qtd'		                      # Remove orphans using pacaur
alias pare='pacaur -R'		                          # Remove packages, keeping its settings and dependencies
alias parem='pacaur -Rns'		                      # Remove packages, including its settings and unneeded dependencies
alias parep='pacaur -Si'		                      # Display information about a package in the repositories
alias pareps='pacaur -Ss'		                      # Search for packages in the repositories
alias paupd='pacaur -Sy && sudo abs && sudo aur'      # Update and refresh local package, ABS and AUR databases
alias paupd='pacaur -Sy && sudo abs'		          # Update and refresh the local package and ABS databases
alias paupd='pacaur -Sy && sudo aur'		          # Update and refresh the local package and AUR databases
alias paupd='pacaur -S'		                          # Update and refresh the local package database
alias paupg='pacaur -Syua'		                      # Sync with repositories before upgrading all packages (from AUR too)
alias pasu='pacaur -Syua --no-confirm'		          # Same as paupg, but without confirmation
alias upgrade='pacaur -Syu'		                      # Sync with repositories before upgrading packages

###############################################################################################
# Pacman Aliases                                                                              #
###############################################################################################
#
alias pac-remove='sudo pacman -Rs'                          # Remove
alias pac-search='sudo pacman -Ss'                          # Search
alias pac-info='sudo pacman -Si'                            # Info
alias pac-list-orphans='sudo pacman -Qdt'                   # List Orphans
alias pac-remove-orphans='paclo && sudo pacman -Rns $(pacman -Qtdq)'   # Remove Orphans
alias pac-clean-cache='sudo pacman -Scc'                    # Clean Cache
alias pac-list-files='sudo pacman -Ql'                      # List Files
alias pacup='sudo pacman -Syuu'                             # Pacman update
alias pacin='sudo pacman -S'	                            # Install packages from the repositories
alias pacins='sudo pacman -U'	                            # Install a package from a local file
alias pacinsd='sudo pacman -S --asdeps'	                    # Install packages as dependencies of another package
alias pacloc='pacman -Qi'	                                # Display information about a package in the local database
alias paclocs='pacman -Qs'	                                # Search for packages in the local database
alias paclsorphans='sudo pacman -Qdt'	                    # List all orphaned packages
alias pacmir='sudo pacman -Syy'	                            # Force refresh of all package lists after updating mirrorlist
alias pacre='sudo pacman -R'	                            # Remove packages, keeping its settings and dependencies
alias pacrem='sudo pacman -Rns'	                            # Remove packages, including its settings and dependencies
alias pacrep='pacman -Si'	                                # Display information about a package in the repositories
alias pacreps='pacman -Ss'	                                # Search for packages in the repositories
alias pacupd='sudo pacman -Sy && sudo abs && sudo aur'	    # Update and refresh the local package, ABS and AUR databases
alias pacupd='sudo pacman -Sy && sudo abs'	                # Update and refresh the local package and ABS databases
alias pacupd='sudo pacman -Sy && sudo aur'	                # Update and refresh the local package and AUR databases
alias pacupd='sudo pacman -Sy'	                            # Update and refresh the local package database
alias pacupg='sudo pacman -Syu'	                            # Sync with repositories before upgrading packages
alias upgrade='sudo pacman -Syu'	                        # Sync with repositories before upgrading packages
alias pacfileupg='sudo pacman -Fy'	                        # Download fresh package databases from the server
alias pacfiles='pacman -Fs'	                                # Search package file names for matching strings
alias pacls='pacman -Ql'	                                # List files in a package
alias pacown='pacman -Qo'	                                # Show which package owns a file

###############################################################################################
# Yay Aliases                                                                                 #
###############################################################################################
#
alias yayup='yay -Syua'
alias yaconf='yay -Pg'	                                    # Print current configuration
alias yain='yay -S'	                                        # Install packages from the repositories
alias yains='yay -U'	                                    # Install a package from a local file
alias yainsd='yay -S --asdeps'	                            # Install packages as dependencies of another package
alias yaloc='yay -Qi'	                                    # Display information about a package in the local database
alias yalocs='yay -Qs'	                                    # Search for packages in the local database
alias yalst='yay -Qe'	                                    # List installed packages including from AUR (tagged as "local")
alias yamir='yay -Syy'	                                    # Force refresh of all package lists after updating mirrorlist
alias yaorph='yay -Qtd'	                                    # Remove orphans using yaourt
alias yare='yay -R'	                                        # Remove packages, keeping its settings and dependencies
alias yarem='yay -Rns'	                                    # Remove packages, including its settings and unneeded dependencies
alias yarep='yay -Si'	                                    # Display information about a package in the repositories
alias yareps='yay -Ss'	                                    # Search for packages in the repositories
alias yaupg='yay -Syu'	                                    # Sync with repositories before upgrading packages
alias yasu='yay -Syu --no-confirm'	                        # Same as yaupg, but without confirmation

