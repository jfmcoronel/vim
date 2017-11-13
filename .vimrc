" fzf
set rtp+=/usr/local/opt/fzf

" Pathogen
filetype off
call pathogen#incubate()
call pathogen#helptags()

" Miscellaneous
set number
filetype indent plugin on
syntax on
set hlsearch
set autoindent
set ignorecase
set smartcase
set incsearch
set cursorline
set foldmethod=indent
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap <Space> :noh<cr>
set noesckeys

" NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
let NERDTreeQuitOnOpen = 1

" Rainbow Parentheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
nnoremap <Leader>r :RainbowParenthesesToggle<cr>

" Color scheme
let g:rehash256 = 1
set t_Co=256
set background=dark
colorscheme jellybeans

" Ctrl-P
let g:ctrlp_show_hidden = 1
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

" indentLine
let g:indentLine_color_term = 239

set backspace=indent,eol,start

" fzf.vim
nmap ,p :Files<CR>
nmap ,o :Buffers<CR>
"let g:fzf_action = { 'enter': 'tabedit' }
"nmap <Leader>t :Tags<CR>

"" General buffer settings
set hidden
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'
let g:airline#extensions#syntastic#enabled = 1
set laststatus=2
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <C-X> :bdelete<CR>

" Jellybeans
let g:jellybeans_use_term_italics = 1
