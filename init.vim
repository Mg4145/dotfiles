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

set signcolumn=yes
set updatetime=300
set cmdheight=2

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
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
call plug#end()

" colorscheme gruvbox
colorscheme tokyonight
highlight Normal guibg=none
" set background=dark 

if executable('rg')
	let g:rg_derive_root='true'
endif 

set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" remove trailing whitespaces
autocmd BufWritePre     *.py : %s/\s\+$//e
autocmd BufWritePre     *.rs : %s/\s\+$//e
autocmd BufWritePre     *.c : %s/\s\+$//e
autocmd BufWritePre     *.cpp : %s/\s\+$//e
autocmd BufWritePre     *.java : %s/\s\+$//e
