" vim:fdm=marker

" => General {{{
" Leader to Space mapping
let mapleader = " "

" Include vundle config
source ~/.vim/bundle.vim

filetype plugin indent on
syntax on
" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W w !sudo tee % > /dev/null

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Split right and below
set splitbelow
set splitright
" }}}

" => Search {{{
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
" }}}

"=> Files and backups {{{
" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile
" }}}

" => Text, tab and indent related {{{
" Use spaces instead of tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Indent guides
nnoremap <leader>il :IndentLinesToggle<CR>

" Terraform related
let g:terraform_align=1
" let g:terraform_fold_sections=1
let g:terraform_fmt_on_save=1
" }}}

" => Moving around, tabs, windows and buffers {{{
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <leader>j 10j
map <leader>k 10k
map <leader>l 10l
map <leader>h 10h
" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map t] :tabnext<cr>
map t[ :tabprevious<cr>
map b] :bnext<cr>
map b[ :bprevious<cr>

" Let 'tl' toggle between this and the last accessed tab
" let g:lasttab = 1
" nmap <Leader>tt :exe "tabn ".g:lasttab<CR>
" au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>
" }}}

" => Status line {{{
" Always show the status line
set laststatus=2

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c
" }}}

" => Terminal {{{
tnoremap <Esc> <C-\><C-n>
"}}}

" => Colors {{{
set termguicolors
" set t_Co=256
set background=dark
" colorscheme codedark
colorscheme kuroi
let g:vim_json_syntax_conceal = 0
hi MatchParen guifg=NONE guibg=NONE gui=underline cterm=underline
"}}}

" => File Explorer {{{
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
map <F2> :ToggleNERDTree<CR>
map <leader>n :ToggleNERDTree<CR>
let g:NTPNames = ['requirements.txt', 'requirements.yml', 'build.xml', 'pom.xml', 'Makefile', '.project', '.lvimrc', 'README.md', 'LICENSE']
let g:NTPNamesDirs = ['.git', 'venv']
" }}}

" => Line Numbers {{{
set number
set relativenumber
map <F3> :set rnu!<CR>
augroup RelativeNumber
  autocmd!
  autocmd InsertEnter   * set norelativenumber
augroup END

" Automatic reloading of .vimrc

augroup VimrcReload
  autocmd!
  autocmd! bufwritepost .vimrc source %
augroup END
" }}}

" => FZF {{{
" Fzf Configuration
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-h': 'split',
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

let g:fzf_command_prefix = 'Fz'

nmap <c-t> :FzFiles<cr>
nmap <leader>ag :FzAg<cr>
nmap <leader>b :FzBuffers<cr>
nmap <leader>gf :FzGFiles<cr>
nmap <leader>gs :FzGFiles?<cr>
nmap <leader>mm :FzMaps<cr>
nmap <leader>cc :FzCommands<cr>
nmap <leader>ft :FzFiletypes<cr>
nmap <leader>/ :FzLocate /<cr>

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
" }}}

" => Copy & Paste, Clipboard {{{
set pastetoggle=<F7> "F7 before pasting to preserve indentation

vnoremap s c<C-r>0<ESC>

" Clipboard sharing based on OS type
let uname = substitute(system('uname'), '\n', '', '')
if uname == 'Linux'
  inoremap <C-v> <ESC>"+p

  vnoremap <C-c> "+y
  augroup PersistentClipboard
    autocmd!
    autocmd VimLeave * call system("xclip -selection clipboard -i", getreg('+'))
  augroup END
elseif uname == 'Darwin'
  set clipboard=unnamed
endif
" }}}

" => Syntax {{{

let g:syntastic_error_symbol = '✘'
" let g:syntastic_style_error_symbol = '⚠'
let g:syntastic_warning_symbol = "▲"
hi SyntasticStyleError guibg=NONE
hi SyntasticStyleWarning guibg=NONE
highlight SyntasticStyleErrorSign guifg=#ffcc00 guibg=NONE
let g:syntastic_mode_map = {
  \ "mode": "passive",
  \ "active_filetypes": [],
  \ "passive_filetypes": [] }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
nnoremap <leader>s :SyntasticCheck<CR>
nnoremap <leader>S :SyntasticReset<CR>
" function SyntasticDetails()
"   let b:syntastic_always_populate_loc_list = 1
"   let b:syntastic_auto_loc_list = 1
"   SyntasticCheck
"   let b:syntastic_always_populate_loc_list = 0
"   let b:syntastic_auto_loc_list = 0
" endfunction
" nnoremap <leader>sd :call SyntasticDetails()<CR>

let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 1
" }}}

" => Autocomplete and snippets {{{
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>d :YcmCompleter GetDoc<CR>
nnoremap <leader>r :YcmCompleter GoToReferences<CR>
nnoremap <leader>t :YcmCompleter GetType<CR>
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_semantic_triggers = { 'python': ['re!(import\s+|from\s+(\w+\s+(import\s+(\w+,\s+)*)?)?)', '.'] }
let g:ycm_key_invoke_completion = '<C-x><C-o>'

let g:UltiSnipsExpandTrigger="<C-x><C-s>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" }}}

" => Ctags {{{
let g:auto_ctags = 1
" let g:auto_ctags_directory_list = ['.git', 'venv']
let g:auto_ctags_tags_name = '.tags'
" }}}

" => Airline {{{
" air-line
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
" }}}

" => Misc {{{
" Mouse
set mouse=a  " on OSX press ALT and click

" map sort function to a key
"" vnoremap <Leader>s :sort<CR>

" jump to the last position when reopening a file
if has("autocmd")
  augroup LastPosition
    au!
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal! g'\"" | endif
  augroup END
endif

" Text wrapping
set wrap linebreak nolist

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

nnoremap <leader>cl :set cursorline!<CR>

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

" Show bad whitespace
highlight ExtraWhitespace ctermbg=red guibg=darkred
augroup WhitespaceMatch
  " Remove ALL autocommands for the WhitespaceMatch group.
  autocmd!
  autocmd BufWinEnter * let w:whitespace_match_number =
        \ matchadd('ExtraWhitespace', '\s\+$')
  autocmd InsertEnter * call s:ToggleWhitespaceMatch('i')
  autocmd InsertLeave * call s:ToggleWhitespaceMatch('n')
augroup END
function! s:ToggleWhitespaceMatch(mode)
  let pattern = (a:mode == 'i') ? '\s\+\%#\@<!$' : '\s\+$'
  if exists('w:whitespace_match_number')
    call matchdelete(w:whitespace_match_number)
    call matchadd('ExtraWhitespace', pattern, 10, w:whitespace_match_number)
  else
    " Something went wrong, try to be graceful.
    let w:whitespace_match_number =  matchadd('ExtraWhitespace', pattern)
  endif
endfunction
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h,*.go,*.js,*.yml,*.yaml,*.json,*.tf match BadWhitespace /\s\+$/

" }}}
