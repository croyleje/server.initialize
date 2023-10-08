syntax enable
set number
set smarttab
set smartindent
set autoindent
set relativenumber
set scrolloff=5
set tabstop=4
set softtabstop=4
set shiftwidth=4
set backspace=indent,eol,start

set ruler
set splitright
set splitbelow
set cursorline
set cursorlineopt=line,number
set cursorcolumn
set showcmd

set hlsearch
set incsearch
set ignorecase
set smartcase

set hidden

set wildmode=longest,list,full
"set wildmode=longest:full,full
set wildmenu

" remap tab to cycle completions on server side vim
inoremap <Tab> <C-n>
inoremap <S-Tab> <C-p>
" remap return to select completion
inoremap <expr> <cr> ((pumvisible())?("\<C-y>"):("\<cr>"))
" escape completion with <Esc> and enter insert mode
inoremap <expr> <Esc> ((pumvisible())?("\<C-e>"):("\<Esc>"))

hi CursorLine NONE
hi CursorLineNr NONE
hi CursorLine ctermbg=black
hi CursorLineNr ctermbg=black


" remap tab to cycle completions on server side vim
"inoremap <Tab> <C-n>
inoremap <expr> <Tab> ((pumvisible())?("\<C-n>"):("\<Tab>"))
inoremap <S-Tab> <C-p>
" remap return to select completion
inoremap <expr> <cr> ((pumvisible())?("\<C-y>"):("\<cr>"))
" escape completion with <Esc> and enter insert mode
inoremap <expr> <Esc> ((pumvisible())?("\<C-e>"):("\<Esc>"))
