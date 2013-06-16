" Vim filetype detection file
" Language:	todo.txt (http://todotxt.com/)
" Maintainer:   G. Wade Johnson
" URL:
" Version:	3
"
au! BufRead,BufNewFile todo.txt,done.txt set filetype=todotxt
