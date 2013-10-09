#!/bin/sh

for entry in $HOME/dotfiles ; do
  ln -s $entry "$HOME/.$entry"
done
unset entry

rm $HOME/.bootstrap.sh # unwanted file

cd $HOME/dotfiles

git submodule init
git submodule update
