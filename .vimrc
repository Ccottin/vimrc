"INSTALL PLUGIN (:PlugInstall)
call plug#begin('~/.vim_runtime/plugged')

Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
" :Flog to see gits' branches and workflow, quit w gq
Plug 'rbong/vim-flog', {'branch': 'v1'}
Plug 'dense-analysis/ale'
Plug 'tmsvg/pear-tree'
Plug 'jacoborus/tender.vim'
" for nodejs completion 
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" there is definitely a lot to dig in fzf
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'MaxMEllon/vim-jsx-pretty' for every react project you'll make
"Plug 'sheerun/vim-polyglot' for better indent

call plug#end()

"set nocompatible 
 " goes with vim polyglot
 """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CoC it is verry powerful, but so many things i might not use it full potential
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" if isdirectory('./node_modules/')

" let g:coc_snippet_next = '<tab>'

" Some servers have issues with backup files, see #649
" set nowritebackup

" GoTo code navigation
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
" set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
" set signcolumn=yes

" Use K to show documentation in preview window
" nnoremap <silent> K :call ShowDocumentation()<CR>
" Map <tab> for trigger completion, completion confirm, snippet expand and jump
" inoremap <silent><expr> <TAB>
"			\ pumvisible() ? coc#_select_confirm() :
"			\ coc#expandableOrJumpable() ?
"			\ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"			\ CheckBackspace() ? "\<TAB>" :
"			\ coc#refresh()

" Formatting selected code & if it does not work, change : for <leader> and select a leader touch
" xmap :f  <Plug>(coc-format-selected)
" nmap :f  <Plug>(coc-format-selected)


" else

" endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "left"
let NERDTreeShowHidden=0
let g:NERDTreeWinSize=30

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ALE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" disable errors and warning for assembly files
autocmd BufRead,BufNewFile,BufReadPost *.s ALEDisable

" lets try auto completion!
autocmd BufRead,BufNewFile,BufReadPost let g:ale_completion_enabled = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:lightline = {
      \ 'colorscheme': 'PaperColor'}

let g:airline_theme = 'tender'

set laststatus=2

set nobackup

"AUTO-SAVE/AUTO-LOAD FOLD
au BufWinLeave *.* mkview
au BufWinEnter *.* if getcmdwintype() == '' && &buftype != 'quickfix' | silent loadview

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

"MAP CTRL +Z/X FOR SIWTCH TAB, change this when you swich computers
nnoremap <C-a> :tabprevious<CR>
nnoremap <C-q> :tabnext<CR>

"import code w/ better indentation"
set shiftround

colorscheme tender
au BufNewFile,BufRead,BufReadPost *.tpp set syntax=cpp
au BufNewFile,BufRead,BufReadPost *.s set syntax=nasm

" change cursor display "

" insert = SInsert "
let &t_SI = "\<esc>[5 q"
" replace = SReplace "
let &t_SR = "\<esc>[3 q"
" normal = ExitInsert "
let &t_EI = "\<esc>[1 q"

no swapfile 
no backup 

"completion menu
set wildmenu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" thx @ranuytte !
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry


let data_dir = "~/.vim_runtime"
if !isdirectory(glob(data_dir . "/plugged"))
	autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
	autocmd VimEnter * NERDTree
endif
