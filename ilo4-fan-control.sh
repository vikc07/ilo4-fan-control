#!/bin/bash
# Calm down those ProLiant jet fans
# Vikram Chauhan
# Ver: 1.2
# Updated: Jan 1, 2024

ILO4= # ip or hostname of ilo4
ILOPORT= # port
ILOUSER=Administrator # ilo user
OPTS="-oKexAlgorithms=+diffie-hellman-group1-sha1 \
-oHostKeyAlgorithms=+ssh-rsa \
-o PubkeyAcceptedKeyTypes=+ssh-rsa"
LO=1600 # adjust the low value
HI=3500 # adjust the high value

echo "starting"
echo `date`

if [ -z "$ILO4" ]
then
  echo ">> enter ILO hostname or IP"
  read ILO4
fi

if [ -z "$ILOPORT" ]
then
  echo ">> enter ILO port"
  read ILOPORT
fi

# disable sensor 11 which is for HDD
ssh $ILO4 -p $ILOPORT -l $ILOUSER $OPTS "fan t 11 off"

for PID in `seq 1 65`;
do
	ssh $ILO4 -p $ILOPORT -l $ILOUSER $OPTS "fan pid $PID lo $LO"
done

for PID in `seq 50 65`;
do
	ssh $ILO4 -p $ILOPORT -l $ILOUSER $OPTS "fan pid $PID hi $HI"
done

echo "done"
echo `date`