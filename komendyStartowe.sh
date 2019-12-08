#!/bin/bash
sudo docker build -t prakhar1989/foodtrucks-web .
sudo docker network create dockery-siec
sudo docker container run -d --name es --net dockery-siec -p 9200:9200 -p 9300:9300 -e “discovery.type=single-node” docker.elastic.co/elasticsearch/elasticsearch:6.3.2
sudo docker container run -d --net dockery-siec -p 5000:5000 --name testowaaplikacja prakhar1989/foodtrucks-web
