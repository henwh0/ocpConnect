#!/bin/bash

#Set variables
DEVICE=$(ls /dev/tty.usbserial-* 2>/dev/null | head -n 1)
BAUD_RATE=57600

# Check that device exists
if [[ -z $DEVICE ]]; then
    echo "Device not found. Check that OCP card is connected via USB or Bluetooth and try again."
    exit 1
fi
# Check if custom baud rate was entered
if [[ $# == 1 ]]; then
    BAUD_RATE=$1
fi
# Check that custom baud rate is a number within range
if ! [[ $BAUD_RATE =~ ^[0-9]+$ ]] || ((BAUD_RATE < 9600 || BAUD_RATE > 115200)); then
    echo "Baud Rate must be a number between 9600 and 115200. Default value is 57600."
    exit 1
fi
# Preparing to start screen session
echo "Ensure that you have selected the correct host."
echo "To exit the screen session, press 'Ctrl + Shift + A', then enter ':quit'"
read -r -p "Press 'Enter' to start the screen session.."
echo ""
# Box width inside pipes
BOX_WIDTH=40
# Print the box
echo "+----------------------------------------+"
echo "|-----------  Screen Session  -----------|"
echo "+----------------------------------------+"
printf "| User: %-32s |\n" "$USER"
printf "| Device: %-30s |\n" "$DEVICE"
printf "| Baud Rate: %-27s |\n" "$BAUD_RATE"
echo "+----------------------------------------+"
echo ""
sleep 1.5
# Starting screen session
screen $DEVICE $BAUD_RATE || echo "An error occurred: $?"

# ***** ******** (FRC)

# To find your debug card identifier, open iTerm2 with the debug card connected to your laptop via USB.
# Then execute the command: "ls /dev/tty.*"
# The debug card should be listed as: tty.usbserial-xxxxxxxxx

# Type the command to execute the script, and then type out whatever baud rate you want to use. If you don't choose your own baud rate, the script will use the default baud rate.
# You can exit the screen session with: "Ctrl + Shift + A", then enter ":quit"
# If you don't exit the screen session with that command, you may need to execute "screen -ls", then "kill" whatever the screen number is.


# Type the command to execute the script, and then type out whatever baud rate you want to use. If you don't choose your own baud rate, the script will use the default baud rate.
# You can exit the screen session with: "Ctrl + Shift + A", then enter ":quit"
# If you don't exit the screen session with that command, you may need to execute "screen -ls", then "kill" whatever the screen number is.
