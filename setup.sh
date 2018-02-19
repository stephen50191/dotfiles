#!/bin/bash

#Sets up the repo on the local machine.
git clone --bare https://github.com/stephen50191/dotfiles.git $HOME/.cfg
function config {
   /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME $@
}
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
else
  mkdir -p .config-backup
  echo "Backing up pre-existing dot files to .config-backup.";
  config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no

config remote set-url origin git@github.com:stephen50191/dotfiles.git
