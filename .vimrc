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
Plugin 'tpope/vim-eunuch'
Plugin 'vim-scripts/dbext.vim'
Plugin 'moll/vim-bbye'
Plugin 'vim-scripts/ag.vim'
Plugin 'octref/RootIgnore'

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

" ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
"Plugin 'astahov/vim-ruby-debugger'

"colors
Plugin 'vim-scripts/CSApprox'
Plugin 'flazz/vim-colorschemes'
Plugin 'romainl/flattened'
Plugin 'lilydjwg/colorizer'

"display
Plugin 'nathanaelkane/vim-indent-guides'

call vundle#end()

filetype plugin indent on
set number
set relativenumber
syntax enable
set mouse=a
set clipboard=unnamed,unnamedplus
set viewoptions=folds,options,cursor,unix,slash
set virtualedit=onemore
set nobackup
set nowritebackup

"colors
set t_Co=256
set background=dark
colorscheme flattened_dark
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight SpellBad ctermbg=none
highlight SpellCap ctermbg=none
set hlsearch

"autosave
autocmd CursorHold * nested update
set noswapfile

"indent
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set copyindent
set foldmethod=indent
set nofoldenable

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
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_css_checkers = ['csslint']

"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
set laststatus=2

"ctrl p
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_show_hidden=1
let g:ctrlp_extensions=['tag']

"RootIgnore
let g:ctrlp_working_path_mode = '0'


"tagbar
nmap <F8> :TagbarToggle<CR>

"indent guides
let g:indent_guides_start_level = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_auto_colors = 0
highlight IndentGuidesOdd ctermbg=none
highlight IndentGuidesEven ctermbg=235

"youcompleteme
let g:ycm_collect_identifiers_from_tags_files = 1
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
