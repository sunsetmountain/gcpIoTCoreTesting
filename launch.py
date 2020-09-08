import json
import os

with open('config.json', "r") as f:
        data = json.load(f)
        projectID = data["project-id"]
        deviceID = data["device-id"]
        cloudRegion = data["cloud-region"]
        registryID = data["registry-id"]
        privateKey = data["private-key"]
f.close()

cmd = "export GOOGLE_CLOUD_PROJECT=%s"%(projectID)
print(cmd)
os.system(cmd)

cmd = "python3 mqttTest.py --algorithm ES256 --ca_certs roots.pem --private_key_file '%s' --mqtt_bridge_port 443 --cloud_region %s --project_id %s --device_id %s --registry_id %s"%(privateKey,cloudRegion,projectID,deviceID,registryID)
print(cmd)
os.system(cmd)
