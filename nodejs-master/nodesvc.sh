#/bin/bash

#Check whether docker process for this API is running or not

docker kill haritibcoblog-node-webapp
docker system prune  --force
docker run -p 9001:9001 -d  -t --name haritibcoblog-node-webapp hsivabc/node-web-app-1
