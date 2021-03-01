# APP DEPLOYEMENT
echo "CLONING APP"
git clone https://github.com/padok-team/docker-dumb-app.git $DIRECTORY -b $1 &> /dev/null
cd docker-dumb-app

echo "BUILDING APP"
docker build -t padok-app . &> /dev/null
docker stop padok-app &> /dev/null && sudo docker rm padok-app &> /dev/null
docker run -d --name padok-app -p 8080:8080 padok-app &> /dev/null && echo "APP LAUNCHED ON PORT 8080 !"

rm -rf docker-dumb-app &> /dev/null