let mapleader = " "                 " Set leader key to Space

syntax on                           " Sets the syntax for coding
set nu                              " Sets line numbers
set guicursor=                      " Sets block cursor
set noerrorbells visualbell t_vb=   " Turns off annoying error sounds
set smartindent                     " Turns on smart indent for coding
set nowrap                          " Prevents line wrapping
set smartcase                       " This is for searching
set incsearch                       " This is for searching
set noswapfile                      " Turns off swap file in created
set nobackup                        " Turns off backups
set undodir=~/.vim/undodir          " Sets undodir to folder
set undofile                        " Return the name of the undo file
set autoindent                      " Copy indent from current line
set cursorline                      " Highlights current line you are on
set cmdheight=2                     " Number of screen lines to use for cli 
set termguicolors                   " Enables 24-bit RGB color
set colorcolumn=80                  " Highlights max line length
set updatetime=100                  " Length of time after you stop typing
set signcolumn=yes                  " Always show the signcolumn
set expandtab                       " Converts tabs to spaces
set shiftwidth=2                    " Levels of indendation 
set tabstop=2                       " How many columns wide a tab char is worth
set softtabstop=2                   " How much whitespace added/removed 


" Remove trailing whitespace
autocmd BufWritePre     *.py : %s/\s\+$//e
autocmd BufWritePre     *.rs : %s/\s\+$//e
autocmd BufWritePre     *.c : %s/\s\+$//e
autocmd BufWritePre     *.cpp : %s/\s\+$//e
autocmd BufWritePre     *.java : %s/\s\+$//e

"Plugins using Vim-Plug
call plug#begin('~/.vim/plugged')
    Plug 'morhetz/gruvbox'
    Plug 'tpope/vim-fugitive'
    Plug 'vim-utils/vim-man'
    Plug 'mbbill/undotree'
    Plug 'https://github.com/ycm-core/YouCompleteMe.git'
    Plug 'https://github.com/junegunn/fzf.git' 
    Plug 'vim-syntastic/syntastic'
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
call plug#end()

" Config for tokyonight colorscheme -- see GitHub for more info
" You must configure it first before you load the colorscheme
let g:tokyonight_style = "storm"
let g:tokyonight_italic_comments = 1
let g:tokyonight_italic_keywords = 1
let g:tokyonight_italic_functions = 1
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]

colorscheme tokyonight              " gruvbox
highlight Normal guibg=none 
set background=dark

" This is for the undotree keybind
nnoremap <F5> :UndotreeToggle<CR>

if executable('rg')
	let g:rg_derive_root='true'
endif 
