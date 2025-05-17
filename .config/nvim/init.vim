set encoding=utf-8
scriptencoding utf-8

" f3rno64's personal vim/neovim config
"
" https://github.com/f3rno64/dotfiles

" {{{ set python3_host_prog to speed up load time

let g:python3_host_prog = '/usr/bin/python3'

" }}}
" {{{ plugin loading

" {{{ ensure plugin directory resolution

if has('nvim')
let s:plugin_dir_path = $HOME . '/.nvim-plugins'
else
let s:plugin_dir_path = $HOME . '/.vim-plugins'
endif

if !isdirectory(s:plugin_dir_path)
call mkdir(s:plugin_dir_path, 'p')
echo 'Created plugin directory: ' . s:plugin_dir_path
endif

" }}}

call plug#begin(s:plugin_dir_path)

" {{{ libs

Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'tpope/vim-repeat'
Plug 'google/vim-maktaba'
Plug 'Shougo/vimproc.vim', { 'do' : 'make' }

" }}}
" {{{ telescope

Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }
Plug 'nvim-telescope/telescope-ui-select.nvim'
Plug 'aznhe21/actions-preview.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', {
\   'do': join([
\     'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release',
\     'cmake --build build --config Release',
\     'cmake --install build --prefix build'
\   ], ' && ')
\ }

function! OpenPluginDirectory()

endfunction

" }}}
" {{{ treesitter

Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'm-demare/hlargs.nvim'
Plug 'windwp/nvim-ts-autotag'
Plug 'RRethy/nvim-treesitter-textsubjects'
Plug 'https://gitlab.com/HiPhish/rainbow-delimiters.nvim.git'

" }}}
" {{{ nvim-tree

Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

" }}}
" {{{ lsp

Plug 'neovim/nvim-lspconfig'
Plug 'reksar/nvim-lsp-python'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'RubixDev/mason-update-all'
Plug 'dnlhc/glance.nvim'
Plug 'pwntester/nvim-lsp'
Plug 'nvimtools/none-ls.nvim'

" }}}
" {{{ cmp

Plug 'petertriho/cmp-git'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'f3fora/cmp-spell'
Plug 'hrsh7th/cmp-emoji'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
Plug 'rasulomaroff/cmp-bufname'
Plug 'amarakon/nvim-cmp-buffer-lines'
Plug 'hrsh7th/cmp-nvim-lsp-document-symbol'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'JMarkin/cmp-diag-codes'
" Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'jcha0713/cmp-tw2css'
Plug 'hrsh7th/nvim-cmp'

" }}}
" {{{ snipppets

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" }}}
" {{{ tabline

" Plug 'romgrk/barbar.nvim'
Plug 'nanozuki/tabby.nvim'

" }}}
" {{{ javascript

Plug 'yuezk/vim-js'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'elzr/vim-json'
Plug 'leafgarland/typescript-vim'
Plug 'jason0x43/vim-js-indent'

Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/es.next.syntax.vim'
Plug 'Quramy/vim-js-pretty-template'

" }}}
" {{{ markdown

Plug 'SidOfc/mkdx'
Plug 'tadmccorkle/markdown.nvim'
Plug 'godlygeek/tabular'
Plug 'preservim/vim-markdown'
Plug 'tpope/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
Plug 'wallpants/github-preview.nvim'

" }}}
" {{{ tags

" Plug 'ludovicchabant/vim-gutentags'
" Plug 'skywind3000/gutentags_plus'

" }}}
" {{{ wiki

Plug 'powerman/vim-plugin-AnsiEsc', { 'on': 'AnsiEsc' }
Plug 'rbgrouleff/bclose.vim'
Plug 'mattn/calendar-vim'
Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
Plug 'f3rno/vimwiki-footnotes'

" }}}
" {{{ ui

Plug 'elpiloto/significant.nvim'

" }}}
" {{{  ai

Plug 'madox2/vim-ai'

" }}}
" {{{ other

" let g:polyglot_disabled = ['markdown']

Plug 'ActivityWatch/aw-watcher-vim'
Plug 'Exafunction/codeium.vim'
Plug 'dmmulroy/tsc.nvim'
Plug 'pmizio/typescript-tools.nvim'
Plug 'sbdchd/neoformat'
Plug 'dstein64/vim-startuptime'
Plug 'junegunn/goyo.vim'
Plug 'liangxianzhe/floating-input.nvim'
Plug 'danilamihailov/vim-tips-wiki'
Plug 'james1236/backseat.nvim'
Plug 'nvim-lua/lsp-status.nvim'
" Plug 'Exafunction/codeium.vim', { 'branch': 'main' }
Plug 'piersolenski/wtf.nvim'
" Plug 'codota/tabnine-nvim', { 'do': './dl_binaries.sh' }
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-emoji'
" Plug 'sheerun/vim-polyglot'
Plug 'sindrets/diffview.nvim'
Plug 'jghauser/follow-md-links.nvim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'tom-anders/telescope-vim-bookmarks.nvim'
Plug 'rhysd/accelerated-jk'
Plug 'dmmulroy/tsc.nvim'
" Plug 'rcarriga/nvim-notify'
Plug 'rafamadriz/friendly-snippets'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
Plug 'Pocco81/true-zen.nvim'
Plug 'nvim-focus/focus.nvim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'christoomey/vim-sort-motion'
Plug 'jbgutierrez/vim-better-comments'
" Plug 'fisadev/vim-isort'
Plug 'voldikss/vim-floaterm'
Plug 'vim-test/vim-test'
Plug 'David-Kunz/jester'
Plug 'AndrewRadev/switch.vim'
Plug 'joaohkfaria/vim-jest-snippets'
" Plug 'lcheylus/overlength.nvim'
Plug 'smoka7/hop.nvim', { 'branch': 'master' }
Plug 'anuvyklack/keymap-amend.nvim'
Plug 'okuuva/auto-save.nvim'
Plug 'declancm/cinnamon.nvim'
Plug 'abecodes/tabout.nvim'
Plug 'nguyenvukhang/nvim-toggler'
Plug 'linrongbin16/lsp-progress.nvim'
Plug 'roobert/search-replace.nvim'
Plug 'ray-x/lsp_signature.nvim'
Plug 'axelvc/template-string.nvim'
Plug 'sontungexpt/buffer-closer'
Plug 'jamestthompson3/sort-import.nvim'
" Plug 'github/copilot.vim'
Plug 'tomiis4/hypersonic.nvim'
Plug 'mvllow/modes.nvim'
Plug 'preservim/vim-wheel'
Plug 'vim-scripts/ScrollColors'
Plug 'preservim/vim-lexical'
Plug 'preservim/vim-thematic'
Plug 'ralismark/opsort.vim'
Plug 'dnlhc/glance.nvim'
Plug 'wincent/terminus'
Plug 'stevearc/dressing.nvim'
Plug 'jghauser/mkdir.nvim'
Plug 'tpope/vim-eunuch'
" Plug 'beauwilliams/focus.nvim'
Plug 'jinh0/eyeliner.nvim'
Plug 'smitajit/bufutils.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'wakatime/vim-wakatime'
Plug 'natecraddock/sessions.nvim'
Plug 'natecraddock/workspaces.nvim'
Plug 'numtostr/BufOnly.nvim', { 'on': 'BufOnly' }
Plug 'rhysd/clever-split.vim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'hashivim/vim-terraform'
Plug 'f3rno64/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }
Plug 'folke/trouble.nvim'
Plug 'weilbith/nvim-code-action-menu', { 'on': 'CodeActionMenu' }
Plug 'kosayoda/nvim-lightbulb'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'ggandor/leap.nvim'
Plug 'tpope/vim-speeddating'
Plug 'lewis6991/gitsigns.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'RRethy/vim-illuminate'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'kevinhwang91/nvim-bqf'
Plug 'karb94/neoscroll.nvim'
Plug 'onsails/lspkind.nvim'
Plug 'kylechui/nvim-surround'
Plug 'folke/todo-comments.nvim'
Plug 'lewis6991/foldsigns.nvim'
Plug 'booperlv/nvim-gomove'
Plug 'windwp/nvim-autopairs'
Plug 'nvim-zh/colorful-winsep.nvim'
Plug 'kwkarlwang/bufresize.nvim'
Plug 'mrjones2014/smart-splits.nvim'
Plug 'folke/zen-mode.nvim'
Plug 'ojroques/nvim-bufdel'
Plug 'smjonas/inc-rename.nvim'
Plug 'winston0410/cmd-parser.nvim'
Plug 'winston0410/range-highlight.nvim'
Plug 'RRethy/vim-illuminate'
Plug 'm4xshen/smartcolumn.nvim'

function! UpdateRemotePlugins(...)
" Needed to refresh runtime files
let &runtimepath=&runtimepath
UpdateRemotePlugins
endfunction

Plug 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }

" }}}
" {{{ colorschemes

Plug 'jaredgorski/SpaceCamp'
Plug 'cryptomilk/nightcity.nvim'
Plug 'sam4llis/nvim-tundra'
Plug 'yasukotelin/shirotelin'
Plug 'kamwitsta/flatwhite-vim'
Plug 'rafamadriz/neon'
Plug 'yashguptaz/calvera-dark.nvim'
Plug 'cseelus/vim-colors-lucid'
Plug 'dasupradyumna/midnight.nvim'
Plug 'jsit/toast.vim'
Plug 'luisiacc/gruvbox-baby', {'branch': 'main'}
Plug 'Alexis12119/nightly.nvim'
Plug 'lewpoly/sherbet.nvim'
Plug 'jacoborus/tender.vim'
Plug 'marko-cerovac/material.nvim'
Plug 'wadackel/vim-dogrun'
Plug 'RRethy/nvim-base16'
Plug 'rebelot/kanagawa.nvim'
Plug 'EdenEast/nightfox.nvim'
Plug 'nyoom-engineering/oxocarbon.nvim'
Plug 'levelone/tequila-sunrise.vim'
Plug 'Abstract-IDE/Abstract-cs'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'glepnir/zephyr-nvim'
Plug 'fenetikm/falcon'
Plug 'savq/melange-nvim'
Plug 'ray-x/aurora'
Plug 'Th3Whit3Wolf/one-nvim'
Plug 'hoprr/calvera-dark.nvim'
Plug 'nxvu699134/vn-night.nvim'
Plug 'Everblush/nvim'
Plug 'sonph/onehalf', { 'rtp': 'vim/' }
Plug 'NLKNguyen/papercolor-theme'
Plug 'lighthaus-theme/vim-lighthaus'
Plug 'daschw/leaf.nvim'
Plug 'schickele/vim-fruchtig'
Plug 'toupeira/vim-desertink'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'https://gitlab.com/yorickpeterse/vim-paper.git'
Plug 'yorik1984/newpaper.nvim'
Plug 'https://gitlab.com/protesilaos/tempus-themes-vim.git'

" }}}

call plug#end()

" }}}
" {{{ functions

" {{{ s:GetUserSnippetsDirPath

function s:GetUserSnippetsDirPath()
if empty($XF_SRC_DIR)
  return ''
endif

let l:path = $XF_SRC_DIR . '/github/' . $USER . '/vim-snippets'

if !maktaba#path#Exists(l:path)
  return ''
else
  return l:path
endif
endfunction

" }}}
" {{{ s:GetUserSnippetFilePath

function s:GetUserSnippetFilePath(filetype)
let l:snippets_path = s:GetUserSnippetsDirPath()

if empty(l:snippets_path)
  return ''
else
  let l:ft_snippets_path = l:snippets_path . '/ultisnips/' . a:filetype . '.snippets'

  if maktaba#path#Exists(l:ft_snippets_path)
    return l:ft_snippets_path
  else
    return ''
  endif
endif
endfunction

" }}}
" {{{ s:GetCommentString


function s:GetCommentString()
let l:comment_string_parts = split(&commentstring, '%s')

if len(l:comment_string_parts) == 0
  return ''
else
  return l:comment_string_parts[0]
endif
endfunction

" }}}

" }}}
" {{{ settings

let mapleader=','

syntax enable

filetype plugin on
filetype indent on

set maxmempattern=5000

set nospell
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

set timeout           " for mappings
set timeoutlen=500    " default value
set ttimeout          " for key codes
set ttimeoutlen=10    " unnoticeable small value

set updatetime=100
set number
set nojoinspaces
set splitbelow
set showmatch
set incsearch
set hlsearch
set colorcolumn=80
set cursorline
set cmdheight=2
set signcolumn=yes:2
set tags=./tags;,tags;$HOME;
set regexpengine=0
set backspace=indent,eol,start
set autoread
set showtabline=2
set shortmess-=S
set showcmd
set smartcase
set hidden
set textwidth=79 " word wrap
set wrap linebreak
set linebreak
set equalalways
set wildignore+=*node_modules/**
set noswapfile
set nobackup
set nowritebackup
set concealcursor=nc
set conceallevel=0
set termguicolors
set mouse+=a
set splitkeep=screen

set foldmethod=marker
set foldcolumn=1
set foldlevel=0

augroup editing
autocmd!
autocmd InsertLeave * set nopaste
autocmd BufEnter * set number
autocmd BufLeave * set nonumber
augroup END

augroup SnippetFoldMethod
autocmd!
autocmd FileType snippets setlocal foldmethod=marker
augroup END

" hacky fix for syntax highlighting in large files
augroup syntax_fix
autocmd!
autocmd WinEnter,Filetype * syntax sync fromstart
augroup END

augroup SetVimSyntax
autocmd!
autocmd BufNewFile,BufRead *.vim setf vim
autocmd BufNewFile,BufRead *.nvim setf vim
augroup END

let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

" }}}
" {{{ gui config

if has('gui_running') || exists('g:GtkGuiLoaded')

" {{{ font

" {{{ list of fonts for reference

" Iosevka
" FuraCode Nerd Font | cali
" Hasklug Nerd Font
" Input Mono (Normal|Narrow|Condensed|Compressed)
" Rec Mono (Linear|Duotone|SemiCasual|Casual)
" Victor Mono
" Operator Mono
" Hermit
" Source Code Pro
" JetBrainsMono Nerd Font
" BlexMono Nerd Font | liga, zero, frac

" }}}

let s:font_name = 'JetBrainsMono Nerd Font'
let s:font_features = ''
let s:font_size = 10

" {{{ functions

" {{{ s:SetFont()

function! s:SetFont()
let &guifont = s:font_name . ' ' . s:font_size
endfunction

" }}}
" {{{ s:AdjustFontSize(delta)

function! s:AdjustFontSize(delta)
let s:font_size += a:delta
call SetFont()
endfunction

" }}}

" }}}
" {{{ keybindings

nnoremap <C-=> :call <SID>AdjustFontSize(1)<cr>
nnoremap <C-+> :call <SID>AdjustFontSize(1)<cr>
nnoremap <C--> :call <SID>AdjustFontSize(-1)<cr>

" }}}

call SetFont()

" }}}
" {{{ terminal

tnoremap <Esc> <C-\><C-n>

" }}}
" {{{ Neovim-GTK

if has('nvim') && ! has('gui_vimr')
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

call rpcnotify(1, 'Gui', 'Option', 'Popupmenu', 0)
call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
call rpcnotify(1, 'Gui', 'Option', 'Cmdline', 0)

let g:GuiInternalClipboard = 1
endif

" }}}
" {{{ cursor init

if has('nvim') && has('gui_running')
set guicursor+=n-v-c-sm:block
set guicursor+=i-ci-ve:ver25
set guicursor+=r-cr-o:hor20
set guicursor+=a:blinkon0
endif

" }}}

endif

" }}}
" {{{ colorschemes

set background=light

" {{{ colorscheme configs

let g:falcon_background = 0
let g:falcon_inactive = 1

let g:calvera_italic_comments = 1
let g:calvera_italic_keywords = 1
let g:calvera_italic_functions = 1
let g:calvera_contrast = 1

let g:material_style = 'deep ocean'

" }}}
" {{{ light colorschemes

" colorscheme fruchtig
" colorscheme shirotelin
" colorscheme onehalflight
" colorscheme paper
" colorscheme tempus_day
" colorscheme tempus_totus
" colorscheme base16-one-light
" colorscheme base16-github
" colorscheme base16-mexico-light
" colorscheme base16-still-alive
" colorscheme base16-unikitty-light
colorscheme newpaper

" }}}
" {{{ light and dark colorschemes

" colorscheme toast
" colorscheme leaf
" colorscheme PaperColor
" colorscheme catppuccin-latte
" colorscheme flatwhite
" colorscheme base16-github
" colorscheme tempus_day

" }}}
" {{{ dark colorschemes

" colorscheme base16-summercamp
" colorscheme spacecamp
" colorscheme base16-colors
" colorscheme tundra
" colorscheme base16-railscasts
" colorscheme tequila-sunrise
" colorscheme melange
" colorscheme base16-blueish
" colorscheme lucid
" colorscheme base16-ayu-mirage
" colorscheme vn-night
" colorscheme base16-summercamp
" colorscheme base16-tokyodark-terminal
" colorscheme base16-onedark
" colorscheme sherbet
" colorscheme slate
" colorscheme murphy
" colorscheme gruvbox-baby
" colorscheme base16-tokyo-city-dark
" colorscheme nightly
" colorscheme tender
" colorscheme dogrun
" colorscheme tempus_future
" colorscheme tempus_night
" colorscheme tempus_warp
" colorscheme desertink
" colorscheme base16-material-palenight
" colorscheme base16-horizon-terminal-dark
" colorscheme base16-irblack
" colorscheme tequila-sunrise
" colorscheme kanagawa
" colorscheme material
" colorscheme nightfox
" colorscheme oxocarbon
" colorscheme base16-gruvbox-dark-medium
" colorscheme abscs
" colorscheme tokyonight-night
" colorscheme zephyr
" colorscheme melange
" colorscheme aurora
" colorscheme one-nvim
" colorscheme falcon
" colorscheme calvera
" colorscheme vn-night
" colorscheme everblush

" }}}

" }}}
" {{{ plugin configs

" {{{ vim-ai

let g:vim_ai_chat = {
\  "options": {
\    "model": "gpt-4",
\    "temperature": 0.2,
\  },
\}

" }}}
" {{{ nightly

lua << EOF

require("nightly").setup({
transparent = false,
styles = {
  comments = { italic = true },
  functions = { italic = false },
  variables = { italic = false },
  keywords = { italic = false },
},
highlights = {},
})

EOF

" }}}
" {{{ material setup

lua << EOF

require('material').setup({
contrast = {
  terminal = true,
  sidebars = true,
  floating_windows = true,
  cursor_line = true,
  non_current_windows = true
},

plugins = {
  'gitsigns',
  'lspsaga',
  'nvim-cmp',
  'nvim-web-devicons',
  'telescope',
  'trouble'
}
})

EOF

" }}}
" {{{ vim-thematic

let g:thematic#defaults = {
\   'background': 'dark',
\   'laststatus': 2,
\   'ruler': 1
\ }

let g:thematic#themes = {
\   'lucid': {
\     'colorscheme': 'lucid',
\     'background': 'dark'
\   },
\
\   'base16-ayu-mirage': {
\     'colorscheme': 'base16-ayu-mirage',
\     'background': 'dark'
\   },
\
\   'base16-summercamp': {
\     'colorscheme': 'base16-summercamp',
\     'background': 'dark'
\   },
\
\   'base16-tokyodark-terminal': {
\     'colorscheme': 'base16-tokyodark-terminal',
\     'background': 'dark'
\   },
\
\   'slate': {
\     'colorscheme': 'slate',
\     'background': 'dark'
\   },
\
\   'murphy': {
\     'colorscheme': 'murphy',
\     'background': 'dark'
\   },
\
\   'gruvbox-baby': {
\     'colorscheme': 'gruvbox-baby',
\     'background': 'dark'
\   },
\
\   'nightly': {
\     'colorscheme': 'nightly',
\     'background': 'dark'
\   },
\
\   'tender': {
\     'colorscheme': 'tender',
\     'background': 'dark'
\   },
\
\   'sherbet': {
\     'colorscheme': 'sherbet',
\     'background': 'dark'
\   },
\
\   'dogrun': {
\     'colorscheme': 'dogrun',
\     'background': 'dark'
\   },
\
\   'tempus_future': {
\     'colorscheme': 'tempus_future',
\     'background': 'dark'
\   },
\
\   'tempus_night': {
\     'colorscheme': 'tempus_night',
\     'background': 'dark'
\   },
\
\   'tempus_warp': {
\     'colorscheme': 'tempus_warp',
\     'background': 'dark'
\   },
\
\   'desertink': {
\     'colorscheme': 'desertink',
\     'background': 'dark'
\   },
\
\   'base16-material-palenight': {
\     'colorscheme': 'base16-material-palenight',
\     'background': 'dark'
\   },
\
\   'base16-horizon-terminal-dark': {
\     'colorscheme': 'base16-horizon-terminal-dark',
\     'background': 'dark'
\   },
\
\   'base16-irblack': {
\     'colorscheme': 'base16-irblack',
\     'background': 'dark'
\   },
\
\   'tequila-sunrise': {
\     'colorscheme': 'tequila-sunrise',
\     'background': 'dark'
\   },
\
\   'kanagawa': {
\     'colorscheme': 'kanagawa',
\     'background': 'dark'
\   },
\
\   'material': {
\     'colorscheme': 'material',
\     'background': 'dark'
\   },
\
\   'nightfox': {
\     'colorscheme': 'nightfox',
\     'background': 'dark'
\   },
\
\   'oxocarbon': {
\     'colorscheme': 'oxocarbon',
\     'background': 'dark'
\   },
\
\   'base16-gruvbox-dark-medium': {
\     'colorscheme': 'base16-gruvbox-dark-medium',
\     'background': 'dark'
\   },
\
\   'abscs': {
\     'colorscheme': 'abscs',
\     'background': 'dark'
\   },
\
\   'tokyonight-night': {
\     'colorscheme': 'tokyonight-night',
\     'background': 'dark'
\   },
\
\   'zephyr': {
\     'colorscheme': 'zephyr',
\     'background': 'dark'
\   },
\
\   'melange': {
\     'colorscheme': 'melange',
\     'background': 'dark'
\   },
\
\   'aurora': {
\     'colorscheme': 'aurora',
\     'background': 'dark'
\   },
\
\   'one-nvim': {
\     'colorscheme': 'one-nvim',
\     'background': 'dark'
\   },
\
\   'falcon': {
\     'colorscheme': 'falcon',
\     'background': 'dark'
\   },
\
\   'calvera': {
\     'colorscheme': 'calvera',
\     'background': 'dark'
\   },
\
\   'vn-night': {
\     'colorscheme': 'vn-night',
\     'background': 'dark'
\   },
\
\   'everblush': {
\     'colorscheme': 'everblush',
\     'background': 'dark'
\   },
\   'fruchtig': {
\     'colorscheme': 'fruchtig',
\     'background': 'light'
\   },
\
\   'newpaper': {
\     'colorscheme': 'newpaper',
\     'background': 'light'
\   },
\
\   'shirotelin': {
\     'colorscheme': 'shirotelin',
\     'background': 'light'
\   },
\
\   'onehalflight': {
\     'colorscheme': 'onehalflight',
\     'background': 'light'
\   },
\
\   'paper': {
\     'colorscheme': 'paper',
\     'background': 'light'
\   },
\
\   'tempus_day': {
\     'colorscheme': 'tempus_day',
\     'background': 'light'
\   },
\
\   'base16-one-light': {
\     'colorscheme': 'base16-one-light',
\     'background': 'light'
\   },
\
\   'base16-railscasts': {
\     'colorscheme': 'base16-railscasts',
\     'background': 'light'
\   },
\
\   'base16-github': {
\     'colorscheme': 'base16-github',
\     'background': 'light'
\   },
\
\   'base16-mexico-light': {
\     'colorscheme': 'base16-mexico-light',
\     'background': 'light'
\   },
\
\   'base16-still-alive': {
\     'colorscheme': 'base16-still-alive',
\     'background': 'light'
\   },
\
\   'base16-unikitty-light': {
\     'colorscheme': 'base16-unikitty-light',
\     'background': 'light'
\   },
\ }

" }}}
" {{{ mason

lua require("mason").setup()

" }}}
" {{{ mason-update-all

lua require("mason-update-all").setup()

" }}}
" {{{ tabnine-nvim

" lua << EOF
"
" require('tabnine').setup({
" disable_auto_comment=true,
" accept_keymap="<C-t>",
" dismiss_keymap = "<C-]>",
" debounce_ms = 800,
" suggestion_color = {gui = "#808080", cterm = 244},
" exclude_filetypes = {"TelescopePrompt", "NvimTree"},
" log_file_path = nil, -- absolute path to Tabnine log file
" })
"
" EOF

" }}}
" {{{ lualine

lua << EOF

local wtf = require("wtf")

require("lualine").setup {
options = {
  icons_enabled = true,
  theme = "auto",
  component_separators = { left = "", right = ""},
  section_separators = { left = "", right = ""},
  disabled_filetypes = {
    statusline = {},
    winbar = {},
  },
  ignore_focus = {},
  always_divide_middle = true,
  globalstatus = false,
  refresh = {
    statusline = 1000,
    tabline = 1000,
    winbar = 1000,
  }
},
sections = {
  lualine_a = {"mode"},
  lualine_b = {"branch", "diff", "diagnostics"},
  lualine_c = {
    {
      "filename",
      path = 2
    },
    "require('lsp-progress').progress()"
  },
  lualine_x = {wtf.get_status, "fileformat", "filetype"},
  lualine_y = {"progress"},
  lualine_z = {"location"}
},
inactive_sections = {
  lualine_a = {},
  lualine_b = {},
  lualine_c = {"filename"},
  lualine_x = {"location"},
  lualine_y = {},
  lualine_z = {}
},
tabline = {},
winbar = {},
inactive_winbar = {},
extensions = {}
}

EOF

" }}}
" {{{ devicons

lua << EOF

require("nvim-web-devicons").setup({
color_icons = true,
default = true,
strict = true
})

EOF

" }}}
" {{{ sessions

lua << EOF

require("sessions").setup({
events = { "BufEnter" },
session_filepath = vim.fn.stdpath("data") .. "/sessions",
absolute = true,
})

EOF

" }}}
" {{{ workspaces

lua << EOF

require("workspaces").setup({
path = vim.fn.stdpath("data") .. "/workspaces",
cd_type = "global",
sort = true,
mru_sort = true,
notify_info = true,
hooks = {
  add = {},
  remove = {},
  rename = {},
  open_pre = {},
  open = function()
    require("sessions").load(nil, { silent = true })
  end,
},
})

EOF

" }}}
" {{{ telescope

lua << EOF

require("telescope").setup({
defaults = {
  mappings = {
    i = {
      ["<esc>"] = "close"
    }
  }
},

extensions = {
  fzf = {
    fuzzy = true,
    override_generic_sorter = true,
    override_file_sorter = true,
    case_mode = "smart_case",
  }
}
})

require("telescope").load_extension("workspaces")
require("telescope").load_extension("ui-select")

EOF

" }}}
" {{{ nvim-tree

lua << EOF

ntree_api = require('nvim-tree.api')
floating_input = require('floating-input')

-- {{{ functions

-- {{{ OpenNvimTreeAtPath()

function OpenNvimTreePathInput(on_confirm)
local opts = { prompt = 'Path: ' }
local win_opts = {
  height = 2,
  style = 'minimal',
  border = 'rounded',
  title_pos = 'center',
  footer = 'Specify path...',
  title = 'Open Path In Tree'
}

floating_input.input(opts, on_confirm, win_opts)
end

-- }}}
-- {{{ OnGetNvinTreeOpenPath

function OnGetNvimTreeOpenPath(path)
ntree_api.tree.open()
ntree_api.tree.change_root(path)
end

-- }}}
-- {{{ OpenPathInputAndNavigate

function OpenPathInputAndNavigate()
OpenNvimTreePathInput(OnGetNvimTreeOpenPath)
end

-- }}}
-- {{{ on_attach

function on_attach(bufnr)
function opts(desc)
  return {
    desc = 'nvim-tree: ' .. desc,
    buffer = bufnr,
    noremap = true,
    silent = true,
    nowait = true
  }
end

vim.keymap.set('n', '<C-]>', ntree_api.tree.change_root_to_node,          opts('CD'))
vim.keymap.set('n', '<C-e>', ntree_api.node.open.replace_tree_buffer,     opts('Open: In Place'))
vim.keymap.set('n', '<C-k>', ntree_api.node.show_info_popup,              opts('Info'))
vim.keymap.set('n', '<C-r>', ntree_api.fs.rename_sub,                     opts('Rename: Omit Filename'))
vim.keymap.set('n', '<C-t>', ntree_api.node.open.tab,                     opts('Open: New Tab'))
vim.keymap.set('n', '<C-v>', ntree_api.node.open.vertical,                opts('Open: Vertical Split'))
vim.keymap.set('n', '<C-x>', ntree_api.node.open.horizontal,              opts('Open: Horizontal Split'))
vim.keymap.set('n', '<BS>',  ntree_api.node.navigate.parent_close,        opts('Close Directory'))
vim.keymap.set('n', '<CR>',  ntree_api.node.open.edit,                    opts('Open'))
vim.keymap.set('n', '<Tab>', ntree_api.node.open.preview,                 opts('Open Preview'))
vim.keymap.set('n', '>',     ntree_api.node.navigate.sibling.next,        opts('Next Sibling'))
vim.keymap.set('n', '<',     ntree_api.node.navigate.sibling.prev,        opts('Previous Sibling'))
vim.keymap.set('n', '.',     ntree_api.node.run.cmd,                      opts('Run Command'))
vim.keymap.set('n', '-',     ntree_api.tree.change_root_to_parent,        opts('Up'))
vim.keymap.set('n', 'a',     ntree_api.fs.create,                         opts('Create'))
vim.keymap.set('n', 'bmv',   ntree_api.marks.bulk.move,                   opts('Move Bookmarked'))
vim.keymap.set('n', 'B',     ntree_api.tree.toggle_no_buffer_filter,      opts('Toggle No Buffer'))
vim.keymap.set('n', 'c',     ntree_api.fs.copy.node,                      opts('Copy'))
vim.keymap.set('n', 'C',     ntree_api.tree.toggle_git_clean_filter,      opts('Toggle Git Clean'))
vim.keymap.set('n', '[c',    ntree_api.node.navigate.git.prev,            opts('Prev Git'))
vim.keymap.set('n', ']c',    ntree_api.node.navigate.git.next,            opts('Next Git'))
vim.keymap.set('n', 'd',     ntree_api.fs.remove,                         opts('Delete'))
vim.keymap.set('n', 'D',     ntree_api.fs.trash,                          opts('Trash'))
vim.keymap.set('n', 'E',     ntree_api.tree.expand_all,                   opts('Expand All'))
vim.keymap.set('n', 'e',     ntree_api.fs.rename_basename,                opts('Rename: Basename'))
vim.keymap.set('n', ']e',    ntree_api.node.navigate.diagnostics.next,    opts('Next Diagnostic'))
vim.keymap.set('n', '[e',    ntree_api.node.navigate.diagnostics.prev,    opts('Prev Diagnostic'))
vim.keymap.set('n', 'F',     ntree_api.live_filter.clear,                 opts('Clean Filter'))
vim.keymap.set('n', 'f',     ntree_api.live_filter.start,                 opts('Filter'))
vim.keymap.set('n', 'g?',    ntree_api.tree.toggle_help,                  opts('Help'))
vim.keymap.set('n', 'gy',    ntree_api.fs.copy.absolute_path,             opts('Copy Absolute Path'))
vim.keymap.set('n', 'H',     ntree_api.tree.toggle_hidden_filter,         opts('Toggle Dotfiles'))
vim.keymap.set('n', 'J',     ntree_api.node.navigate.sibling.last,        opts('Last Sibling'))
vim.keymap.set('n', 'K',     ntree_api.node.navigate.sibling.first,       opts('First Sibling'))
vim.keymap.set('n', 'm',     ntree_api.marks.toggle,                      opts('Toggle Bookmark'))
vim.keymap.set('n', 'o',     ntree_api.node.open.edit,                    opts('Open'))
vim.keymap.set('n', 'O',     ntree_api.node.open.no_window_picker,        opts('Open: No Window Picker'))
vim.keymap.set('n', 'p',     ntree_api.fs.paste,                          opts('Paste'))
vim.keymap.set('n', 'P',     ntree_api.node.navigate.parent,              opts('Parent Directory'))
vim.keymap.set('n', 'q',     ntree_api.tree.close,                        opts('Close'))
vim.keymap.set('n', 'r',     ntree_api.fs.rename,                         opts('Rename'))
vim.keymap.set('n', 'R',     ntree_api.tree.reload,                       opts('Refresh'))
vim.keymap.set('n', 's',     ntree_api.node.run.system,                   opts('Run System'))
vim.keymap.set('n', 'S',     ntree_api.tree.search_node,                  opts('Search'))
vim.keymap.set('n', 'U',     ntree_api.tree.toggle_custom_filter,         opts('Toggle Hidden'))
vim.keymap.set('n', 'W',     ntree_api.tree.collapse_all,                 opts('Collapse'))
vim.keymap.set('n', 'x',     ntree_api.fs.cut,                            opts('Cut'))
vim.keymap.set('n', 'y',     ntree_api.fs.copy.filename,                  opts('Copy Name'))
vim.keymap.set('n', 'Y',     ntree_api.fs.copy.relative_path,             opts('Copy Relative Path'))
vim.keymap.set('n', '<2-LeftMouse>',  ntree_api.node.open.edit,           opts('Open'))
vim.keymap.set('n', '<2-RightMouse>', ntree_api.tree.change_root_to_node, opts('CD'))
vim.keymap.set('n', 'u', ntree_api.tree.change_root_to_parent, opts('Up'))

end

-- }}}
-- {{{ nvim-tree setup

require("nvim-tree").setup({
sort_by = "case_sensitive",
on_attach = on_attach,
view = {
  width = 30
},
renderer = {
  group_empty = true
},
filters = {
  dotfiles = false
}
})

-- }}}

-- }}}

EOF

" }}}
" {{{ vim-grepper

let g:grepper = {}
let g:grepper.tools = ['rg']
let g:grepper.highlight = 1
let g:grepper.quickfix = 1
let g:grepper.open = 1
let g:grepper.switch = 1
let g:grepper.dir = 'repo,file'

" }}}
" {{{ trouble

lua << EOF

require("trouble").setup({
position = 'bottom',
height = 15,
width = 50,
icons = true,
mode = 'workspace_diagnostics',
severity = nil,
fold_open = '',
fold_closed = '',
group = true,
padding = true,
cycle_results = true,
multiline = true,
indent_lines = true,
win_config = { border = 'single' },
auto_open = false,
auto_close = true,
auto_preview = true,
auto_fold = false,
auto_jump = { 'lsp_definitions' },
include_declaration = { 'lsp_references', 'lsp_implementations', 'lsp_definitions' },
signs = {
  error = '',
  warning = '',
  hint = '',
  information = '',
  other = '',
},
use_diagnostic_signs = true
})

EOF

nnoremap <silent> <leader>D :TroubleToggle<cr>

" }}}
" {{{ treesitter

lua << EOF

require'nvim-treesitter.configs'.setup {
sync_install = false,
auto_install = true,
highlight = {
  enable = true,
},

indent = {
  enable = false,
},

yati = {
  enable = true,
  default_lazy = true,

  -- Determine the fallback method used when we cannot calculate indent by tree-sitter
  --   'auto': fallback to vim auto indent
  --   'asis': use current indent as-is
  --   'cindent': see `:h cindent()`
  -- Or a custom function return the final indent result.
  default_fallback = 'auto'
},

autotag = {
  enable = true,
},

rainbow = {
  enable = true,
  extended_mode = true,
  max_file_lines = nil
},

textsubjects = {
  enable = true,
  prev_selection = ',',
  keymaps = {
    ['.'] = 'textsubjects-smart',
    [';'] = 'textsubjects-container-outer',
    ['i;'] = 'textsubjects-container-inner'
  }
}
}

EOF

" }}}
" {{{ hlargs

lua require("hlargs").setup()

" }}}
" {{{ cmp-tabnine

" lua << EOF
"
" local tabnine = require('cmp_tabnine.config')
"
" tabnine:setup({
" max_lines = 1000,
" max_num_results = 20,
" sort = true,
" run_on_every_keystroke = true,
" snippet_placeholder = '..',
" ignored_file_types = {
"   -- default is not to ignore
"   -- uncomment to ignore in lua:
"   -- lua = true
" },
" show_prediction_strength = false,
" min_percent = 0
" })
"
" EOF

" }}}
" {{{ cmp

set completeopt=menu,menuone,noselect

lua << EOF

local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
formatting = {
  format = lspkind.cmp_format({
    mode = "symbol_text",
    menu = ({
      buffer = "[Buffer]",
      nvim_lsp = "[LSP]",
      nvim_lua = "[Lua]"
    }),

    maxwidth = 50,
    ellipsis_char = '...',

    before = function (entry, vim_item)
      return vim_item
    end
  })
},

snippet = {
  expand = function(args)
    vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
  end,
},

window = {
  completion = cmp.config.window.bordered(),
  documentation = cmp.config.window.bordered(),
},

mapping = cmp.mapping.preset.insert({
  ['<C-J>'] = cmp.mapping.scroll_docs(-4),
  ['<C-K>'] = cmp.mapping.scroll_docs(4),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.abort(),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  ['<C-k>'] = cmp.mapping.select_next_item(),
  ['<C-j>'] = cmp.mapping.select_prev_item()
}),

sources = cmp.config.sources({
  { name = 'ultisnips' },
  { name = 'nvim_lsp' },
  { name = 'bufname' },
  { name = 'buffer-lines' },
  -- { name = 'cmp_tabnine' },
  { name = 'cmp-tw2css' },
  { name = 'nvim_lsp_document_symbol' },
  { name = 'nvim_lsp_signature_help' },
  { ignore_pattern = "[(|,]" },
  {
    name = "diag-codes",
    option = { in_comment = true }
  },
  { name = 'emoji' },
  {
    name = 'spell',
    option = {
        keep_all_entries = false,
        enable_in_context = function()
            return true
        end,
    }
  }
}, {
  { name = 'buffer' },
})
})

EOF

" }}}
" {{{ mason-lspconfig,

lua << EOF

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local handlers = {
function (server_name)
  require("lspconfig")[server_name].setup({
    capabilities = capabilities,
    on_attach = function(client, bufnr)
      require("lsp-status").on_attach(client, bufnr)
    end
  })
end
}

require('mason-lspconfig').setup({
handlers = handlers
})

require('mason-lspconfig').setup_handlers(handlers)

EOF

" }}}
" {{{ ultisnips

augroup UltiSnipsAddFiletypes
autocmd!
autocmd FileType js,javascript UltiSnipsAddFiletypes javascript-jsdoc
augroup END

augroup ultisnips_no_auto_expansion
  au!
  au VimEnter * au! UltiSnips_AutoTrigger
augroup END

let g:UltiSnipsEnableSnipMate = 0
let g:UltiSnipsExpandTrigger = '<c-x>'
let g:UltiSnipsListSnippets = '<c-s><c-l>'
let g:UltiSnipsJumpForwardTrigger = '<c-j>'
let g:UltiSnipsJumpBackwardTrigger = '<c-k>'
let g:UltiSnipsSnippetDirectories = [s:GetUserSnippetsDirPath() . '/ultisnips']

" }}}
" {{{ nvim-lightbulb

augroup lightbulb
autocmd!
autocmd CursorHold,CursorHoldI * lua require('nvim-lightbulb').update_lightbulb()
augroup END

" }}}
" {{{ leap

lua require("leap").add_default_mappings()

" }}}
" {{{ gitsigns

lua require("gitsigns").setup()

" }}}
" {{{ comment

lua require('Comment').setup()

" }}}
" {{{ tabline

lua << EOF

require('tabby.tabline').use_preset('active_wins_at_tail', {
nerdfont = true,
})

EOF

" }}}
" {{{ neoscroll

lua require("neoscroll").setup()

" }}}
" {{{ wilder

call wilder#setup({'modes': [':', '/', '?']})
call wilder#set_option('renderer', wilder#popupmenu_renderer({
    \ 'highlighter': wilder#basic_highlighter(),
    \ }))

" }}}
" {{{ nvim-surround

lua require("nvim-surround").setup()

" }}}
" {{{ todo-comments

lua require("todo-comments").setup()

" }}}
" {{{ foldsigns

lua require("foldsigns").setup()

" }}}
" {{{ nvim-gomove

lua << EOF

require("gomove").setup({
map_defaults = true,
reindent = true,
undojoin = true,
move_past_end_col = false
})

EOF

" }}}
" {{{ nvim-autopairs

lua require("nvim-autopairs").setup()

" }}}
" {{{ colorful-winsep

lua require("colorful-winsep").setup()

" }}}
" {{{ bufresize

lua require("bufresize").setup()

" }}}
" {{{ smart-splits

lua << EOF

require('smart-splits').setup({
resize_mode = {
  hooks = {
    on_leave = require('bufresize').register,
  },
},
})

EOF

" }}}
" {{{ zen-mode

lua require("zen-mode").setup()

" }}}
" {{{ inc-rename

lua require("inc_rename").setup()

" }}}
" {{{ range-highlight

lua require("range-highlight").setup()

" }}}
" {{{ glance

lua << EOF

-- Lua configuration
local glance = require('glance')
local actions = glance.actions

glance.setup({
height = 18, -- Height of the window
zindex = 45,

-- By default glance will open preview "embedded" within your active window
-- when `detached` is enabled, glance will render above all existing windows
-- and won't be restiricted by the width of your active window
detached = true,

-- Or use a function to enable `detached` only when the active window is too small
-- (default behavior)
detached = function(winid)
  return vim.api.nvim_win_get_width(winid) < 100
end,

preview_win_opts = { -- Configure preview window options
  cursorline = true,
  number = true,
  wrap = true,
},
border = {
  enable = false, -- Show window borders. Only horizontal borders allowed
  top_char = '―',
  bottom_char = '―',
},
list = {
  position = 'right', -- Position of the list window 'left'|'right'
  width = 0.33, -- 33% width relative to the active window, min 0.1, max 0.5
},
theme = { -- This feature might not work properly in nvim-0.7.2
  enable = true, -- Will generate colors for the plugin based on your current colorscheme
  mode = 'auto', -- 'brighten'|'darken'|'auto', 'auto' will set mode based on the brightness of your colorscheme
},
mappings = {
  list = {
    ['j'] = actions.next, -- Bring the cursor to the next item in the list
    ['k'] = actions.previous, -- Bring the cursor to the previous item in the list
    ['<Down>'] = actions.next,
    ['<Up>'] = actions.previous,
    ['<Tab>'] = actions.next_location, -- Bring the cursor to the next location skipping groups in the list
    ['<S-Tab>'] = actions.previous_location, -- Bring the cursor to the previous location skipping groups in the list
    ['<C-u>'] = actions.preview_scroll_win(2),
    ['<C-d>'] = actions.preview_scroll_win(-2),
    ['v'] = actions.jump_vsplit,
    ['s'] = actions.jump_split,
    ['t'] = actions.jump_tab,
    ['<CR>'] = actions.jump,
    ['o'] = actions.jump,
    ['<leader>l'] = actions.enter_win('preview'), -- Focus preview window
    ['q'] = actions.close,
    ['Q'] = actions.close,
    ['<Esc>'] = actions.close,
    -- ['<Esc>'] = false -- disable a mapping
  },
  preview = {
    ['Q'] = actions.close,
    ['<Tab>'] = actions.next_location,
    ['<S-Tab>'] = actions.previous_location,
    ['<leader>l'] = actions.enter_win('list'), -- Focus list window
  },
},
hooks = {},
folds = {
  fold_closed = '',
  fold_open = '',
  folded = true, -- Automatically fold list on startup
},
indent_lines = {
  enable = true,
  icon = '│',
},
winbar = {
  enable = true, -- Available starting from nvim-0.8+
},
})

EOF

" }}}
" {{{ vim-illuminate

lua << EOF

require('illuminate').configure({
  providers = {
      'lsp',
      'treesitter',
      'regex',
  },
  delay = 100,
  filetype_overrides = {},
  filetypes_denylist = {
      'dirvish',
      'fugitive',
  },
  filetypes_allowlist = {},
  modes_denylist = {},
  modes_allowlist = {},
  providers_regex_syntax_denylist = {},
  providers_regex_syntax_allowlist = {},
  under_cursor = true,
  large_file_cutoff = nil,
  large_file_overrides = nil,
  min_count_to_highlight = 1,
})

EOF

" }}}
" {{{ smartcolumn

lua require("smartcolumn").setup()

" }}}
" {{{ eyeliner

lua << EOF

require'eyeliner'.setup {
highlight_on_key = true
}

EOF

" }}}
" {{{ focus.nvim

lua << EOF

require('focus').setup()

local ignore_filetypes = { 'NvimTree' }
local ignore_buftypes = { 'nofile', 'prompt', 'popup' }
local augroup = vim.api.nvim_create_augroup('FocusDisable', { clear = true })

vim.api.nvim_create_autocmd('WinEnter', {
 group = augroup,
 callback = function()
     if vim.tbl_contains(ignore_buftypes, vim.bo.buftype)
     then
         vim.w.focus_disable = true
     else
         vim.w.focus_disable = false
     end
 end,
 desc = 'Disable focus autoresize for BufType',
})

vim.api.nvim_create_autocmd('FileType', {
 group = augroup,
 desc = 'Disable focus autoresize for FileType',
 callback = function()
     if vim.tbl_contains(ignore_filetypes, vim.bo.filetype)
     then
         vim.b.focus_disable = true
     else
         vim.b.focus_disable = false
     end
 end
})

EOF

" }}}
" {{{ dressing

lua require('dressing').setup()

" }}}
" {{{ glance

lua << EOF

require('glance').setup({
height = 20
})

EOF

" }}}
" {{{ vim-lexical

let g:lexical#spelllang = ['en_us']
let g:lexical#thesaurus = [$HOME . '.src/github/f3rno64/dotfiles/moby_wordlist']

augroup lexical
autocmd!
autocmd FileType markdown,md,mkd call lexical#init()
autocmd FileType textile call lexical#init()
autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END

" }}}
" {{{ vim-wheel

let g:wheel#map#up = '<c-k>'
let g:wheel#map#down = '<c-j>'
let g:wheel#map#mouse = 1
let g:wheel#scroll_on_wrap = 1

" }}}
" {{{ modes

lua require('modes').setup({})

" }}}
" {{{ hypersonic

lua require('hypersonic').setup({})

" }}}
" {{{ sort-import

lua require('sort-import').setup()

" }}}
" {{{ buffer-closer

lua << EOF

require("buffer-closer").setup({
min_remaining_buffers = 2,
retirement_minutes = 3,
check_when_buffer_adding = true,
check_after_minutes = {
  enabled = true,
  interval_minutes = 1,
},

excluded = {
  filetypes = { "lazy", "NvimTree" },
  buftypes = { "terminal", "nofile", "quickfix", "prompt", "help" },
  filenames = {},
},

ignore_working_windows = true
})

EOF

" }}}
" {{{ template-string.nvim

lua << EOF

require('template-string').setup({
filetypes = { 'html', 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'python' },
jsx_brackets = true,
remove_template_string = true,
restore_quotes = {
  normal = [[']],
  jsx = [["]],
},
})

EOF

" }}}
" {{{ lsp_signature.nvim

lua require'lsp_signature'.setup(opts)

" }}}
" {{{ search-replace.nvim

lua require("search-replace").setup({})

" }}}
" {{{ lsp-progress.nvim

lua require('lsp-progress').setup()

" }}}
" {{{ nvim-toggler.nvim

lua require('nvim-toggler').setup()

" }}}
" {{{ tabout.nvim

lua << EOF

require('tabout').setup {
tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
act_as_tab = true, -- shift content if tab out is not possible
act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
default_tab = '<C-t>', -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
default_shift_tab = '<C-d>', -- reverse shift default action,
enable_backwards = true, -- well ...
completion = true, -- if the tabkey is used in a completion pum
tabouts = {
  {open = "'", close = "'"},
  {open = '"', close = '"'},
  {open = '`', close = '`'},
  {open = '(', close = ')'},
  {open = '[', close = ']'},
  {open = '{', close = '}'}
},
ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
exclude = {} -- tabout will ignore these filetypes
}

EOF

" }}}
" {{{ cinnamon.nvim

lua require('cinnamon').setup()

" }}}
" {{{ auto-save.nvim

lua require("auto-save").setup()

" }}}
" {{{ hop

lua require'hop'.setup {}

" }}}
" {{{ overlength

" lua << EOF
"
" require('overlength').setup({
"    -- Overlength highlighting enabled by default
"   enabled = true,
"
"   -- Colors for OverLength highlight group
"   colors = {
"     ctermfg = nil,
"     ctermbg = 'darkgrey',
"     fg = nil,
"     bg = '#8B0000',
"   },
"
"   -- Mode to use textwidth local options
"   -- 0: Don't use textwidth at all, always use config.default_overlength.
"   -- 1: Use `textwidth, unless it's 0, then use config.default_overlength.
"   -- 2: Always use textwidth. There will be no highlighting where
"   --    textwidth == 0, unless added explicitly
"   textwidth_mode = 2,
"   -- Default overlength with no filetype
"   default_overlength = 80,
"   -- How many spaces past your overlength to start highlighting
"   grace_length = 1,
"   -- Highlight only the column or until the end of the line
"   highlight_to_eol = true,
"
"   -- List of filetypes to disable overlength highlighting
"   disable_ft = { 'qf', 'help', 'man', 'checkhealth', 'lazy', 'packer', 'NvimTree', 'Telescope', 'WhichKey' },
" })
"
" EOF

" }}}
" {{{ vim-wiki

" {{{ - data

let g:x#wiki#fold#header_depth_regex = '/^#\+/'
let g:x#wiki#fold#blank_line_regex = '/\v^\s*$/'
let g:x#wiki#state#fold#valid = maktaba#enum#Create([
\   'INITIAL',
\   'EXPANDED',
\   'COLLAPSED',
\   'DIRTY',
\ ])

let g:x#wiki#state#fold#default = g:x#wiki#state#fold#valid.INITIAL
let g:x#wiki#state#fold = v:null

" }}}
" {{{   - configuration

augroup xf_vimwiki
au BufEnter *.wiki :syntax sync fromstart
au BufEnter *.wiki :e!
augroup END

let g:vimwiki_list = [{
\ 'name': 'Personal Wiki',
\ 'path': $HOME . '/.src/github/f3rno64/vim-wiki/src',
\ 'path_html': $HOME . '/.src/github/f3rno64/vim-wiki/html',
\ 'ext': '.wiki',
\ 'links_space_char': '_',
\ 'cycle_bullets': 1,
\ 'diary_rel_path': 'journal/',
\ 'diary_index': 'index',
\ 'diary_header': 'Journal',
\ 'diary_caption_level': 1,
\ 'list_margin': 0,
\ 'index': 'index',
\ 'auto_toc': 1,
\ 'auto_tags': 1,
\ 'auto_export': 1,
\ 'auto_diary_index': 1,
\ 'auto_generate_links': 1,
\ 'auto_generate_tags': 1,
\ 'html_filename_parameterization': 0,
\ 'maxhi': 1,
\ 'nested_syntaxes': {
\   'ruby': 'ruby',
\   'python': 'python',
\   'css': 'css',
\   'scss': 'scss',
\   'go': 'go',
\   'js': 'javascript',
\   'json': 'json',
\   'c++': 'cpp',
\   'sh': 'sh',
\   'racket': 'racket',
\ }}]

let g:vimwiki_auto_chdir = 0
let g:vimwiki_listsyms = '.oOX'
let g:vimwiki_listsym_rejected = '-'
let g:vimwiki_auto_header = 1
let g:vimwiki_toc_link_format = 0
let g:vimwiki_hl_headers = 0
let g:vimwiki_hl_cb_checked = 2
let g:vimwiki_dir_link = 'index'
let g:vimwiki_global_ext = 0
let g:vimwiki_create_link = 1
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_table_auto_fmt = 1
let g:vimwiki_conceallevel = 2
let g:vimwiki_conceal_pre = 1
let g:vimwiki_conceal_onechar_markers = 1
let g:vimwiki_emoji_enable = 3
let g:vimwiki_toc_header = 'Contents'
let g:vimwiki_links_header = 'Links'
let g:vimwiki_tags_header = 'Tags'
let g:vimwiki_links_header_level = 2
let g:vimwiki_tags_header_level = 2
let g:vimwiki_toc_header_level = 2
let g:vimwiki_folding='expr'
let g:vimwiki_markdown_header_style = 1
let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr,pre,script'
" let g:vimwiki_folding='expr:quick'
" let g:vimwiki_fold_lists = 0
" let g:vimwiki_filetypes = ['vimwiki']

" }}}

" }}}
" {{{ switch

let g:switch_mapping = '-'

" }}}
" {{{ jester

lua << EOF

require("jester").setup({
cmd = "jest -t '$result' -- $file", -- run command
identifiers = {"test", "it"}, -- used to identify tests
prepend = {"describe"}, -- prepend describe blocks
expressions = {"call_expression"}, -- tree-sitter object used to scan for tests/describe blocks
path_to_jest_run = 'jest', -- used to run tests
path_to_jest_debug = './node_modules/.bin/jest', -- used for debugging
terminal_cmd = ":vsplit | terminal", -- used to spawn a terminal for running tests, for debugging refer to nvim-dap's config
dap = { -- debug adapter configuration
  type = 'node2',
  request = 'launch',
  cwd = vim.fn.getcwd(),
  runtimeArgs = {'--inspect-brk', '$path_to_jest', '--no-coverage', '-t', '$result', '--', '$file'},
  args = { '--no-cache' },
  sourceMaps = false,
  protocol = 'inspector',
  skipFiles = {'<node_internals>/**/*.js'},
  console = 'integratedTerminal',
  port = 9229,
  disableOptimisticBPs = true
}
})

EOF

" }}}
" {{{ custom quickfix

lua << EOF

function quickfix()
  vim.lsp.buf.code_action({
      filter = function(a) return a.isPreferred end,
      apply = true
  })
end

EOF

" }}}
" {{{ vim-test

let test#strategy = 'floaterm'

" }}}
" {{{ vim-isort

" let g:vim_isort_map = '<C-i>'
" let g:vim_isort_python_version = 'python3'

" }}}
" {{{ better-whitespace

let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" }}}
" " {{{ focus.nvim
"
" lua << EOF
"
" require("focus").setup({
"     enable = true, -- Enable module
"     commands = true, -- Create Focus commands
"     autoresize = {
"         enable = true, -- Enable or disable auto-resizing of splits
"         width = 0, -- Force width for the focused window
"         height = 0, -- Force height for the focused window
"         minwidth = 0, -- Force minimum width for the unfocused window
"         minheight = 0, -- Force minimum height for the unfocused window
"         height_quickfix = 10, -- Set the height of quickfix panel
"     },
"     split = {
"         bufnew = false, -- Create blank buffer for new split windows
"         tmux = false, -- Create tmux splits instead of neovim splits
"     },
"     ui = {
"         number = false, -- Display line numbers in the focussed window only
"         relativenumber = false, -- Display relative line numbers in the focussed window only
"         hybridnumber = false, -- Display hybrid line numbers in the focussed window only
"         absolutenumber_unfocussed = false, -- Preserve absolute numbers in the unfocussed windows
"
"         cursorline = true, -- Display a cursorline in the focussed window only
"         cursorcolumn = false, -- Display cursorcolumn in the focussed window only
"         colorcolumn = {
"             enable = false, -- Display colorcolumn in the foccused window only
"             list = '+1', -- Set the comma-saperated list for the colorcolumn
"         },
"         signcolumn = true, -- Display signcolumn in the focussed window only
"         winhighlight = false, -- Auto highlighting for focussed/unfocussed windows
"     }
" })
"
" EOF
"
" " }}}
" {{{ true-zen.nvim

lua << EOF

require('true-zen').setup({
modes = { -- configurations per mode
  ataraxis = {
    shade = "dark", -- if `dark` then dim the padding windows, otherwise if it's `light` it'll brighten said windows
    backdrop = 0.25, -- percentage by which padding windows should be dimmed/brightened. Must be a number between 0 and 1. Set to 0 to keep the same background color
    minimum_writing_area = { -- minimum size of main window
      width = 81,
      height = 40,
    },
    quit_untoggles = true, -- type :q or :qa to quit Ataraxis mode
    padding = { -- padding windows
      left = 52,
      right = 52,
      top = 0,
      bottom = 0,
    },
    callbacks = { -- run functions when opening/closing Ataraxis mode
      open_pre = nil,
      open_pos = nil,
      close_pre = nil,
      close_pos = nil
    },
  },
  minimalist = {
    ignored_buf_types = { "nofile" }, -- save current options from any window except ones displaying these kinds of buffers
    options = { -- options to be disabled when entering Minimalist mode
      number = false,
      relativenumber = false,
      showtabline = 0,
      signcolumn = "no",
      statusline = "",
      cmdheight = 1,
      laststatus = 0,
      showcmd = false,
      showmode = false,
      ruler = true,
      numberwidth = 1
    },
    callbacks = { -- run functions when opening/closing Minimalist mode
      open_pre = nil,
      open_pos = nil,
      close_pre = nil,
      close_pos = nil
    },
  },
  narrow = {
    -- change the style of the fold lines. Set it to:
    -- `informative`: to get nice pre-baked folds
    -- `invisible`: hide them
    -- function() end: pass a custom func with your fold lines. See :h foldtext
    folds_style = "informative",
    run_ataraxis = true, -- display narrowed text in a Ataraxis session
    callbacks = { -- run functions when opening/closing Narrow mode
      open_pre = nil,
      open_pos = nil,
      close_pre = nil,
      close_pos = nil
    },
  },
  focus = {
    callbacks = { -- run functions when opening/closing Focus mode
      open_pre = nil,
      open_pos = nil,
      close_pre = nil,
      close_pos = nil
    },
  }
},
integrations = {
  tmux = true,
  kitty = {
    enabled = false,
    font = "+3"
  },
  lualine = true
},
})

EOF

" }}}
" {{{ vim-clap

let g:clap_theme = 'shirotelin'

" }}}
" {{{ vim-vsnip

" If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']

" }}}
" {{{ vim-notify

" lua << EOF

" vim.notify = require("notify")

" EOF

" }}}
" {{{ tsc

lua << EOF

require('tsc').setup({
auto_open_qflist = false,
auto_close_qflist = false,
auto_focus_qflist = false,
auto_start_watch_mode = true,
bin_path = require('tsc/utils').find_tsc_bin(),
enable_progress_notifications = false,
flags = {
  noEmit = true,
  project = function()
    return require('tsc/utils').find_nearest_tsconfig()
  end,
  watch = true,
},
hide_progress_notifications_from_history = true,
spinner = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
pretty_errors = true,
})

EOF

" }}}
" {{{ bookmarks.nvim

lua require('telescope').load_extension('vim_bookmarks')

highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=194 ctermfg=NONE

let g:bookmark_sign = '🚩'
let g:bookmark_annotation_sign = '⭐'
let g:bookmark_highlight_lines = 1
let g:bookmark_no_default_key_mappings = 1
let g:bookmark_auto_save_file = $HOME . '/.vim-bookmarks'
let g:bookmark_auto_save = 1
let g:bookmark_center = 1
let g:bookmark_location_list = 1

" }}}
" {{{ actions-preview.nvim

lua << EOF

require("actions-preview").setup({
diff = {
  ctxlen = 3,
},

highlight_command = {
  -- require("actions-preview.highlight").delta(),
  require("actions-preview.highlight").diff_so_fancy(),
  -- require("actions-preview.highlight").diff_highlight(),
},

backend = { "telescope" },

telescope = {
  sorting_strategy = "ascending",
  layout_strategy = "vertical",
  layout_config = {
    width = 0.8,
    height = 0.9,
    prompt_position = "top",
    preview_cutoff = 20,
    preview_height = function(_, _, max_lines)
      return max_lines - 15
    end,
  },
},
})

EOF

" }}}
" {{{ vim diagnostics config

lua << EOF

vim.diagnostic.config({
update_in_insert = true,
severity_sort = true,
float = {
  border = 'rounded',
},
signs = {
  text = {
    [vim.diagnostic.severity.ERROR] = '✘',
    [vim.diagnostic.severity.WARN] = '▲',
    [vim.diagnostic.severity.HINT] = '⚑',
    [vim.diagnostic.severity.INFO] = '»',
  },
},
})

vim.api.nvim_create_autocmd('ModeChanged', {
pattern = {'n:i', 'v:s'},
desc = 'Disable diagnostics in insert and select mode',
callback = function(e) vim.diagnostic.disable(e.buf) end
})

vim.api.nvim_create_autocmd('ModeChanged', {
pattern = 'i:n',
desc = 'Enable diagnostics when leaving insert mode',
callback = function(e) vim.diagnostic.enable(e.buf) end
})

EOF

" }}}
" {{{ vim lsp config

lua << EOF

vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
vim.lsp.handlers.hover,
{border = 'rounded'}
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
vim.lsp.handlers.signature_help,
{border = 'rounded'}
)

local function hide_semantic_highlights()
for _, group in ipairs(vim.fn.getcompletion('@lsp', 'highlight')) do
vim.api.nvim_set_hl(0, group, {})
end
end

vim.api.nvim_create_autocmd('ColorScheme', {
desc = 'Clear LSP highlight groups',
callback = hide_semantic_highlights,
})

vim.api.nvim_set_hl(0, 'LspReferenceRead', {link = 'Search'})
vim.api.nvim_set_hl(0, 'LspReferenceText', {link = 'Search'})
vim.api.nvim_set_hl(0, 'LspReferenceWrite', {link = 'Search'})

vim.opt.updatetime = 400

local function highlight_symbol(event)
local id = vim.tbl_get(event, 'data', 'client_id')
local client = id and vim.lsp.get_client_by_id(id)
if client == nil or not client.supports_method('textDocument/documentHighlight') then
return
end

local group = vim.api.nvim_create_augroup('highlight_symbol', {clear = false})

vim.api.nvim_clear_autocmds({buffer = event.buf, group = group})

-- vim.api.nvim_create_autocmd({'CursorHold', 'CursorHoldI'}, {
--   group = group,
--   buffer = event.buf,
--   callback = vim.lsp.buf.document_highlight,
-- })

-- vim.api.nvim_create_autocmd({'CursorMoved', 'CursorMovedI'}, {
--   group = group,
--   buffer = event.buf,
--   callback = vim.lsp.buf.clear_references,
-- })
end

vim.api.nvim_create_autocmd('LspAttach', {
desc = 'Setup highlight symbol',
callback = highlight_symbol,
})

EOF

" }}}
" {{{ markdown.nvim

lua require('markdown').setup()

" }}}
" {{{ mkdx

if !has('nvim')
augroup MKDX
au!
au FileType markdown so $HOME/.vim/pack/plugins/start/mkdx/ftplugin/markdown.vim
augroup END
endif

let g:mkdx#settings = {
  \ 'image_extension_pattern': 'a\?png\|jpe\?g\|gif',
  \ 'insert_indent_mappings':  1,
  \ 'gf_on_steroids':          1,
  \ 'restore_visual':          1,
  \ 'enter':                   { 'enable': 1, 'shift': 1, 'o': 1,
  \                              'shifto': 1, 'malformed': 1 },
  \ 'tab':                     { 'enable': 1 },
  \ 'map':                     { 'prefix': '<leader>', 'enable': 1 },
  \ 'tokens':                  { 'enter':  ['-', '*', '>'],
  \                              'bold':   '**', 'italic': '*',
  \                              'strike': '',
  \                              'list':   '-',  'fence':  '',
  \                              'header': '#' },
  \ 'checkbox':                { 'toggles': [' ', '_', 'o', 'O', 'X'],
  \                              'update_tree': 2,
  \                              'initial_state': ' ',
  \                              'match_attrs': {
  \                                 'mkdxCheckboxEmpty': 'conceal cchar=1',
  \                                 'mkdxCheckboxPending': 'conceal cchar=2',
  \                                 'mkdxCheckboxComplete': 'conceal cchar=3',
  \                               }, },
  \ 'toc':                     { 'text':       'TOC',
  \                              'list_token': '-',
  \                              'position':   0,
  \                              'update_on_write':   1,
  \                              'details':    {
  \                                 'enable':  1,
  \                                 'summary': '{{toc.text}}',
  \                                 'nesting_level': 3,
  \                                 'child_count': 5,
  \                                 'child_summary': 'show {{count}} items'
  \                              }
  \                            },
  \ 'table':                   { 'divider': '|',
  \                              'header_divider': '-',
  \                              'align': {
  \                                 'left':    [],
  \                                 'right':   [],
  \                                 'center':  [],
  \                                 'default': 'center'
  \                              }
  \                            },
  \ 'links':                   { 'external': {
  \                                 'enable':     1,
  \                                 'timeout':    3,
  \                                 'host':       '',
  \                                 'relative':   1,
  \                                 'user_agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/9001.0.0000.000 vim-mkdx/1.10.0'
  \                              },
  \                              'fragment': {
  \                                 'jumplist': 1,
  \                                 'complete': 1
  \                              },
  \                              'conceal': 1
  \                            },
  \ 'highlight':               {
  \                              'enable': 1,
  \                              'frontmatter': {
  \                                'yaml': 1,
  \                                'toml': 0,
  \                                'json': 0
  \                              }
  \                            },
  \ 'auto_update':             { 'enable': 1 },
  \ 'fold':                    { 'enable': 1, 'components': ['toc', 'fence'] }
  \ }

" }}}
" {{{ github-preview.nvim

lua << EOF

require("github-preview").setup({
host = "localhost",
port = 6666,
single_file = false,
theme = {
    name = "system",
    high_contrast = false,
},
details_tags_open = true,
cursor_line = {
    disable = false,
    color = "#c86414",
    opacity = 0.2,
},
scroll = {
    disable = false,
    top_offset_pct = 35,
},
log_level = nil,
})

EOF

" }}}
" {{{ vim-gitgutter

let g:gitgutter_sign_added = emoji#for('white_check_mark')
let g:gitgutter_sign_modified = emoji#for('pencil2')
let g:gitgutter_sign_removed = emoji#for('x')
let g:gitgutter_sign_modified_removed = emoji#for('red_circle')

" }}}
" {{{ tabnine-nvim

" lua << EOF
"
" require('tabnine').setup({
" disable_auto_comment=true,
" accept_keymap="<Tab>",
" dismiss_keymap = "<C-]>",
" debounce_ms = 300,
" suggestion_color = {gui = "#808080", cterm = 244},
" exclude_filetypes = {"TelescopePrompt", "NvimTree"},
" log_file_path = nil
" })
"
" EOF

" }}}
" {{{ vim-wtf

lua << EOF

require("wtf").setup({
  popup_type = "popup",
  openai_api_key = vim.env.OPENAI_API_KEY,
  openai_model_id = "gpt-3.5-turbo",
  context = true,
  language = "english",
  search_engine = "google",
  hooks = {
      request_started = nil,
      request_finished = nil,
  },
  winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
})

EOF

" }}}
" {{{ codeium

" let g:codeium_disable_bindings = 1

" }}}
" {{{ backseat.nvim

lua << EOF

require("backseat").setup({
  openai_api_key = vim.env.OPENAI_API_KEY,
  openai_model_id = 'gpt-4',
  language = 'english',
  split_threshold = 100,
  additional_instruction = "Respond precisely",
  highlight = {
    icon = '', -- ''
    group = 'Comment',
  }
})

EOF

" }}}
" {{{ gutentags

" let g:gutentags_modules = ['ctags']
" let g:gutentags_project_root = ['.root']
" let g:gutentags_cache_dir = expand($HOME . '/.cache/tags')
" let g:gutentags_plus_switch = 1
" let g:gutentags_file_list_command = 'fd -e c -e h'

" }}}
" {{{ typescript-tools.nvim

lua << EOF

require("typescript-tools").setup {
  settings = {
    -- spawn additional tsserver instance to calculate diagnostics on it
    separate_diagnostic_server = true,
    -- "change"|"insert_leave" determine when the client asks the server about diagnostic
    publish_diagnostic_on = "insert_leave",
    -- array of strings("fix_all"|"add_missing_imports"|"remove_unused"|
    -- "remove_unused_imports"|"organize_imports") -- or string "all"
    -- to include all supported code actions
    -- specify commands exposed as code_actions
    expose_as_code_action = {},
    -- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
    -- not exists then standard path resolution strategy is applied
    tsserver_path = nil,
    -- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
    -- (see 💅 `styled-components` support section)
    tsserver_plugins = {},
    -- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
    -- memory limit in megabytes or "auto"(basically no limit)
    tsserver_max_memory = "auto",
    -- described below
    tsserver_format_options = {},
    tsserver_file_preferences = {},
    -- locale of all tsserver messages, supported locales you can find here:
    -- https://github.com/microsoft/TypeScript/blob/3c221fc086be52b19801f6e8d82596d04607ede6/src/compiler/utilitiesPublic.ts#L620
    tsserver_locale = "en",
    -- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
    complete_function_calls = true,
    include_completions_with_insert_text = true,
    -- CodeLens
    -- WARNING: Experimental feature also in VSCode, because it might hit performance of server.
    -- possible values: ("off"|"all"|"implementations_only"|"references_only")
    code_lens = "off",
    -- by default code lenses are displayed on all referancable values and for some of you it can
    -- be too much this option reduce count of them by removing member references from lenses
    disable_member_code_lens = true,
    -- JSXCloseTag
    -- WARNING: it is disabled by default (maybe you configuration or distro already uses nvim-ts-autotag,
    -- that maybe have a conflict if enable this feature. )
    jsx_close_tag = {
        enable = false,
        filetypes = { "javascriptreact", "typescriptreact" },
    }
  },
}

EOF

" }}}
" {{{ tsc.nvim

lua require('tsc').setup()

"
" }}}

" }}}
" {{{ keybindings

" {{{ nohl

noremap <silent> <C-l> :<C-u>nohlsearch<cr><C-l>
inoremap <silent> <C-l> <C-o>:nohlsearch<cr>

" }}}
" {{{ profiling

function! s:StartProfiling()
  execute 'profile start profile.log'
  execute 'profile func *'
  execute 'profile file *'
endfunction

function! s:StopProfiling()
  execute 'profile pause'
  noautocmd qall!
endfunction

nnoremap PR :call <SID>StartProfiling()<cr>
nnoremap PS :call <SID>StopProfiling()<cr>

" }}}
" {{{ sessions

nnoremap <leader>ss <cmd>SessionsSave<cr>
nnoremap <leader>sl <cmd>SessionsLoad<cr>

" }}}
" {{{ workspaces

nnoremap <leader>wo <cmd>WorkspacesOpen<cr>
nnoremap <leader>wl <cmd>WorkspacesList<cr>

" }}}
" {{{ vim-thematic

nnoremap tn :ThematicNext<cr>
nnoremap tp :ThematicPrevious<cr>
nnoremap tr :ThematicRandom<cr>
nnoremap tnp :Thematic newpaper<cr>
nnoremap tir :Thematic base16-irblack<cr>
nnoremap tam :Thematic material<cr>
nnoremap tka :Thematic kanagawa<cr>

" }}}
" {{{ bufutils

nnoremap <leader>zi :BResizeZoom<cr>
nnoremap <leader>zo :BResizeZoom<cr>

" }}}
" {{{ quote word

nnoremap <silent> <leader>sr" ciw""<Esc>P
nnoremap <silent> <leader>sr' ciw''<Esc>P`

" }}}
" {{{ plugin management

nnoremap <silent> PI :PlugInstall<cr>
nnoremap <silent> PU :PlugUpdate<cr>
nnoremap <silent> PG :PlugUpgrade<cr>
nnoremap <silent> PC :PlugClean<cr>

" }}}
" {{{ bookmarks

nnoremap <silent> BB <Plug>BookmarkToggle
nnoremap <silent> Bi <Plug>BookmarkAnnotate
nnoremap <silent> Bs <Plug>BookmarkShowAll
nnoremap <silent> Bj <Plug>BookmarkNext
nnoremap <silent> Bk <Plug>BookmarkPrev
nnoremap <silent> Bc <Plug>BookmarkClear
nnoremap <silent> Bx <Plug>BookmarkClearAll
nnoremap <silent> Bkk <Plug>BookmarkMoveUp
nnoremap <silent> Bjj <Plug>BookmarkMoveDown
nnoremap <silent> Bg <Plug>BookmarkMoveToLine
nnoremap <silent> tba :Telescope vim_bookmarks all<cr>
nnoremap <silent> tbf :Telescope vim_bookmarks current_file<cr>

" }}}
" {{{ edit vim/nvim config

if has('nvim')
nnoremap <silent> <leader>rr :e ~/.config/nvim/init.vim<cr>
else
nnoremap <silent> <leader>rr :e ~/.vimrc<cr>
endif

" }}}
" {{{ force write (save)

nnoremap <silent> WW :w!<cr><cr>

" }}}
" {{{ force edit

nnoremap <silent> EE :e!<cr>

" }}}
" {{{ toggle quickfix

function! ToggleQuickFix()
  if empty(filter(getwininfo(), 'v:val.quickfix'))
      copen
  else
      cclose
  endif
endfunction

nnoremap <silent> QF :call ToggleQuickFix()<cr>

" }}}
" {{{ sort lines

function! SortLines() range
execute a:firstline . ',' . a:lastline . 's/^\(.*\)$/\=strdisplaywidth( submatch(0) ) . " " . submatch(0)/'
execute a:firstline . ',' . a:lastline . 'sort n'
execute a:firstline . ',' . a:lastline . 's/^\d\+\s//'
endfunction

vnoremap <silent> SS :'<,'> call SortLines()<cr><cr>

" }}}
" {{{ select in braces

nnoremap <silent> VB viB

" }}}
" {{{ insert dynamic class name in react

function! MakeClassNameAttributeDynamic()
execute "normal! :s/className=\"\\(.*\\)\"/className={cn('\\1')}/\r"
endfunction

nnoremap <silent> <leader>cn :call MakeClassNameAttributeDynamic()<cr>

" }}}
" {{{ reload vim/nvim config

nnoremap <silent> <leader>RR :source $MYVIMRC<cr>

" }}}
" {{{ insert snippet folds

function! s:GetFoldShortcutExecString(fold_str)
return <SID>GetCommentString() . ' ' . a:fold_str
endfunction

function! s:InsertFoldEndAndStart()
execute 'normal! o' . <SID>GetFoldShortcutExecString('}}}')
execute 'normal! o' . <SID>GetFoldShortcutExecString('{{{ ')
execute 'normal! o'
execute 'normal! k'
endfunction

nnoremap <silent> FFS :put=(<SID>GetFoldShortcutExecString('{{{ '))<cr>kddA
nnoremap <silent> FFE :put=(<SID>GetFoldShortcutExecString('}}}'))<cr>kdd<esc>
nnoremap <silent> FFM :call <SID>InsertFoldEndAndStart()<cr>

" }}}
" {{{ tabs

nnoremap <silent> <leader>tn :tabnew<cr>
nnoremap <silent> <leader>tc :tabclose<cr>
nnoremap <silent> <leader>to :tabonly<cr>
nnoremap <silent> <leader>tl :tabnext<cr>
nnoremap <silent> <leader>th :tabprevious<cr>
nnoremap <silent> <leader>tL :+tabmove<cr>
nnoremap <silent> <leader>tH :-tabmove<cr>

" }}}
" {{{ diagnostics

nnoremap <silent> <leader>dqf :lua vim.diagnostic.setqflist()<cr>
nnoremap <silent> gl :lua vim.diagnostic.open_float()<cr>
nnoremap <silent> [d :lua vim.diagnostic.goto_prev({ border = "single" })<cr>
nnoremap <silent> ]d :lua vim.diagnostic.goto_next({ border = "single" })<cr>

" }}}
" {{{ lsp

nnoremap <silent> LD :lua vim.lsp.buf.declaration()<cr>
nnoremap <silent> Ld :lua vim.lsp.buf.definition()<cr>
nnoremap <silent> Lt :lua vim.lsp.buf.type_definition()<cr>
nnoremap <silent> Lr :lua vim.lsp.buf.references()<cr>
nnoremap <silent> Li :lua vim.lsp.buf.implementation()<cr>
nnoremap <silent> Lh :lua vim.lsp.buf.hover()<cr>
nnoremap <silent> Ls :lua vim.lsp.buf.signature_help()<cr>
nnoremap <silent> ff :lua vim.lsp.buf.format()<cr>
nnoremap <silent> Lrn :lua vim.lsp.buf.rename()<cr>
nnoremap <silent> Lca :lua vim.lsp.buf.code_action()<cr>
nnoremap <silent> Lcap :lua require('actions-preview').code_actions<cr>

" }}}
" {{{ refactor insert _isUndefined

nnoremap <silent> <leader>rd :s/typeof \(\w*\) === 'undefined'/_isUndefined(\1)/g<cr>
nnoremap <silent> <leader>rud :s/typeof \(\w*\) !== 'undefined'/!_isUndefined(\1)/g<cr>

" }}}
" {{{ insert emoji list

function s:InsertEmojiList()
for e in emoji#list()
  call append(line('$'), printf('%s (%s)', emoji#for(e), e))
endfor
endfunction

nnoremap <silent> IEL :call s:InsertEmojiList()<cr>

" }}}
" {{{ edit snippets

let s:ts_snippets_path = s:GetUserSnippetFilePath('typescript')
let s:tsreact_snippets_path = s:GetUserSnippetFilePath('typescriptreact')

if !empty(s:ts_snippets_path)
execute 'nnoremap <silent> est :e ' . s:ts_snippets_path . '<cr>'
endif

if !empty(s:tsreact_snippets_path)
execute 'nnoremap <silent> estr :e ' . s:tsreact_snippets_path . '<cr>'
endif

" }}}
" {{{ vim-wtf

xnoremap <silent> <leader>gw :lua require('wtf').ai()<cr>
nnoremap <silent> <leader>gw :lua require('wtf').ai()<cr>
nnoremap <silent> <leader>gW :lua require('wtf').search()<cr>

" }}}
" {{{ codeium

" imap <script><silent><nowait><expr> <S-tab> codeium#Accept()
" imap jj <cmd>call codeium#CycleCompletions(-1)<cr>
" imap kk <cmd>call codeium#CycleCompletions(-1)<cr>
" imap cc <cmd>call codeium#Clear()<cr>

" }}}
" {{{ exec current line

nnoremap <silent> <leader>ex :exec '!'.getline('.')<cr>

" }}}
" {{{ nvim-tree

nnoremap <silent> <leader>e :NvimTreeFocus<cr>
nnoremap <silent> <leader>eo :NvimTreeOpen<cr>
nnoremap <silent> <leader>ec :NvimTreeClose<cr>
nnoremap <silent> <leader>et :NvimTreeToggle<cr>
nnoremap <silent> <leader>eff :NvimTreeFindFile<cr>
nnoremap <silent> <leader>es :NvimTreeResize 30<cr>
nnoremap <silent> <leader>el :NvimTreeResize 55<cr>
nnoremap <silent> <leader>ecl :NvimTreeCollapse<cr>
lua vim.keymap.set('n', '<leader>ep', OpenPathInputAndNavigate)

" }}}
" {{{ ctrl+backspace delete word

imap <C-BS> <C-W>
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

" }}}
" {{{ help

nnoremap HH :execute 'vert help ' . expand('<cword>')<cr>

" }}}
" {{{ fast quit

nnoremap <silent> <leader>q :qa<cr>
nnoremap <silent> <leader>Q :q!<cr>

" }}}
" {{{ fast save

nnoremap <silent><leader>SS<CR>

" }}}
" {{{ folds

" {{{ s:CloseAllFolds

function! s:CloseAllFolds() abort
let &foldlevel = 0
endfunction

" }}}
" {{{ s:OpenAllFolds

function! s:OpenAllFolds() abort
let &foldlevel = 99
endfunction

" }}}
" {{{ s:ToggleFolds

function! s:ToggleFolds() abort
if &foldlevel > 0
  call <SID>CloseAllFolds()
else
  call <SID>OpenAllFolds()
endif
endfunction

" }}}

nnoremap <silent> <leader><space> @=(foldlevel('.')?'za':"\<space>")<CR>
nnoremap <silent> fff :call <SID>ToggleFolds()<CR>

" }}}
" {{{ search highlights

nnoremap <leader>hl :nohl<CR>

" }}}
" {{{ splits

nnoremap <up> :resize -1<CR>
nnoremap <down> :resize +1<CR>
nnoremap <left> :vert resize +1<CR>
nnoremap <right> :vert resize -1<CR>

nnoremap <leader>cs :CleverSplit<CR>
nnoremap <leader>ch :CleverHSplit<CR>
nnoremap <leader>cv :CleverVSplit<CR>

" }}}
" {{{ buffers

nnoremap <leader>bo :BufOnly<CR>
nnoremap <leader>bn :BufferNext<CR>
nnoremap <leader>bN :BufferPrevious<CR>

" }}}
" {{{ terminal splits

command! -nargs=* T split | terminal <args>
command! -nargs=* VT vsplit | terminal <args>

" }}}
" {{{ terminal exit shortcut

tnoremap <Esc> <C-\><C-n>

" }}}
" {{{ trim trailing spaces

nnoremap <leader><leader><leader> :%s/\s\+$//e<cr>

" }}}
" {{{ telescope

nnoremap <c-p> <cmd>Telescope find_files<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fw <cmd>Telescope workspaces<cr>
nnoremap <leader>fd <cmd>Telescope diagnostics<cr>

" }}}
" {{{ vim-grepper

nnoremap <silent> GG :Grepper<cr>
nnoremap <silent> GC :Grepper-cword -noprompt<cr>

" }}}
" {{{ ultisnips

nnoremap <c-r><c-s> :call UltiSnips#RefreshSnippets()<cr>

" }}}
" {{{ tabline

nnoremap <silent> <leader>ta :$tabnew<cr>
nnoremap <silent> <leader>tc :tabclose<cr>
nnoremap <silent> <leader>to :tabonly<cr>
nnoremap <silent> <leader>tn :tabn<cr>
nnoremap <silent> <leader>tp :tabp<cr>
nnoremap <silent> <leader>tmp :-tabmove<cr>
nnoremap <silent> <leader>tmn :+tabmove<cr>

" }}}
" {{{ smart-splits

nnoremap <silent> <A-h> :lua require('smart-splits').resize_left()<cr>
nnoremap <silent> <A-j> :lua require('smart-splits').resize_down()<cr>
nnoremap <silent> <A-k> :lua require('smart-splits').resize_up()<cr>
nnoremap <silent> <A-l> :lua require('smart-splits').resize_right()<cr>

nnoremap <silent> <C-h> :lua require('smart-splits').move_cursor_left()<cr>
nnoremap <silent> <C-j> :lua require('smart-splits').move_cursor_down()<cr>
nnoremap <silent> <C-k> :lua require('smart-splits').move_cursor_up()<cr>
nnoremap <silent> <C-l> :lua require('smart-splits').move_cursor_right()<cr>

nnoremap <silent> <leader><leader>h :lua require('smart-splits').swap_buf_left()<cr>
nnoremap <silent> <leader><leader>j :lua require('smart-splits').swap_buf_down()<cr>
nnoremap <silent> <leader><leader>k :lua require('smart-splits').swap_buf_up()<cr>
nnoremap <silent> <leader><leader>l :lua require('smart-splits').swap_buf_right()<cr>

" }}}
" {{{ inc-rename

lua << EOF

vim.keymap.set("n", "<leader>rn", function()
return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })

EOF

" }}}
" {{{ glance

nnoremap <silent> <leader>Gr :Glance references<cr>
nnoremap <silent> <leader>Gd :Glance definitions<cr>
nnoremap <silent> <leader>Gt :Glance type_definitions<cr>
nnoremap <silent> <leader>Gi :Glance implementations<cr>

" }}}
" {{{ ScrollColors

map <silent><F3> :NEXTCOLOR<cr>
map <silent><F2> :PREVCOLOR<cr>

" }}}
" {{{ nvim-toggler.nvim

nnoremap <silent> <leader>cl :lua require('nvim-toggler').toggle()<cr>
vnoremap <silent> <leader>cl :lua require('nvim-toggler').toggle()<cr>

" }}}
" {{{ hop

nnoremap <silent>Hw :HopWord<CR>
nnoremap <silent>Hl :HopLine<CR>
nnoremap <silent>Hls :HopLineStart<CR>
nnoremap <silent>Ha :HopAnywhere<CR>
nnoremap <silent>Hc1 :HopChar1<CR>
nnoremap <silent>Hc2 :HopChar2<CR>
nnoremap <silent>Hp :HopPattern<CR>

" }}}
" {{{ custom quickfix

lua vim.keymap.set('n', 'qqf', quickfix, { noremap=true, silent=true })

" }}}
" {{{ vim-test

nmap <silent> <leader>tt :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>

" }}}
" {{{ trouble

nnoremap <silent><leader>T :TroubleToggle<cr>

" }}}
" {{{ true-zen.nvim

nnoremap <silent> <leader>zn :TZNarrow<cr>
vnoremap <silent> <leader>zn :'<,'>TZNarrow<cr>
nnoremap <silent> <leader>zf :TZFocus<cr>
nnoremap <silent> <leader>zm :TZMinimalist<cr>
nnoremap <silent> <leader>za :TZAtaraxis<cr>

" }}}
" {{{ vim-vnsip

imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)

" }}}
" {{{ accelerated-jk

nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

" }}}

" }}}
