#!/usr/bin/env bash

SOURCE=$(pwd)/dev
CONTAINER_HOME=/root
CONTAINER=afni-base
REPOSITORY=afni-base
TAG=0.01
FORCE_BUILD=0
PRIVILEGED=
ENVIRONMENT=
	xhost +local:docker && docker run $PRIVILEGED --net=host  -w /root/abin -e QT_GRAPHICSSYSTEM="native" -e DISPLAY=$DISPLAY -v /root/.Xauthority:/root/.Xauthority:rw -v /tmp/.X11-unix:/tmp/.X11-unix  -v $SOURCE:$CONTAINER_HOME/dev:delegated  -v  ~/.ssh:/root/.ssh:ro -v ~/.gitconfig:/root/.gitconfig:ro  -it  $REPOSITORY
