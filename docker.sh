# INSTALL DOCKER
docker -v > /dev/null
if [ $? -ne 0 ]; then
    echo "INSTALLING DOCKER"
    sudo apt-get -qq update &> /dev/null
    sudo apt-get -qq install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common &> /dev/null
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add - &> /dev/null
    sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable" &> /dev/null
    sudo apt-get -qq update &> /dev/null
    sudo apt-get -qq install -y docker-ce docker-ce-cli containerd.io &> /dev/null
fi

sudo groupadd docker &> /dev/null
sudo usermod -aG docker $USER &> /dev/null