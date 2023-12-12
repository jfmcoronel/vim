"
" Plugins
"
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'NLKNguyen/papercolor-theme'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive'

Plug 'jfmcoronel/vim-polyglot'
Plug 'jfmcoronel/vim-mipssyntax'
Plug 'jfmcoronel/vim-sdq-highlight'

if has('nvim')
  Plug 'sainnhe/gruvbox-material'
  Plug 'williamboman/mason.nvim'
  Plug 'williamboman/mason-lspconfig.nvim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-tree/nvim-web-devicons'
  "Plug 'glepnir/dashboard-nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'MunifTanjim/nui.nvim'
  Plug 'nvim-neo-tree/neo-tree.nvim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'rcarriga/nvim-notify'
  Plug 'phaazon/hop.nvim'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'willothy/nvim-cokeline'
  Plug 'sbdchd/neoformat'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'kevinhwang91/nvim-bqf'
  Plug 'stevearc/aerial.nvim'
  Plug 'L3MON4D3/LuaSnip', {'tag': 'v<CurrentMajor>.*', 'do': 'make install_jsregexp'}
  Plug 'saadparwaiz1/cmp_luasnip'
  Plug 'rafamadriz/friendly-snippets'
  Plug 'famiu/bufdelete.nvim'
  Plug 'mhartington/formatter.nvim'

  function! UpdateRemotePlugins(...)
    " Needed to refresh runtime files
    let &rtp=&rtp
    UpdateRemotePlugins
  endfunction
  Plug 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }
  "Plug 'roxma/nvim-yarp'
  "Plug 'roxma/vim-hug-neovim-rpc'

  " Dark colorschemes
  Plug 'sainnhe/sonokai'
  Plug 'sainnhe/everforest'
  Plug 'catppuccin/nvim'
  Plug 'marko-cerovac/material.nvim'
  Plug 'rose-pine/neovim'
  " Light colorschemes
  Plug 'sainnhe/edge'
  Plug 'EdenEast/nightfox.nvim'
  "Plug 'rebelot/kanagawa.nvim'
  "Plug 'shaunsingh/nord.nvim'
  "Plug 'navarasu/onedark.nvim'
  "Plug 'olimorris/onedarkpro.nvim'
  "Plug 'tanvirtin/monokai.nvim'
else
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'haya14busa/incsearch.vim'
  Plug 'haya14busa/incsearch-easymotion.vim'
  Plug 'lifepillar/vim-gruvbox8'
  Plug 'bitc/vim-bad-whitespace'
  Plug 'preservim/nerdtree'
  Plug 'unblevable/quick-scope'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'Chiel92/vim-autoformat'
  Plug 'tpope/vim-sleuth'
  Plug 'airblade/vim-gitgutter'
  Plug 'Yggdroot/indentLine'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'ocaml/vim-ocaml'
  Plug 'elixir-editors/vim-elixir'
  Plug 'Ryanoasis/vim-devicons'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'jxnblk/vim-mdx-js'
  Plug 'MaxMEllon/vim-jsx-pretty'
  Plug 'ivyl/vim-bling'
  Plug 'rachitnigam/pyret-lang.vim'
  Plug 'rescript-lang/vim-rescript'
endif

call plug#end()

"
" Common settings
"
set number
set expandtab
set termguicolors
set ignorecase
set background=dark
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
"set wildmenu
"set wildmode=longest:full,longest

"
" Common bindings
"
let mapleader = " "
nmap <Leader><Space> :noh<cr>
noremap <silent><esc> <esc>:noh<CR><esc>
nmap <Leader>` mpggVG"+y`p
nmap <Leader>P :set paste!<CR>
nmap <Leader>LL :let &background = ( &background == "dark"? "light" : "dark" )<CR>
iabbrev @1@ ⓵
iabbrev @2@ ⓶
iabbrev @3@ ⓷
iabbrev @4@ ⓸
iabbrev @5@ ⓹
iabbrev @6@ ⓺
iabbrev @7@ ⓻
iabbrev @8@ ⓼
iabbrev @9@ ⓽
vmap +/ <Leader>c 
nmap +/ <Leader>c 

"
" Common commands
"
:command MyVimConfig :e $MYVIMRC
:command MyVimReload :source $MYVIMRC
:command Mips set ft=mips

"
" fzf.vim
"
let g:fzf_layout = { 'down': '40%' }
let g:fzf_preview_window = []

if !has('nvim')
  "
  " Fallback config for regular vim
  "

  set nocompatible

  " Miscellaneous
  colorscheme gruvbox8
  filetype plugin on
  syntax on
  set hlsearch
  set smartindent
  set ignorecase
  set wildignorecase
  set smartcase
  set incsearch
  set cursorline
  set backspace=indent,eol,start

  " NERDTree
  autocmd vimenter * if !argc() | NERDTree | endif
  let NERDTreeQuitOnOpen = 1
  let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

  " Color scheme
  let g:rehash256 = 1
  set t_Co=256

  "" General buffer settings
  set hidden

  " vim-airline
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_powerline_fonts = 1
  let g:airline_theme='base16_gruvbox_dark_hard'
  let g:airline#extensions#syntastic#enabled = 1
  set laststatus=2

  set tabstop=2
  set softtabstop=2
  set shiftwidth=2
  set smarttab
  set autoindent
  set fileformat=unix

  let python_highlight_all=1
  syntax on

  " Standards
  set encoding=utf-8
  set conceallevel=0

  " Case-insensitive insert mode
  set smartcase
  au InsertEnter * set noignorecase
  au InsertLeave * set ignorecase

  " Case-insensitive command mode
  augroup dynamic_smartcase
    autocmd!
    autocmd CmdLineEnter : set nosmartcase
    autocmd CmdLineLeave : set smartcase
  augroup END

  "Airline
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#buffer_idx_mode = 1
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
  nmap <C-p> :Files<CR>

  " Others
  set showcmd

  let g:tex_conceal = ''

  let g:coc_filetype_map = {
    \ 'elm': 'elm',
    \ }

  " CoC
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

  nmap <leader>f <Plug>(coc-format)
  nmap <leader>r <Plug>(coc-rename)
  nmap <leader><CR> <Plug>(coc-definition)
  nmap <leader>w <Plug>(coc-references)
  nmap <leader>[ <Plug>(coc-diagnostic-prev)
  nmap <leader>] <Plug>(coc-diagnostic-next)

  "nmap <leader>a <Plug>(coc-codeaction-refactor)
  "xmap <leader>a  <Plug>(coc-codeaction-refactor-selected)
  nmap <leader>a <Plug>(coc-codeaction)
  xmap <leader>a <Plug>(coc-codeaction-selected)
  nmap <leader>c <Plug>(coc-references)
  inoremap <silent><expr> <c-space> coc#refresh()
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  autocmd CursorHold * silent call CocActionAsync('highlight')
  autocmd User CocStatusChange redraws

  " https://superuser.com/questions/1734914/neovim-coc-nvim-enter-key-doesnt-work-to-autocomplete
  " https://www.reddit.com/r/neovim/comments/wqepw0/coc_completion_confirm_not_working_with_most/
  "inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#insert() : "\<CR>"
  "
  "inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#insert() : "\<Tab>"
  "inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

  nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

  command! -nargs=0 Prettier :CocCommand prettier.formatFile

  nnoremap <silent> <Leader>h :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

  "Python
  :command Pyimport CocCommand pyright.organizeimports
  autocmd BufWritePre *.py :silent call CocAction('runCommand', 'pyright.organizeimports')

  "
  " vim-easymotion
  "
  let g:EasyMotion_smartcase = 1
  let g:EasyMotion_do_mapping = 0

  function! s:incsearch_config(...) abort
    return incsearch#util#deepextend(deepcopy({
    \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
    \   'keymap': {
    \     "\<CR>": '<Over>(easymotion)'
    \   },
    \   'is_expr': 0
    \ }), get(a:, 1, {}))
  endfunction

  function QuickFind()
    " Undocumented call for easymotion-sn
    call EasyMotion#S(-1,0,2)

    " https://stackoverflow.com/questions/22798473/vim-how-to-turn-off-search-highlight-after-timeout-x-seconds
    " https://stackoverflow.com/questions/50234309/vim-execute-nohlsearch-not-working-in-function
    call feedkeys( ":nohlsearch\<CR>" )
  endfunction

  " nerd-commentary
  let g:NERDDefaultAlign = 'left'

  " vim-gitgutter
  let g:gitgutter_map_keys=0
  nmap [c <Plug>(GitGutterPrevHunk)
  nmap ]c <Plug>(GitGutterNextHunk)
  nmap <Leader>L :execute ( g:colors_name == "gruvbox8" ? "colorscheme PaperColor" : "colorscheme gruvbox8" ) <CR>
  map \ :call QuickFind()<CR>
  nnoremap <C-X> :bdelete<CR>

else
  "
  " nvim-specific config
  "
  colorscheme gruvbox-material
  let g:python3_host_prog = expand('~/.pyenv/shims/python3')

  nmap <Leader>L :execute ( g:colors_name == "gruvbox-material" ? "colorscheme edge" : "colorscheme gruvbox-material" ) <CR>
  map \ :HopPattern<CR>
  nmap <leader>1 <Plug>(cokeline-focus-1)
  nmap <leader>2 <Plug>(cokeline-focus-2)
  nmap <leader>3 <Plug>(cokeline-focus-3)
  nmap <leader>4 <Plug>(cokeline-focus-4)
  nmap <leader>5 <Plug>(cokeline-focus-5)
  nmap <leader>6 <Plug>(cokeline-focus-6)
  nmap <leader>7 <Plug>(cokeline-focus-7)
  nmap <leader>8 <Plug>(cokeline-focus-8)
  nmap <leader>9 <Plug>(cokeline-focus-9)
  nmap <leader>f :Neoformat<CR>
  autocmd FileType fsharp nnoremap <leader>f :Format<CR>
  nmap <C-p> :Telescope find_files<CR>
  nnoremap <C-X> :Bdelete<CR>

  autocmd VimEnter * call s:setup_plugins()
  function! s:setup_plugins() abort
    :delcommand PlenaryBustedDirectory
    :delcommand PlenaryBustedFile

lua<<EOF
    --require'dashboard'.setup {
    --  theme = 'hyper',
    --  config = {
    --    shortcut = {
    --      { desc = ' Update', group = '@property', action = 'Lazy update', key = 'u' },
    --      {
    --        icon = ' ',
    --        icon_hl = '@variable',
    --        desc = 'Files',
    --        group = 'Label',
    --        action = ':NeoTreeFocus',
    --        key = 'f',
    --      },
    --      {
    --        desc = ' Apps',
    --        group = 'DiagnosticHint',
    --        action = 'Telescope app',
    --        key = 'a',
    --      },
    --      {
    --        desc = ' dotfiles',
    --        group = 'Number',
    --        action = 'Telescope dotfiles',
    --        key = 'd',
    --      },
    --    },
    --  },
    --}
    require'mason.api.command'
    require"mason".setup {}
    require"mason-lspconfig".setup {}
    require"neo-tree".setup({
      close_if_last_window = false,
    })
    require'lualine'.setup {}
    require'hop'.setup {}
    require("luasnip.loaders.from_vscode").lazy_load()
    require'telescope'.setup{
      defaults = {
        mappings = {
          ["i"] = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
          }
        }
      },
    }
    require('aerial').setup({
      open_automatic = true,
      on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        --vim.cmd "AerialOpen!"
        vim.keymap.set('n', '<Leader>k', '<cmd>AerialPrev<CR>', {buffer = bufnr})
        vim.keymap.set('n', '<Leader>j', '<cmd>AerialNext<CR>', {buffer = bufnr})
        vim.keymap.set('n', '<Leader>o', '<cmd>AerialToggle!<CR>', {buffer = bufnr})
      end,
    })

    local green = vim.g.terminal_color_2
    local yellow = vim.g.terminal_color_3

    require('cokeline').setup({
      components = {
        {
          text = '｜',
          fg = function(buffer)
            return
              buffer.is_modified and yellow or green
          end
        },
        {
          text = function(buffer) return buffer.devicon.icon .. ' ' end,
          fg = function(buffer) return buffer.devicon.color end,
        },
        {
          text = function(buffer) return buffer.index .. ': ' end,
        },
        {
          text = function(buffer) if buffer.is_modified then return '• ' else return '' end end,
        },
        {
          text = function(buffer) return buffer.unique_prefix end,
          style = 'italic',
        },
        {
          text = function(buffer) return buffer.filename .. ' ' end,
          style = function(buffer) return buffer.is_focused and 'bold' or nil end,
        },
        {
          text = ' ',
        },
      },
    })

    local util = require "formatter.util"
    
    require("formatter").setup {
      logging = true,
      log_level = vim.log.levels.WARN,
      filetype = {
        fsharp = {
          (function()
            return {
              exe = "fantomas",
              args = {
                util.escape_path(util.get_current_buffer_file_path()),
              },
            }
          end)
        },
    
        ["*"] = {
          require("formatter.filetypes.any").remove_trailing_whitespace
        }
      }
    }

    vim.notify = require("notify")
    vim.notify.setup {
      render = 'compact'
    }

    local lspconfig = require('lspconfig')
    lspconfig.clangd.setup {}
    lspconfig.gleam.setup {}
    lspconfig.pyright.setup {}
    lspconfig.ruff_lsp.setup {}
    lspconfig.tsserver.setup {}
    lspconfig.rust_analyzer.setup {
      -- Server-specific settings. See `:help lspconfig-setup`
      settings = {
        ['rust-analyzer'] = {},
      },
    }
    lspconfig.r_language_server.setup {}
    lspconfig.fsautocomplete.setup{}

    local bufopts = { noremap=true, silent=true, buffer=bufnr }
    vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '<Leader>[', vim.diagnostic.goto_prev)
    vim.keymap.set('n', '<Leader>]', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<Leader>r', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<Leader>c', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<Leader><CR>', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', '<Leader>a', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)

    --vim.api.nvim_create_autocmd('LspAttach', {
    --  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    --  callback = function(ev)
    --    local opts = { buffer = ev.buf }

    --    vim.keymap.set('n', '<Leader>f', function()
    --      vim.lsp.buf.format { async = true }
    --    end, opts)

    --  end,
    --})

    local cmp = require'cmp'
    local luasnip = require'luasnip'

    local has_words_before = function()
      local line = vim.api.nvim_get_current_line()
      local cursor = vim.api.nvim_win_get_cursor(0)

      if string.sub(line, cursor[2] - 1, cursor[2]) == " " then
        return false
      end

      if string.sub(line, cursor[2], cursor[2] + 1) == " " then
        return false
      end

      return (vim.api.nvim_buf_get_lines(0, cursor[1] - 1, cursor[1], true)[1] or ''):sub(cursor[2], cursor[2]):match('%s') 
    end

    cmp.setup({
      snippet = {
        expand = function(args)
          -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
          -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
      },
      window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        -- { name = 'vsnip' }, -- For vsnip users.
        { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
      }, {
        { name = 'buffer' },
      })
    })

    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    require('lspconfig')['pyright'].setup {
      capabilities = capabilities,
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "strict"
          }
        },
      },
    }
    require('lspconfig')['tsserver'].setup {
      capabilities = capabilities
    }
    require('lspconfig')['rust_analyzer'].setup {
      capabilities = capabilities
    }
    require('lspconfig')['r_language_server'].setup {
      capabilities = capabilities
    }
EOF
  endfunction

  call wilder#setup({'modes': [':', '/', '?']})
  call wilder#set_option('pipeline', [
        \   wilder#branch(
        \     wilder#cmdline_pipeline({
        \       'language': 'python',
        \       'fuzzy': 1,
        \     }),
        \     wilder#python_search_pipeline({
        \       'pattern': wilder#python_fuzzy_pattern(),
        \       'sorter': wilder#python_difflib_sorter(),
        \       'engine': 're',
        \     }),
        \   ),
        \ ])

endif
