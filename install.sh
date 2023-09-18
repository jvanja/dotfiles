#!/bin/bash

# Color variables
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'
bg_red='\033[0;41m'
bg_green='\033[0;42m'
bg_yellow='\033[0;43m'
bg_blue='\033[0;44m'
bg_magenta='\033[0;45m'
bg_cyan='\033[0;46m'
# Clear the color after that
clear='\033[0m'

CUR_PATH=$(pwd)

echo -e "---------------------------------------"
echo -e "Creating dotfiles..."
echo -e "---------------------------------------"
linkables=$( ls -1 -d *.symlink )
for file in $linkables ; do
	target="$HOME/.$( basename $file ".symlink" )"
	echo -e "${cyan}copying${clear} $CUR_PATH/$file to $target"
	cp $CUR_PATH/$file $target
done

echo -e "..................."
echo -e "${yellow}Syncing nvim config${clear}"
echo -e "..................."
rsync -avh $CUR_PATH/nvim/ ~/.config/nvim --delete
