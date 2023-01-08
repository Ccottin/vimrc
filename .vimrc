set mouse=a
set nu
set autoindent
set smartindent
set cindent

set tabstop=4
"expand tab remplace tes tabs par des espaces pour l proprete sur le web"
set	noexpandtab
set	shiftwidth=4
set	softtabstop=4

"import code w/ better indentation"
set shiftround

colorscheme pablo
au BufNewFile,BufRead,BufReadPost *.tpp set syntax=cpp

" change cursor display "

" insert = SInsert "
let &t_SI = "\<esc>[5 q"
" replace = SReplace "
let &t_SR = "\<esc>[3 q"
" normal = ExitInsert "
let &t_EI = "\<esc>[1 q"

"no swapfile "
"no backup "
