" Fish doesn't play all that well with others
set shell=/bin/bash

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "\<Space>"

" =============================================================================
" # PLUGINS
" =============================================================================
" Load vundle
set nocompatible
filetype off
call plug#begin()
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'APZelos/blamer.nvim'
Plug 'Yggdroot/indentLine'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'leafgarland/typescript-vim', {'for': ['typescript']}
Plug 'pangloss/vim-javascript', {'for': ['javascript']}
Plug 'mhinz/vim-signify'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'editorconfig/editorconfig-vim'
Plug 'mbbill/undotree'
Plug 'dhruvasagar/vim-table-mode' , { 'for': ['yaml', 'makedown'] }
Plug 'skywind3000/asynctasks.vim'
Plug 'skywind3000/asyncrun.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'Yggdroot/hiPairs'
" Semantic language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" On-demand lazy load
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'tpope/vim-projectionist'
Plug 'honza/vim-snippets'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> [e <Plug>(coc-diagnostic-prev-error)
nmap <silent> ]e <Plug>(coc-diagnostic-next-error)

" hunk jumping
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gs :split<CR><Plug>(coc-definition)
nmap <silent> gv :vsplit<CR><Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>


" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)



" Use K to show documentation in preview window.
noremap <silent> K :call <SID>show_documentation()<CR>

" Use t to translate current word
" popup
nmap T <Plug>(coc-translator-p)
vmap T <Plug>(coc-translator-pv)


" coc-explorer mapping
nmap <silent> <leader>ft :CocCommand explorer<CR>

" test current
nmap <silent> <leader>tt :AsyncTask current-test<CR>


" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)


command! -bang -nargs=* FindCurrentWord
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(expand('<cword>')), 0)

" search current word
noremap <silent> gw :FindCurrentWord<CR>

" async task
let g:asynctasks_term_focus=0
let g:asynctasks_term_reuse=1
let g:asynctasks_term_pos = 'bottom'

" todo
noremap <silent> <leader>td :Rg TODO<CR>

" undotree
noremap <silent> <leader>ut :UndotreeToggle<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)


let g:coc_global_extensions = ['coc-tasks', 'coc-snippets']


let g:table_mode_corner='|'

let g:lightline = {
      \'colorscheme': 'one',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'absolutepath', 'modified'] 
      \           ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \ },
      \}

" Enables blamer on (neo)vim startup.
let g:blamer_enabled = 1

" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

 " Mappings using CoCList:
" Show all diagnostics.
noremap <leader>l :<C-u>CocList<cr>

noremap <silent> <leader>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
noremap <silent> <leader>e  :<C-u>CocList extensions<cr>
" Show commands.
noremap <silent> <leader>c  :<C-u>CocList commands<cr>
" Show commands.
noremap <silent> <leader>ol :<C-u>CocList outline<cr>


vmap <leader>f  <Plug>(coc-format-selected)
noremap <leader>f  <Plug>(coc-format-selected)



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" Fast saving
noremap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif



if has("nvim")
  set guicursor=
endif


"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes


" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif


" Add a bit extra margin to the left
set foldcolumn=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 

" Enable 256 colors palette in Gnome Terminal
set t_Co=256


" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set colorcolumn=80 " and give me a colored column
set showcmd " Show (partial) command in status line.
set relativenumber " Relative line numbers
set number " Also show current absolute line


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <silent> <C-W>\ <C-W>v
map <silent> <C-W>- <C-W>s

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>
noremap <C-p> :Files<CR>
map <leader>q :q<cr>
map <leader>qa :qa<cr>


inoremap <C-j> <Esc>

set clipboard=unnamedplus

" search tools
if executable('ag')
	set grepprg=ag\ --nogroup\ --nocolor
endif

if executable('rg')
	set grepprg=rg\ --no-heading\ --vimgrep
	set grepformat=%f:%l:%c:%m
endif

" Enable persistent undo so that undo history persists across vim sessions
set undofile
set undodir=~/.vim/undo


noremap j gj
noremap k gk


colorscheme gruvbox 
set background=dark
hi Normal ctermbg=NONE guibg=NONE


" language config
" disable vim-go :GoDef short cut (gd) this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

" terminal shell
let g:terminal_shell = "/usr/bin/fish"

" Define prefix dictionary
let g:maplocalleader = ','
noremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
noremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

" asyncrun 
noremap <leader>fr :AsyncTask file-run<CR>
noremap <leader>ff :AsyncTask file-format<CR>
"buff list
noremap <leader>bb  :Buffers<CR>  
"Start page
noremap <leader>st :Startify<CR>
noremap <leader>tm :MarkdownPreviewToggle<CR>


"Start page
noremap <leader><leader> :A<cr>

let g:hiPairs_enable_matchParen = 0

" Fugitive Conflict Resolution
nnoremap <leader>gd :Gvdiffsplit!<CR>
nnoremap gdh :diffget //2<CR>
