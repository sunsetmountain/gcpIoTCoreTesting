sudo apt-get install -y wget openssl python3-pip
openssl ecparam -genkey -name prime256v1 -noout -out ec_private_on_deck.pem
openssl ec -in ec_private_on_deck.pem -pubout -out ec_public_on_deck.pem
openssl ecparam -genkey -name prime256v1 -noout -out ec_private_at_bat.pem
openssl ec -in ec_private_at_bat.pem -pubout -out ec_public_at_bat.pem
openssl ecparam -genkey -name prime256v1 -noout -out ec_private_on_base.pem
openssl ec -in ec_private_on_base.pem -pubout -out ec_public_on_base.pem
#cp ../.ssh/ec_private.pem ec_private_at_bat.pem
#cp ../.ssh/ec_public.pem ec_public_at_bat.pem
