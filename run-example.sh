#!/bin/sh

mkdir -p output
docker build -t markdown-to-pdf . && docker run --rm -v $PWD/output/:/output/ markdown-to-pdf
