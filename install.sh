#!/bin/bash
# (c) J~Net 2025
#
# ./install.sh program_name
#
if [ -z "$1" ]; then
    echo "Error: No program name supplied."
    echo "Usage: ./install.sh <program_name>"
    exit 1
fi

function x(){
sudo chmod +x $1
}

echo "Installing..."
x $1
sudo cp ./$1 /usr/local/bin/
x /usr/local/bin/$1
echo "Install Of $1 Complete!"
