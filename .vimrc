filetype plugin indent on

let mapleader=","

colorscheme elflord " good starting color scheme

syntax enable " enable syntax highlighting

set background=dark

set number " show line numbers

set showcmd " shows current command in bottom right

" set cursorline " highlight current line

set wildmenu " visual autocomplete for command menu

set lazyredraw " only redraw when we need to for performance

set noshowmatch " no highlight matching [{()}]

set incsearch " search as characters are entered 

set nohlsearch " don't highlight search results

set smartcase " only uses case sensitive searching if one or more uppercase characters are used

set visualbell " sets the bell to be 'visual' instead of making a sound (visual bell does nothing in windows bash)

augroup run "run currently edited program with <leader> + r
	autocmd!
	autocmd FileType python nnoremap <buffer> <leader>r :w<CR>:!clear;python3 %<CR>
	autocmd FileType c nnoremap <buffer> <leader>r :w<CR>:!clear;gcc % -std=c99 -Wall -Wconversion -lm -o %:r_vimcompiled;./%:r_vimcompiled;rm %:r_vimcompiled<CR>
	autocmd FileType cpp nnoremap <buffer> <leader>r :w<CR>:!clear;g++ % -std=c++11 -Wall -lm -o %:r_vimcompiled;./%:r_vimcompiled;rm %:r_vimcompiled<CR>
	autocmd FileType lisp nnoremap <buffer> <leader>r :w<CR>:!clear;clisp -i %<CR>
	autocmd FileType javascript nnoremap <buffer> <leader>r :w<CR>:!clear;nodejs %<CR>
	autocmd FileType asm nnoremap <buffer> <leader>r :w<CR>:!clear;nasm % -o %:r.bin<CR>
	autocmd FileType java nnoremap <buffer> <leader>r :w<CR>:!clear;javac %; java %:r<CR>
augroup END

" maps Y to yank to end of line, instead of yank entire line
noremap Y y$

" use <leader> + w to write file
noremap <leader>w :w<CR>

if empty(glob('~/.vim/autoload/plug.vim')) " install vim-plug if it doesn't already exist
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

call plug#end()
