#!/bin/bash

# move key to temporary backup location
mv ec_private_on_deck.pem ec_private_on_base.pem
mv ec_public_on_deck.pem ec_public_on_base.pem

# delete remaining existing keys
rm ec_private_at_bat.pem
rm ec_public_at_bat.pem

# generate new keys
openssl ecparam -genkey -name prime256v1 -noout -out ec_private_on_deck.pem
openssl ec -in ec_private_on_deck.pem -pubout -out ec_public_on_deck.pem
openssl ecparam -genkey -name prime256v1 -noout -out ec_private_at_bat.pem
openssl ec -in ec_private_at_bat.pem -pubout -out ec_public_at_bat.pem
