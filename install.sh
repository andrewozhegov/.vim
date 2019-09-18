#!/bin/sh

powerline_installer_url="https://raw.githubusercontent.com/andrewozhegov/shell-tools/master/powerline-install.sh"
powerline_installer="${PWD}/$(basename ${powerline_installer_url})"

ln -sf ~/.vim/vimrc ~/.vimrc

if wget -q ${powerline_installer_url} ; then
    chmod 744 ${powerline_installer}
    sudo bash ${powerline_installer} --vim ~/.vim/addons/powerline.vim
    rm -f ${powerline_installer}
fi

vim -c 'PluginInstall'
