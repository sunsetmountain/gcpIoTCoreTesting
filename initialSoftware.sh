#!/bin/bash

sudo apt-get update
sudo apt-get -y install build-essential libssl-dev python3-dev libffi-dev python3-pip git
sudo pip3 install -r requirements.txt
