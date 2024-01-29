set nocompatible              " be iMproved, required
filetype off                  " required
set encoding=utf-8

let mapleader = ","
let python_highlight_all=1

let api_root = "~/projects/api"
let upgrade_root = "~/projects/upgrade"

"cd
exec "cd ".api_root
exec "map <Leader>wr :cd ".upgrade_root."<CR>"

" change to current file directory
map <Leader>w :cd %:h<CR>

" Show hidden characters (spaces, tabs, etc)
nmap <silent> <leader>s :set nolist!<CR>

" Quick insert mode exit
imap jj <Esc>

" Quick nohl
nnoremap <Leader>h :nohl<CR>

" Enable folding
set foldmethod=indent
set foldlevel=99

" Save a file that requires sudoing even when
" you opened it as a normal user.
command! Sw w !sudo tee % > /dev/null

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

" Plugin 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'mileszs/ack.vim'
Plugin 'ervandew/supertab'
Plugin 'vim-syntastic/syntastic'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Rename'

" react
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'pangloss/vim-javascript'
Plugin 'mattn/emmet-vim'

" python
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Plugin config

" CtrlP
nnoremap <Leader>t :CtrlP getcwd()<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>f :CtrlPTag<cr>
let g:ctrlp_working_path_mode = 'ra'

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

let g:SuperTabDefaultCompletionType = '<C-n>'

" jsx, tsx, emmet
let g:jsx_ext_required = 0
let g:user_emmet_leader_key='<C-e>'
let g:user_emmet_settings = {
  \ 'javascript.jsx' : {
    \    'extends' : 'jsx',
    \ },
  \}
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

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

" copilot
let g:copilot_filetypes = {
            \ 'gitcommit': v:true,
            \'markdown': v:true, 
            \'yaml': v:true
            \ }
inoremap <Leader>] <Plug>(copilot-next)
inoremap <Leader>[ <Plug>(copilot-previous)
inoremap <Leader>\ <Plug>(copilot-suggest)
