#!/bin/bash

echo "HOME VERSION"
echo "stopping ipython if running"
sudo docker stop ipython
echo "removing ipython container if lingering"
sudo docker rm ipython
echo "building docker image for ipython from file"
sudo docker build -t ipython docker/.
echo "now running ipython"
sudo docker run -d -p 8888:8888 -v $PWD:/workspace -w="/workspace" -n ipython jupyter/datascience-notebook start-notebook.sh
