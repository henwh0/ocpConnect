#!/bin/bash

#Set variables
DEVICE="YOUR DEVICE ID HERE"
BAUD_RATE=57600
# Check if custom baud rate was entered
if [[ $# == 1 ]]; then
    BAUD_RATE=$1
fi
# Check that custom baud rate is a number within range
if ! [[ $BAUD_RATE =~ ^[0-9]+$ ]] || ((BAUD_RATE < 9600 || BAUD_RATE > 115200)); then
    echo "Baud Rate must be a number between 9600 and 115200."
    exit 1
fi
# Preparing to start screen session
echo "Ensure that your device variable is correct."
echo "Ensure that you have selected the correct host."
read -r -p "Press 'Enter' to start the screen session.."
echo ""
echo "+--------------------------------------+"
echo "|            Screen Session            |"
echo "+--------------------------------------+"
echo "| $USER"
echo "| Device: $DEVICE"
echo "| Baud Rate: $BAUD_RATE"
echo "+--------------------------------------+"
echo ""
sleep 0.3
# Starting screen session
screen $DEVICE $BAUD_RATE || echo "An error ocurred: $?"

# ***** ******** (FRC)

# To find your debug card identifier, open iTerm2 with the debug card connected to your laptop via USB.
# Then execute the command: "ls /dev/tty.*"
# The debug card should be listed as: tty.usbserial-xxxxxxxxx

# Type the command to execute the script, and then type out whatever baud rate you want to use. If you don't choose your own baud rate, the script will use the default baud rate.
# You can exit the screen session with: "Ctrl + Shift + A", then enter ":quit"
# If you don't exit the screen session with that command, you may need to execute "screen -ls", then "kill" whatever the screen number is.
