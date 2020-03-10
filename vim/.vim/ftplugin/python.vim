set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set fileformat=unix

" set nofoldenable
set foldmethod=indent
set foldlevel=99
highlight Folded ctermbg=245
let g:SimpylFold_docstring_preview = 1

" autocmd BufWritePre *.py execute ':Black'
"python with virtualenv support
python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
 project_base_dir = os.environ['VIRTUAL_ENV']
 activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
 exec(open(activate_this).read(), dict(__file__=activate_this))
EOF
