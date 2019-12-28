#!/bin/sh
set -e

workDir=`pwd`

# Install export templates
wget https://downloads.tuxfamily.org/godotengine/3.1.1/Godot_v3.1.1-stable_export_templates.tpz --quiet
mkdir ~/.cache
mkdir -p ~/.config/godot
mkdir -p ~/.local/share/godot/templates/3.1.1.stable
unzip Godot_v3.1.1-stable_export_templates.tpz
mv templates/* ~/.local/share/godot/templates/3.1.1.stable
rm -f Godot_v3.1.1-stable_export_templates.tpz

if [ "$3" != "" ]
then
    SubDirectoryLocation="$3/"
fi

# Export for project
echo "Building ${PROJECT} for Linux"
mkdir -p `pwd`/build/${SubDirectoryLocation:-""}
godot --export $2 `pwd`/build/${SubDirectoryLocation:-""}$1

echo ::set-output name=build::`pwd`/build/${SubDirectoryLocation:-""}

if [ "$4" = "true" ]
then
    mkdir `pwd`/package
    cd `pwd`/build
    zip `pwd`/package/artifact.zip ${SubDirectoryLocation:-"*"} -r
    echo ::set-output name=artifact::`pwd`/package/artifact.zip
fi