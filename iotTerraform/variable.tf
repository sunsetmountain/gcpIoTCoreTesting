variable "project_name" {
   description = "The project ID where all resources will be launched."
  type = string
}

variable "region" {
  description = "The location region to deploy the Cloud IOT services. Note: Be sure to pick a region that supports Cloud IOT."
  type        = string
}

variable "zone" {
  description = "The location zone to deploy the Cloud IOT services. Note: Be sure to pick a region that supports Cloud IOT."
  type        = string
}

variable "num_of_devices" {}

variable "user" {
  description = "The IAM user that has project Compute Engine access"
  type        = string
}

variable "privatekeypath" {
  description = "The location of the file with the private JSON key with project compute engine access"
  type        = string
}
