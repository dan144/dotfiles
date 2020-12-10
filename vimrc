filetype plugin indent on
syntax enable

set tabstop=4
set et
set hlsearch
set incsearch
set relativenumber
set number
set laststatus=2
set colorcolumn=120
set tabpagemax=50
highlight Visual term=reverse ctermbg=242 guibg=DarkGrey

:ca syntog  SyntasticToggleMode
:ca WQ      wq
:ca Wq      wq
:ca wQ      wq
:ca W       w
:ca Q       q
:ca Qa      qa
:ca QA      qa
:ca errors  Errors

if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
    echo "Run :PlugInstall"
endif

call plug#begin('~/.vim/plugged')
call plug#end()

let g:syntastic_quiet_messages     = { 'regex': 'E501' }
let g:syntastic_c_compiler_options = "-std=gnu11 -g -Wall -Wextra -fPIC -I /usr/include -Isrc/ -Isrc/include/ -I/opt/pindrop/include"

autocmd FileType c      set ai ts=4 sw=4 sts=4 et sm
autocmd FileType python set ai ts=4 sw=4 sts=4 et sm
autocmd FileType json   set ai ts=4 sw=4 sts=4 et sm
autocmd FileType rst    set ai ts=3 sw=3 sts=3 et sm spell spelllang=en_us spellfile=~/.vim/spell/en.utf-8.add
autocmd FileType sh     set ai ts=4 sw=4 sts=4 et sm
autocmd FileType make   set ai ts=8 sw=8 noet sm
autocmd BufEnter,BufNew *.go set ai ts=4 sw=4 noet sm
