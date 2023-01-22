#!/usr/bin/env bash

SOURCE=$(pwd)/dev
CONTAINER_HOME=/home/build
CONTAINER=afni-base
REPOSITORY=afni-base
TAG=0.01
FORCE_BUILD=0
PRIVILEGED=
ENVIRONMENT=
	xhost +local:docker && docker run $PRIVILEGED --net=host  -w /root/abin -e DISPLAY=$DISPLAY -v /root/.Xauthority:/root/.Xauthority:rw -v /tmp/.X11-unix:/tmp/.X11-unix  -v $SOURCE:$CONTAINER_HOME/dev:delegated  -v  ~/.ssh:/home/build/.ssh:ro -v ~/.gitconfig:/home/build/.gitconfig:ro  -it  $REPOSITORY
