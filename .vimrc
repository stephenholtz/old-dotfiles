" Maintainer: 
" "     Stephen Holtz 
" "     stephenholtz.com
" " Portions borrowed from:
" "     https://github.com/amix/vimrc (almost all of sugar from here)
" "     http://www.astro.ucla.edu/~mperrin/comp/vimrc
" " Sections:
" "    -> General
" "    -> Key mapping
" "    -> Bundles 

" " => General
set nocompatible                " Allow just Vi iMproved
set history=700                 " Sets how many lines of history VIM has to remember
set autoread                    " Set to auto read when a file is changed from the outside
set so=4                        " Set 4 lines to the cursor - when moving vertically using j/k
set number                      " show line numbers
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
set tm=500
set nobackup                    " Turn backup off
set nowb 
set noswapfile
set encoding=utf8               " Set utf8 as standard encoding and en_US as the standard language
set ffs=unix,dos,mac            " Use Unix as the standard file type

" Appearance                    set colorscheme is below (after bundle management)
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
"
" Speed up transition from modes (very effective!)
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

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

" vundle to easily manage plugins
Bundle 'gmarik/vundle'

""" Colorscheme plugins
" jellybean colorscheme
Bundle 'https://github.com/nanotech/jellybeans.vim'
" solarized is a very nice color setup
Bundle 'altercation/vim-colors-solarized'

""" Misc plugins
" surround makes parens better
Bundle 'tpope/vim-surround'
" characterize extends 'ga' to give unicode
Bundle 'tpope/vim-characterize'
" BufExplorer is an essential buffer ext
Bundle 'corntrace/bufexplorer'
" tabular makes organized, readable code
Bundle 'godlygeek/tabular'
" NERDTree for sweet file browsing
Bundle 'scrooloose/nerdtree'
" NERDCommenter for easy/sexy commenting
Bundle 'scrooloose/nerdcommenter'
" powerline for an awesome status line
Bundle 'Lokaltog/powerline' 
" vim-repeat, allows plugin maps to be repeated
Bundle 'tpope/vim-repeat'
" vim-speeddating, increment dates, times etc., use :SpeedDatingFormat
Bundle 'tpope/vim-speeddating'
" ctrlp for fuzzy searching
Bundle 'kien/ctrlp.vim'
" Narrow Region Plugin (EMACS clone) 
Bundle 'chrisbra/NrrwRgn'

""" Language specific plugins
" vim-r-plugin for communication b/n vim and R 
Bundle 'jcfaria/VIM-R-plugin'
" split shell within vim required by VimLab
Bundle 'ervandew/screen'
" VimLab for matlab useage (tmux / screen.vim reqd)
Bundle "dajero/VimLab" 
" matlab support (only working one for some reason)
Bundle 'djoshea/vim-matlab'
" vim-matlab-fold for folding like in the matlab editor
Bundle 'djoshea/vim-matlab-fold'

"" REPL interactions
" vim-slime will send text to tmux etc., 
Bundle 'jpalardy/vim-slime' 
" vimux is a plugin to interact with tmux
Bundle 'benmills/vimux'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" matlab setup (mlint compatibility)
" matlab's bin *must* be in my PATH
autocmd BufEnter *.m    compiler mlint 
autocmd BufEnter *.m    map <M-n> :cnext<CR> 
autocmd BufEnter *.m    map <M-p> :cprevious<CR> 

autocmd BufLeave *.m    unmap <M-n> 
autocmd BufLeave *.m    unmap <M-p> 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" R environment setup OSX relies on screen.vim and VIM-R-plugin
" - Requires installation of VimCom in R: 
"   chooseCRANmirror()
"   install.package('devtools')
"   library(devtools)
"   install_github('jalvesaq/VimCom')
"

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
" [Working with MATLAB]
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
" Fast save / reload vimrc
nmap <leader>w :w!<cr>
nmap <leader>e :e!<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colorscheme Setup

" Solarized setup
" syntax on
" set background=
" let g:solarized_termtrans = 1
" colorscheme solarized

" Jellybeans setup
syntax on
colorscheme jellybeans

" powerline setup using vundle
" set rtp+={repository_root}/powerline/bindings/vim
" cp -R ~/.vim/bundle/powerline/powerline/config_files/* ~/.config/powerline
" *set iterm2 to use powerline patched font for both ascii and non ascii!!
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2
set ambiwidth=single
set noshowmode          " gets rid of the redundant mode description
