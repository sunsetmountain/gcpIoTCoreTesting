#Script to run the example script
#Before first run, make sure to edit/replace...
#cloud-region
#project-id
#device-id
#registry-id

# Example:
# python3 mqttTest.py --algorithm ES256 --ca_certs roots.pem --private_key_file ec_private_at_bat.pem --mqtt_bridge_port 443 --cloud_region us-central1 --project_id my-iotcore-test-project --device_id my-iot-device --registry_id my-test-project-registry

python3 mqttTest.py --algorithm ES256 --ca_certs roots.pem --private_key_file ec_private_at_bat.pem --mqtt_bridge_port 443 --cloud_region cloud-region --project_id project-id --device_id device-id --registry_id registry-id
