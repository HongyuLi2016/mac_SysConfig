set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
"
" Power Line
Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" Powerline setup
"set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 18
set laststatus=2

"NerdTree
Bundle 'scrooloose/nerdtree'
"Python Mode
Bundle 'klen/python-mode'
"Python autocompletion
Plugin 'davidhalter/jedi-vim'
Plugin 'ervandew/supertab'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"
augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
    augroup END
"
"

"turn on file explorer
map <F2> :NERDTreeToggle<CR>
"auto run python3
nnoremap <silent> <F5> :!clear;python3 %<CR>
"auto run python2.7
nnoremap <silent> <F6> :!clear;python %<CR>

" Python-mode
" Activate rope
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 1


let g:jedi#popup_on_dot = 0
"let g:jedi#use_tabs_not_buffers = 1
let g:jedi#completions_command = "<C-N>"
autocmd FileType python setlocal completeopt-=preview
let g:jedi#show_call_signatures = "0"

let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"


" lhy configuration
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set number
set expandtab  " turns <TAB>s into spaces
" set relativenumber
set ruler
set cursorline
" set guifont=Menlo\ Italic:h20
set guifont=Source\ Code\ Pro\ Semibold:h20
"set showcmd             " show command in bottom bar
set splitbelow
set splitright
colorscheme solarized
setlocal textwidth=79
set wildmenu            " visual autocomplete for command menu
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
nnoremap <silent> <leader><space> :nohlsearch<CR>
set foldlevelstart=1
"nnoremap <space> za
" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" highlight last inserted text
" nnoremap gV `[v`]
let mapleader=","       " leader is comma
