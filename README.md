# GCP IoT Core testing

From the IoT device...

sudo apt-get -y install git<br/>
git clone https://github.com/sunsetmountain/gcpIoTCoreTesting<br/>
cd gcpIoTCoreTesting<br/>
chmod +x generateInitialKeys.sh initialSoftware.sh getGoogleKey.sh launchTest.sh <br/>
./initialSoftware.sh<br/>
./getGoogleKey.sh<br/>
./generateInitialKeys.sh<br/>

Edit the launchTest.sh file and replace cloud-region, project-id, device-id and registry-id

Upload the public key to GCP and use it to register the device in the IoT Core registry

Use ./launchTest.sh to test out the functionality
