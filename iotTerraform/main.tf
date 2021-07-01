provider "google" {
  project = var.project_name
  region = var.region
  zone = var.zone
}

#-------------------------------------------------------
# Enable APIs
#    - Cloud Function
#    - Pub/Sub
#    - Firestore
#    - Cloud IoT
#    - Dataflow
#-------------------------------------------------------

module "project_services" {
  source  = "terraform-google-modules/project-factory/google//modules/project_services"
  version = "3.3.0"

  project_id    = var.project_name
  activate_apis =  [
    "cloudresourcemanager.googleapis.com",
    "cloudfunctions.googleapis.com",
    "pubsub.googleapis.com",
    "cloudiot.googleapis.com",
    "compute.googleapis.com"
  ]

  disable_services_on_destroy = false
  disable_dependent_services  = false
}

#---------------------------------------------------------
# Create VM
# - instance-1
#---------------------------------------------------------

resource "google_compute_instance" "instance-1" {
  name         = "instance-1"
  machine_type = "e2-standard-4"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Include this section to give the VM an external ip address
    }
  }

  metadata_startup_script = <<SCRIPT
    sudo apt-get -y install git
    SCRIPT

#  provisioner "remote-exec" {
#    connection {
#      host        = google_compute_address.static.address
#      type        = "ssh"
#      user        = var.user
#      timeout     = "500s"
#      private_key = file(var.privatekeypath)
#    }
#    inline = [
#      "sudo apt-get -y install git",
#      "git clone https://github.com/sunsetmountain/gcpIoTCoreTesting",
#      "cd gcpIoTCoreTesting",
#      "chmod +x initialSoftware.sh launchTest.sh keyRotation.sh"
#    ]
#  }

}

#---------------------------------------------------------
# Create Pub/Sub Topics and Subscriptions
# - test-events
# - test-cert-info
# - test-state
#---------------------------------------------------------

resource "google_pubsub_topic" "test-events" {
  name = "test-events"
  depends_on = [module.project_services]
}

resource "google_pubsub_topic" "test-cert-info" {
  name = "test-cert-info"
  depends_on = [module.project_services]
}

resource "google_pubsub_topic" "test-state" {
  name = "test-state"
  depends_on = [module.project_services]
}

resource "google_pubsub_subscription" "test-events" {
  name  = "test-events-subscription"
  topic = google_pubsub_topic.test-events.name

  labels = {
    foo = "bar"
  }

  # 20 minutes
  message_retention_duration = "1200s"
  retain_acked_messages      = true

  ack_deadline_seconds = 20

  expiration_policy {
    ttl = "300000.5s"
  }
  retry_policy {
    minimum_backoff = "10s"
  }

  enable_message_ordering    = false
}

resource "google_pubsub_subscription" "test-cert-info" {
  name  = "test-cert-info-subscription"
  topic = google_pubsub_topic.test-cert-info.name

  labels = {
    foo = "bar"
  }

  # 20 minutes
  message_retention_duration = "1200s"
  retain_acked_messages      = true

  ack_deadline_seconds = 20

  expiration_policy {
    ttl = "300000.5s"
  }
  retry_policy {
    minimum_backoff = "10s"
  }

  enable_message_ordering    = false
}

resource "google_pubsub_subscription" "test-state" {
  name  = "test-state-subscription"
  topic = google_pubsub_topic.test-state.name

  labels = {
    foo = "bar"
  }

  # 20 minutes
  message_retention_duration = "1200s"
  retain_acked_messages      = true

  ack_deadline_seconds = 20

  expiration_policy {
    ttl = "300000.5s"
  }
  retry_policy {
    minimum_backoff = "10s"
  }

  enable_message_ordering    = false
}

#---------------------------------------------------------
# Create IoT Registry
# - test-registry
#---------------------------------------------------------

resource "google_cloudiot_registry" "test-registry" {
  name = "test-registry"

  event_notification_configs {
    pubsub_topic_name = google_pubsub_topic.test-cert-info.id
    subfolder_matches = "test-cert-info"
  }

  event_notification_configs {
    pubsub_topic_name = google_pubsub_topic.test-events.id
    subfolder_matches = ""
  }

  state_notification_config = {
    pubsub_topic_name = google_pubsub_topic.test-state.id
  }

  mqtt_config = {
    mqtt_enabled_state = "MQTT_ENABLED"
  }

  http_config = {
    http_enabled_state = "HTTP_DISABLED"
  }
  log_level = "INFO"
}

#---------------------------------------------------------
# Create IoT Device
# - instance-1
#---------------------------------------------------------

resource "google_cloudiot_device" "instance-1" {
  name     = "instance-1"
  registry = google_cloudiot_registry.test-registry.id
}
