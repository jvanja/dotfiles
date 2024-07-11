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

echo ""
echo -e "${red}---------------------------------------"
echo -e "Symlinking dotfiles..."
echo -e "---------------------------------------${clear}"
stow bash -t ~ --verbose=1
# linkables=$( ls -1 -A -p bash/ | grep -v / )
# for file in $linkables ; do
# 	echo -e "${cyan}copying:${clear}"
# 	cp -v $CUR_PATH/bash/$file $HOME/$file
# done

echo ""
echo -e "${cyan}---------------------------------------"
echo -e "${cyan}Symlinking ~/.config filder"
echo -e "---------------------------------------${clear}"
cd bash/config; stow . -t ~/.config --verbose=1
# rsync -avh $CUR_PATH/bash/config/ ~/.config

# echo ""
# echo -e "${yellow}---------------------------------------"
# echo -e "${yellow}Syncing nvim config"
# echo -e "---------------------------------------${clear}"
# rsync -avh --exclude 'lazy-lock.json' --exclude 'lazyvim.json' $CUR_PATH/nvim/ ~/.config/nvim --delete

