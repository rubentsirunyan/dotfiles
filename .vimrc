"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sections:
"    => General
"    => Search
"    => Files and backups
"    => Text, tab and indent related
"    => Moving around, tabs and buffers
"    => Status line
"    => File Explorer
"    => Line Numbers
"    => FZF
"    => Copy & Paste, Clipboard
"    => Editing mappings
"    => vimgrep searching and cope displaying
"    => Misc
"    => Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Include vundle config
source ~/.vim/bundle.vim

filetype plugin indent on
syntax on
" :W sudo saves the file 
" (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null

" Don't redraw while executing macros (good performance config)
set lazyredraw 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Files and backups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Indent Guide
let g:indent_guides_auto_colors = 0
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
hi IndentGuidesOdd  guibg=red   ctermbg=black
hi IndentGuidesEven guibg=green ctermbg=236
map <leader>ig :IndentGuidesToggle<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tt :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


""""""""""""""""""""""""""""""
" => File Explorer
""""""""""""""""""""""""""""""
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
map <F2> :NERDTreeToggle<CR>


""""""""""""""""""""""""""""""
" => Line Numbers
""""""""""""""""""""""""""""""
set number
map <F3> :set rnu!<CR>
autocmd InsertEnter   * set norelativenumber



" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

""""""""""""""""""""""""""""""
" => FZF
""""""""""""""""""""""""""""""
" Fzf Configuration
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }
" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

nmap <c-t> :FzfFiles<cr>
nmap <c-l>l :FzfLines<cr>
nmap <c-l>b :FzfBLines<cr>


let g:fzf_command_prefix = 'Fzf' 
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


""""""""""""""""""""""""""""""
" => Copy & Paste, Clipboard
"""""""""""""""""""""""""""""" 
set pastetoggle=<F7> "F7 before pasting to preserve indentation
" set clipboard=unnamedplus
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mouse
set mouse=a  " on OSX press ALT and click

" map sort function to a key
"" vnoremap <Leader>s :sort<CR>

set so=10

" Guide column
set colorcolumn=80
highlight ColorColumn ctermbg=black

" LimeLight
let g:limelight_conceal_ctermfg = 'gray'

" Line highlighting
hi CursorLine cterm=NONE ctermbg=black

augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

nnoremap <leader>l :set cursorline!<CR>

" Useful settings
set history=700
set undolevels=700

" Turn persistent undo on 
" means that you can undo even when you close a buffer/VIM
try
  set undodir=~/.vim/temp/undodir
  set undofile
catch
endtry
