#!/usr/bin/env bash

SOURCE=$(pwd)/dev
CONTAINER_HOME=/home/afni
CONTAINER=afni-easy
REPOSITORY=afni-easy
TAG=0.01
FORCE_BUILD=0
PRIVILEGED=
ENVIRONMENT=
	docker run $PRIVILEGED  -v $SOURCE:$CONTAINER_HOME/dev:delegated  -v  ~/.ssh:/home/afni/.ssh:ro -v ~/.gitconfig:/home/afni/.gitconfig:ro  -it  $REPOSITORY


