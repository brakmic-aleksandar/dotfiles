" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugrn'
call plug#begin('~/.vim/plugged')
  Plug 'preservim/nerdtree'
  Plug 'kaicataldo/material.vim', { 'branch': 'main' }
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'jiangmiao/auto-pairs'
  Plug 'machakann/vim-sandwich'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'jackguo380/vim-lsp-cxx-highlight'
  Plug 'vim-syntastic/syntastic'
call plug#end()

" For Neovim 0.1.3 and 0.1.4 - https://github.com/neovim/neovim/pull/2198
if (has('nvim'))
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

" For Neovim > 0.1.5 and Vim > patch 7.4.1799 - https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162
" Based on Vim patch 7.4.1770 (`guicolors` option) - https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd
" https://github.com/neovim/neovim/wiki/Following-HEAD#20160511
if (has('termguicolors'))
  set termguicolors
endif

let g:material_theme_style = 'darker'

colorscheme material
" Make background transparent
hi Normal guibg=NONE ctermbg=NONE

let g:airline_powerline_fonts = 0
let g:airline_theme='transparent'
" hi airline_c  ctermbg=NONE guibg=NONE
" hi airline_tabfill ctermbg=NONE guibg=NONE
set number
autocmd FileType nerdtree set norelativenumber
let NERDTreeMinimalUI = 1
let NERDTreeDirArrowCollapsible = ' '
let NERDTreeDirArrowExpandable = ' '
set fcs=eob:\ 
let g:syntastic_enable_signs = 0
highlight clear SignColumn
hi MatchParen cterm=NONE,bold gui=NONE,bold  guibg=NONE guifg=NONE
