#!/bin/bash

uniqueID=$(sudo cat /sys/class/dmi/id/product_uuid)
echo $uniqueID
echo $uniqueID > device-id.txt
