#Script to run the example script
#Before first run, make sure to edit/replace...
#cloud-region
#project-id
#device-id
#registry-id

python3 mqtt_example.py --algorithm ES256 --ca_certs roots.pem --cloud_region cloud-region --project_id project-id --device_id device-id --private_key_file ec_private.pem --registry_id registry-id --mqtt_bridge_port 443
