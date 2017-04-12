#! /bin/bash

mkdir -p $HOME/.vim/autoload

#### pathogen
cd /tmp
git clone https://github.com/tpope/vim-pathogen.git
cp vim-pathogen/autoload/pathogen.vim $HOME/.vim/autoload
rm -rf vim-pathogen
mkdir -p $HOME/.vim/bundle

cd $HOME/.vim/bundle

#### syntastic
git clone https://github.com/scrooloose/syntastic.git

echo "installing vim plugins for haskell"

mkdir -p $HOME/.vim/autoload
mkdir -p $HOME/.vim/bundle

cd $HOME/.vim/bundle

#### vim-hdevtools
git clone https://github.com/bitc/vim-hdevtools.git

#### vim2hs
git clone https://github.com/dag/vim2hs.git

#### vimproc - required by ghcmod-vim
git clone https://github.com/Shougo/vimproc.vim.git 
pushd vimproc.vim
make
popd

#### ghcmod-vim 
git clone https://github.com/eagletmt/ghcmod-vim.git

##
## NOTES:
##
## haskellmode-vim does not seem to be supported anymore:
## http://stackoverflow.com/questions/20622390/is-haskellmode-vim-dead
##
## syntastic no longer works with ghc-mod ( as of ghc-mod 5.4.0 ):
## https://github.com/scrooloose/syntastic/issues/1576
## Syntastic author suggests using ghcmod-vim instead in that post.
##
## Still using syntastic though to work with hdevtools and hlint.
##

## reflex-platform (contains try-reflex)
cd
git clone https://github.com/reflex-frp/reflex-platform.git

