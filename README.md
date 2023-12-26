# ilo4-fan-control
This is a simple script to power down fans on HP ProLiant Server.

It was only tested to work on DL380P G8.

Use at your own risk.

## Pre-requisite
In the ILO4 Admin UI, add the authorized SSH key for the Administrator user.

This can be found under Administration > Security > Secure Shell Key

## Usage
Update the $ILO4 and $ILOPORT variables in the script, or the script will ask you to enter those variables.

You can either execute the shell script directly, or schedule at boot time. Be sure to set authorized keys or script will nag you for Administrator password.
