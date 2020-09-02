# GCP IoT Core testing

From the IoT device...

sudo apt-get -y install git<br/>
git clone https://github.com/sunsetmountain/gcpIoTCoreTesting<br/>
cd gcpIoTCoreTesting<br/>
chmod +x generate_keys.sh initialsoftware.sh get_google_key.sh launchTest.sh <br/>
./initialsoftware.sh<br/>
./get_google_key.sh<br/>
./generate_keys.sh<br/>

Edit the launchTest.sh file and replace cloud-region, project-id, device-id and registry-id

Upload the public key to GCP and use it to register the device in the IoT Core registry

Use ./launchTest.sh to test out the functionality
