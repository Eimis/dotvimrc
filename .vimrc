let macvim_skip_colorscheme = 1

"start maximised
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=999 columns=999
endif

let mapleader=","

set shell=bash

set autoindent

"save session when exitting vim
let g:session_autosave='yes'
let g:session_autoload='no'

let g:indentLine_fileType = ['xml', 'xsd']
let g:indentLine_char = '┆'

"vim start screen:
let g:startify_session_dir = '~/.vim/sessions'
let g:startify_session_sort = 1

" more comfortablekey binding for recursive search
cabbrev ack Ack!
"turn off search result highlighting:
cabbrev nhl nohlsearch

"modify python comment code delimiter
let g:NERDCustomDelimiters = {
\ 'python': { 'left': '# ' }
\ }

au BufNewFile,BufRead *.ejs set filetype=html "set syntax for .ejs files
au BufNewFile,BufRead *.html set filetype=htmldjango "turn on Django syntax
au BufNewFile,BufRead *.txt set filetype=django "turn on Django syntax

if has('gui_running')
    set background=dark
    colorscheme gruvbox
    "colorscheme alduin
    let g:airline_powerline_fonts = 1
    "let g:airline_theme='luna'
else
    set background=dark
    colorscheme gruvbox
endif

"colorscheme codeschool
"colorscheme base16-default
"colorscheme base16-ocean
"colorscheme solarized  "light
"colorscheme base16-mocha
"colorscheme wombat  "dark
"colorscheme gruvbox  "dark

"scheme specific options:
let g:gruvbox_contrast_dark='soft'
let g:gruvbox_invert_selection=0

let g:airline#extensions#hunks#enabled=0 " do not show git changes (lines changed)

" Map gwp keys to call the function
nnoremap gwp :call PushToCurrentBranch()<CR>

" Refresh Command-T files
noremap <F5> :CommandTFlush<CR>

" Search and replace text in visual mode (Ctrl+R)
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

"Search for visualy highlighted text (hl --> //):
vnoremap // y/<C-R>"<CR>

"move lines up/down like in Sublime Text
nmap <C-S-Up> :m -2<CR>
nmap <C-S-Down> :m +1<CR>

"insert new line with <enter> or shift + <enter>
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

"custom commands

"ipdb
command Ipdb :normal i <Tab>import ipdb; ipdb.set_trace()<ESC>
command Pdb :normal i <Tab>import pdb; pdb.set_trace()<ESC>

"redraw colors:
command Recolor :syntax sync fromstart

"Remove whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

set expandtab

autocmd FileType python set sw=4
autocmd FileType html set sw=2
autocmd FileType python set ts=4
autocmd FileType python set sts=4

set number
set colorcolumn=80
set hlsearch
"allow backspacing over everything in insert mode
set backspace=indent,eol,start
set showmatch     " set show matching parenthesis
set incsearch     " show search matches as you type
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set nobackup
set laststatus=2
" tell vim to use an undo file
set undofile
" set a directory to store the undo history
set undodir=/Users/eimantas/.vim/vim_undos

set winaltkeys=no

set go-=m  "remove menu bar
set go-=T  "remove toolbar
set go-=r  "remove right-hand scroll bar
set go-=L  "remove left-hand scroll bar

filetype detect " always detect filetype

set guifont=Fira\ Mono\ for\ Powerline:h13
"set guifont=Sauce\ Code\ Powerline:h13
"set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h13

"jump between windows with Alt
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"nerdtree ignore
let NERDTreeIgnore = ['\.pyc$', '\.orig$', ]

"nerdtree FIND
nnoremap nf  :NERDTreeFind<CR>

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

"autocomplete
:set completeopt=longest,menuone

:inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

:inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

"TAB SHORTCUTS
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabprev<CR>
nnoremap tk  :tabnext<CR>
nnoremap tl  :tablast<CR>
nnoremap tw  :tabclose<CR>
nnoremap tt  :tab split<CR>

"Scan only opened buffers and current file, makes autocompletion faster.
set complete=.,w,b,u

"turn on sidebar (NerdTree)
nmap <silent> <c-n> :NERDTreeToggle<CR>

"Syntax checking
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_javascript_checkers = ['jshint']

"commandT ignore files/dirs (also autocomplete ignore) ??
set wildignore+=eggs
set wildignore+=develop-eggs
set wildignore+=*.pyc,.git
set wildignore+=*/migrations/*
set wildignore+=*/vendor/*
set wildignore+=*/media/*
set wildignore+=*/virtualenv/*

set wildignore+=*.orig
set wildignore+=tags

"By setting this option to true (1) you enable asynchronous tags file updates. Good luck! ;-)
"autocmd FileType python let b:easytags_auto_highlight = 0
"let g:easytags_async = 0

"Lawrencium status window fucks up splits after it's being used, so:
let g:lawrencium_status_win_split_even = 1

autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>

"=================== PLUGINS ===================

if has('vim_starting')
  set rtp+=~/.vim/bundle/neobundle.vim/
  call neobundle#begin(expand('~/.vim/bundle/'))
endif

let g:autopep8_disable_show_diff=1
"this doesn't fucking work:
let g:autopep8_max_line_length=79
autocmd FileType python noremap <buffer> <F8> :call Autopep8()<CR>

"Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

"Syntax
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'Raimondi/delimitMate' "auto close quotes, etc.
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'scrooloose/syntastic'
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}} "identation, etc.
NeoBundle 'nvie/vim-flake8'
NeoBundle 'wincent/command-t'
NeoBundle 'groenewege/vim-less'
NeoBundle 'ervandew/supertab' "autocomplete with TAB

"Themes, Looks
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'chankaward/vim-railscasts-theme'
"NeoBundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'} "status bar
NeoBundle 'vim-airline/vim-airline' " status bar
NeoBundle 'vim-airline/vim-airline-themes' " status bar themes
NeoBundle 'morhetz/gruvbox'

NeoBundle 'alessandroyorba/monrovia'
NeoBundle 'alessandroyorba/alduin'
NeoBundle 'alessandroyorba/sidonia'

"file management
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'phleet/vim-mercenary'  "Fugitive for hg
NeoBundle 'ludovicchabant/vim-lawrencium'  "Fugitive for hg
NeoBundle 'airblade/vim-gitgutter' "diff
"NeoBundle 'mhinz/vim-signify' "diff for hg
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'AndrewRadev/undoquit.vim'
NeoBundle 'xolox/vim-session'
NeoBundle 'xolox/vim-misc' "probably related to vim-session
"NeoBundle 'xolox/vim-easytags'  "for Ctags
NeoBundle 'szw/vim-tags'  "for Ctags
NeoBundle 'mileszs/ack.vim' " greping
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'majutsushi/tagbar' "class outline viewer for Vim
NeoBundle 'digitaltoad/vim-jade' "Syntax for Jjade templates
NeoBundle 'keith/swift.vim' "Syntax for Swift
NeoBundle 'maksimr/vim-jsbeautify' "Beautiful js
NeoBundle 'tell-k/vim-autopep8' "Auto pep8
NeoBundle 'tpope/vim-rhubarb' "enables : GBrowse
NeoBundle 'Yggdroot/indentLine'  "indent lines
NeoBundle 'mhinz/vim-startify'  "start screen

call neobundle#end()

syntax on
syntax enable
filetype plugin on
filetype on
filetype plugin indent on
set syn=auto
set autoread
set equalalways

noremap <C-M> :TagbarToggle<CR>
