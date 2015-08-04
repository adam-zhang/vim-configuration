" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2011 Apr 15
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

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

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
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

filetype on

colorscheme desert
set number
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=uutf-8,gbk,cs-bom,cp936
set fileencoding=utf-8

let g:vimrc_author="Mingping (Adam) Zhang"
let g:vimrc_email="mingpingzhang@163.com"
let g:vimrc_homepage=""

nmap <F4> :AuthorInfoDetect<cr>

"let g:clang_complete_copen=1
"let g:clang_periodic_quickfix=1
"let g:clang_snippets=1
"let g:clang_close_preview=1
"let g:clang_use_library=1
"let g:clang_user_options='-stdlib=libc++ -std=c++11 -IIncludePath'

"autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
"func SetTitle() 
"    "如果文件类型为.sh文件 
"    if &filetype == 'sh' 
"        call setline(1,"\#########################################################################") 
"        call append(line("."), "\# File Name: ".expand("%")) 
"        call append(line(".")+1, "\# Author: Mingping (Adam) Zhang") 
"        call append(line(".")+2, "\# mail: mingpingzhang@163.com") 
"        call append(line(".")+3, "\# Created Time: ".strftime("%Y-%b-%d %X")) 
"        call append(line(".")+4, "\#########################################################################") 
"        call append(line(".")+5, "\#!/bin/bash") 
"        call append(line(".")+6, "") 
"    else 
"        call setline(1, "/*************************************************************************") 
"        call append(line("."), "    > File Name: ".expand("%")) 
"        call append(line(".")+1, "    > Author: Mingping (Adam) Zhang") 
"        call append(line(".")+2, "    > Mail: mingpingzhang@163.com ") 
"        call append(line(".")+3, "    > Created Time: ".strftime("%Y-%b-%d %X")) 
"        call append(line(".")+4, " ************************************************************************/") 
"        call append(line(".")+5, "")
"    endif
"    if &filetype == 'cpp'
""        call append(line(".")+6, "#include<iostream>")
""        call append(line(".")+7, "using namespace std;")
""        call append(line(".")+8, "")
"    endif
"    if &filetype == 'c'
""        call append(line(".")+6, "#include<stdio.h>")
""        call append(line(".")+7, "")
"    endif
"    "新建文件后，自动定位到文件末尾
"    autocmd BufNewFile * normal G
"endfunc 
