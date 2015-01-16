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

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

set tabstop=4
set shiftwidth=4

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
