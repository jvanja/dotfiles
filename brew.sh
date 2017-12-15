#!/usr/bin/env bash

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# list of tools from 12/15/2017
brew install advancecomp
brew install apple-gcc42
brew install automake
brew install bison@2.7
brew install boost
brew install cmake
brew install homebrew/php/composer
brew install cscope
brew install ctags
brew install dnsmasq
brew install doxygen
brew install homebrew/php/drush
brew install ffmpeg
brew install flex
brew install fzf
brew install gcc@4.9
brew install git
brew install imagemagick
brew install isl@0.11
brew install libksba
brew install libvo-aacenc
brew install libxslt
brew install mcrypt
brew install mongodb
brew install mysql
brew install neovim
brew install nvm
brew install optipng
brew install pdf2htmlex
brew install pngquant
brew install poppler
brew install python3
brew install re2c
brew install reattach-to-user-namespace
brew install rename
brew install homebrew/php/robo
brew install sbt
brew install telnet
brew install homebrew/php/terminus
brew install the_silver_searcher
brew install tmux
brew install tree
brew install utf8proc
brew install vim
brew install homebrew/php/wp-cli
brew install yarn
brew install zlib
brew install zsh

# Remove outdated versions from the cellar.
brew cleanup
