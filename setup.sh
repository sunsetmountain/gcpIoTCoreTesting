#!/bin/bash

sudo apt-get -y install git
git clone https://github.com/sunsetmountain/gcpIoTCoreTesting
cd gcpIoTCoreTesting
chmod +x generateInitialKeys.sh initialSoftware.sh getGoogleKey.sh launchTest.sh 
./initialSoftware.sh
./getGoogleKey.sh
./generateInitialKeys.sh

uniqueID=$(sudo cat /sys/class/dmi/id/product_uuid)
echo $uniqueID
echo $uniqueID > device-id.txt
