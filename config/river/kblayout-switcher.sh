#!/bin/bash

KBLAYOUTS=('br' 'us')
CURR_KBLAYOUT=`cat CURR_KBLAYOUT.variable`

if (( $CURR_KBLAYOUT < ${#KBLAYOUTS[@]} )); then
    CURR_KBLAYOUT=$(( $CURR_KBLAYOUT + 1 ))
    sed -i '1d' CURR_KBLAYOUT.variable
    echo $CURR_KBLAYOUT >> CURR_KBLAYOUT.variable
else
    CURR_KBLAYOUT=1
    sed -i '1d' CURR_KBLAYOUT.variable
    echo 1 >> CURR_KBLAYOUT.variable
fi

CURR_KBLAYOUT=$(( $CURR_KBLAYOUT - 1 ))

riverctl keyboard-layout ${KBLAYOUTS[$CURR_KBLAYOUT]}
notify-send "Keyboard layout changed to '${KBLAYOUTS[CURR_KBLAYOUT]}'!"
