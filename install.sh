#!/bin/bash

CUR_PATH=$(pwd)

echo "creating dotfiles..."
linkables=$( ls -1 -d *.symlink )
for file in $linkables ; do
	target="$HOME/.$( basename $file ".symlink" )"
	echo "copying $CUR_PATH/$file to $target"
	cp $CUR_PATH/$file $target
done

echo "creating coc-settings.json"
cp $CUR_PATH/vimcoc.settings ~/.vim/
