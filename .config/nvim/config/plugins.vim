" ### PLUGIN LIST AND CONFIG (EXCEPT KEYBINDS AND STYLES) ###

" Install vim-plug if not found
let plug_install = 0
let autoload_plug_path = g:config_path . '/autoload/plug.vim'
if !filereadable(autoload_plug_path)
  silent exe '!curl -fL --create-dirs -o ' . autoload_plug_path .
    \ ' https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  execute 'source ' . fnameescape(autoload_plug_path)
  let plug_install = 1
endif
unlet autoload_plug_path

call plug#begin(g:config_path . '/plugins')
  Plug 'lifepillar/vim-solarized8',                    " Theme
  Plug 'preservim/nerdtree'                            " FileTree
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " File search
  Plug 'junegunn/fzf.vim'
  Plug 'vim-airline/vim-airline'                       " Status bar
  Plug 'brakmic-aleksandar/vim-airline-themes'         " Status bar themes
  Plug 'ntpeters/vim-better-whitespace'                " Trailing whitespace detection
  Plug 'jiangmiao/auto-pairs'                          " Automatically input bracket pairs
  Plug 'sheerun/vim-polyglot'                          " Syntax highlighting, indent detection
  Plug 'lervag/vimtex'                                 " Tex tooling
  Plug 'Konfekt/vim-alias'                             " Command aliases
  Plug 'tpope/vim-fugitive'                            " Adds git command in commandline
  Plug 'myusuf3/numbers.vim'                           " Show relative numbers
  Plug 'christoomey/vim-tmux-navigator'                " Navigate between tmux and nvim panes
  Plug 'puremourning/vimspector',                      " Debugger
    Plug 'puremourning/vimspector', {'do': 'python3 install_gadget.py --enable-vscode-cpptools'}
  Plug 'preservim/nerdcommenter'                       " Comment toggle
  Plug 'neoclide/coc.nvim', {'branch': 'release'}      " Autocompletion, linting
if has("nvim-0.5.0")
  Plug 'folke/which-key.nvim'                          " Command suggestion
endif
call plug#end()

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Don't load netrw
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1
let g:netrw_liststyle = 3

" ## NERDTree ##
let NERDTreeMinimalUI = 1
let NERDTreeDirArrowCollapsible = ' '
let NERDTreeDirArrowExpandable = ' '
let NERDTreeNaturalSort = 1
let NERDTreeShowHidden = 1
let NERDTreeStatusline = ''


" #  FZF ##
" Show fzf window at the bottom of the screen
let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.4, 'yoffset': 0.99 } }


" ## Airline ##
let g:airline_powerline_fonts = 0
" Don't show encoding if its utf-8
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'


" ## Vimspector ##
" Run VimspectorInstall to install these adapters
let g:vimspector_install_gadgets = [ 'CodeLLDB' ]
" Customized Vimspectors default layout
function! s:CustomiseUI()
  " Close the output window
  call win_gotoid( g:vimspector_session_windows.output )
  q
endfunction
augroup MyVimspectorUICustomistaion
  autocmd!
  autocmd User VimspectorUICreated call s:CustomiseUI()
augroup END


" ## NERDCommenter ##
" Create default mappings
let g:NERDCreateDefaultMappings = 0
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1


" ## Fugative ##
" Show current branch in status line
set statusline^=%{FugitiveStatusline()}


" ## COC ##
" Extension list
let g:coc_global_extensions = [
\ 'coc-rls',
\ 'coc-pyright',
\ 'coc-clangd',
\ 'coc-cmake',
\ 'coc-json',
\ 'coc-toml',
\ 'coc-markdownlint',
\ 'coc-vimtex',
\ 'coc-clang-format-style-options'
\]
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" ## Which-key ##
if has("nvim-0.5.0")
lua << EOF
  require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
  }
EOF
endif
