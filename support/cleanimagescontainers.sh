#!/bin/bash
sudo docker rm $(sudo docker ps -a -q) --force
sudo docker rmi $(sudo docker images -q) --force
