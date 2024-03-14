#!/bin/bash


docker build -t chamilo:1.11.10 -f Dockerfile .

# docker login
# docker tag chamilo:1.11.10 {USERNAME}/chamilo:1.11.10
# docker push {USERNAME}/chamilo:1.11.10

