#!/bin/sh

packages_required=exuberant-ctags

for package in ${packages_required} ; do
    which ${package} || echo "Package '${package}' is required but not found!"
done

ln -sf ~/.vim/vimrc ~/.vimrc
vim -c 'PluginInstall'
