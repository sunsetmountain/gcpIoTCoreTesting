# GCP IoT Core testing

For simple IoT Core communication testing. This document assumes that a project and IoT Core registry are already setup.

From the IoT device...

sudo apt-get -y install git<br/>
git clone https://github.com/sunsetmountain/gcpIoTCoreTesting<br/>
cd gcpIoTCoreTesting<br/>
chmod +x generateInitialKeys.sh initialSoftware.sh getGoogleKey.sh launchTest.sh <br/>
./initialSoftware.sh<br/>
./getGoogleKey.sh<br/>
./generateInitialKeys.sh<br/>

(or use the setup.sh script in this repository -- copy it to the device, chmod +x setup.sh and ./setup.sh)

Edit the launchTest.sh file and replace cloud-region, project-id, device-id and registry-id

Make sure that the device-id on the device has a match in the IoT Core registry in the GCP project. Upload the public key to the IoT Core registry associating it with the device.

Use ./launchTest.sh to test out the functionality
