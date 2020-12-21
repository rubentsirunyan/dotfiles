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
Plugin 'scrooloose/nerdtree'
Plugin 'janlay/NERD-tree-project'
set rtp+=/usr/local/opt/fzf
Plugin 'junegunn/fzf.vim'
" Plugin 'ivang/vim-autoclose'
Plugin 'Raimondi/delimitMate'
Plugin 'tomtom/tcomment_vim'
Plugin 'junegunn/limelight.vim'
Plugin 'aonemd/kuroi.vim'
" NOTE: Uncomment after https://gitlab.com/HiPhish/jinja.vim/merge_requests/1
" is merged
" Plugin 'hiphish/jinja.vim'
Plugin 'rubentsirunyan/jinja.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'elzr/vim-json'
Plugin 'hashivim/vim-terraform'
" Plugin 'psf/black'
" Plugin 'soramugi/auto-ctags.vim'
Plugin 'tomasiser/vim-code-dark'
Plugin 'vim-syntastic/syntastic'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tweekmonster/startuptime.vim'
Plugin 'martinda/Jenkinsfile-vim-syntax'
" Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
if v:version > 704
 Plugin 'Valloric/YouCompleteMe'
endif

" All of your Plugins must be added before the following line
call vundle#end()            " required
