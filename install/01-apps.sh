#!/bin/sh

# install apps
pacman -S man-pages man-db zsh zsh-completions git openssh

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# configure oh-my-zsh
# TBD

# configure git
# TBD
