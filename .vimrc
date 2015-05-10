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
Plugin 'morhetz/gruvbox'

"display
Plugin 'nathanaelkane/vim-indent-guides'

call vundle#end()

filetype plugin indent on
set relativenumber
syntax enable
set mouse=a
set clipboard=unnamed,unnamedplus
set viewoptions=folds,options,cursor,unix,slash
set virtualedit=onemore
set backup

"colors
set t_Co=256
set background=dark
colorscheme gruvbox
hi Normal ctermbg=none
hi NonText ctermbg=none
set hlsearch

"autosave
au CursorHold,InsertLeave * nested update
set noswapfile

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

"indent guides
let g:indent_guides_start_level = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
hi IndentGuidesOdd ctermbg=none
hi IndentGuidesEven ctermbg=235

"youcompleteme
let g:ycm_collect_identifiers_from_tags_files = 1
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
