[[ -z $(pgrep -xU $UID mpdscribble) ]] && mpdscribble &

xrandr --output HDMI-1 --primary --mode 1680x1050 --rotate normal --output DVI-I-1 --mode 1280x1024 --rotate normal --right-of HDMI-1

nitrogen --restore
