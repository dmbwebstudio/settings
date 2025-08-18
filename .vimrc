"++++++++++++++++++"
"+ Basic settings +"
"++++++++++++++++++"

set nocompatible
syntax on
filetype on
filetype indent on
filetype plugin on

set number
set relativenumber
set cursorline
set showmatch
set laststatus=2

"++++++++++++++++++++++"
"+ Indentation & Tabs +"
"++++++++++++++++++++++"
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smartindent
set autoindent

"++++++++++++++"
"+   Search   +"
"++++++++++++++"
set ignorecase
set smartcase
set hlsearch
set incsearch
nnoremap <silent> <Esc> :noh<CR>

"+++++++++++"
"+   Nav   +"
"+++++++++++"
set scrolloff=5
set wildmenu
set wildmode=longest:full,full


"+++++++++++++++"
"+ by language +"
"+++++++++++++++"
autocmd FileType elixir setlocal shiftwidth=2 softtabstop=2 tabstop=2

autocmd FileType javascript,typescript setlocal shiftwidth=2 softtabstop=2 tabstop=2

autocmd FileType go setlocal noexpandtab shiftwidth=4 softtabstop=4 tabstop=4

autocmd FileType sql setlocal shiftwidth=2 softtabstop=2 tabstop=2

"+++++++++"
"+ Other +"
"+++++++++"
set clipboard=unnamedplus
set mouse=a
set ruler
set title




















