#!/bin/bash

# Update system and install core dependencies
echo "Updating system and installing core dependencies..."
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y git curl wget python3 python3-pip golang

# Set up Go environment if not already set up
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

# Install Python dependencies for LinkFinder with --break-system-packages
echo "Installing dependencies for LinkFinder..."
python3 -m pip install jsbeautifier --break-system-packages
pip3 install -r requirements.txt

# Make linkfinder.py globally accessible by creating a symlink
sudo cp linkfinder.py /usr/local/bin/linkfinder.py
sudo chmod +x /usr/local/bin/linkfinder.py
echo -e '#!/bin/bash\npython3 /usr/local/bin/linkfinder.py "$@"' | sudo tee /usr/local/bin/linkfinder > /dev/null
sudo chmod +x /usr/local/bin/linkfinder
cd ..

# Verify LinkFinder installation
if command -v linkfinder > /dev/null; then
  echo "LinkFinder installed successfully and is accessible globally as 'linkfinder'."
else
  echo "Error: LinkFinder installation failed."
fi

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

# Install Python dependencies for Waymore
pip3 install -r requirements.txt --break-system-packages

# Make waymore.py globally accessible by copying and linking
sudo cp waymore.py /usr/local/bin/waymore
sudo chmod +x /usr/local/bin/waymore

# Verify Waymore installation
if command -v waymore > /dev/null; then
  echo "Waymore installed successfully and is accessible globally as 'waymore'."
else
  echo "Error: Waymore installation failed."
fi
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

echo "All tools have been successfully installed and are globally accessible!"
