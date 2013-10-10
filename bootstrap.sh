#!/bin/sh

for target in $HOME/dotfiles/* ; do
  name="${target##*/}" # extract filename
  link="$HOME/.$name"
  [ -e "$link" ] && echo "$link exists, skipping..." && continue
  ln -sv "$target" "$link"
done
unset target

rm -v $HOME/.bootstrap.sh $HOME/.paclist # unwanted files

cd $HOME/dotfiles

git submodule init
git submodule update
