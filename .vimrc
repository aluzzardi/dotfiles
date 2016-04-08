""" Vundle

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-sensible'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'chriskempson/base16-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'fatih/vim-go'
Plugin 'Shougo/neocomplete.vim'
Plugin 'majutsushi/tagbar'

call vundle#end()            " required
filetype plugin indent on    " required


""" Settings

set number
set showmatch
set nohlsearch
set ignorecase
set smartcase

set tabstop=4
set softtabstop=4
set shiftwidth=4

set showmode
set ul=200
set cindent
set ttyfast
set cursorline
set nowrap
set ttymouse=xterm2
set encoding=utf-8
set ff=unix
set nobackup
set noswapfile

let mapleader=","
let maplocalleader = '_'

if has("mouse")
    set mouse=a
endif


""" GUI

if has("gui")
    set guicursor+=a:blinkon0
    set tb=tooltips
	set vb t_vb= " Disable bell
    set guioptions-=m " remove menu bar
    set guioptions-=T " remove toolbar
    set guioptions-=r " remove right-hand scroll bar
    set guioptions-=L " remove left-hand scroll bar
    set guioptions+=c
    set guifont=Inconsolata-g\ for\ Powerline:h12 
endif


""" Mappings

nnoremap Q gq
nnoremap <silent> <C-j> :tabnext<CR>
nnoremap <silent> <C-k> :tabprevious<CR>

""" Scheme

set background=dark
let base16colorspace=256
set t_Co=256
let g:airline_theme = 'base16'

try
	colorscheme base16-tomorrow
catch  /^Vim\%((\a\+)\)\=:E185/
	colorscheme desert
endtry


""" NerdTree

let NERDTreeAutoDeleteBuffer = 1
let NERDTreeHijackNetrw = 1
let NERDTreeMinimalUI = 1
nnoremap <silent> t :NERDTree<CR>


""" Tagbar
nnoremap <F8> <Esc>:TagbarToggle<CR>


""" Fugitive
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>gl :Glog<CR>
nnoremap <silent> <leader>gr :Gread<CR>
nnoremap <silent> <leader>gw :Gwrite<CR>
nnoremap <silent> <leader>ge :Gedit<CR>


""" Omni-Completion
set ofu=syntaxcomplete#Complete
set completeopt=menu


""" Go
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)


""" Fix lag of syntastic+go-vim
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }


""" neocomplete
let g:neocomplete#enable_at_startup = 1


""" HTML
autocmd Filetype html setlocal ts=4 sw=4 expandtab
