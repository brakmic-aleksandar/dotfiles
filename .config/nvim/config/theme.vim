" ### THEME ###

" ## Genera; ##
set termguicolors
set background=dark
let g:solarized_statusline = "flat"
colorscheme solarized8
" Make Vertical splitter color same as numbers column
highlight VertSplit guifg=#073642 guibg=#073642


" ## Airline ##
let g:airline_theme='solarized'
" TODO: Check this function out
" function! AirlineThemePatch(palette)
"  if g:airline_theme == 'solarized'
"    for colors in values(a:palette.normal)
"      let colors[0] = #073642
"    endfor
"  endif
"endfunction

" ## FZF ##
let g:fzf_colors = {
\ 'fg':      ['fg', 'Normal'],
\ 'bg':      ['bg', 'VertSplit'],
\ 'hl':      ['fg', 'Identifier'],
\ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
\ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
\ 'hl+':     ['fg', 'Identifier'],
\ 'border':  ['bg', 'VertSplit'],
\ 'pointer': ['fg', 'Type'],
\ 'info':    ['fg', 'Type'],
\ 'prompt':  ['fg', 'Type'],
\ 'header':  ['fg', 'Identifier']
\ }
