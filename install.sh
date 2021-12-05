#!/bin/sh

packages_required="exuberant-ctags vim-gui-common"

for package in ${packages_required} ; do
    dpkg -l | grep ${package} || echo "Package '${package}' is required but not found!"
done

cd ~/.vim
ls -A ~/.vim/bundle/Vundle.vim && git submodule update --init

ln -sf ~/.vim/vimrc ~/.vimrc
vim -c 'PluginInstall'
