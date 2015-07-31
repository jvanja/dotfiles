#!/bin/bash

DOTFILES=$HOME/.dotfiles

echo "creating dotfiles..."
linkables=$( ls -1 -d *.symlink )
for file in $linkables ; do
	target="$HOME/.$( basename $file ".symlink" )"
	#echo "creating symlink for $file"
	echo "copying $file to $target"
	cp $file $target
done
