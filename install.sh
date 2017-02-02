#!/bin/sh
# vimrc install script

# color
colormsg() { tput setaf $1; echo $2; tput sgr0; }

colormsg 2 "Vundle..."
git submodule update --init

colormsg 2 "Symlink vimrc.."
ln -s $PWD/vimrc ~/.vimrc

colormsg 2 "Fetching vundles..."
vim +PluginInstall +qall

colormsg 2 "Done."
