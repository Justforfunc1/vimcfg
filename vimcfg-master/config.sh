#! /bin/bash

if [ ! -f ~/.vim ] ; then 
    mkdir ~/.vim
fi

if [ ! -f ~/.vim/plugin ] ; then 
    mkdir -p ~/.vim/plugin
fi

cp ./vimrc ~/.vimrc
cp ./my_plugin/my.vim ~/.vim/plugin/
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# bash_profile
cp bash_profile ~/.bash_profile
source ~/.bash_profile

# tmux conf
cp tmux.conf ~/.tmux.conf

# gdb init
cp gdbinit ~/.gdbinit

exit;
