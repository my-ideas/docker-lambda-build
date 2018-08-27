#!/bin/bash
gitVer=$(git rev-parse --short HEAD)
docker build --build-arg GITHASH=$gitVer -t myideas/lambda-build -t myideas/lambda-build:$gitVer .

docker push myideas/lambda-build