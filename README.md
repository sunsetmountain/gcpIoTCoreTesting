# GCP IoT Core testing

For simple IoT Core communication testing. This document assumes that a project and IoT Core registry are already setup (this involves enabling APIs for IoT Core, Cloud Functions, GCE and the Google Cloud IoT API along with creating PubSub topics for events, state and cert-info).

From the IoT device...

sudo apt-get -y install git<br/>
git clone https://github.com/sunsetmountain/gcpIoTCoreTesting<br/>
cd gcpIoTCoreTesting<br/>
chmod +x initialSoftware.sh launchTest.sh <br/>
./initialSoftware.sh<br/>


(or use the setup.sh script in this repository -- copy it to the device in the directory where gcpIoTCoreTesting will go, chmod +x setup.sh and ./setup.sh)

Edit the config.json file and replace cloud-region, project-id, device-id and registry-id

Make sure that the device-id on the device has a match in the IoT Core registry in the GCP project. Upload the public key (ec_public_at_bat) to the IoT Core registry associating it with the device. Note that 3 public/private key pairs are generated at setup -- all 3 can be associated with the device if needed. 

Key rotation capabilities haven't yet been fully added to the code, but the idea is on-deck would copy to at-bat and at-bat would copy to on-base and then a new on-deck key would be created. This would need to be communicated with IoT Core.

Use python3 launch.py to test out the functionality

To test out self-registration capabilities, edit initialRegistration.json, obtain provisioning private/public keys (storage location is TBD -- place them in the .ssh directory) and use startSelfRegistration.py to run the functionality.
