"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"     Stephen Holtz 
"     stephenholtz.com
"
" Portions borrowed from:
"     https://github.com/amix/vimrc (almost all of sugar from here)
"     http://www.astro.ucla.edu/~mperrin/comp/vimrc
"
" Sections:
"    -> General
"    -> Key mapping
"    -> Bundles 
"    -> MATLAB
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible                " Allow just Vi iMproved
set history=700                 " Sets how many lines of history VIM has to remember
set autoread                    " Set to auto read when a file is changed from the outside
set so=4                        " Set 4 lines to the cursor - when moving vertically using j/k
set wildmenu                    " Turn on the WiLd menu for tab complete etc.,
set wildignore=*.o,*~,*.pyc     " Ignore compiled files
set ruler                       " Always show current position
set cmdheight=2                 " Height of the command bar
set hid                         " A buffer becomes hidden when it is abandoned
set backspace=eol,start,indent  " Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l          " Vestigial, unsure of function....
set ignorecase                  " Ignore case when searching
set smartcase                   " When searching try to be smart about cases 
set hlsearch                    " Highlight search results
set incsearch                   " Makes search act like search in modern browsers
set magic                       " For regular expressions turn magic on
set showmatch                   " Show matching brackets when text indicator is over them
set mat=2                       " How many tenths of a second to blink when matching brackets
set noerrorbells                " No annoying sound on errors
set novisualbell                " No annoying sound on errors
set t_vb=
set tm=500
set nobackup                    " Turn backup off, since most stuff is in SVN, git et.c anyway...
set nowb 
set noswapfile                  
set encoding=utf8               " Set utf8 as standard encoding and en_US as the standard language
set ffs=unix,dos,mac            " Use Unix as the standard file type

" Appearance
syntax enable                   " Enable syntax highlighting
colorscheme desert              " Very popular setting
set background=dark             " Works with desert well
set lazyredraw                  " Don't redraw while executing macros (good performance config)
set expandtab                   " Use spaces instead of tabs
set smarttab                    " Be smart when using tabs
set shiftwidth=4                " 1 tab == 4 spaces
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

filetype on             " Required, turn on and off to fix OS X problem
filetype off            " Required, turn on and off to fix OS X problem
filetype plugin on      " Use filetype plugins for nerdcommenter, and nerdtree  plugin
filetype indent on      " Required by vundle

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key mapping 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Get rid of those dirty arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

" Fast saving, exiting, reload vimrc
nmap <leader>w :w!<cr>
nmap <leader>q :q!<cr>

" Fast NERDTree opening
nmap <leader>n :NERDTree<cr>

" Get rid of obnoxious highlighting after searches with return key
"nmap <CR> :noh<CR><CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Bundles 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use Vundle for bundling plugins
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" To install bundles, just add in below (defaults to github)
" NOTE: comments after Bundle command are not allowed..

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Lokaltog/powerline' 

let NERDTreeShowHidden = 1 " Let nerdtree show hidden files

" powerline setup using vundle
" set rtp+={repository_root}/powerline/bindings/vim
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim


