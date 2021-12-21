if has('python3')
endif

syntax on 
set nu
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

set expandtab 
set shiftwidth=4
set tabstop=4 
set softtabstop=4 

set colorcolumn=80

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'tpope/vim-fugitive'
Plug 'https://github.com/leafgarland/typescript-vim.git'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'mbbill/undotree'
Plug 'https://github.com/ycm-core/YouCompleteMe.git'
Plug 'https://github.com/junegunn/fzf.git' 

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
