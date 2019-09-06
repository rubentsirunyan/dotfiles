" Vundle 
"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'PProvost/vim-ps1'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'google/vim-searchindex.git'
"Plugin 'Shougo/neocomplete.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'janlay/NERD-tree-project'
"Plugin 'junegunn/fzf'
set rtp+=~/.fzf
Plugin 'junegunn/fzf.vim'
" Plugin 'Townk/vim-autoclose'
Plugin 'ivang/vim-autoclose'
Plugin 'tomtom/tcomment_vim'
Plugin 'junegunn/limelight.vim'
Plugin 'aonemd/kuroi.vim'
" NOTE: Uncomment after https://gitlab.com/HiPhish/jinja.vim/merge_requests/1
" is merged
" Plugin 'hiphish/jinja.vim'
Plugin 'rubentsirunyan/jinja.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'elzr/vim-json'
"Plugin 'davidhalter/jedi-vim'
"if v:version > 704
"  Plugin 'Valloric/YouCompleteMe'
"endif
 
" All of your Plugins must be added before the following line
call vundle#end()            " required
