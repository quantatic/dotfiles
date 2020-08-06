#!/bin/bash

#makes this script work no matter where this directory is located, no matter where the init file is called from
CURRENT_DIRECTORY=$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd) 

FILES=(".vimrc" ".editorconfig" ".emacs");

for file in ${FILES[@]}
do
	ln -s -v $CURRENT_DIRECTORY/$file ~/$file; #sets up $file
done
