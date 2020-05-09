#!/bin/bash
sudo docker kill $(sudo docker ps -aq)
sudo docker rm $(sudo docker ps -aq)

