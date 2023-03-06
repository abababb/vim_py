set nocompatible              " be iMproved, required
filetype off                  " required

let api_root = "~/projects/"
"cd
execute "cd ".api_root

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'mileszs/ack.vim'
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Tagbar'
Plugin 'Rename'
"Plugin 'dense-analysis/ale'

" react
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'mattn/emmet-vim'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
""Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
""Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
""Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" python相关插件
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" 其余配置
let mapleader = ","

" Enable folding
set foldmethod=indent
set foldlevel=99

set encoding=utf-8

" CtrlP
nnoremap <Leader>t :CtrlP getcwd()<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>f :CtrlPTag<cr>
let g:ctrlp_working_path_mode = 'ra'

" Quick nohl
nnoremap <Leader>h :nohl<CR>

" change to current file directory
map <Leader>w :cd %:h<CR>
execute "map <Leader>wa :cd ".api_root."<CR>"

" Show hidden characters (spaces, tabs, etc)
nmap <silent> <leader>s :set nolist!<CR>

" Quick insert mode exit
imap jj <Esc>

" create tags
map <Leader>. :!ctags -R --languages=python,javascript -f ./.git/tags `pwd`<CR>

" Save a file that requires sudoing even when
" you opened it as a normal user.
command! Sw w !sudo tee % > /dev/null

" nerdtree配置
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>r :TagbarToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__$'] "ignore files in NERDTree
let g:NERDTreeMapHelp = "h"

" Fugitive shortcuts
nnoremap <Leader>c :Gcommit -a<CR>i
nnoremap <Leader>a :Git add %:p<CR>
"Fugitive (Git) in status line
set statusline=%{exists(\"*fugitive#statusline\")?\"branch:\ \".fugitive#statusline():\"\"}\ %F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]
" always display status line
set laststatus=2

let g:EasyMotion_leader_key = '<Space>'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" YouCompleteMe插件配置
let g:ycm_autoclose_preview_window_after_completion=1
map <Leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

"jsx
let g:jsx_ext_required = 0
let g:user_emmet_leader_key='<C-e>'
let g:user_emmet_settings = {
  \ 'javascript.jsx' : {
    \    'extends' : 'jsx',
    \ },
  \}

" ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_python_checkers = ["flake8"]
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
            \ "mode": "active",
            \ "active_filetypes": [],
            \ "passive_filetypes": ["python"] }
nnoremap <Leader>sc :SyntasticCheck<CR>
nnoremap <Leader>sr :SyntasticReset<CR>

let python_highlight_all=1

"Spaces, not tabs
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2

set directory^=$HOME/.vim/swap//
set nu
set hlsearch
syntax on
