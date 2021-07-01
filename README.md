# GCP IoT Core testing

<b>Purpose: To conduct basic IoT Core setup and testing of IoT Functionality (e.g. basic communication along with a potential device registration and key rotation approach) using a VM in GCP with IoT Core</b>

<b>Setup a GCP project to use for testing...</b>
- Create a project and enable billing

<b>Options on how to proceed...</b>
1. Follow the below to walk through setting up the necessary infrastructure in order to gain a hands-on walk through of the elements needed
2. Download and execute the Terraform contained within the repository and then skip ahead to the step that includes SSH'ing into the VM to complete the VM setup

<b>Enable the necessary APIs
- Go to APIs & Services -- enable the APIs for IoT Core, Cloud Functions and Compute Engine

<b>Setup PubSub topics...</b>
- Go to Pub/Sub
- Create three topics (test-events, test-cert-info and test-state)

<b>Setup IoT Core...</b>
- Go to IoT Core
- Create a registry (test-registry), assign the PubSub topics during creation

<b>Setup a VM to use as a test "IoT device"...</b>
- Go to Compute Engine and create a VM (minimal size, Linux)
- SSH into the VM
- From the command line of the VM, issue the following commands (or use the setup.sh script in this repository -- copy it to the device in the directory where gcpIoTCoreTesting will go, chmod +x setup.sh and ./setup.sh)...

<block>
sudo apt-get -y install git<br/>
git clone https://github.com/sunsetmountain/gcpIoTCoreTesting<br/>
cd gcpIoTCoreTesting<br/>
chmod +x initialSoftware.sh launchTest.sh <br/>
./initialSoftware.sh<br/>
</block>

<br/>

Edit the config.json file and replace cloud-region, project-id, device-id and registry-id

cat ec_public_at_bat.pem

copy the text in the file to the clipboard

  <b>Go to IoT Core, then to Devices...</b>
- Create a new device ensuring that the device-id matches what was put into the config.json file
- Expand the Communication, Cloud Logging, Authentication area during device creation
- In the Authentication section, select a Public key format of ES256
- Paste the key value into the the text box
- Click on the Create button


<b>Registering devices/rotating keys...</b>

The first time the IoT device is used, there needs to be a way to trust that the device is known and then to register the initial keys that will be unique to the device. The code provided assumes that a device will be registered with IoT Core along with an associated certificate and this cert/device-id will be placed on new IoT devices to allow them to send a secure message to IoT Core announcing their own unique device ID and key(s). Functionality would need to be implemented (e.g. via a Function such as in https://github.com/sunsetmountain/gcpIoTCoreAddDeviceFunction) that monitors for new device registration messages and then takes care of registering the device. To test out client-side self-registration capabilities, edit initialRegistration.json, obtain provisioning private/public keys (storage location is TBD -- place them in the .ssh directory) and use startSelfRegistration.py to run the functionality.

The current code is geared towards creating and rotating self-signed keys on the device that will then been rotated periodically by the client code and the changes communicated through IoT core. Three sets of keys are generated when the initialSoftware.sh script is run and the device code contains the ability to rotate keys by sending them update through a PubSub message to the test-cert-info queue. A function would need to process the change and update the device.

<b>Issuing commands to devices...</b>

Responding to a command isn't currently implemented in the client code. Triggering a command from IoT Core to a device can be implemented through a Cloud Function such as the example code at https://github.com/sunsetmountain/gcpIoTCoreCommandFunction

<b>Testing functionality...</b>

Use python3 launch.py to test out the functionality
