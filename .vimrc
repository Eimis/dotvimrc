let macvim_skip_colorscheme = 1

"start maximised
if has("gui_running")
  " GUI is running or is about to start.
  " Maximize gvim window.
  set lines=999 columns=999
endif

syntax on
filetype plugin on
filetype on
filetype plugin indent on

set syn=auto

"pathogen plugin
execute pathogen#infect()

let mapleader=","

set shell=bash

set autoindent

"copying, pasting
"
"copy
vmap <F7> "+ygv"zy`>
"paste (Shift-F7 to paste after normal cursor, Ctrl-F7 to paste over visual selection)
nmap <F7> "zgP
nmap <S-F7> "zgp
imap <F7> <C-r><C-o>z
vmap <C-F7> "zp`]
cmap <F7> <C-r><C-o>z
"copy register
autocmd FocusGained * let @z=@+

"save session when exitting vim
let g:session_autosave='yes'
let g:session_autoload='no'

"modify python comment code delimiter
let g:NERDCustomDelimiters = {
\ 'python': { 'left': '# ' }
\ }

au BufNewFile,BufRead *.ejs set filetype=html "set syntax for .ejs files

set background=dark

"colorscheme codeschool
colorscheme base16-default

" Map gwp keys to call the function
nnoremap gwp :call PushToCurrentBranch()<CR>

" Refresh Command-T files
noremap <F5> :CommandTFlush<CR>

" Search and replace text in visual mode (Ctrl+R)
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

"move lines up/down like in Sublime Text
nmap <C-S-Up> :m -2<CR>
nmap <C-S-Down> :m +1<CR>

"insert new line with <enter> or shift + <enter>
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

"custom commands
command ChangePwd :cd %:p:h

"ipdb
command Ipdb :normal i <Tab>import ipdb; ipdb.set_trace()<ESC>

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

set winaltkeys=no

set go-=m  "remove menu bar
set go-=T  "remove toolbar
set go-=r  "remove right-hand scroll bar
set go-=L  "remove left-hand scroll bar

filetype detect " always detect filetype

set guifont=DejaVu\ Sans\ Mono\ For\ Powerline:h13

"jump between windows with Alt
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"nerdtree ignore
let NERDTreeIgnore = ['\.pyc$']

set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
" Always show statusline set laststatus=2 " Use 256 colours (Use this setting only if your terminal supports 256 colours) set t_Co=256

"autocomplete
:set completeopt=longest,menuone

:inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

:inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

"Scan only opened buffers and current file, makes autocompletion faster.
set complete=.,w,b,u

"turn on sidebar (NerdTree)
nmap <silent> <c-n> :NERDTreeToggle<CR>

"Syntax checking
let g:syntastic_python_checkers = ['flake8']

"commandT ignore
set wildignore+=eggs
set wildignore+=develop-eggs
set wildignore+=migrations

"=================== PLUGINS ===================

if has('vim_starting')
  set rtp+=~/.vim/bundle/neobundle.vim/
  call neobundle#rc(expand('~/.vim/bundle/'))
endif



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

"Themes, Looks
NeoBundle 'chriskempson/base16-vim'
"NeoBundle 'bling/vim-airline' "status bar
NeoBundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'} "status bar

"file management
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'AndrewRadev/undoquit.vim'
NeoBundle 'xolox/vim-session'
NeoBundle 'xolox/vim-misc' "probably related to vim-session
NeoBundle 'szw/vim-tags'  "for Ctags
NeoBundle 'mileszs/ack.vim' " greping
NeoBundle 'chriskempson/base16-vim'
