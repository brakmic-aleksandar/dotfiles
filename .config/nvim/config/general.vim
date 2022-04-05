" ### GENERAL NVIM CONFIG ###

" Setup variables referencing OS nvim is running on
let g:is_win = (has('win32') || has('win64')) ? v:true : v:false
let g:is_linux = (has('unix') && !has('macunix')) ? v:true : v:false
let g:is_mac = has('macunix') ? v:true : v:false
" Do no wrap lines
set nowrap

" Disable showing current mode on command line since statusline plugins can show it.
set noshowmode

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0")
  " Merge number and sign columns if supported
  set signcolumn=number
else
  set signcolumn=yes
endif

" Enable syntax highlighting
syntax enable

" Enable filetype, plugin and identation detection
filetype plugin indent on

" Minimum lines to keep above and below cursor when scrolling
set scrolloff=2

" Set fillchars for folding, vertical split, end of buffer, and message separator
set fillchars=fold:\ ,vert:\|,eob:\ ,msgsep:‾

" Give more space for displaying messages.
set cmdheight=2

" Highlight current line when in Insert mode
autocmd InsertEnter,InsertLeave * set cul!

" Use ripgrep for instead of vimgrep
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
  set grepformat=%f:%l:%c:%m
endif

" Use system clipboard for unanamed registers (yank/paste)
set clipboard^=unnamed,unnamedplus

" Hide, don't close buffers
set hidden

" Persistent undo even after you close a file and re-open it
set undofile

" Don't backup files
set nobackup
set nowritebackup

" Time in milliseconds to wait for a mapped sequence to complete,
" see https://unix.stackexchange.com/q/36882/221410 for more info
set timeoutlen=500

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Ignore certain files and folders when globing
set wildignore+=*.o,*.obj,*.dylib,*.bin,*.dll,*.exe
set wildignore+=*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**
set wildignore+=*.jpg,*.png,*.jpeg,*.bmp,*.gif,*.tiff,*.svg,*.ico
set wildignore+=*.pyc,*.pkl
set wildignore+=*.DS_Store
set wildignore+=*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.xdv
set wildignorecase  " ignore file and dir name cases in cmd-completion

" Do not use smart case in command line mode, extracted from https://vi.stackexchange.com/a/16511/15292.
augroup dynamic_smartcase
  autocmd!
  autocmd CmdLineEnter : set nosmartcase
  autocmd CmdLineLeave : set smartcase
augroup END

" Automatically reload the file if it is changed outside of Nvim, see
" https://unix.stackexchange.com/a/383044/221410. It seems that `checktime`
" command does not work in command line. We need to check if we are in command
" line before executing this command. See also
" https://vi.stackexchange.com/a/20397/15292.
augroup auto_read
  autocmd!
  autocmd FileChangedShellPost * call v:lua.vim.notify("File changed on disk. Buffer reloaded!", 'warn', {'title': 'nvim-config'})
  autocmd FocusGained,CursorHold * if getcmdwintype() == '' | checktime | endif
augroup END
