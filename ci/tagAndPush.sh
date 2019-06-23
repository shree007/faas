#!/bin/sh
set -e

IMAGE_REGISTRY=$1
IMAGE_NAME=$2
PLATFORM=""

if [ ! -z "$3" ]; then
 PLATFORM="-$3"
fi

echo "Tagging $IMAGE_REGISTRY/$IMAGE_NAME:$TRAVIS_TAG$PLATFORM"
docker tag $IMAGE_NAME:latest-dev$PLATFORM $IMAGE_REGISTRY/$IMAGE_NAME:$TRAVIS_TAG$PLATFORM;

echo "Pushing $IMAGE_REGISTRY/$IMAGE_NAME:$TRAVIS_TAG$PLATFORM"
docker push $IMAGE_REGISTRY/$IMAGE_NAME:$TRAVIS_TAG$PLATFORM;
