syntax enable

let g:solarized_termcolors=256
"set t_Co=256 "better colours over ssh?

colorscheme solarized
set background=dark




map ] :wq <ENTER>
map \ :w <ENTER>


set smartindent

set expandtab
set shiftwidth=4
set softtabstop=4


set showmatch           " highlight matching [{()}]
set number              " show line numbers
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu

set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" tab navigation with arrow keys
map <Right> :tabnext<CR>
map <Left> :tabprevious<CR>

" tab navigation like firefox
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>


" jk is escape
inoremap jk <esc>





set foldenable          " enable folding
set foldmethod=indent
"set foldlevel=0
set foldlevelstart=10   " open most folds by default
set foldnestmax=4      " 10 nested fold max

"set foldmethod=syntax
"set foldnestmax=1
