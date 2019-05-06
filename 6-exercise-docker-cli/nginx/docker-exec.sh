# 1) Start a nginx server as container (nginx)

CID=docker run -d -p 8080:80 nginx
# visit 127.0.0.1:8080

# 2) Connect to the container

docker exec -it $CID /bin/bash

# 3) Change the website (/var/www/index.html) on runtime

echo "hallo docker" > /usr/share/nginx/html/index.html
exit

# OR

docker exec -d $CID /bin/bash -c "echo 'hallo docker2' > /usr/share/nginx/html/index.html"

# 4) Verify the change by visiting the website before and after the modification

# Worked!

