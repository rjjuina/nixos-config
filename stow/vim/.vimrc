" General configuration options
" use vim settings rather than vi settings, have this line on the top as it influences other options
set nocompatible
set backspace=indent,eol,start
set history=1000
set showcmd
set showmode
set autoread
set hidden
set shell=/bin/zsh
set modifiable
set showmatch
set textwidth=200
set foldenable
set colorcolumn=150  " Maximum length in line of 150
set gfn=Mono:h14

"Interface options
set laststatus=2  " always display the status bar
set ruler  " always show cursor positon
set wildmenu  " display command line's tab complete options as a menu
set tabpagemax=40
set cursorline
set number
set relativenumber  " show line number on the current line and relative numbers on all other lines
set noerrorbells
set visualbell
set title

" Swap and backup options - disable all of them
set noswapfile
set nobackup
set nowb

" Indentation options
set autoindent
set smartindent
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
filetype indent on
set nowrap

" Search options
set incsearch
set hlsearch
set ignorecase
set smartcase

" Text rendering options
set encoding=utf8
set linebreak
set scrolloff=3
set sidescrolloff=5
syntax enable


" Leader key
let mapleader = ' '
let g:mapleader = ' '

nmap <leader>a ggVG
vnoremap <leader>y :w !pbcopy<cr><cr>
nmap <leader>p :r !pbpaste<cr><cr>
nmap <leader>w :w!<cr>
nmap <leader>q :q!<cr>
nmap <leader>wq :wq!<cr>
nnoremap <leader>n :NERDTreeFocus<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>f :Files<cr>
nnoremap <leader>h :Rg<cr>


" Key binkdings
" delete without yank
" nnoremap d "_d
" vnoremap d "_d

" replace currently selected text without yanking it
" vnoremap p "_dP

" paste on new line
" nnoremap ,p o<Esc>p
" nnoremap ,P O<Esc>P

" Identations
vnoremap << <gv
vnoremap >> >gv
vnoremap = =gv

" Mode Settings
let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

" Cursor settings:
"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar

" to fix cursor deplay when change mode
set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set ttyfast

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

let NERDTreeShowHidden=1  " NERDTree always show hidden files default
let NERDTreeQuitOnOpen=1

if executable('rnix-lsp')
    au User lsp_setup call lsp#register_server({
  \ 'name': 'rnix-lsp',
  \ 'cmd': {server_info->[&shell, &shellcmdflag, 'rnix-lsp']},
  \ 'whitelist': ['nix'],
  \ })
endif


""""""""""""""""
" DEPENDENCIES "
""""""""""""""""

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
  \| endif

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'preservim/nerdtree'
" Plug 'ycm-core/YouCompleteMe'
Plug 'rhysd/vim-grammarous'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'python-mode/python-mode'
" Plug 'Vimjas/vim-python-pep8-indent'
Plug 'jceb/vim-orgmode'
Plug 'LnL7/vim-nix'
Plug 'tomlion/vim-solidity'
Plug 'jamessan/vim-gnupg'

call plug#end()

"""""""""""
" MODULES "
"""""""""""

" source ~/.vim/modules/java.vim

