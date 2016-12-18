" ============================================================================
" File:        vim-pastplace.vim
" Description: Reopen files where you left off.
" Author:      Greg Dietsche <vim@gregd.org>
" Licence:     MIT
" Website:     https://www.gregd.org/
" Version:     0.0.1
" ============================================================================

if exists('b:pastplace_loaded') || &cp
  finish
endif
let b:pastplace_loaded = 1

if !exists('g:pastplace_ignore')
  let g:pastplace_ignore = ['gitcommit', 'gitrebase', 'svn', 'hgcommit']
endif

function! s:restore_cursor()
  if line("'\"") <= line("$") && index(g:pastplace_ignore, &filetype) < 0
    normal! g`"
    return 1
  endif
endfunction

augroup pastplace
  autocmd!
  autocmd BufWinEnter * call s:restore_cursor()
augroup END
