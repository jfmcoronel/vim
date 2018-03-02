" fzf
set rtp+=/usr/local/opt/fzf

" Pathogen
filetype off
call pathogen#incubate()
call pathogen#helptags()

" Miscellaneous
set number
"filetype indent plugin on
syntax on
set hlsearch
set autoindent
set smartindent
set ignorecase
set smartcase
set incsearch
set cursorline
"set foldmethod=indent
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
nnoremap <Space> :noh<cr>
set noesckeys

" NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
let NERDTreeQuitOnOpen = 1

" Color scheme
let g:rehash256 = 1
set t_Co=256
set background=dark
colorscheme gruvbox

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
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"" General buffer settings
set hidden
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='gruvbox'
let g:airline#extensions#syntastic#enabled = 1
set laststatus=2
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
nnoremap <C-X> :bdelete<CR>

" Line numbers
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
