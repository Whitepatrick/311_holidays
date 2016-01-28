#!/bin/bash

echo "MAC VERSION"
echo "stopping ipython if running"
docker stop ipython
echo "removing ipython container if lingering"
docker rm ipython
echo "now running ipython"
docker run -d -p 8888:8888 -v $PWD:/workspace -w="/workspace" --name ipython --user root -e NB_UID=503 jupyter/datascience-notebook start-notebook.sh
