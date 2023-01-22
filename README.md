# Overview
This is an easy way to get started working with AFNI on Ubuntu. These instructions are written for ubuntu 22.04 but could be used on other OSes.

# Setup Environment - Ubuntu 22.04
1. Install git
```bash
sudo apt update -y && sudo apt dist-upgrade -y && sudo apt install git build-essential -y
```

2. Install Docker
```bash
sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release
    
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

 echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
sudo apt-get update
sudo apt install docker-ce
sudo usermod -aG docker $USER
```

3. Reboot and log back in.

# Clone this repo & Get Started
```bash
git clone https://github.com/caseykelso/afni-easy.git
./build.sh
```

# Run the AFNI environment
```bash
./run.sh
```

