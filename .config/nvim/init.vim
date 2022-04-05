let g:config_path = stdpath('config')

let s:config_files = [
\ 'general.vim',
\ 'plugins.vim',
\ 'mappings.vim',
\ 'theme.vim'
\]

for s:fname in s:config_files
  execute printf('source %s/config/%s', g:config_path, s:fname)
endfor
