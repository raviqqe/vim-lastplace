" ============================================================================
" File:        vim-pastplace.vim
" Description: Reopen files where you left off. Configurable.
" Author:      Greg Dietsche <vim@gregd.org>
" Licence:     MIT
" Website:     https://www.gregd.org/
" Version:     3.0.4
" ============================================================================

if exists("b:loaded_pastplace_plugin") || &cp
	finish
endif
let b:loaded_pastplace_plugin = 1

scriptencoding utf-8

if !exists('g:pastplace_ignore')
	let g:pastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"
endif

if !exists('g:pastplace_open_folds')
	let g:pastplace_open_folds = 1
endif

fu! s:pastplace()
	if index(split(g:pastplace_ignore, ","), &filetype) == -1 
		if line("'\"") > 0 && line("'\"") <= line("$")
			"if the last edit position is set and is less than the
			"number of lines in this buffer.

			if line("w$") == line("$") 
				"if the last line in the current buffer is
				"also the last line visible in this window
				execute "normal! g`\""

			elseif line("$") - line("'\"") > ((line("w$") - line("w0")) / 2) - 1
				"if we're not at the bottom of the file, center the
				"cursor on the screen after we make the jump
				execute "normal! g`\"zz"

			else
				"otherwise, show as much context as we can by jumping
				"to the end of the file and then to the mark. If we
				"pressed zz here, there would be blank lines at the
				"bottom of the screen. We intentionally leave the
				"last line blank by pressing <c-e> so the user has a
				"clue that they are near the end of the file.
				execute "normal! \G'\"\<c-e>"
			endif
		endif
		if foldclosed(".") != -1 && g:pastplace_open_folds
			"if we're in a fold, make the current line visible
			execute "normal! zv"
		endif
	endif
endf

augroup pastplace_plugin
	autocmd!
	autocmd BufWinEnter * call s:pastplace()
augroup END
