if has('python3')
endif

syntax on 
set nu
set guicursor=
set noerrorbells
set smartindent 
set nowrap 
set smartcase
set incsearch
set noswapfile 
set nobackup 
set undodir=~/.vim/undodir
set undofile 
set autoindent 
set cursorline

set termguicolors

" This is for tabbing
set expandtab 
set shiftwidth=4
set tabstop=4 
set softtabstop=4 

set colorcolumn=80

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mbbill/undotree'
Plug 'nvim-lua/completion-nvim'
Plug 'vim-syntastic/syntastic'

call plug#end()

colorscheme gruvbox
set background=dark 

if executable('rg')
	let g:rg_derive_root='true'
endif 

set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif


let g:ycm_confirm_extra_conf = 0 
let g:ycm_path_to_python_interpreter = '/usr/bin/python3.9'
let g:ycm_autoclose_preview_window_after_completion=1

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

set updatetime=300
set cmdheight=2

" remove trailing whitespaces
autocmd BufWritePre     *.py : %s/\s\+$//e
autocmd BufWritePre     *.rs : %s/\s\+$//e
autocmd BufWritePre     *.c : %s/\s\+$//e
autocmd BufWritePre     *.cpp : %s/\s\+$//e
autocmd BufWritePre     *.java : %s/\s\+$//e
