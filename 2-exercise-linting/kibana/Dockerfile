docker run -d \
  --name kibana \
  --env LOGSPOUT=ignore \
  --env ELASTICSEARCH_URL=http://elasticsearch:9200 \
  --link elasticsearch \
  --publish 5601:5601 \
  kibana