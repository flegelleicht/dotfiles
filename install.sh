#!/bin/zsh

if [ -f ~/.vimrc ]; then
  cp ~/.vimrc ~/.vimrc.`date "+%Y%m%d%H%M%S"`
fi
ln -s ~/.dotfiles/vim/.vimrc ~/.vimrc
