"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Initialize Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin('~/.config/nvim/bundle')

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setup Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plugin 'VundleVim/Vundle.vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plugin list
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" python
""Plugin 'andviro/flake8-vim'
Plugin 'nvie/vim-flake8'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'dowan/vim-pydocstring'
Plugin 'tell-k/vim-autopep8'


" js
Plugin 'posva/vim-vue'
"Plugin 'elzr/vim-json'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" crystal
Plugin 'rhysd/vim-crystal'

" go
Plugin 'fatih/vim-go'

" integration
""Plugin 'christoomey/vim-tmux-navigator'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'w0rp/ale'

" interface
Plugin 'bling/vim-airline'
Plugin 'metakirby5/codi.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'Yggdroot/LeaderF'
Plugin 'chriskempson/base16-vim'

" completion
Plugin 'valloric/youcompleteme'
Plugin 'tpope/vim-surround'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Finalize Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call vundle#end()
filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Line Numbering
set number

" Textwidth
set tw=120

" Don't wrap text
set nowrap

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>

"""""""""""""""""""""""""""""""""""""""""
" Coloring Config
"""""""""""""""""""""""""""""""""""""""""
" Turn on syntax coloring
syntax on

" Use this colorscheme
"colorscheme vitamins
"colorscheme darcula
"colorscheme molokai
"colorscheme inkpot
colorscheme ThemerVim

" Better command-line completion
set wildmenu
 
" Show partial commands in the last line of the screen
set showcmd

"""""""""""""""""""""""""""""""""""""""""
" Smart tabbing and cases
"""""""""""""""""""""""""""""""""""""""""
set smartindent
set autoindent
set smartcase  " capital letters = case sensitive
set tabstop=4
set shiftwidth=4
set mouse=a
set encoding=utf-8
set expandtab
autocmd FileType vue set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType js set tabstop=2|set shiftwidth=2|set expandtab

"""""""""""""""""""""""""""""""""""""""""
" plugin conf
"""""""""""""""""""""""""""""""""""""""""

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"flake 8
let g:flake8_show_in_gutter=1
map <F7> :PyFlake

"rainbow parenthese
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:rbpt_max = 16

let g:rbpt_loadcmd_toggle = 0

"tagbar
nmap <F3> :TagbarToggle<CR>

" nerd tree
map <F2> :NERDTreeToggle<CR>

" pydocstring
map <slient> <F4> <Plug>(pydocstring)

" go

" you complete me
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_python_binary_path = 'python'

" LeaderF
let g:Lf_ShortcutF = '<C-P>'

"close parenthese etc
inoremap {      {}<Left>
inoremap (      ()<Left>
inoremap '      ''<Left>
inoremap [      []<Left>
inoremap "      ""<Left>
inoremap `      ``<Left>

set whichwrap=<,>
set colorcolumn=80

command WW  w | :%s/\s\+$//e | :call Autopep8() | :call Flake8()

if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" change clipboard 
set clipboard=unnamedplus

" navigate in splits
nnoremap <M-t> <C-W><C-J>
nnoremap <M-c> <C-W><C-K>
nnoremap <M-n> <C-W><C-L>
nnoremap <M-h> <C-W><C-H>
