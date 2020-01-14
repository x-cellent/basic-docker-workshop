docker run -d \
  --name logspout \
  --volume /var/run/docker.sock:/var/run/docker.sock \
  --volume /var/run:/var/run:rw \
  --publish 8000:80 \
  amouat/logspout-logstash \
  logstash://logstash:5000

docker run -d \
  --name logstash \
  --env LOGSPOUT=ignore \
  --volume $PWD/logging/logstash.conf:/etc/logstash.conf \
  --publish 127.0.0.1:5544:5544 \
  logstash:7.0.0 \
  -f /etc/logstash.conf