#!/bin/bash

#makes this script work no matter where this directory is located, no matter where the init file is called from
CURRENT_DIRECTORY=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd) 

ln -s -v $CURRENT_DIRECTORY/.vimrc ~/.vimrc #sets up vimrc
ln -s -v $CURRENT_DIRECTORY/.editorconfig ~/.editorconfig #sets up the editor config for vim
