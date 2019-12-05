#!/bin/sh
set -e

workDir=`pwd`
platforms="linux windows mac html5"

wget https://downloads.tuxfamily.org/godotengine/3.1.1/Godot_v3.1.1-stable_export_templates.tpz --quiet
mkdir ~/.cache
mkdir -p ~/.config/godot
mkdir -p ~/.local/share/godot/templates/3.1.1.stable
unzip Godot_v3.1.1-stable_export_templates.tpz
mv templates/* ~/.local/share/godot/templates/3.1.1.stable
rm -f Godot_v3.1.1-stable_export_templates.tpz

if [ "${SUBDIRECTORY}" != "" ]
then
    SubDirectoryLocation="${SUBDIRECTORY}/"
fi

# Export for Linux
echo "Building ${PROJECT} for Linux"
mkdir -p ./build/linux/${SubDirectoryLocation:-""}
godot --export Linux/X11 ./build/linux/${SubDirectoryLocation:-""}${PROJECT}

# Export for Windows
echo "Building ${PROJECT} for Windows"
mkdir -p ./build/windows/${SubDirectoryLocation:-""}
godot --export "Windows Desktop" ./build/windows/${SubDirectoryLocation:-""}${PROJECT}.exe

# Export for OSX
echo "Building ${PROJECT} for OSX"
mkdir -p ./build/mac/${SubDirectoryLocation:-""}
godot --export "Mac OSX" ./build/mac/${SubDirectoryLocation:-""}${PROJECT}

# Export for HTML5
echo "Building ${PROJECT} for HTML5"
mkdir -p ./build/html5/${SubDirectoryLocation:-""}
godot --export "HTML5" ./build/html5/${SubDirectoryLocation:-""}index.html

mkdir ${workDir}/package
if [ ${PACKAGE:-"false"} = "true" ]
then
    for platform in $platforms
    do
        if [ "$(ls -A ${workDir}/build/${platform})" ]; then
            echo $platform
            pwd
            ls
            cd ${workDir}/build/${platform}
            zip ${workDir}/package/${PROJECT}-${platform}.zip ${SUBDIRECTORY:-"*"} -r
        else
            echo "${platform} did not build!"
        fi
    done
fi