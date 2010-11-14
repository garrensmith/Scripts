#!bin/sh

mkdir dev
echo "install basics"
sudo apt-get install g++ curl libssl-dev apache2-utils build-essential
echo "Install git"
sudo apt-get install git-core git-gui gitk git-doc 
echo "Install curl"
sudo apt-get install curl
echo "Install ruby"
sudo apt-get install ruby rake irb

rake




