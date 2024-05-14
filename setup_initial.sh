#!/bin/bash

# Initialize a bare Git repository in your home directory
git init --bare $HOME/.cfg

# Set up a Git alias to manage dotfiles
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc

# Source the .bashrc to make the alias available in the current session
source $HOME/.bashrc

# Configure Git to ignore untracked files
config config --local status.showUntrackedFiles no

# Add the remote repository for dotfiles
config remote add origin https://github.com/asmundur/dotfiles.git
