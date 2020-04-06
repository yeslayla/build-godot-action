#!/bin/sh
set -e

# Move godot templates already installed from the docker image to home
mv -n /root/.local ~

if [ "$3" != "" ]
then
    SubDirectoryLocation="$3/"
fi

mode="export"
if [ "$6" = "true" ]
then
    mode="export-debug"
fi

# Export for project
echo "Building $1 for $2"
mkdir -p ~/build/${SubDirectoryLocation:-""}
cd ${5-"~"}
godot --${mode} $2 ~/build/${SubDirectoryLocation:-""}$1
cd ~

echo ::set-output name=build::~/build/${SubDirectoryLocation:-""}


if [ "$4" = "true" ]
then
    mkdir -p ~/package
    cd ~/build
    zip ~/package/artifact.zip ${SubDirectoryLocation:-"."} -r
    echo ::set-output name=artifact::~/package/artifact.zip
fi
