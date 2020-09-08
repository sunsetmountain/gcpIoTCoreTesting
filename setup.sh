#!/bin/bash

# get unique identifier for the device
uniqueID=$(sudo cat /sys/class/dmi/id/product_uuid)
echo $uniqueID
echo $uniqueID > device-id.txt

# install software from repository
sudo apt-get -y install git
git clone https://github.com/sunsetmountain/gcpIoTCoreTesting
cd gcpIoTCoreTesting

# run initial setup scripts
chmod +x initialSoftware.sh launchTest.sh 
./initialSoftware.sh
