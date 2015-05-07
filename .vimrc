set shell=bash

"vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

"git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'gregsexton/gitv'

"nav
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-eunuch'
Plugin 'vim-scripts/dbext.vim'
Plugin 'moll/vim-bbye'

"edit
Plugin 'tpope/vim-commentary'
Plugin 'Valloric/YouCompleteMe'

"interface
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'

"tags
Plugin 'majutsushi/tagbar'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'

"file types
Plugin 'ekalinin/Dockerfile.vim'

"colors
Plugin 'vim-scripts/CSApprox'
Plugin 'romainl/flattened' 

"characters
Plugin 'Yggdroot/indentLine'

call vundle#end()

filetype plugin indent on
set relativenumber
set t_Co=256
set background=dark
colorscheme flattened_dark 
syntax enable
set mouse=a

"autosave
au CursorHold,InsertLeave * nested update
set noswapfile

"highlight
set hlsearch

"indent
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set copyindent

"buffers
set hidden
nnoremap <C-right> :bnext<CR>
nnoremap <C-left> :bprev<CR>
nnoremap <C-down> :Bdelete<CR>

"move lines
nnoremap <A-j> :m .+1<CR>== 
nnoremap <A-k> :m .-2<CR>== 

"syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
set laststatus=2

"ctrl p
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_show_hidden=1
let g:ctrlp_extensions=['tag']

"tagbar
nmap <F8> :TagbarToggle<CR>

"indentline
let g:indentLine_char = '︙'
let g:indentLine_color_dark = 1
