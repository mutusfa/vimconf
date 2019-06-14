" Vundle

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'altercation/vim-colors-solarized'  " an eye-friendly colorscheme
Plugin 'rhysd/vim-clang-format'  " automatic formatter for clangs
Plugin 'scrooloose/nerdcommenter'  " Commenting plugin
Plugin 'tell-k/vim-autopep8'  " Automatically conform to PEP8 style guide (Python)
Plugin 'tpope/vim-fugitive'  "  git wrapper
Plugin 'Valloric/YouCompleteMe'  " Autocompleter
Plugin 'VundleVim/Vundle.vim'  " let Vundle manage Vundle

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" General
set number	" Show line numbers
set showbreak=+++ 	" Wrap-broken line prefix
set showmatch	" Highlight matching brace
set visualbell	" Use visual bell (no beeping)
 
set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
"set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally
 
set autoindent	" Auto-indent new lines
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs
 
" Advanced
set confirm	" Prompt confirmation dialogs
set hidden      " Don't write file on buffer change
set ruler	" Show row and column ruler information
 
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour
set tabstop=4
set shiftwidth=4  " indent by 4 spaces by default
set expandtab  " only Makefiles need tabs
set list listchars=tab:»·,trail:·  " Show hidden whitespace

" vim-clang-format options
let g:clang_format#auto_format=1  " format on writing

" NerdCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" autopep8 options
let g:autopep8_disable_show_diff = 1
let g:autopep8_on_save = 1

" Manual functions
" fill rest of line with characters
" credit to drfrogsplat https://stackoverflow.com/a/3400528
function! FillLine( str )
    " set tw to the desired total length
    let tw = &textwidth
    if tw==0 | let tw = 80 | endif
    " strip trailing spaces first
    .s/[[:space:]]*$//
    " calculate total number of 'str's to insert
    let reps = (tw - col("$")) / len(a:str)
    " insert them, if there's room, removing trailing spaces (though forcing
    " there to be one)
    if reps > 0
        .s/$/\=(' '.repeat(a:str, reps))/
    endif
endfunction

" Manual shortcuts 
let mapleader = ","
nnoremap <silent> <leader><space> :nohlsearch<Enter>
 
" Allow for nice separation via comment lines
inoremap <leader>== <Esc>:call FillLine('=')<Enter>
nnoremap <leader>== <Esc>:call FillLine('=')<Enter>
inoremap <leader>=- <Esc>:call FillLine('-')<Enter>
nnoremap <leader>=- <Esc>:call FillLine('-')<Enter>

" Move by visual lines
nnoremap <silent> j gj
vnoremap <silent> j gj
onoremap <silent> j gj
nnoremap <silent> k gk
vnoremap <silent> k gk
onoremap <silent> k gk
nnoremap <silent> $ g$
vnoremap <silent> $ g$
onoremap <silent> $ g$
nnoremap <silent> 0 g0
vnoremap <silent> 0 g0
onoremap <silent> 0 g0

" Allow to use jk to escape to normal mode
inoremap <silent> jk <Esc>
onoremap <silent> jk <Esc>
cnoremap jk <C-C>
