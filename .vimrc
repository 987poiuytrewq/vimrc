"neobundle
set nocompatible
set runtimepath+=~/.vim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

"util
NeoBundle 'tpope/vim-sensible'
NeoBundle 'tpope/vim-dispatch'
NeoBundle 'Shougo/vimproc.vim', {'build':{'unix':'make'}}
NeoBundle 'szw/vim-tags'

"motion
NeoBundleLazy 'bkad/CamelCaseMotion'
NeoBundle 'terryma/vim-smooth-scroll'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-commentary'
NeoBundle 'vimtaku/hl_matchit.vim'

"buffers
NeoBundle 'tpope/vim-eunuch'
NeoBundle 'moll/vim-bbye'

"interface
NeoBundle 'scrooloose/syntastic'
NeoBundle 'Valloric/YouCompleteMe', {'build':{'unix':'./install.py'}}
NeoBundle 'bling/vim-airline'

"unite
NeoBundle 'Shougo/unite.vim'
NeoBundleLazy 'Shougo/unite-outline',
      \ {'autoload':{'unite_sources':'outline'}}
NeoBundleLazy 'Shougo/neomru.vim',
      \ {'autoload':{'unite_sources':['file_mru','directory_mru']}}
NeoBundleLazy 'lambdalisue/unite-grep-vcs',
      \ {'autoload':{'unite_sources':'grep/git'}}
NeoBundleLazy 'kmnk/vim-unite-giti',
      \ {'autoload':{'unite_sources':'giti'}}
NeoBundleLazy 'osyo-manga/unite-quickfix',
      \ {'autoload':{'unite_sources':['quickfix', 'location_list']}}

"git
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'

"ruby
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'nelstrom/vim-textobj-rubyblock'
NeoBundle 'thoughtbot/vim-rspec'

"db
" NeoBundle 'vim-scripts/dbext.vim'

"file types
NeoBundleLazy 'ekalinin/Dockerfile.vim'
autocmd FileType Dockerfile NeoBundleSource 'ekalinin/Dockerfile.vim'
NeoBundleLazy 'pangloss/vim-javascript'
autocmd FileType javascript NeoBundleSource 'pangloss/vim-javascript'
NeoBundleLazy 'mxw/vim-jsx'
autocmd FileType javascript NeoBundleSource 'mxw/vim-jsx'

"colors
NeoBundle 'sickill/vim-monokai'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

"general
set number
set mouse=a
set clipboard=unnamed,unnamedplus
set ttyfast
set ttimeoutlen=0

"leader
let mapleader = "\<Space>"

"camelcasemotion
map ,w <Plug>CamelCaseMotion_w
map ,b <Plug>CamelCaseMotion_b
map ,e <Plug>CamelCaseMotion_e
NeoBundleSource 'bkad/CamelCaseMotion'

"colors
set t_Co=256
set background=dark
colorscheme monokai
let g:airline_theme = 'dark'
highlight Normal ctermbg=none
highlight NonText ctermbg=none
set hlsearch

"hl_matchit
let g:hl_matchit_enable_on_vim_startup = 1
let g:hl_matchit_hl_groupname = 'Search'
let g:hl_matchit_cursor_wait = 0.050
let g:hl_matchit_hl_priority = 1

"saving
function! StripTrailingWhitespace()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

set nobackup
set nowritebackup
set noswapfile
autocmd TextChanged,InsertLeave * nested update
autocmd BufWritePre * :call StripTrailingWhitespace()

"indent
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set copyindent
set foldmethod=indent
set nofoldenable

"wrap
set breakindent
set linebreak
" don't break on ruby sigils
set breakat-=:
set breakat-=@
set showbreak=└─

"buffer / window navigation
set hidden
nnoremap <leader>l :bnext<CR>
nnoremap <leader>h :bprev<CR>
nnoremap <leader>k :call smooth_scroll#up(&scroll, 10, 5)<CR>
nnoremap <leader>j :call smooth_scroll#down(&scroll, 10, 5)<CR>
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprev<CR>
nnoremap <C-k> :call smooth_scroll#up(&scroll, 10, 5)<CR>
nnoremap <C-j> :call smooth_scroll#down(&scroll, 10, 5)<CR>
nnoremap <leader>q :Bdelete<CR>
nnoremap <leader>w <C-w>w
nnoremap <leader>n :nohlsearch<CR>

"git gutter
let g:gitgutter_sign_column_always = 1
let g:gitgutter_sign_added              = '➕'
let g:gitgutter_sign_modified           = '❙'
let g:gitgutter_sign_removed            = '▁'
let g:gitgutter_sign_removed_first_line = '─'
let g:gitgutter_sign_modified_removed   = '❙'
let g:gitgutter_diff_args = '-b -w --ignore-blank-lines'
nmap <leader>cs <Plug>GitGutterStageHunk
nmap <leader>cr <Plug>GitGutterRevertHunk
nmap <leader>cp <Plug>GitGutterPreviewHunk

"vim-tags
let g:vim_tags_auto_generate = 1

"syntastic
highlight link SyntasticErrorSign GitGutterDelete
let g:syntastic_error_symbol = '✖'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_cursor_columns = 0
let g:syntastic_quiet_messages = { "level": "warnings", "type": "style" }
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_css_checkers = ['csslint']
let g:syntastic_sass_checkers = ['sass']

"airline
let g:airline_extensions = ['tabline', 'branch', 'unite', 'syntastic']
let g:airline_powerline_fonts=1
let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = ''
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
set laststatus=2

"unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use('matcher_fuzzy')
call unite#filters#sorter_default#use('sorter_selecta')
call unite#custom#source('file_mru', 'matchers', ['matcher_project_files', 'matcher_fuzzy'])
call unite#custom#source('file', 'converters', ['converter_tail_abbr'])
call unite#custom#source('file', 'matchers', ['matcher_default'])
call unite#custom#source('file_rec,file_rec/git', 'converters', ['converter_relative_abbr'])
nnoremap <leader># :<C-u>Unite -no-split -smartcase -buffer-name=directories -start-insert -hide-source-names file file/new directory/new<CR>
nnoremap <leader>d :<C-u>UniteWithBufferDir -no-split -smartcase -buffer-name=directories -start-insert -hide-source-names file file/new directory/new<CR>
nnoremap <leader>f :<C-u>Unite -no-split -smartcase -buffer-name=files -start-insert file_rec/git:--cached:--others:--exclude-standard<CR>
nnoremap <leader>r :<C-u>Unite -no-split -smartcase -buffer-name=recent -start-insert file_mru<CR>
nnoremap <leader>o :<C-u>Unite -no-split -smartcase -start-insert -buffer-name=outline outline<CR>
nnoremap <leader>y :<C-u>Unite -no-split -smartcase -buffer-name=yank history/yank<CR>
nnoremap <leader>b :<C-u>Unite -no-split -smartcase -buffer-name=buffers buffer<CR>
nnoremap <leader>cc :<C-u>Unite -no-split -smartcase -buffer-name=quickfix quickfix<CR>
nnoremap <leader>cl :<C-u>Unite -no-split -smartcase -buffer-name=locations location_list<CR>
nnoremap <leader>gg :<C-u>Unite -no-split -smartcase -buffer-name=grep grep/git<CR>
nnoremap <leader>gp :<C-u>UniteResume grep<CR>
nnoremap <leader>gb :<C-u>Unite -no-split -buffer-name=gitbranches giti/branch_all<CR>
nnoremap <leader>gs :<C-u>Unite -no-split -buffer-name=gitstatus giti/status<CR>
nnoremap <leader>gl :<C-u>Unite -no-split -buffer-name=gitlog giti/log<CR>

"unite customisation
function! s:unite_directory_keybindings()
  imap <buffer> <C-h> <Plug>(unite_delete_backward_path)
endfunction
autocmd FileType unite call s:unite_directory_keybindings()

"youcompleteme
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
"
"ruby complete
setlocal omnifunc=syntaxcomplete#Complete
let g:rubycomplete_rails = 1
" let g:rubycomplete_buffer_loading = 1 "this causes massive slowdown
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_include_object = 1
let g:rubycomplete_include_objectspace = 1

"rspec
command! Rspec :call RunNearestSpec()<CR>

"macros
command! HashTorpedo :%s/ ["':]\(\S*\)["']* => / \1: /g
