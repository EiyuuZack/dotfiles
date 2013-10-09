" Forget being compatible with good ol' vi
set nocompatible

" Manage plugins as bundles for easy install/remove/update
" pass a string argument to use another folder other than bundle
execute pathogen#infect()

" Colorscheme (terminal must support 256 colors)
" Drop gnome-terminal, urxvt is where's it's at
set t_Co=256
"colorscheme xoria256
"colorscheme mustang
colorscheme molokai
" this one will hurt your eyes... and it's a mac theme trolol
"colorscheme vividchalk

"change to a specialized colorscheme when entering vimdiff
if &diff
        colorscheme xoria256
endif

" Get that filetype stuff happening
filetype plugin indent on

" Turn on that syntax highlighting
syntax on

" Syntax coloring lines that are too long just slows down the world
set synmaxcol=2048

" By setting ‘hidden’ you’re telling Vim that it’s OK to have an
" unwritten buffer that’s no longer visible.
" If you’ve got 12 buffers and 2 windows then there are 10 buffers that
" aren’t visible and if you set ‘nohidden’ then that means that
" those 10 buffers must be written to disk. If they aren’t written to disk then
" they would have to be visible.
set hidden

" Don't update the display while executing macros
"set lazyredraw

" At least let yourself know what mode you're in
set showmode

" Enable enhanced command-line completion. Presumes you have compiled
" with +wildmenu.  See :help 'wildmenu'
set wildmenu
set wildmode=longest,list,full

" Set the search scan to wrap around the file
set wrapscan

" Make command line two lines high
set ch=2

" set visual bell -- I hate that damned beeping
set vb

" Allow backspacing over indent, eol, and the start of an insert
set backspace=2

" Set the status line the way I like it
set stl=%f\ %y%{'['.(&fenc==''?&enc:&fenc).']'}%m%r\ %l/%L\ %c\ #%n
" set stl=%f\ %y%{'['.(&fenc==''?&enc:&fenc).']'}%m%r\ %l/%L\ %c\ #%n\ [%b][0x%B] " with ASCII codes

" tell Vim to always put a status line in, even if there is only one
" window
set laststatus=2

" Hide the mouse pointer while typing
set mousehide

" Keep some stuff in the history
set history=100

" No backups, you should know what you're doing Zack
set nobackup
set nowritebackup

" These commands open folds
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo

" Set foldlevelstart to 1 to avoid
" completely folding newly opened files
set foldlevelstart=1

" Too many nested folds are annoying,
" put an end to it
set foldnestmax=2

" Set how the folds look
set foldtext=strpart(getline(v:foldstart),0,50).'\ ...\ '.substitute(getline(v:foldend),'^[\ #]*','','g').'\ '

" When the page starts to scroll, keep the cursor 8 lines from
" the top and 8 lines from the bottom
set scrolloff=8

" Allow the cursor to go in to 'invalid' places
"set virtualedit=all

" Number of spaces that a <Tab> in the file counts for
set tabstop=2

" Number of spaces to use for each step of (auto)indent
set shiftwidth=2

" Use the appropriate number of spaces to insert a <Tab>.
" Spaces are used in indents with the '>' and '<' commands
" and when 'autoindent' is on. To insert a real tab when
" 'expandtab' is on, use CTRL-V <Tab>
set expandtab

" When on, a <Tab> in front of a line inserts blanks
" according to 'shiftwidth'. 'tabstop' is used in other
" places. A <BS> will delete a 'shiftwidth' worth of space
" at the start of the line
"set smarttab
set softtabstop=2

" Display extra whitespace
" tabs as »· (might be displayed as spaces if expand tab is on)
" spaces as ·
" If you want to change color, trail and eol chars are SpecialKey
"set list listchars=tab:»·,trail:·

" Show (partial) command in status line
set showcmd

" Show line numbers
"set number

" Show relative line numbers
" This changes Vim’s line number column to display
" how far away each line is from the current one,
" instead of showing the absolute line number
"set relativenumber

" When a bracket is inserted, briefly jump to the matching
" one. The jump is only done if the match can be seen on the
" screen. The time to show the match can be set with 'matchtime'
set showmatch

" When there is a previous search pattern, highlight all its matches
set hlsearch

" Incrementally match the search
set incsearch

" Ignore case in search patterns
set ignorecase

" Override the 'ignorecase' option if the search pattern
" contains upper case characters
set smartcase

" Copy indent from current line when starting a new line
" (typing <CR> in Insert mode or when using the "o" or "O" command)
set autoindent

" Maximum width of text that is being inserted. A longer
" line will be broken after white space to get this width
set textwidth=80

" This is a sequence of letters which describes how
" automatic formatting is to be done.
"
" letter    meaning when present in 'formatoptions'
" ------    ---------------------------------------
" c         Auto-wrap comments using textwidth, inserting
"           the current comment leader automatically.
" q         Allow formatting of comments with "gq".
" r         Automatically insert the current comment leader
"           after hitting <Enter> in Insert mode.
" t         Auto-wrap text using textwidth (does not apply
"           to comments)
set formatoptions=c,q

" Show the line and column number of the cursor position, separated by a comma
" set ruler

" Open new horizontal split windows on the right instead of left
" and new vertical split windows bellow instead of above
set splitright
set splitbelow
"-----------------------------------------------------------------------------"
"     Useful tidbits/workarounds
"-----------------------------------------------------------------------------"

" Fold CSS files by bracket and also close them upon opening file
" no matter what foldlevel is set to globally
autocmd BufNewFile,BufRead *.css set fdm=marker fmr={,} fdl=0

" Also map { to add closing bracket two lines bellow and jump to
" middle line
"autocmd BufNewFile,BufRead *.css inoremap { {<CR>}<Esc>ko

" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window. Protect against
" screwing up folding when switching between windows.
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

autocmd FileType ruby setlocal foldnestmax=5

"-----------------------------------------------------------------------------"
"     REMEMBER, :verbose *map (imap, nnoremap, etc) IS YOUR BEST FRIEND!!!
"-----------------------------------------------------------------------------"
" Turn off search highlight until the next search
" useful once you've found what you were looking for
nmap <silent> ,l :noh<CR>

" Strip all trailing whitespace in the current file
nmap <silent> ,s  :%s/\s\+$//<CR>:let @/=''<CR>:echo 'All trailing whitespace stripped'<CR>

" Correct indentation on the whole file
" (be careful with commented methods and stuff)
nmap <silent> ,f ggVG=<Esc>

" Close all folds recursively then open firstlevel
nmap <silent> zM zMzo

" Sort all CSS properties alphabetically
" while keeping webkit and moz properties
" together with their CSS3 counterpart
" (must be nnoremap otherwise would expand j,V, etc...)
nnoremap <silent> ,c ?{<CR>jV/\v^\s*\}?$<CR>k:sort/\s*\(-\a*-\\|\)/<CR>:noh<CR>
"nnoremap <silent> ,c ?{<CR>jV/\v^\s*\}?$<CR>k:sort<CR>:noh<CR> completely alphabetical

" Smart way to move between windows
map <C-n> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Paste mode
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>

" Toggle NERDtree
nmap <silent> ,n :NERDTreeToggle<CR>


"-----------------------------------------------------------------------------"
"     PLUGINS
"-----------------------------------------------------------------------------"

" NERDtree configuration

" Specify which files the NERD tree should ignore
let NERDTreeIgnore=['\~$', '\.swp$', '\.svn$', '\.git$']

" Open bookmarks on startup
"let NERDTreeShowBookmarks=1

" Closes the tree window after opening a file
let NERDTreeQuitOnOpen=1

" LaTeX-suite configuration

" IMPORTANT -- grep will sometimes skip displaying the file name if you search in a
" single file. This will confuse LaTeX-suite. Set grep program to always
" generate a file-name
set grepprg=grep\ -nH\ $*

" OPTIONAL -- Starting with vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex'
let g:tex_flavor='latex'

" Set the default output of latex as pdf
let g:Tex_DefaultTargetFormat='pdf'

" Set default pdf viewer
let g:Tex_ViewRule_pdf='zathura'

" Ruby configuration

" Enable folds...
:let ruby_fold=1

" ...but not on comments
:let ruby_no_comment_fold=1
