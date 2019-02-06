" Vundle settings
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'mbbill/undotree'
Plugin 'tpope/vim-rails'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'
Plugin 'mattn/emmet-vim'
Plugin 'kshenoy/vim-signature'

Plugin 'ajh17/spacegray.vim'
Plugin 'kiddos/malokai.vim'
Plugin 'wolf-dog/nighted.vim'
Plugin 'fenetikm/falcon'
Plugin 'altercation/vim-colors-solarized'
call vundle#end()
filetype plugin indent on

" These settings are advised by: https://github.com/tpope/vim-pathogen
" call pathogen#infect()
"execute pathogen#infect()
"filetype plugin indent on

" Most of the following settings come from: http://stevelosh.com/blog/2010/09/coming-home-to-vim/
syntax on
set modelines=0

set tabstop=2
set shiftwidth=2
"set softtabstop=4
"set expandtab

set guicursor=a:blinkon0
"set guifont=Menlo\ Regular:h12
set guifont=Fira\ Code:h14
set guioptions=egmrLt

set encoding=utf-8
set scrolloff=5
"set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
"set relativenumber
set number
set undofile
set undodir=~/.vimundo

let mapleader = ","

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

set wrap
set textwidth=79
set formatoptions=qrn1
"set colorcolumn=85

"set list
set listchars=tab:▸\ ,eol:¬

nnoremap j gj
nnoremap k gk

inoremap jk <ESC>

nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <F5> :UndotreeToggle<CR>

"nnoremap <S-C-h> :tabp<cr>
"nnoremap <S-C-l> :tabn<cr>
nnoremap <S-Left> :tabp<cr>
nnoremap <S-Right> :tabn<cr>

color spacegray "desert "clouds_midnight

set splitbelow
set splitright

