set shell=bash

" Vundle installation

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()
" alternatively, pass a path where Vundle should install bundles
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
Bundle 'gmarik/vundle'

" The following are examples of different formats supported.
" Keep bundle commands between here and filetype plugin indent on.
" scripts on GitHub repos
" Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'tpope/vim-rails.git'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" scripts from http://vim-scripts.org/vim/scripts.html
" Bundle 'L9'
" Bundle 'FuzzyFinder'
" scripts not on GitHub
" Bundle 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Bundle 'file:///home/gmarik/path/to/plugin'
" ...

" My bundles

Bundle 'scrooloose/nerdtree'
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.meta$', '\~$']

Bundle 'scrooloose/syntastic'
Bundle 'dart-lang/dart-vim-plugin'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-fugitive'
Bundle 'majutsushi/tagbar'
Bundle 'altercation/vim-colors-solarized'
Bundle 'mattn/emmet-vim'
Bundle 'myusuf3/numbers.vim'
Bundle 'vim-scripts/django.vim'
Bundle 'ciaranm/detectindent'
Bundle 'wting/rust.vim'
Bundle 'xolox/vim-easytags'
Bundle 'xolox/vim-misc'
Bundle 'rizzatti/dash.vim'
Bundle 'vim-scripts/EasyGrep'

filetype plugin indent on     " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
" Put your stuff after this line

" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

"
" My configuration
"

set wildmenu 	" for convenient menus
set nu			" for line numbers
set clipboard=unnamed

" Identation

set shiftwidth=4
set tabstop=4
set softtabstop=4
set so=5

" Settings for syntastic

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set wildignore=*.meta
set path=$PWD/**
set cinkeys-=0#

" Colorscheme

set background=dark
colorscheme solarized

" Cursor position
" http://vim.wikia.com/wiki/Highlight_current_line

augroup CursorLine
	au!
	au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
	au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
	au WinLeave * setlocal nocursorline
	au WinLeave * setlocal nocursorcolumn
augroup END

" Russian support
" https://github.com/shvechikov/vim-keymap-russian-jcukenmac
set keymap=russian-jcukenmac
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan

" No automatic line breaks for text files
" http://vim.wikia.com/wiki/Word_wrap_without_line_breaks

set wrap
set linebreak
set nolist  " list disables linebreak
set textwidth=0
set wrapmargin=0
set formatoptions+=l
set so=99

autocmd filetype python nnoremap <F4> :w <bar> exec '!python '.shellescape('%')<CR>
autocmd filetype c nnoremap <F4> :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
" Launching asm files in 386 emulator (OS development)
autocmd filetype asm nnoremap <F4> :w <bar> exec '!nasm '.shellescape('%').' -f bin -o '.shellescape('%:r').' && qemu-system-i386 '.shellescape('%:r')<CR>
" Ignore angular html stuff
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute", "trimming empty"]
" Detect identation, always
autocmd BufReadPre,FileReadPre * :DetectIndent
" 4 spaces for rust files
autocmd FileType rust setlocal shiftwidth=4 softtabstop=4 expandtab

" EasyGrep options
let g:EasyGrepFileAssociations='/Users/maxjankov/.vim/bundle/EasyGrep/plugin/EasyGrepFileAssociations'
let g:EasyGrepMode=2
let g:EasyGrepCommand=0
let g:EasyGrepRecursive=1
let g:EasyGrepSearchCurrentBufferDir=0
let g:EasyGrepIgnoreCase=0
let g:EasyGrepHidden=0
let g:EasyGrepFilesToExclude=''
let g:EasyGrepAllOptionsInExplorer=1
let g:EasyGrepWindow=0
let g:EasyGrepReplaceWindowMode=0
let g:EasyGrepOpenWindowOnMatch=1
let g:EasyGrepEveryMatch=0
let g:EasyGrepJumpToMatch=1
let g:EasyGrepInvertWholeWord=0
let g:EasyGrepFileAssociationsInExplorer=0
let g:EasyGrepExtraWarnings=1
let g:EasyGrepOptionPrefix='<leader>vy'
let g:EasyGrepReplaceAllPerFile=0

" JSON beautify command
function! FormatJSON() :%!python -m json.tool endufction
