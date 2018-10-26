set nocompatible " be iMproved

" Set leader key to create namespace for custom shortcuts
nnoremap <Space> "\"    " Remove the default action of space
let mapleader = " "
let g:mapleader = " "
set timeoutlen=3000 " Set timeout for key mappings (milliseconds)

"
" Keymappings
"

" Setting key combination to keyboard output
execute "set <A-j>=\ej"
execute "set <A-k>=\ek"
execute "set <A-h>=\eh"
execute "set <A-l>=\el"

" Navigation
nnoremap <C-j> :tabnext<CR>
nnoremap <C-k> :tabprevious<CR>
nnoremap <C-l> :bn<CR>
nnoremap <C-h> :bp<CR>
nnoremap <silent> <A-j> :wincmd j<CR>
nnoremap <silent> <A-k> :wincmd k<CR>
nnoremap <silent> <A-h> :wincmd h<CR>
nnoremap <silent> <A-l> :wincmd l<CR>

" Jump cursor up and down page
nnoremap <C-u> 20k
vnoremap <C-u> 20k
nnoremap <C-d> 20j
vnoremap <C-d> 20j

nnoremap <leader>sh :nohlsearch<Bar>:echo<CR>
" Fast closing for buffer
nnoremap <F13> :bd<CR>

" Window resizing
nnoremap <silent> <leader>0 :resize +2<CR>
nnoremap <silent> <leader>9 :resize -5<CR>
nnoremap <silent> <leader>= :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

" Paste mode for inserting text from pasting
nnoremap <leader>p :set invpaste paste?<CR>     " In normal mode, invert the
                                                " 'paste' option and show value
                                                " of current option
set pastetoggle=<F2>    " Maps F2, in insert mode, to toggle 'paste' on or off
set showmode            " Displays, in insert mode, whether 'paste' is turned on

"inoremap <S-Tab> <C-d>     " Mapping will not work because
                            " Valloric/YouCompleteMe uses <S-Tab>


"
" Appearance
"

syntax on
set background=dark
colorscheme desert
set colorcolumn=81,101
highlight Visual ctermbg=LightGray ctermfg=DarkGray
highlight colorcolumn ctermbg=Gray ctermfg=Black guibg=Gray guifg=Black
highlight MatchParen ctermfg=White ctermbg=Gray
highlight IncSearch ctermbg=LightGray ctermfg=Red
highlight Search ctermbg=LightGray ctermfg=Red
set hlsearch " Highlight search results
"set ignorecase
set incsearch " Search as you type 
set number " Line numbers
set ruler " Show cursor's line and column number
"set guicursor=a:blinkon0

"
" Indentation
"

set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
set smarttab
set backspace=indent,eol,start
" autocmd BufNewFile,BufRead *.sol set formatoptions+=r

" File specific indentation rules
autocmd Filetype html setlocal shiftwidth=2 softtabstop=2
" Disable smart indenting for python (smart indenting affects python comments)
autocmd Filetype python setlocal nosmartindent

"
" General Functionality
"

set scrolloff=3 " Keep 3 lines between cursor and edge of screen
set hidden " Have edited buffers that aren't visible in a window
set modelines=0
set wildmenu
set wildmode=longest:full
set wrap
set linebreak " Wrap line on an actual word boundary rather than in the middle

"" Persistent undo
"if !isdirectory($HOME."/.dotfiles/vim/undodir")
"    call mkdir($HOME."/.dotfiles/vim/undodir", "p")
"endif
"set undodir=~/.vim/undodir
"set undofile
"set undolevels=1000     " Maximum number of changes that can be undone
"set undoreload=10000    " Maximum number of lines to save for undo on a buffer
"                        " reload

"
" Gui specific
"

if has("gui_running")
    " Use option (alt) as a meta key. When on, option-key presses
    " are not interpreted, thus enabling bindings <A-...>
    set macmeta

    set guifont=Menlo\ Regular:h13
    set guioptions-=m   " Hide the menu bar so that alt-key does nothing
    "set winaltkeys=no  " Allow alt-key mappings to work
    "set guioptions+=a   " Automatic copy to clipboard on selection
    "set guioptions+=c   " Use console prompt
    "set mouse=a         " Set mouse to behave in command-line mode
endif

"
" For reading PDF files
" Usage: :Rpdf example.pdf
"
:command! -complete=file -nargs=1 Rpdf :r !pdftotext -nopgbrk <q-args> -
:command! -complete=file -nargs=1 Rpdfformat :r !pdftotext -nopgbrk <q-args> - |fmt -csw78

"
" Plugins
"

" Plugin management using junegunn/vim-plug
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/scrooloose/nerdcommenter'
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'https://github.com/Yggdroot/indentLine'
Plug 'https://github.com/scrooloose/syntastic'
Plug 'https://github.com/jeetsukumaran/vim-buffergator'
Plug 'https://github.com/elzr/vim-json'
"Plug 'https://github.com/tomlion/vim-solidity' " ethereum script language
call plug#end()

" Required for plugin support
"filetype plugin indent on "doesn't seem to be required anymore?

" Settings for vim-airline/vim-airline
set laststatus=2    " Always show a status line at the bottom of the window.
                    " Otherwise status line is not displayed
set ttimeoutlen=50 	" Set timeout for key codes (milliseconds)
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#checks = [ ]

" Settings for scrooloose/nerdtree
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

" Settings for ctrlpvim/ctrlp.vim
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_working_path_mode = 'wra'
let g:ctrlp_root_markers = ['.tern-project', '.project']
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules)$',
            \ 'file': '\v\.(exe|so|dll)$'
            \ }
let g:ctrlp_max_files = 0

" Settings for Yggdroot/indentLine
"let g:indentLine_char="|"
let g:indentLine_indentLevel=25
let g:indentLine_color_term=7   " DarkGray=8, Black=0, DarkBlue=4, DarkRed=1
nnoremap <silent> <leader>il :IndentLinesToggle<CR>

" Settings for scrooloose/syntastic
" Use :help syntastic
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args = '--ignore=W291,W293,W391,E501,E302,E303,E265'

" Settings for scrooloose/nerdcommenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = "left"
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace= 1
" Disable multi-line delimiters. This allows for dumb nesting that I prefer
let g:NERDCustomDelimiters = {
    \ 'javascript': {'left': '//'},
    \ 'solidity': {'left': '//'}
\ }

" Settings for jeetsukumaran/vim-buffergator
let g:buffergator_suppress_keymaps = 1
let g:buffergator_viewport_split_policy = "B"
let g:buffergator_hsplit_size = 20
let g:buffergator_show_full_directory_path = 0
let g:buffergator_display_regime = "filepath"
let g:buffergator_sort_regime = "filepath"
nnoremap <silent> <leader>bb :BuffergatorToggle<CR>
nnoremap <silent> <leader>bt :BuffergatorTabsToggle<CR>

" Settings for elzr/vim-json
let g:vim_json_syntax_conceal = 0
