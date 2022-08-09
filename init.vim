let mapleader = " "                 " Set leader key to Space

syntax on                           " Sets the syntax for coding
set nu                              " Sets line numbers
set guicursor=                      " Sets block cursor
set noerrorbells visualbell t_vb=  " Turns off annoying error sounds
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
set updatetime=300                  " Length of time after you stop typing
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

" Plugins using Vim-Plug see GitHub for more information
call plug#begin('~/.vim/plugged')
    Plug 'morhetz/gruvbox'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'tpope/vim-fugitive'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'mbbill/undotree'
    Plug 'vim-syntastic/syntastic'
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
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

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" This is for the undotree keybind
nnoremap <F5> :UndotreeToggle<CR>

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

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
