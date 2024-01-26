#/usr/bin/bash

mkdir -p ~/Videos/recordings
cd ~/Videos/recordings
if [[ "$(pidof wf-recorder)" == "" ]]; then
    notify-send "wf-recorder" "Starting recording" -a 'wf-recorder'
    paplay --volume=45536 ~/.config/river/coolblep.wav &
    wf-recorder --audio=alsa_output.usb-Kingston_HyperX_Cloud_Flight_Wireless-00.analog-stereo.monitor -f './recording_'"$(date '+%Y_%m_%_d..%H.%M')"'.mp4' -t --geometry "$(slurp)" 
else
    /usr/bin/kill --signal SIGINT wf-recorder
    notify-send "wf-recorder" "Recording Stopped" -a 'wf-recorder'
    paplay --volume=45536 ~/.config/river/coolblepclose.wav
fi
