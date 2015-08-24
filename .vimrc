" Pathogen
filetype off
call pathogen#incubate()
call pathogen#helptags()

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

" NERDTree
autocmd vimenter * if !argc() | NERDTree | endif	" open NERDTree if Vim is executed without opening a file
let NERDTreeQuitOnOpen = 1							" close NERDTree after opening file

" EasyMotion
" let g:EasyMotion_leader_key = ','
" nmap h ,F
" vmap h ,F
" nmap l ,f
" vmap l ,f
" nmap k ,k
" vmap k ,k
" nmap j ,j
" vmap j ,j

" Powerline
set encoding=utf-8
set laststatus=2
let g:Powerline_symbols="fancy"

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

" Vim Session
let g:session_autosave = 'no'

" Molokai
let g:rehash256 = 1
set t_Co=256
set background=dark
colorscheme molokai

" Timeout
"set timeoutlen=1000 ttimeoutlen=0

set noesckeys

" Ctrl-P
let g:ctrlp_show_hidden = 1
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

" neocomplete
let g:neocomplete#enable_at_startup = 1 
let g:neocomplete#enable_smart_case = 1
set completeopt-=preview

" indentLine
let g:indentLine_color_term = 239
