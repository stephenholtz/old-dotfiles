" Vim configuration file, 
" https://www.github.com/stephenholtz/dotfiles/.vimrc
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                " Allow just Vi iMproved
set history=700                 " Sets how many lines of history VIM has to remember
set autoread                    " Set to auto read when a file is changed from the outside
set so=4                        " Set 4 lines to the cursor - when moving vertically using j/k
set number                      " show line numbers
set wildmenu                    " Turn on the WiLd menu for tab complete etc.,
set wildignore=*.o,*~,*.pyc     " Ignore compiled files
set ruler                       " Always show current position
set cmdheight=1                 " Height of the command bar
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
set tm=500
set nobackup                    " Turn backup off
set nowb 
set noswapfile
set encoding=utf8               " Set utf8 as standard encoding and en_US as the standard language
set ffs=unix,dos,mac            " Use Unix as the standard file type
set wrapscan                    " Allow search to wrap (default)

" Appearance                    set colorscheme is below (after bundle management)
set t_Co=256
set lazyredraw                  " Don't redraw while executing macros (good performance config)
set expandtab                   " Use spaces instead of tabs
set smarttab                    " Be smart when using tabs
set shiftwidth=4                " 1 tab == 4 spaces
set tabstop=4
set guifont=Inconsolata:h14      " installed on macosx (copy in dotfiles/fonts)
set listchars=tab:»\ ,eol:¬,trail:. " show hidden characters
" Linebreak on 500 characters
set lbr
set tw=500

set ai   " Auto indent
set si   " Smart indent
set wrap " Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Bundles 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use Vundle for bundling plugins
" :PluginList          - list configured bundles
" :PluginInstall(!)    - install(update) bundles
" :PluginSearch(!) foo - search(or refresh cache first) for foo
" :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
" see :h vundle for more details or wiki for FAQ

" To install bundles, just add in below (defaults to github)
filetype off        " Required by vundle
" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()

" vundle to easily manage plugins
Plugin 'gmarik/Vundle.vim'

""" Colorscheme plugins
Plugin 'chriskempson/base16-vim'          " well maintained colorschemes

""" Misc plugins
Plugin 'tpope/vim-surround'         " surround text easily
Plugin 'corntrace/bufexplorer'      " essential buffer ext
Plugin 'fholgado/minibufexpl'       " Mini bufferexplorer
Plugin 'godlygeek/tabular'          " organized, readable code
Plugin 'scrooloose/nerdtree'        " file browsing
Plugin 'scrooloose/syntastic'       " syntax checking
Plugin 'scrooloose/nerdcommenter'   " easy/sexy commenting
Plugin 'tpope/vim-repeat'           " allows plugin maps to be repeated
Plugin 'kien/ctrlp.vim'             " fuzzy searching (also ctags)
Plugin 'rking/ag.vim'               " silver searcher integration

""" Language specific plugins
Plugin 'ervandew/screen'            " split shell within vim required by VimLab
Plugin 'dajero/VimLab'              " matlab useage (tmux / screen.vim reqd)
Plugin 'djoshea/vim-matlab'         " matlab support
Plugin 'djoshea/vim-matlab-fold'    " folding like in the matlab editor

"" REPL interactions
Plugin 'jpalardy/vim-slime'         " send text to tmux etc.
Plugin 'benmills/vimux'             " interact with tmux

call vundle#end()                   " required
filetype plugin indent on           " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" matlab setup (mlint compatibility)
" matlab's bin *must* be in my PATH
" autocmd BufEnter *.m    compiler mlint 
" autocmd BufEnter *.m    map <M-n> :cnext<CR> 
" autocmd BufEnter *.m    map <M-p> :cprevious<CR> 

" autocmd BufLeave *.m    unmap <M-n> 
" autocmd BufLeave *.m    unmap <M-p> 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" R environment setup OSX relies on screen.vim and VIM-R-plugin
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" - Requires installation of VimCom in R: 
"   chooseCRANmirror()
"   install.package('devtools')
"   library(devtools)
"   install_github('jalvesaq/VimCom')

filetype plugin on      " Use filetype plugins for nerdcommenter, and nerdtree  plugin
filetype indent on      " Required by vundle

" Opens R in terminal rather than RGui (OSX)
let vimplugin_applescript = 0
let vimplugin_screenplugin = 0
" Other R/tmux conf
let g:screenImpl = 'Tmux'               " Enable Tmux support
let vimrplugin_screenvsplit = 1         " Vertical Tmux split
let g:ScreenShellInitialFocus = 'shell' " 
let g:vimrplugin_noscreenrc = 1         " use my own .screenrc
let vimrplugin_conqueplugin = 0         " ignore concue plugin
let g:vimrplugin_map_r = 1              " allow r-plugin to send lines to R
let vimrplugin_vimpager = "no"          " see Vim buffer R documentation...
" Mapping for R 
" Start R with F2 Key
map <F2> <Plug>Rstart
imap <F2> <Plug>Rstart
vmap <F2> <Plug>Rstart
" Send selection to R with space bar
vmap <Space> <Plug>RDSendSelection
" Send line to R with space bar
nmap <Space> <Plug>RDSendLine

" NERDtree setup
let NERDTreeShowHidden = 1 " Let nerdtree show hidden files

" Fast NERDTree opening
nmap <leader>n :NERDTree<cr>
nmap <leader>f :MatlabFoldText()<cr>

" ctrlp setup
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_switch_buffer = 'Et' " If already open, try to switch instead of opening

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimux setup (defaults from doc/vimux.txt) 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Works with MATLAB
" - open tmux pane and run matlab with -nodesktop -nosplash
" - use commands below to send text, or run scripts!

" Run current file in nearest non-vim pane/window
map <Leader>rb :call VimuxRunCommand(bufname("%"))<CR>
" Run current file, but don't hit enter (just send command)
map <Leader>rq :call VimuxRunCommand(bufname("%"),0)<CR>
" Run last command (in the VimuxRunCommand history)
map <Leader>rl :call VimuxRunLastCommand()<CR>

" visual mode - yank selection to register v, call slime
vmap <Leader>vs "vy:call VimuxSlime()<cr>
" normal mode - yank paragraph to register v, call slime
nmap <Leader>vp vip"vy:call VimuxSlime()<cr>
" normal mode - yank full line to register v, call slime
nmap <Leader>vs ^v$"vy:call VimuxSlime()<cr>

" Send the register text from the mapping above to the REPL
function! VimuxSlime()
    call VimuxOpenRunner()
    call VimuxSendText(@v)
    call VimuxSendKeys("Enter")
endfunction

" Keys sent to runner (might need to make this filetype specific)
let VimuxResetSequence = ""
let g:VimuxUseNearset = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other Key mapping 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fast save / reload vimrc
nmap <leader>w :w!<cr>
nmap <leader>e :e!<cr>

" Get rid of ex
nnoremap Q <nop>

" Switch between files quickly
nmap <leader><leader> <C-^>

" Quickly comment with Tabularize
"if exists(":Tabularize")
    " Line up the = in a block of text
    nmap <leader>t= :Tabularize /=<CR>
    vmap <leader>t= :Tabularize /=<CR>
    " Line up text that follows the colon
    nmap <leader>t: :Tabularize /:\zs<CR>
    vmap <leader>t: :Tabularize /:\zs<CR>
    " Line up the % or # or //
    nmap <leader>t% :Tabularize /%<CR>
    vmap <leader>t% :Tabularize /%<CR>
    nmap <leader>t# :Tabularize /#<CR>
    vmap <leader>t# :Tabularize /#<CR>
    nmap <leader>t/ :Tabularize /\/\<CR>
    vmap <leader>t/ :Tabularize /\/\<CR>
"endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark         " User dark version of base16 colors
syntax on                   " Required
let base16colorspace=256    " Access colors present in 256 colorspace
colorscheme base16-eighties

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Powerline ( installed with pip )
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set encoding=utf-8
set laststatus=2
set ambiwidth=single
set noshowmode
let g:Powerline_symbols='fancy'
