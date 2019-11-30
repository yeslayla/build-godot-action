#!/bin/sh
set -e

if [ "$SUBDIRECTORY" != "" ]; then
    SUBDIRECTORY = "/$SUBDIRECTORY/"
fi


wget https://downloads.tuxfamily.org/godotengine/3.1.1/Godot_v3.1.1-stable_export_templates.tpz --quiet
mkdir ~/.cache
mkdir -p ~/.config/godot
mkdir -p ~/.local/share/godot/templates/3.1.1.stable
unzip Godot_v3.1.1-stable_export_templates.tpz
mv templates/* ~/.local/share/godot/templates/3.1.1.stable
rm -f Godot_v3.1.1-stable_export_templates.tpz

# Export for Linux
mkdir -p ./build/linux
godot --export Linux/X11 ./build/linux/${SUBDIRECTORY}${PROJECT}

# Export for Windows
mkdir -p ./build/windows
godot --export "Windows Desktop" ./build/windows/${SUBDIRECTORY}${PROJECT}.exe

# Export for OSX
mkdir -p ./builds/mac
godot --export "Mac OSX" ./build/mac/${SUBDIRECTORY}${PROJECT}