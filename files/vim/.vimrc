set number
syntax on

colorscheme default
set laststatus=2
set path=.,/usr/include,,**

let g:netrw_banner=0
let g:netrw_liststyle=3
" Lifted off from http://blog.g14n.info/2013/07/my-vim-configuration.html
" when navigating a folder, hitting <v> opens a window at right side (default
" is left side)
"
" Thank you!
let g:netrw_altv = 1

" set newline to text beginning of previous line
set autoindent

" for indents that consist of 4 space characters but are entered with the tab key
set tabstop=2 softtabstop=2 
set shiftwidth=2 
set expandtab 
set smartindent
set nowrap
set smartcase
set incsearch

" map shift-tab behavior
" command mode
nnoremap <s-tab> <<

" for insert mode
inoremap <s-tab> <c-d>

" turn hybrid line numbers on
:set number relativenumber

" turn hybrid line numbers off
:set nonumber norelativenumber

" toggle hybrid line numbers
:set number! relativenumber!
