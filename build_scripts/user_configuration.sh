#! /bin/bash
USER_KEY=$1

mkdir ~/.ssh
echo $USER_KEY > ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys

cd 

./setup_basic_vim_plugins
./user_installs.sh
./personalize.sh
