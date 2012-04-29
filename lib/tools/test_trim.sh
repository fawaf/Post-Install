#!/bin/bash
# Tests TRIM for the current drive

pushd / &>> $logfile
sudo dd if=/dev/urandom of=tempfile count=100 bs=512k oflag=direct &>> $logfile
output=$(sudo hdparm --fibmap tempfile) &>> $logfile

VTEST=`echo $output | sed 's/tempfile:\(.*\)sectors\(.*\)/\2/'` &>> $logfile

VSTABLE=`echo "${VTEST}"|cut -d " " -f 3` &>> $logfile

StatusBefore=`sudo hdparm --read-sector $VSTABLE /dev/sda` &>> $logfile

sudo rm tempfile &>> $logfile
sync &>> $logfile

sleep 5 &>> $logfile

StatusAfter=`sudo hdparm --read-sector $VSTABLE /dev/sda` &>> $logfile

StatusAfterOnlyZeros=`echo $StatusAfter | sed 's/ //g' | sed 's/\/dev\/\(.*\)succeeded\(.*\)/\2/'` &>> $logfile

if [[ $StatusAfterOnlyZeros =~ 0* ]]; then
	echo "TRIM is currently functioning."
else
	echo "TRIM is currently not functioning."
fi

popd