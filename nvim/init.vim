set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')
Plug 'gmarik/Vundle.vim'
Plug 'ctrlpvim/ctrlp.vim' "fuzzy find
Plug 'posva/vim-vue'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs' "make nerdtree feel like a true pannel, independent of tabs
"Plugin 'tpope/vim-fugitive' "some git support like :Gstatus
Plug 'airblade/vim-gitgutter' "git gutter madness
Plug 'itchyny/lightline.vim'
"Plug 'vim-airline/vim-airline' "nicer status line
"Plug 'vim-airline/vim-airline-themes'
Plug 'godlygeek/tabular' "text filtering and alignment
Plug 'easymotion/vim-easymotion' "move easily without <number>w or <number>f
Plug 'mhinz/vim-startify' "fancy startpage
"Plugin 'scrooloose/syntastic' "syntax checking on the fly
Plug 'mileszs/ack.vim' "use ack to search files
Plug 'jiangmiao/auto-pairs'
" Language support
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
"Plug 'klen/python-mode'
Plug 'fatih/vim-go'
Plug 'AndrewRadev/splitjoin.vim'
"buffers
Plug 'jlanzarotta/bufexplorer'
" Color
Plug 'fatih/molokai' "molokai theme
Plug 'dracula/vim'
Plug 'kristijanhusak/vim-hybrid-material' "hybrid_reverse theme
Plug 'jdkanani/vim-material-theme' " theme material-theme
"Plugin 'Valloric/YouCompleteMe' "neocomplete alternative
"Plugin 'Shougo/neocomplete.vim' "autocompletion for go code
Plug 'majutsushi/tagbar' "source tagbar
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
Plug 'zchee/deoplete-go', { 'do': 'make' }
Plug 'YorickPeterse/happy_hacking.vim'
call plug#end()            " required
filetype plugin indent on    " required

"true colors
"set termguicolors
"set t_ut=
"autowrite file when using make
set autowrite
"ctrp
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_switch_buffer = 'et'  " jump to a file if it's open already
let g:ctrlp_mruf_max=450    " number of recently opened files
let g:ctrlp_max_files=0     " do not limit the number of searchable files
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_match_window = 'bottom,order:btt,max:10,results:10'
let g:ctrlp_buftag_types = {'go' : '--language-force=go --golang-types=ftv'}"
nnoremap <leader>b :CtrlPCurWD<cr>
nnoremap <leader>b <esc> :CtrlPCurWD<cr>
"general
let mapleader=","
map <Leader>t :CtrlP<cr>
set wildignore+=*/vendor/*,*/.git/*,*/_old/*
map <Leader>a :bprev<cr>
map <Leader>s :bnext<cr>
map <Leader>d :bd<cr>
map <Leader>f :b
map <Leader>bb :ls<CR>:buffer<Space>
map <Leader>j :CtrlPBuffer<cr>
nmap <C-d> :CtrlPBufTag<CR>
"buffers
noremap <C-Tab> :bnext<CR>
noremap <C-S-Tab> :bprevious<CR>
set switchbuf=useopen,usetab
"windows splits navigation easy
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
"tabs
"map <C-Tab> :tabnext<CR>
"map <C-S-Tab> :tabprev<CR>
  " switch between tabs with cmd+1, cmd+2,..."
  map <D-1> 1gt
  map <D-2> 2gt
  map <D-3> 3gt
  map <D-4> 4gt
  map <D-5> 5gt
  map <D-6> 6gt
  map <D-7> 7gt
  map <D-8> 8gt
  map <D-9> 9gt
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
"terminal
"allow esc to exit a terminal buffer
tnoremap <Esc> <C-\><C-n>
"vim-go
"easy jump to the next error. cnext works for quickfix errors, use :lext for
"location lists errors
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
let g:go_list_type = "quickfix" "make all location list errors into quickfix errors
"do not report errors, syntastic handles that
let g:go_fmt_autosave = 1
let g:go_fmt_command = 'goreturns'
"try metalinter on save
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_deadline = "10s"
"gocode for faster autocompletion
let g:go_gocode_autobuild = 1
"let gocode offer suggestions based on unimported backages
let g:go_gocode_unimported_packages = 1
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
"other
au FileType go nmap <Leader>de <Plug>(go-describe)
"go declarations
nmap <C-g> :GoDecls<cr>
imap <C-g> <esc>:<C-u>GoDecls<cr>
" enable highlighting
let g:go_highlight_types = 1
let g:go_highligh_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goreturns"
"let g:go_fmt_fail_silently = 1
let g:go_auto_type_info = 1
set updatetime=100
"deoplete-go
set completeopt+=noinsert "neocomplete like
set completeopt+=noselect "deoplete.nvim recommended
let g:python3_host_prog = '/usr/bin/python3.4'
let g:python3_host_skip_check = 1 "skip the check of neovim module
let g:deoplete#enable_at_startup = 1 "start deoplete automatically
let g:deoplete#sources#go#gocode_binary = '/usr/local/go/work/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#pointer = 1 "to support * completion
let g:deoplete#sources#go#use_cache = 1
let g:deoplete#sources#go#json_directory= '~/.cache/deoplete/go/$GOOS_$GOARCH'

"quickfix
autocmd FileType qf wincmd J
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
"

"easymotion
let g:EasyMotion_leader_key = '<leader><leader>'
"lightline
set noshowmode " we show the mode with airline or lightline
" ==================== Lightline ====================
"
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste'],
      \             [ 'fugitive', 'filename', 'modified', 'ctrlpmark', 'go'] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component': {
      \   'go': '%#goStatuslineColor#%{LightLineGo()}',
      \ },
      \ 'component_visible_condition': {
      \   'go': '(exists("*go#statusline#Show") && ""!=go#statusline#Show())'
      \ },
      \ 'component_function': {
      \   'lineinfo': 'LightLineInfo',
      \   'percent': 'LightLinePercent',
      \   'modified': 'LightLineModified',
      \   'filename': 'LightLineFilename',
      \   'fileformat': 'LightLineFileformat',
      \   'filetype': 'LightLineFiletype',
      \   'fileencoding': 'LightLineFileencoding',
      \   'mode': 'LightLineMode',
      \   'fugitive': 'LightLineFugitive',
      \   'ctrlpmark': 'CtrlPMark',
      \ },
      \ }

function! LightLineModified()
  if &filetype == "help"
    return ""
  elseif &modified
    return "+"
  elseif &modifiable
    return ""
  else
    return ""
  endif
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! LightLineInfo()
  return winwidth(0) > 60 ? printf("%3d:%-2d", line('.'), col('.')) : ''
endfunction

function! LightLinePercent()
  return &ft =~? 'vimfiler' ? '' : (100 * line('.') / line('$')) . '%'
endfunction

function! LightLineFugitive()
  return exists('*fugitive#head') ? fugitive#head() : ''
endfunction

function! LightLineGo()
  return exists('*go#statusline#Show') ? go#statusline#Show() : ''
endfunction

function! LightLineMode()
  let fname = expand('%:t')
  return fname == 'ControlP' ? 'CtrlP' :
        \ &ft == 'vimfiler' ? 'VimFiler' :
        \ winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! LightLineFilename()
  let fname = expand('%:t')
  if mode() == 't'
    return ''
  endif

  return fname == 'ControlP' ? g:lightline.ctrlp_item :
        \ &ft == 'vimfiler' ? vimfiler#get_status_string() :
        \ ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ ('' != fname ? fname : '[No Name]')
endfunction

function! LightLineReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! CtrlPMark()
  if expand('%:t') =~ 'ControlP'
    call lightline#link('iR'[g:lightline.ctrlp_regex])
    return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
          \ , g:lightline.ctrlp_next], 0)
  else
    return ''
  endif
endfunction

let g:ctrlp_status_func = {
      \ 'main': 'CtrlPStatusFunc_1',
      \ 'prog': 'CtrlPStatusFunc_2',
      \ }

function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
  let g:lightline.ctrlp_regex = a:regex
  let g:lightline.ctrlp_prev = a:prev
  let g:lightline.ctrlp_item = a:item
  let g:lightline.ctrlp_next = a:next
  return lightline#statusline(0)
endfunction

function! CtrlPStatusFunc_2(str)
  return lightline#statusline(0)
endfunction
" vim-ariline
"neocomplete
let g:neocomplete#enable_at_startup = 1
syntax on                   " Enable syntax highlighting
set ai                      " when in doubt return, in edit mode, indents to the current indentation level
set smartindent             " lines ending in a { indent. lines ending in a } outdent
set backspace=2             " backspace will be able to continue past the current line onto the previous line
set backspace=indent,eol,start "backspace works in insert mode
set encoding=utf-8 "windows, I'm looking at you
"set colorcolumn=80          " highlight the 80th column
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
"if using fatik/molokai, try to enable 256 colors
let g:rehash256 = 1
colorscheme hybrid_reverse

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

