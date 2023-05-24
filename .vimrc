" PRELIM FILE CONFIG ---------------------------------------------- {{{
" Set number by default
set number
" Enable automatic indentation
set autoindent
" Highlight currentline
set cursorline
set showcmd      " Shows what you are typing as a command
set nocompatible " Necessary for lots for cool vim things
set ruler        " Always show current positions along the bottom
set ignorecase   " Ignore case when searching
set smartcase    " This will allow you to search specifically for capital letters
set hlsearch     " Highlight search things
set incsearch    " Make search act like search in modern browsers
set magic        " Set magic on, for regular expressions
set showmatch    " Show matching bracets when text indic
filetype on      " Enable type file detection. Vim will be able to try to detect the type of file is
filetype indent on

" }}}

" PLUGINS ------------------------------------------------------- {{{
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" For folding
Plug 'pseewald/vim-anyfold'

" For tabline below
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

Plug 'mileszs/ack.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'dense-analysis/ale'
Plug 'NLKNguyen/papercolor-theme'

" For javascript/react
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

" For markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" Initialize plugin system
call plug#end()
" }}}

" PLUGINS SETTING -------------------------------------------------{{{
" Set Papercolor-theme
set t_Co=256   " This is may or may not needed.
set background=dark
colorscheme PaperColor

" vim-anyfold settings
filetype plugin indent on " required
syntax on                 " required
autocmd Filetype * AnyFoldActivate               " activate for all filetypes
" or
" autocmd Filetype <your-filetype> AnyFoldActivate " activate for a specific
" filetype
" set foldlevel=0  " close all folds
" " or
" set foldlevel=99 " Open all folds

" NERDTree setting
let NERDTreeIgnore = ['\.pyc$'] " Ignore files with .pyc extension
" NERDTree shortcut
map <Leader>n :NERDTreeToggle<CR>
map <Leader>m :NERDTreeFind<CR>
nmap <Leader>t :TagbarToggle<CR>   

" ctrlp settings
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" }}}

" VIM ----------------------------------------------------------- {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" PYTHON -------------------------------------------------------- {{{
augroup filetype_python
  autocmd!
  " Enable syntax highlighting
  syntax on
  set backspace=indent,eol,start
  " Enable tab to be 2 spaces, , Replacing tabs with white spaces
  set tabstop=2 shiftwidth=2 expandtab
  if has("multi_byte")
    set encoding=utf-8
    setglobal fileencoding=utf-8
  else
    echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
  endif

  " insert pdb automatically
  autocmd FileType python nnoremap <Leader>p oimport pdb; pdb.set_trace() #TODO

  let g:python_highlight_all=1
  let g:python_highlight_func_calls=1

  " ale settings
  let g:ale_python_flake8_options = '--ignore=E501,E201,E202,W504'
  let g:ale_python_flake8_args = '-m flake8'
  let g:ale_cache_executable_check_failures = 1 
augroup END

" }}}
