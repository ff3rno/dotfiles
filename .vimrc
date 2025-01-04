" {{{ plugin loading

" {{{ plug#begin

if has('nvim')
  let g:plugin_root = '/.nvim-plugins'
else
  let g:plugin_root = '/.vim-plugins'
end

let g:plugin_path = $HOME . g:plugin_root

call plug#begin(g:plugin_path)

" }}}
" {{{ syntax

Plug 'khaveesh/vim-fish-syntax'

" }}}
" {{{ colorschemes

Plug 'sainnhe/sonokai'

" }}}
" {{{ grep

Plug 'mhinz/vim-grepper', { 'on': ['Grepper', '<plug>(GrepperOperator)'] }

" }}}
" {{{ plugin#end

call plug#end()

" }}}

" }}}
" {{{ plugin configuration

" {{{ vim-grepper

let g:grepper = {}
let g:grepper.tools = []

if executable('fd')
    let g:grepper.tools += ['fd']
endif

if executable('ag')
    let g:grepper.tools += ['ag']
endif

let g:grepper.highlight = 1
let g:grepper.quickfix = 1
let g:grepper.open = 1
let g:grepper.switch = 1
let g:grepper.dir = 'repo,file'
let g:grepper.ag = {
\ 'grepprg': 'ag --ignore-dir={modules,node_modules,.undodir,docs/dist,bower_components,dist,build}'
\ }

" }}}

" }}}
" {{{ configuration

" {{{ set *

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set timeout
set timeoutlen=300
set ttimeout
set ttimeoutlen=10

set encoding=utf-8
set number
set nojoinspaces
set splitbelow
set showmatch
set incsearch
set relativenumber
set hlsearch
set colorcolumn=80
set cmdheight=2
set signcolumn=yes
set regexpengine=1
set backspace=indent,eol,start
set autoread
set showtabline=2
set shortmess-=S
set showcmd
set smartcase
set hidden
set tw=79
set nocompatible
set equalalways
set wildignore+=*node_modules/**

set noswapfile
set nobackup
set nowritebackup

set concealcursor=nc
set conceallevel=3

set foldmethod=marker
set foldcolumn=1
set foldlevel=1

" if &shell =~# 'fish$'
"   set shell=sh
" endif

" }}}
" {{{ disable python2 check

let g:loaded_python_provider=0

" }}}
" {{{ netrw

let g:netrw_banner = 0
let g:netrw_altv = 1 " split to right
" let g:netrw_browse_split = 2 " open file in right split
let g:netrw_sizestyle = "H" " human readable base 1024
let g:netrw_liststyle = 3
let g:netrw_winsize = 20
let g:netrw_nogx = 1
" let g:netrw_browsex_viewer = 'xdg-open'
let g:netrw_list_hide = netrw_gitignore#Hide()

" }}}
" {{{ statusline

set laststatus=2

" left
set statusline=
set statusline+=%#PmenuSel#
set statusline+=\ " padding
" set statusline+=%{FugitiveHead()}
" set statusline+=\ " padding
set statusline+=%#CursorColumn#
set statusline+=\ " padding
" set statusline+=%{StatuslineALE()}
" set statusline+=\ " padding
" set statusline+=%{coc#status()}
" set statusline+=\ " padding
set statusline+=%#LineNr#
set statusline+=\ " padding
set statusline+=%f

" right
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ " padding
set statusline+=%y
set statusline+=\ " padding
set statusline+=%#PmenuSel#
set statusline+=\ L%l\ %p%%
set statusline+=\ " padding

" }}}

" }}}
" {{{ autocommands

" {{{ auto number toggle

autocmd BufEnter * set relativenumber
autocmd BufLeave * set norelativenumber

" }}}
" {{{ auto nopaste

autocmd InsertLeave * set nopaste

" }}}
" {{{ hacky fix for syntax highlighting in large files

autocmd WinEnter,Filetype * syntax sync fromstart

" }}}
" {{{ autosave

autocmd InsertLeave,TextChanged * update

" }}}
" {{{ search highlight toggle

" {{{ functions

" {{{ - s:hlsearch_enable()

func! s:hlsearch_enable()
  setlocal hlsearch
endfunc

" }}}
" {{{ - s:hlsearch_disable()

func! s:hlsearch_disable()
  setlocal nohlsearch
endfunc

" }}}

" }}}

augroup dynamic_search_hl
  autocmd!
  autocmd InsertEnter * call <SID>hlsearch_disable()
  autocmd InsertLeave * call <SID>hlsearch_enable()
augroup END

" }}}
" {{{ statusline fix

" Fix for https://github.com/itchyny/lightline.vim/issues/448
" (affects builtin statusline as well)
func! FixLightlineStartupRender(timer)
  execute('resize -1')
  execute('resize +1')
endfunc

autocmd VimEnter * call timer_start(600, 'FixLightlineStartupRender')

" }}}

" }}}
" {{{ colorscheme

" {{{ enable 256 colors

set t_Co=256

if has("termguicolors")
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" }}}
" {{{ configure

" {{{ sonokai

let g:sonokai_style = 'maia'
let g:sonokai_enable_italic = 1
let g:sonokai_diagnostic_text_highlight = 1
let g:sonokai_diagnostic_line_highlight = 1
let g:sonokai_diagnostic_line_highlight = 'highlighted'
let g:sonokai_inlay_hints_background = 'dimmed'
let g:sonokai_spell_foreground = 'colored'
let g:sonokai_disable_terminal_colors = 1
let g:sonokai_better_performance = 1

if has('nvim')
  let g:sonokai_dim_inactive_windows = 1
endif

" }}}

" }}}

set background=dark
colorscheme sonokai

" }}}
" {{{ keybindings

let mapleader = ','

" {{{ folds

" {{{ functions

" {{{   - s:folds_toggle()

func! s:folds_toggle() abort
  if &foldlevel > 0
    call <SID>folds_collapse()
  else
    call <SID>folds_expand()
  endif
endfunc

" }}}
" {{{   - s:folds_collapse()

func! s:folds_collapse() abort
  let &foldlevel = 0
endfunc

" }}}
" {{{   - s:folds_expand()

func! s:folds_expand() abort
  let &foldlevel = 99
endfunc

" }}}

" }}}

nnoremap <silent> fff :call <SID>folds_toggle()<cr>
nnoremap <silent> <leader><Space> @=(foldlevel('.')?'za':"\<Space>")<cr>

" }}}
" {{{ fast line movements

nnoremap J 2j
nnoremap K 2k

" }}}
" {{{ ctrl+backspace delete word

imap <C-BS> <C-W>
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

" }}}
" {{{ fast quit

nnoremap <silent> <leader>q :qa<cr>
nnoremap <silent> <leader>Q :q!<cr>

" }}}
" {{{ netrw

nnoremap <leader>e :Lexplore<cr>

" }}}
" {{{ trim trailing spaces

nnoremap <leader><leader><leader> :%s/\s\+$//e<cr>

" }}}
" {{{ splits

nnoremap <up> :resize -1<cr>
nnoremap <down> :resize +1<cr>
nnoremap <left> :vert resize +1<cr>
nnoremap <right> :vert resize -1<cr>

nnoremap <leader>s :CleverSplit<cr>

" }}}
" {{{ tab zoom+nav

nnoremap <silent> <leader>zi :tab split<cr>
nnoremap <silent> <leader>zo :tab close<cr>
nnoremap <silent> <leader>N :tabnext<cr>
nnoremap <silent> <leader>P :tabprev<cr>

" }}}
" {{{ terminal splits

command! -nargs=* T split | terminal <args>
command! -nargs=* VT vsplit | terminal <args>

" }}}
" {{{ grepper

nnoremap <silent> <leader>G :Grepper<cr>
nnoremap <silent> <leader>W :Grepper-cword<cr>

" }}}
" {{{ search highlight

nnoremap <silent> <leader>hh :nohl<cr>

" }}}

" }}}
