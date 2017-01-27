" lhy configuration
if has('gui_running')
    let $PYTHONHOME="/Library/Frameworks/Python.framework/Versions/3.6"
    set pythonthreedll=/Library/Frameworks/Python.framework/Versions/3.6/lib/libpython3.6m.dylib
    py3 None
endif
set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8
set number
"set number background=dark
set tabstop=4    
set softtabstop=4
set expandtab  " turns <TAB>s into spaces
" set relativenumber
set ruler
set cursorline
" set guifont=Menlo\ Italic:h20
set guifont=Source\ Code\ Pro\ Semibold:h20
"set showcmd             " show command in bottom bar
"set splitbelow
set splitright
set background=dark
if has('gui_running')
    let g:solarized_diffmode="high"
    let g:solarized_visibility="high"
    colorscheme solarized
    
else
    "let g:solarized_diffmode="high"
    "let g:solarized_visibility="high"
    colorscheme badwolf
    highlight Comment    ctermfg=01DD00
    highlight Identifier ctermfg=99AA00
    syntax on
    "let g:solarized_termcolors=256
endif

setlocal textwidth=79
set wildmenu            " visual autocomplete for command menu
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

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
nnoremap <silent> <leader><space> :nohlsearch<CR>



" Vundle config
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
"Plugin 'davidhalter/jedi-vim'
"Plugin 'ervandew/supertab'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"
" augroup vimrc_autocmds
"     autocmd!
"     " highlight characters past column 120
"     autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
"     autocmd FileType python match Excess /\%120v.*/
"     autocmd FileType python set nowrap
"     augroup END
"
"

"turn on file explorer
map <F2> :NERDTreeToggle<CR>
"auto run python3
nnoremap <silent> <F5> :!clear;python3 %<CR>
"auto run python2.7
nnoremap <silent> <F6> :!clear;python2.7 %<CR>
nnoremap <silent> <F9> :PymodeLintAuto <CR>

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
"
"
let g:pymode = 1
let g:pymode_options = 1
let g:pymode_options_max_line_length = 79
let g:pymode_options_colorcolumn = 1
"let g:pymode_quickfix_minheight = 3
"let g:pymode_quickfix_maxheight = 6
if has('gui_running')
    let g:pymode_python = 'python3'
endif

"Turn off the run code script
let g:pymode_run = 0
let g:pymode_run_bind = '<leader>r'
" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_unmodified = 1
"Show error message if cursor placed at the error line
let g:pymode_lint_message = 1
"let g:pymode_lint_checker = ['pylint', 'pyflakes', 'pep8', 'mccabe']
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_sort = ['E', 'C', 'I']
let g:pymode_lint_cwindow = 1
" Auto check on save
"let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" Rope
let g:pymode_rope = 0
let g:pymode_rope_regenerate_on_write = 0

"Turn on code completion support in the plugin
let g:pymode_rope_completion = 1
"let g:pymode_rope_complete_on_dot = 1
let g:pymode_rope_lookup_project = 0
let g:pymode_rope_autoimport_modules = ['os', 'shutil', 'datetime']
let g:pymode_rope_autoimport = 1
let g:pymode_rope_completion_bind = "<C-Space>"

" find defination
let g:pymode_rope_goto_definition_bind = '<C-g>'
let g:pymode_rope_goto_definition_cmd = 'vnew'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_syntax_highlight_equal_operator = g:pymode_syntax_all

" autofold code
let g:pymode_folding = 1

"Jedi config
let g:jedi#popup_on_dot = 0
"let g:jedi#use_tabs_not_buffers = 1
"let g:jedi#completions_command = "<C-N>"
autocmd FileType python setlocal completeopt-=preview
let g:jedi#show_call_signatures = "0"

let g:jedi#goto_command = ""
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
