echo "REMOVING APT PACKAGES"
sudo apt remove docker-ce docker-ce-cli containerd.io &> /dev/null

echo "STOPING CONTAINERS"
docker image rm padok-app 
docker stop padok-app &> /dev/null && sudo docker rm padok-app &> /dev/null
rm -rf docker-dumb-app &> /dev/null