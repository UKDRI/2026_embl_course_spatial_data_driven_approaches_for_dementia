#!/usr/bin/env bash
#
set -e

tag=latest
podman build -t spatialdata:$tag .

if [ -e spatialdata_${tag}.tar ]
then
	rm spatialdata_${tag}.tar
fi
if [ -e spatialdata_${tag}.sif ]
then
	rm spatialdata_${tag}.sif
fi

podman save -o spatialdata_${tag}.tar localhost/spatialdata:$tag
apptainer build spatialdata_${tag}.sif docker-archive://spatialdata_${tag}.tar
