set shell=bash

"vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-scripts/dbext.vim'
Plugin 'bling/vim-airline'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()

filetype plugin indent on
set number
set t_Co=256
set background=dark
colorscheme default
syntax enable
set mouse=a

"autosave
au CursorHold,InsertLeave * nested update
set noswapfile

"indent
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set copyindent

"tabbing
set hidden
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprev<CR>


"syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers = ['eslint']

"NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_theme='sol'
