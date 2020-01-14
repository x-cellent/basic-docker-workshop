Exercise: docker CLI
====================

1. Start the identicon system:

    - xcellenthub/identicon:1.0
    - xcellenthub/dnmonster
    - xcellenthub/redis

1. Explore the containers by finding their

    - names
    - port mappings
    - volumes
    - IP addresses
    - labels
    - container IDs

1. Save the identicon image as archive to disk

1. Delete the identicon image from local Docker cache

1. Load saved identicon image archive back into local Docker cache

Solution
========

1. .
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

1. .
    ```
    docker ps | grep dnmonster
    docker ps | grep redis
    docker ps | grep identicon
    
    docker inspect dnmonster
    docker inspect redis
    docker inspect identicon
    ```

1.
    `docker save xcellenthub/identicon:1.0 -o identicon.image`

1.
    `docker rmi -f xcellenthub/identicon:1.0`

1.
    `docker load -i identicon.image`
