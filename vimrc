set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim' "fuzzy find
"Plugin 'scrooloose/nerdtree'
"Plugin 'jistr/vim-nerdtree-tabs' "make nerdtree feel like a true pannel, independent of tabs
"Plugin 'tpope/vim-fugitive' "some git support like :Gstatus
Plugin 'airblade/vim-gitgutter' "git gutter madness
Plugin 'vim-airline/vim-airline' "nicer status line
Plugin 'vim-airline/vim-airline-themes'
Plugin 'godlygeek/tabular' "text filtering and alignment
Plugin 'easymotion/vim-easymotion' "move easily without <number>w or <number>f
Plugin 'mhinz/vim-startify' "fancy startpage
"Plugin 'scrooloose/syntastic' "syntax checking on the fly
Plugin 'mileszs/ack.vim' "use ack to search files
Plugin 'jiangmiao/auto-pairs'
" Language support
Plugin 'klen/python-mode'
Plugin 'fatih/vim-go'
" Color
Plugin 'altercation/vim-colors-solarized' "solarized theme
Plugin 'fatih/molokai' "molokai theme
Plugin 'Valloric/YouCompleteMe' "neocomplete alternative
"Plugin 'cschlueter/vim-wombat' "Wombat
"Plugin 'Shougo/neocomplete.vim' "autocompletion for go code
Plugin 'majutsushi/tagbar' "source tagbar
Plugin 'sourcegraph/sourcegraph-vim' "sourcegraph
call vundle#end()            " required
filetype plugin indent on    " required

"ctrp
let mapleader=";"
map <Leader>t :CtrlP<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>l :CtrlPLine<cr>
map <Leader>a :bprev<cr>
map <Leader>s :bnext<cr>
map <Leader>d :bd<cr>
map <Leader>f :b
map <Leader>bb :ls<CR>:buffer<Space>
map <Leader>j :CtrlPBuffer<cr>
nmap <C-d> :CtrlPBufTag<CR>
"buffers
noremap <leader>d :bd<cr>
noremap <C-Tab> :bnext<CR>
noremap <C-S-Tab> :bprevious<CR>
set switchbuf=useopen,usetab
"windows splits navigation easy
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
"tabs
map <C-TAB> :tabn<CR>
map <C-S-TAB> :tabp<CR>
"yanc to system clipboards
map <leader>y "*y
map <leader>p "*p
"set runtimepath^=~/.vim/bundle/ctrlp.vim
"python-mode
let g:pymode_folding = 0
let g:pymode_lint_checkers = ['pyflakes','pep8']
let g:pymode_lint_ignore = "E501,W"
let g:pymode_options_colorcolumn = 0
let g:pymode_warning = 1

"vim-go
"do not report errors, syntastic handles that
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
"au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)
" enable highlighting
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1

nmap <C-b> :normal o_ = "breakpoint"<CR>
"quickfix
autocmd FileType qf wincmd J
nnoremap <leader>a :cclose<CR>
map <C-n> :cn<CR>
map <C-p> :cp<CR>
" scrooloose/syntastic Configuration
    let g:syntastic_aggregate_errors = 1
"    let g:syntastic_quiet_messages = { "type": "style", "level": "warnings", "file": "\.go$" }
    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_python_pylint_args='--disable=E1101,E0102,E1103,E0602'

" scrooloose/nerdtree Configuration
    " Ctrl+N to toggle NerdTree
    map <Leader>nt :NERDTreeToggle<CR>
    " If nerdtree is the only thing left then quit
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
	:let g:NERDTreeWinSize=20

" use Ctrl+T to toggle majutsushi/tagbar
    nmap <F8> :TagbarToggle<CR>
	let g:tagbar_width=40
  let g:tagbar_show_linenumbers = 1 "relative line numbers
"autocmd FileType go nested :TagbarOpen "autopoen tagbar for go packages

"easymotion
let g:EasyMotion_leader_key = '<leader><leader>'
"sourcegraph
let g:SOURCEGRAPH_AUTO="false"
nnoremap <F2> :GRAPH<CR>
" vim-ariline
let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme             = 'molokai' "auto selected based on colorscheme

syntax on                   " Enable syntax highlighting
set ai                      " when in doubt return, in edit mode, indents to the current indentation level
set smartindent             " lines ending in a { indent. lines ending in a } outdent
set backspace=2             " backspace will be able to continue past the current line onto the previous line
set backspace=indent,eol,start "backspace works in insert mode
set encoding=utf-8 "windows, I'm looking at you
set colorcolumn=80          " highlight the 80th column
set hidden                  " allow opening new files/buffers if the current one has unsaved changes
set history=1000              " keep 1000 lines of command line history
set hlsearch                " highlight all search matches
set ignorecase smartcase    " case-insensitvice search unless upper-case letters
set laststatus=2            " always show a status line
"set list                    " show invisible characters
"set listchars=tab:›\ ,eol:¬,trail:· "Set the characters for the invisible
set nolazyredraw            " don't do lazy redrawing
set linebreak               " wrap lines when displaying but don't add them to the file, obviously
set incsearch               " do incremental searching
set modeline                " honor modelines ( http://vim.wikia.com/wiki/Modeline_magic )
set ruler                   " show the cursor position all the time
set t_Co=256                " 256 colors
"set scrolloff=2             " move the display buffer when you're this close to the end of the page on screen
"set scrolloff=999           " keep the cursor centered in the screen
set scrolljump=3            " when we do scroll off the edfe jump this many lines
set shiftwidth=2            " Number of spaces to use for each step of (auto)indent
set shortmess=aI            " avoid anoyting hit ENTER stuff at prompt
set showcmd                 " display incomplete commands
set showmode                " If in Insert, Replace or Visual mode put a message on the last line.
set softtabstop=2           " Number of spaces that a <Tab> counts for while performing editing operations, like inserting a <Tab> or using <BS>
set smartcase               " Override the 'ignorecase' option if the search pattern contains upper case characters.
set tabstop=2               " Number of spaces that a <Tab> in the file counts for.
set expandtab               " Expand tabs into spaces
set wildmenu                " Make use of the "status line" to show possible completions of command line commands, file names, and more.
set splitbelow              "  splits show below by default
set splitright              " split to the right by default
"set wrap linebreak nolist   " soft line wrap
set nowrap "don't wrap the lines
set wildmode=list:longest,full
set title "nice title for the window
set visualbell              " No beep
set t_vb=                   " visual bell things
                            " When more than one match, list all matches and complete till longest common string. Complete the next full match
set ttimeoutlen=100 timeoutlen=5000
                            " The time in milliseconds that is waited for a key code or mapped key sequence to complete.d
set statusline=%<[%n]\ %F\ %m%r%y%=%-14.(%l,%c%V%)\ %P

set relativenumber
set undodir=~/.vim/undo     "undo dir
set undofile
"set number "shows on the row the absolute number
"function! ToggleRelativeNumber()
"    if &relativenumber == 1
"        set norelativenumber
"        set number
"    else
"        set relativenumber
"    endif
"endfunction
"
"nmap <F5> :call ToggleRelativeNumber()<CR> "relative numbers
"imap <F5> <Esc>:call ToggleRelativeNumber()<CR>a
"
"cursor
set cursorline "highlight line where the cursor is
"set cursorcolumn "highlight column where the cursor is
set showmatch               " Show matching braces and parens
"color
set background=dark
"colorscheme wombat256
colorscheme solarized
"colorscheme molokai

"writes faster
nmap <leader>w :w!<cr>

"fullscrean
nmap <leader>f :set fu<cr>
"down is the next line
nnoremap j gj
nnoremap k gk

"easy escape
imap jj <esc>
imap jJ <esc>
imap Jj <esc>
imap JJ <esc>
"autocommands
" Clear whitespace at the end of lines automatically
autocmd BufWritePre * :%s/\s\+$//e
"
" Don't fold anything.
autocmd BufWinEnter * set foldlevel=999999
"set nowrap
"set autoindent
"set expandtab "put spaces instead of tabs, for python
"set copyindent
"set shiftround
"gvim options
if has("gui_running")
  set guifont=Monaco:h14
  set columns=140
  set lines=40
  set sessionoptions=blank,buffers,curdir,folds,localoptions,options,resize,tabpages,winpos,winsize
  colorscheme molokai
  set fuopt+=maxhorz
  set guioptions=egmt
endif
