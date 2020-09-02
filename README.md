# GCP IoT Core testing

From the IoT device...

sudo apt-get -y install git
git clone https://github.com/sunsetmountain/gcpIoTCoreTesting
cd gcpIoTCoreTesting
chmod +x generate_keys.sh initialsoftware.sh get_google_key.sh launchTest.sh 
./initialsoftware.sh
./get_google_key.sh
./generate_keys.sh

Edit the launchTest.sh file and replace cloud-region, project-id, device-id and registry-id

Upload the public key to GCP and use it to register the device in the IoT Core registry

Use ./launchTest.sh to test out the functionality
