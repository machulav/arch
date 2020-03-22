#!/bin/sh

# install apps
pacman -S man-pages man-db which zsh 
# zsh-completions git openssh

# make zsh a default shell
chsh -s $(which zsh) vova
chsh -s $(which zsh) root

# install oh-my-zsh

# configure oh-my-zsh
# TBD

# configure git
# TBD
