#/bin/bash

if [ ! -d ~/.vim ]; then
  mkdir ~/.vim
fi

if [ ! -f ~/.vimrc ]; then
  cp .vimrc ~/.vimrc
  echo 'Copied preconfigured .vimrc'
fi

git clone https://github.com/vim-airline/vim-airline ~/.vim/pack/dist/start/vim-airline
rm -rf ~/.vim/pack/dist/start/vim-airline/.git

echo ':helptags ~/.vim/pack/dist/start/vim-airline/doc'

git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
rm -rf ~/.vim/pack/vendor/start/nerdtree/.git
vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q

git clone https://github.com/morhetz/gruvbox.git ~/.vim/pack/default/start/gruvbox
rm -rf ~/.vim/pack/default/start/gruvbox/.git

