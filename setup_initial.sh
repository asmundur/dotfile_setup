#!/bin/bash

# Remove existing .cfg directory if it exists
rm -rf $HOME/.cfg

# Initialize a bare Git repository in your home directory
git init --bare $HOME/.cfg

# Set up a Git alias to manage dotfiles
echo "alias config='/usr/bin/git --git-dir=\$HOME/.cfg/ --work-tree=\$HOME'" >> $HOME/.bashrc

# Define the alias in the current script session
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Set the default branch name to 'main'
git config --global init.defaultBranch main

# Configure Git to ignore untracked files
config config --local status.showUntrackedFiles no

# Rename the branch to 'main'
config branch -m main

# Add the remote repository for dotfiles
config remote add origin git@github.com:asmundur/dotfiles.git

