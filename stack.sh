#!/bin/bash

sudo docker run -d -p 8888:8888 -v $PWD:/workspace -w="/workspace" jupyter/datascience-notebook start-notebook.sh
