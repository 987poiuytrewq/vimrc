set shell=bash

"vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

"util
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-dispatch'
Plugin 'Shougo/vimproc'
Plugin 'szw/vim-tags'

"motion
Plugin 'terryma/vim-smooth-scroll'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'bkad/CamelCaseMotion'
Plugin 'vimtaku/hl_matchit.vim'

"buffers
Plugin 'tpope/vim-eunuch'
Plugin 'moll/vim-bbye'

"interface
Plugin 'scrooloose/syntastic'
Plugin 'Shougo/neocomplete.vim'
Plugin 'bling/vim-airline'

"unite
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/unite-outline'
Plugin 'Shougo/neomru.vim'
Plugin 'tsukkee/unite-tag'
Plugin 'lambdalisue/unite-grep-vcs'
Plugin 'sgur/unite-qf'

"git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'

" ruby
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'thoughtbot/vim-rspec'

"file types
Plugin 'ekalinin/Dockerfile.vim'

"colors
Plugin 'sickill/vim-monokai'

call vundle#end()

set number
set mouse=a
set clipboard=unnamed,unnamedplus

"leader
let mapleader = "\<Space>"

"colors
set t_Co=256
set background=dark
colorscheme monokai
let g:airline_theme = 'dark'
highlight Normal ctermbg=none
highlight NonText ctermbg=none
set hlsearch

"saving
fun! StripTrailingWhitespace()
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
let g:gitgutter_sign_added            = '➕'
let g:gitgutter_sign_modified         = '❙'
let g:gitgutter_sign_removed          = '▁'
let g:gitgutter_sign_modified_removed = '❙'
nmap <leader>cs <Plug>GitGutterStageHunk
nmap <leader>cr <Plug>GitGutterRevertHunk
nmap <leader>cp <Plug>GitGutterPreviewHunk

"vim-tags
let g:vim_tags_auto_generate = 1

"syntastic
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
set laststatus=2

"unite
let g:unite_source_history_yank_enable = 1
let g:unite_source_tag_show_location = 0
let g:unite_source_tag_max_name_length = 100
let g:unite_source_tag_max_fname_length = 100
call unite#filters#matcher_default#use('matcher_fuzzy')
call unite#filters#sorter_default#use('sorter_selecta')
call unite#custom#source('file_mru', 'matchers', ['matcher_project_files', 'matcher_fuzzy'])
call unite#custom#source('file', 'converters', ['converter_tail_abbr'])
call unite#custom#source('file_rec,file_rec/git', 'converters', ['converter_relative_abbr'])
nnoremap <leader>d :<C-u>UniteWithBufferDir -no-split -smartcase -buffer-name=directories -start-insert -hide-source-names file file/new directory/new<CR>
nnoremap <leader>f :<C-u>Unite -no-split -smartcase -buffer-name=files -start-insert file_rec/git:--cached<CR>
nnoremap <leader>r :<C-u>Unite -no-split -smartcase -buffer-name=recent -start-insert file_mru<CR>
nnoremap <leader>t :<C-u>UniteWithInput -no-split -smartcase -buffer-name=tags tag<CR>
nnoremap <leader>g :<C-u>Unite -no-split -smartcase -buffer-name=grep grep/git<CR>
nnoremap <leader>p :<C-u>UniteResume -buffer-name=grep<CR>
nnoremap <leader>o :<C-u>Unite -no-split -smartcase -start-insert -buffer-name=outline outline<CR>
nnoremap <leader>y :<C-u>Unite -no-split -smartcase -buffer-name=yank history/yank<CR>
nnoremap <leader>b :<C-u>Unite -no-split -smartcase -buffer-name=buffers buffer<CR>
nnoremap <leader>c :<C-u>Unite -no-split -smartcase -buffer-name=quickfix qf<CR>

"unite customisation
function! s:unite_directory_keybindings()
  imap <buffer> <C-j> <Plug>(unite_delete_backward_path)
endfunction
autocmd FileType unite call s:unite_directory_keybindings()

let s:unite_delete_file_action = {
  \ 'description' : 'Delete file',
  \ 'is_selectable' : 1,
  \ }
function! s:unite_delete_file_action.func(candidates)
  for candidate in a:candidates
    let path = candidate.action__path
    echo 'Deleted ' . path
    call delete(path)
  endfor
endfunction
call unite#custom#action('source/file/file', 'delete', s:unite_delete_file_action)

"neocomplete
let g:neocomplete#enable_at_startup = 1
set omnifunc=syntaxcomplete#Complete

"rspec
command Rspec :call RunNearestSpec()<CR>
