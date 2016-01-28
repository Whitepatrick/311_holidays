#!/bin/bash

echo "WORK VERSION"
echo "stopping ipython if running"
sudo docker stop ipython
echo "removing ipython container if lingering"
sudo docker rm ipython
echo "now running ipython"
sudo docker run -d -p 8888:8888 -v $PWD:/workspace -w="/workspace" --name ipython --user root -e NB_UID=502 jupyter/datascience-notebook start-notebook.sh
