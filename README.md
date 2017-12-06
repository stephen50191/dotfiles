# dotfiles

To install run the following script:

#!/bin/bash

# Creates an ssh key to github
ssh-keygen -qb 4096 -f ~/.ssh/id_git

cat ~/.ssh/id_git

read -p "Add key to github then press enter to continue"

#Adds correct key to ssh config.
touch ~/.ssh/config
grep -q -F 'host github.com' ~/.ssh/config || printf "host github.com\n  user git\n  identityfile ~/.ssh/id_git >> ~/.ssh/config

#Sets up the repo on the local machine.
git clone --bare git@github.com:stephen50191/dotfiles.git $HOME/.cfg
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
