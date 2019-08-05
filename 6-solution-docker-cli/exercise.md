Exercise: docker cli
====================

1) start the identicon system

- xcellenthub/identicon:1.0
- xcellenthub/dnmonster
- xcellenthub/redis

2) explore the containers by finding their

- names
- port mappings
- volumes
- IP addresses
- labels
- container IDs

3) Save the identicon image as archive to disk

4) Delete the identicon image from local Docker system

5) Load saved identicon image archive back into local Docker system

Solution
========

1)
```
docker run -d \
  --name dnmonster \
  --restart=always \
  xcellenthub/dnmonster:1.0

docker run -d \
  --name redis \
  --restart=always \
 xcellenthub/redis:1.0

docker run -d \
  --name identicon \
  --restart=always \
  -e STAGE=dev \
  -p 5000:5000 \
  -v $PWD/identicon/app:/app \
  --link dnmonster:dnmonster \
  --link redis:redis \
  xcellenthub/identicon:1.0
```

2)
docker ps | grep dnmonster
docker ps | grep redis
docker ps | grep identicon

docker inspect dnmonster
docker inspect redis
docker inspect identicon

3)
docker save xcellenthub/identicon:1.0 -o identicon.image

4)
docker rmi -f xcellenthub/identicon:1.0

5)
docker load -i identicon.image