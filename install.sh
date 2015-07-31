#!/bin/bash

CUR_PATH=$(pwd)

echo "creating dotfiles..."
linkables=$( ls -1 -d *.symlink )
for file in $linkables ; do
	target="$HOME/.$( basename $file ".symlink" )"
	#echo "creating symlink for $file"
	echo "copying $CUR_PATH/$file to $target"
	cp $CUR_PATH/$file $target
done
