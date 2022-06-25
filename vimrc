syntax on
set nu 
set noerrorbells
set smartindent
set nowrap
set smartcase
set incsearch
set autoindent 

" set cursorline
" set colorcolumn=80

set expandtab 
se shiftwidth=4
set tabstop=4
set softtabstop=4

if executable('rg')
    let g:rg_derive_root='true'
endif 

set noerrorbells visualbell t_vb=
if has('autocmd')
    autocmd GUIEnter * set visualbell t_vb=
endif

set background=dark
colorscheme torte
