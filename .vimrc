set nocompatible

" vim-plug
call plug#begin('~/.vim/plugged')

"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'tpope/vim-vinegar'
Plug 'preservim/nerdtree'
"if has('nvim')
"  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/defx.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif
Plug 'lifepillar/vim-gruvbox8'
Plug 'unblevable/quick-scope'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-sleuth'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'Yggdroot/indentLine'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'bitc/vim-bad-whitespace'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'ocaml/vim-ocaml'
Plug 'elixir-editors/vim-elixir'

Plug 'Ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'dense-analysis/ale'

Plug 'jxnblk/vim-mdx-js'
Plug 'MaxMEllon/vim-jsx-pretty'

Plug 'jfmcoronel/vim-mipssyntax'

"Plug 'nathangrigg/vim-beancount'
"

call plug#end()

let mapleader = " "

" Miscellaneous
set number
filetype plugin on
syntax on
set hlsearch
set smartindent
set ignorecase
set wildignorecase
set smartcase
set incsearch
set cursorline
"nnoremap <Space> :noh<cr>
nmap <Leader><Space> :noh<cr>
set noesckeys
set backspace=indent,eol,start


" NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
let NERDTreeQuitOnOpen = 1
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" Color scheme
let g:rehash256 = 1
set t_Co=256
set background=dark
colorscheme gruvbox8

" fzf.vim
nmap <C-p> :Files<CR>
let g:fzf_layout = { 'down': '40%' }
let g:fzf_preview_window = []

"" General buffer settings
set hidden

" vim-airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline#extensions#syntastic#enabled = 1
set laststatus=2
"nnoremap <Tab> :bnext<CR>
"nnoremap <S-Tab> :bprevious<CR>
nnoremap <C-X> :bdelete<CR>

" Line numbers
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set fileformat=unix

let python_highlight_all=1
syntax on

" Standards
set encoding=utf-8

" vim-easymotion
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 0

"nmap sl <Plug>(easymotion-fln)
"nmap sh <Plug>(easymotion-Fln)
"nmap sj <Plug>(easymotion-fn)
"nmap sk <Plug>(easymotion-Fn)
"nmap sw <Plug>(easymotion-w)
"nmap sW <Plug>(easymotion-W)
"nmap sb <Plug>(easymotion-b)
"nmap sB <Plug>(easymotion-B)
"nmap se <Plug>(easymotion-e)
"nmap sE <Plug>(easymotion-E)
"nmap sf <Plug>(easymotion-f)
"nmap sF <Plug>(easymotion-F)

"map <Leader>j <Plug>(incsearch-easymotion-/)
"map <Leader>k <Plug>(incsearch-easymotion-?)
map \ <Plug>(easymotion-sn)

set conceallevel=0

"" Elm
"let g:elm_format_autosave = 1
"let g:elm_setup_keybindings = 1
"
"" Reason
"let g:LanguageClient_serverCommands = {
"      \ 'reason': ['/Users/jfmcoronel/rls-macos/reason-language-server']
"      \ }

" vim-hardmode
"let g:hardtime_default_on = 1

" Case-insensitive insert mode
set smartcase
au InsertEnter * set noignorecase
au InsertLeave * set ignorecase
"
" Case-insensitive command mode
augroup dynamic_smartcase
  autocmd!
  autocmd CmdLineEnter : set nosmartcase
  autocmd CmdLineLeave : set smartcase
augroup END

" nerd-commentary
let g:NERDDefaultAlign = 'left'
vmap +/ <Leader>c 
nmap +/ <Leader>c 

" vim-gitgutter
let g:gitgutter_map_keys=0
nmap [c <Plug>(GitGutterPrevHunk)
nmap ]c <Plug>(GitGutterNextHunk)

function! s:incsearch_config(...) abort
  return incsearch#util#deepextend(deepcopy({
  \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
  \   'keymap': {
  \     "\<CR>": '<Over>(easymotion)'
  \   },
  \   'is_expr': 0
  \ }), get(a:, 1, {}))
endfunction

nmap <Leader>P :set paste!<CR>

" CoC
"command! -nargs=0 Prettier :CocCommand prettier.formatFile
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"Airline
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#tab_nr_type = 1 " tab number
"let g:airline#extensions#tabline#show_tab_nr = 1
"let g:airline#extensions#tabline#formatter = 'default'
"let g:airline#extensions#tabline#buffer_nr_show = 1
"let g:airline#extensions#tabline#fnametruncate = 16
"let g:airline#extensions#tabline#fnamecollapse = 2
let g:airline#extensions#tabline#buffer_idx_mode = 1
"let g:airline#extensions#tabline#fnamemod = ':t'
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab0

nmap <Leader>f <Plug>(coc-format)
nmap <Leader>r <Plug>(coc-rename)
nmap <Leader><CR> <Plug>(coc-definition)
nmap <Leader>w <Plug>(coc-references)
nmap <Leader>[ <Plug>(coc-diagnostic-prev)
nmap <Leader>] <Plug>(coc-diagnostic-next)
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
autocmd CursorHold * silent call CocActionAsync('highlight')

command! -nargs=0 Prettier :CocCommand prettier.formatFile
"
nnoremap <silent> <Leader>h :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Vim
:command VimConfig :e $MYVIMRC
:command VimReload :source $MYVIMRC

" MIPS
:command Mips set ft=mips

" ALE
let g:ale_virtualenv_dir_names = []

"Python
:command Pyimport CocCommand pyright.organizeimports

" OCaml
"let g:no_ocaml_maps = 1
"" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
"let s:opam_share_dir = system("opam config var share")
"let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

"let s:opam_configuration = {}

"function! OpamConfOcpIndent()
"  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
"endfunction
"let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

"function! OpamConfOcpIndex()
"  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
"endfunction
"let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

"function! OpamConfMerlin()
"  let l:dir = s:opam_share_dir . "/merlin/vim"
"  execute "set rtp+=" . l:dir
"endfunction
"let s:opam_configuration['merlin'] = function('OpamConfMerlin')

"let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
"let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
"let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
"for tool in s:opam_packages
"  " Respect package order (merlin should be after ocp-index)
"  if count(s:opam_available_tools, tool) > 0
"    call s:opam_configuration[tool]()
"  endif
"endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line


"vmap <Leader>f <Plug>(coc-format)
"nmap <Leader>f <Plug>(coc-format)

autocmd User CocStatusChange redraws

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

iabbrev @1@ ⓵
iabbrev @2@ ⓶
iabbrev @3@ ⓷
iabbrev @4@ ⓸
iabbrev @5@ ⓹
iabbrev @6@ ⓺
iabbrev @7@ ⓻
iabbrev @8@ ⓼
iabbrev @9@ ⓽
