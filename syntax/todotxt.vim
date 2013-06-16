" Vim syntax file
" Language:    todo.txt
" Maintainer:    G. Wade Johnson
" Filenames:    todo.txt

" Install this file in ~/.vim/syntax/todotxt.vim
" Add the following line to ~/.vim/ftdetect/todotxt.vim
" au BufRead,BufNewFile todo.txt,*.todo.txt,recur.txt,*.todo setfiletype
" todotxt

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" todotxt.com todo.txt compatible
syn match       todoContext       /\s\?@\S\+/
syn match       todoDate          /\d\d\d\d-\d\d-\d\d/
syn match       todoDone          /^x .*/
syn match       todoPriority      /([A-Z])/
syn match       todoProject       /+\S\+/
syn match       todoTag           /[a-zA-Z_0-9\-]\+:\w\S*/

if version >= 508 || !exists("did_conf_syntax_inits")
  if version < 508
    let did_todo_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  " MatchParen White on Cyan
  " Constant Red
  " Special  Purple
  " Identifier Cyan
  " Statement Yellow
  " PreProc Purple
  " Type Green
  " Underlined Purple underlined
  " CursorLine White underlined
  " Ignore White bold
  " Error White on Red
  " Todo Black on Yellow
  " Normal

  HiLink todoContext        Statement
  HiLink todoDate           Special
  HiLink todoDone           NonText
  hi todoPriority term=bold cterm=bold gui=bold
  HiLink todoProject        Identifier
  HiLink todoTag            Type

  syn region todotxtPriA matchgroup=todotxtPriA start=/^\s*\((A)\)/ end=/ / contains=ALL
  syn region todotxtPriB matchgroup=todotxtPriB start=/^\s*\((B)\)/ end=/ / contains=ALL
  syn region todotxtPriC matchgroup=todotxtPriC start=/^\s*\((C)\)/ end=/ / contains=ALL
  syn region todotxtPriD matchgroup=todotxtPriD start=/^\s*\((D)\)/ end=/ / contains=ALL
  hi todotxtPriA ctermfg=DarkRed guifg=DarkRed
  hi todotxtPriB ctermfg=DarkGreen guifg=DarkGreen
  hi todotxtPriC ctermfg=DarkBlue guifg=DarkBlue
  hi todotxtPriD ctermfg=Brown guifg=Brown

  delcommand HiLink
endif

let b:current_syntax = "todotxt"

" vim: ts=8 sw=2
