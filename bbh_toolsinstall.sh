#!/bin/bash

# Update system and install core dependencies
echo "Updating system and installing core dependencies..."
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y git curl wget python3 python3-pip golang

# Set up Go environment (if Go is not already set up)
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
mkdir -p $GOPATH

# Install NMap
echo "Installing NMap..."
sudo apt install -y nmap

# Install JSLinkFinder
echo "Installing JSLinkFinder..."
git clone https://github.com/GerbenJavado/LinkFinder.git
cd LinkFinder
pip3 install -r requirements.txt
sudo python3 setup.py install
cd ..

# Install anew
echo "Installing anew..."
git clone https://github.com/tomnomnom/anew.git
cd anew
go build
sudo mv anew /usr/local/bin
cd ..

# Install Waymore
echo "Installing Waymore..."
git clone https://github.com/xnl-h4ck3r/waymore.git
cd waymore
pip3 install -r requirements.txt
cd ..

#!/bin/bash

# Update system and install core dependencies
echo "Updating system and installing core dependencies..."
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y git curl wget python3 python3-pip golang

# Set up Go environment (if Go is not already set up)
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin
mkdir -p $GOPATH

# Install NMap
echo "Installing NMap..."
sudo apt install -y nmap

# Install JSLinkFinder
echo "Installing JSLinkFinder..."
git clone https://github.com/GerbenJavado/LinkFinder.git
cd LinkFinder

# Install jsbeautifier with --break-system-packages flag to avoid virtual env issues
echo "Installing jsbeautifier..."
python3 -m pip install jsbeautifier --break-system-packages

pip3 install -r requirements.txt
sudo python3 setup.py install
cd ..

# Install anew
echo "Installing anew..."
git clone https://github.com/tomnomnom/anew.git
cd anew
go build
sudo mv anew /usr/local/bin
cd ..

# Install Waymore
echo "Installing Waymore..."
git clone https://github.com/xnl-h4ck3r/waymore.git
cd waymore
pip3 install -r requirements.txt
cd ..

# Install Subfinder
echo "Installing Subfinder..."
git clone https://github.com/projectdiscovery/subfinder.git
cd subfinder/v2/cmd/subfinder
go build
sudo mv subfinder /usr/local/bin
cd ../../..

# Install HTTPX
echo "Installing HTTPX..."
git clone https://github.com/projectdiscovery/httpx.git
cd httpx/cmd/httpx
go build
sudo mv httpx /usr/local/bin
cd ../../..

# Install ffuf
echo "Installing ffuf..."
git clone https://github.com/ffuf/ffuf.git
cd ffuf
go build
sudo mv ffuf /usr/local/bin
cd ..

# Cleanup
echo "Cleaning up unnecessary files..."
rm -rf LinkFinder anew waymore subfinder httpx ffuf

echo "All tools have been successfully installed and are ready for use!"
