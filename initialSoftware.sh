#!/bin/bash

sudo apt-get update
sudo apt-get -y install build-essential libssl-dev python3-dev libffi-dev python3-pip git wget openssl
sudo pip3 install -r requirements.txt

# download Google keys
wget -O roots.pem https://pki.goog/roots.pem

# generate initial keys
openssl ecparam -genkey -name prime256v1 -noout -out ec_private_on_deck.pem
openssl ec -in ec_private_on_deck.pem -pubout -out ec_public_on_deck.pem
openssl ecparam -genkey -name prime256v1 -noout -out ec_private_at_bat.pem
openssl ec -in ec_private_at_bat.pem -pubout -out ec_public_at_bat.pem
