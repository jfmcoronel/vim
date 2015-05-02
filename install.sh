ln -s $(pwd)/.vimrc ../.
ln -s $(pwd)/.vim ../.vim
git submodule init
git submodule update --recursive
