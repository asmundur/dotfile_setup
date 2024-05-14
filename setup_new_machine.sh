#!/bin/bash

# Clone the dotfiles repository as a bare repository
git clone --bare git@github.com:asmundur/dotfiles.git $HOME/.cfg

# Define the 'config' function to manage dotfiles
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}

# Create a backup directory for any pre-existing dotfiles
mkdir -p .config-backup

# Attempt to check out the dotfiles
config checkout
if [ $? = 0 ]; then
  echo "Checked out config."
else
  echo "Backing up pre-existing dot files."
  config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv $HOME/{} .config-backup/{}
  config checkout
fi

# Configure Git to ignore untracked files
config config status.showUntrackedFiles no

echo "If nothing else was printed after 'Backing up pre-existing....' then dotfile import was SUCCESSFUL"
