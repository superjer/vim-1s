" vim-1s - Search for current search pattern across entire Git repo
" Maintainer:   Jer Wilson <superjer@superjer.com>
" URL:          https://github.com/superjer/vim-1s
" Version:      0.1
"
" License:
" Copyright Jer Wilson. Distributed under the same terms as Vim itself.
" See :help license
"
" Installation:
" Put this file in your ~/.vim/plugin dir or, if you use a bundler, clone
" https://github.com/superjer/vim-1s to your bundles dir.
"
" Description:

if exists("g:loaded_1s")
  finish
endif
let g:loaded_1s = 1

" 1s to search-again in all files in Git
func! GitGrep(...)
  let save = &grepprg
  set grepprg=git\ grep\ -n\ $*
  let s = 'grep'
  for i in a:000
    let s = s . " " . i
  endfor
  exe s
  let &grepprg = save
endfun
command! -nargs=? GitGrep call GitGrep(<f-args>)
nnoremap 1s :cope \| GitGrep '<C-R>=substitute(substitute(substitute(@/,"'","'\\\\''","g"),"\|","\\\\\\\\\|","g"),"\\\\v","","g")<CR>'<Left><CR>

