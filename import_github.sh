#!/bin/sh
URL=https://data.gharchive.org/2019-05-15-20.json.gz
wget $URL

gunzip ./2019-05-15-20.json.gz

