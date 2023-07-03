set path=.,,**
set autochdir
set tags=./tags;/

set t_u7=

" set spelllang=en_us
" set spell
set hls is

" enable syntax highlighting
syntax on

" select case-insenitiv search (not default)
set ignorecase

" show cursor line and column in the status line
set ruler

" show matching brackets
set showmatch

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set number
set relativenumber
set numberwidth=4
set colorcolumn=80,120

let c_space_errors=1

" tab size
set tabstop=4
set shiftwidth=4

" don't create `filename~` backups
set nobackup

" don't create temp files
set noswapfile

" use Unicode
set encoding=utf-8

" errors flash screen rather than emit beep
set visualbell

" Indent new line the same as the preceding line
set smartindent

" statusline indicates insert or normal mode
set showmode showcmd

" http://vim.wikia.com/wiki/Searching
set hlsearch incsearch ignorecase smartcase

" As opposed to `wrap`
"set nowrap

" open new buffers without saving current modifications (buffer remains open)
set hidden

" http://stackoverflow.com/questions/9511253/how-to-effectively-use-vim-wildmenu
set wildmenu wildmode=list:longest,full

" StatusLine always visible, display full path
" http://learnvimscriptthehardway.stevelosh.com/chapters/17.html
set laststatus=2 statusline=%F

" Use system clipboard
" http://vim.wikia.com/wiki/Accessing_the_system_clipboard
set clipboard=unnamedplus

" Folding
" https://vim.fandom.com/wiki/Folding
" https://vim.fandom.com/wiki/All_folds_open_when_opening_a_file
" https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
set foldmethod=indent
set foldnestmax=1
set foldlevelstart=1

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf'
Plug 'vim-scripts/AutoComplPop'
Plug 'tpope/vim-fugitive'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'
Plug 'nordtheme/vim'
Plug 'mbbill/undotree'
Plug 'nvim-lua/plenary.nvim'
Plug 'tpope/vim-surround'

" Initialize plugin system
call plug#end()

colorscheme nord

" AutoComplPop settings
set completeopt=menuone
set shortmess+=c

if &term == "screen"
  set t_Co=256
endif

highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+$/


" Coc settings
" Some servers have issues with backup files, see #649.
set nowritebackup

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

let g:user_emmet_leader_key='<C-E>'

let mapleader=" "

" Fugitive
nnoremap <Leader>gb :Git blame<CR>

" My remaps
nnoremap <Leader>pe :Ex<CR>

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

nnoremap n nzzzv
nnoremap N Nzzzv

nnoremap <Leader>r :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
nnoremap <Leader>x :!chmod +x %<CR>

nnoremap <Leader>u :UndotreeToggle<CR>:UndotreeFocus<CR>

