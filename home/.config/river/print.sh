#!/bin/bash
grim -g "$(slurp)" - | wl-copy
notify-send "Copied print selection to clipboard!"
