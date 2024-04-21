# Checkout the rtpproxy repo
https://github.com/faheem2084/rtpproxy.git


# Create Docker Network
docker network create --driver=bridge --subnet=10.0.0.0/24 voice_network

# rtpproxy build on alpine linux on ARM64v8 Architecture(Mac M3)
cd rtpproxy/build
docker build -t my_rtpproxy .

# Run 
cd ..
docker-compose up -d