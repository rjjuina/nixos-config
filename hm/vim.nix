{ pkgs, ... }:
{

  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      vim-airline
      vim-surround
      auto-pairs
      nerdtree
      vim-grammarous
      fzf-vim
      vim-lsp
      # YouCompleteMe
      # python-mode
      # vim-flake8
      # vim-python-pep8-indent
    ];
    extraConfig = ''
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
      set clipboard=unnamedplus  " use system clipboard as default register

      " Interface options
      set laststatus=2  " always display the status bar
      set ruler  " always show cursor positon
      set wildmenu  " display command line's tab complete options as a menu
      set tabpagemax=40
      set cursorline
      set number
      " set relativenumber  " show line number on the current line and relative numbers on all other lines
      " enable relative numbers only in normal mode, and absolute Numbers only in Insert mode
      augroup toggle_relative_number
      autocmd InsertEnter * :setlocal norelativenumber
      autocmd InsertLeave * :setlocal relativenumber
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
      let mapleader = " "
      let g:mapleader = " "

      nmap <leader>a ggVG
      vnoremap <leader>y :w !pbcopy<cr><cr>
      nmap <leader>p :r !pbpaste<cr><cr>
      nmap <leader>w :w!<cr>
      nmap <leader>q :q!<cr>
      nmap <leader>wq :wq!<cr>
      nnoremap <leader>n :NERDTreeFocus<cr>
      nnoremap <leader>b :buffers<cr>:buffer<Space>
      " nno;remap <leader>b :Buffers<cr>
      nnoremap <leader>f :FZF<cr>


      " Key bindings
      inoremap <C-b> <Left>
      inoremap <C-f> <Right>

      map <C-k> :bprev<cr>
      map <C-j> :bnext<cr>
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
    '';
  };
}

