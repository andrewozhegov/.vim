#!/bin/sh

powerline_installer="https://raw.githubusercontent.com/andrewozhegov/mi-air-13-ubuntu/master/tools/powerline-install.sh"

ln -sf ~/.vim/vimrc ~/.vimrc

if wget -q ${powerline_installer} ; then
    chmod 744 $(basename ${powerline_installer})
    sudo bash $(basename ${powerline_installer}) --vim
fi

vim -c 'PluginInstall'
