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
Plugin 'tpope/vim-eunuch'
Plugin 'moll/vim-bbye'
Plugin 'wting/gitsessions.vim'
Plugin 'bkad/CamelCaseMotion'
Plugin 'vimtaku/hl_matchit.vim'
Plugin 'tpope/vim-surround'

"unite
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/unite-outline'
Plugin 'Shougo/neomru.vim'
Plugin 'tsukkee/unite-tag'
Plugin 'lambdalisue/unite-grep-vcs'

"utils
Plugin 'tpope/vim-dispatch'
Plugin 'Shougo/vimproc'
Plugin 'szw/vim-tags'

"edit
Plugin 'tpope/vim-commentary'
Plugin 'Valloric/YouCompleteMe'

"interface
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'

"file types
Plugin 'ekalinin/Dockerfile.vim'

" ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
" Plugin 'astahov/vim-ruby-debugger'

"colors
Plugin 'vim-scripts/CSApprox'
Plugin 'flazz/vim-colorschemes'
Plugin 'romainl/flattened'

call vundle#end()

filetype plugin indent on
set number
set relativenumber
syntax enable
set mouse=a
set clipboard=unnamed,unnamedplus
set viewoptions=folds,options,cursor,unix,slash
set virtualedit=onemore

"leader
let mapleader = "\<Space>"

"colors
set t_Co=256
set background=dark
colorscheme flattened_dark
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight SpellBad ctermbg=none
highlight SpellCap ctermbg=none
set hlsearch
set showcmd

"saving
fun! StripTrailingWhitespace()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

nnoremap <leader>w :w<CR>
set nobackup
set nowritebackup
set noswapfile
autocmd TextChanged,InsertLeave * update
autocmd BufWritePre * :call StripTrailingWhitespace()
runtime macros/matchit.vim

"indent
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set copyindent
set foldmethod=indent
set nofoldenable

"buffer / window navigation
set hidden
nnoremap <leader>l :bnext<CR>
nnoremap <leader>h :bprev<CR>
nnoremap <leader>q :Bdelete<CR>
nnoremap <leader>k <C-u>
nnoremap <leader>j <C-d>

"git gutter
let g:gitgutter_realtime = 1

"hl_matchit
let g:hl_matchit_enable_on_vim_startup = 1

"syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_cursor_columns = 0
let g:syntastic_quiet_messages = { "level": "warnings", "type": "style" }
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_css_checkers = ['csslint']
let g:syntastic_sass_checkers = ['sass']

"airline
let g:airline_extensions = ['tabline', 'branch', 'unite', 'syntastic']
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = ''
let g:airline_left_sep=''
let g:airline_right_sep=''
set laststatus=2

"unite
let g:unite_source_history_yank_enable = 1
nnoremap <leader>d :<C-u>Unite -no-split -smartcase -buffer-name=directories -start-insert file/async<CR>
nnoremap <leader>f :<C-u>Unite -no-split -smartcase -buffer-name=files -start-insert file_rec/git:--cached:--others:--exclude-standard<CR>
nnoremap <leader>r :<C-u>Unite -no-split -smartcase -buffer-name=recent -start-insert file_mru<CR>
nnoremap <leader>t :<C-u>Unite -no-split -smartcase -buffer-name=tags -start-insert tag<CR>
nnoremap <leader>g :<C-u>Unite -no-split -smartcase -buffer-name=grep grep/git<CR>
nnoremap <leader>o :<C-u>Unite -no-split -smartcase -buffer-name=outline outline<CR>
nnoremap <leader>y :<C-u>Unite -no-split -smartcase -buffer-name=yank history/yank<CR>
call unite#custom#source('file_mru', 'matchers', ['matcher_project_files', 'matcher_fuzzy'])
call unite#custom#source('file,file/async', 'converters', ['converter_tail_abbr'])
call unite#custom#source('file_rec/git', 'converters', ['converter_relative_abbr'])
call unite#custom#source('file,file/async,file_rec/git', 'matchers', ['matcher_fuzzy'])
call unite#custom#source('file,file/async,file_rec/git', 'sorters', ['sorter_selecta'])

"youcompleteme
let g:ycm_collect_identifiers_from_tags_files = 1
let g:vim_tags_use_vim_dispatch = 1
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown set omnifunc=htmlcomplete#CompleteTags
autocmd FileType eruby set omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
