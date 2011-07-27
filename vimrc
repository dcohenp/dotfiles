" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

call pathogen#runtime_append_all_bundles()

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Don't use Ex mode, use Q for formatting
map Q gq

" have syntax highlighting in terminals which can display colours:
if has('syntax') && (&t_Co > 2)
        syntax enable
        
        "highlight Pmenu      ctermbg=grey ctermfg=black
        "highlight PmenuSel   cterm=bold,reverse ctermbg=black ctermfg=yellow
        "highlight PmenuSbar  ctermbg=blue
        "highlight PmenuThumb ctermfg=lightblue
        
        let c_gnu          = 1
        let c_space_errors = 1
    
endif

"" have command-line completion <Tab> (for filenames, help topics, option names)
"" first list the available options and complete the longest common part, then
"" have further <Tab>s cycle through the possibilities:
set wildmode=list:longest,full

"" when using list, keep tabs at their full width and display `arrows':
" (Character 187 is a right double-chevron, and 183 a mid-dot.)
"execute 'set listchars+=tab:' . nr2char(187) . nr2char(183)

"" have the mouse enabled all the time:
if has('mouse')
  set mouse=a
  set ttymouse=xterm2
endif

"" don't make it look like there are line breaks where there aren't:
set nowrap

"" use indents of 2 spaces, and have them copied down lines:
set shiftwidth=2
set tabstop=8
set softtabstop=2
set shiftround
set smarttab
set expandtab

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

  " When using multiple windows, set a minimum width and height
  autocmd VimEnter *
    \ set winheight=60 winwidth=90 winminwidth=10 winminheight=10

  augroup END

else
  " always set autoindenting on
  set autoindent
endif " has("autocmd")

" normally don't automatically format `text' as it is typed, only do this
" with comments
set formatoptions-=t 

"" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase

"" use <Ctrl>+N/<Ctrl>+P to cycle through files:
nnoremap <C-N> :next<CR>
nnoremap <C-P> :prev<CR>
" [<Ctrl>+N by default is like j, and <Ctrl>+P like k.]

"" Show line numbers
set number

"" Always show the statusline
set laststatus=2

"" have <Tab> (and <Shift>+<Tab> where it works) change the level of
"" indentation:
"inoremap <Tab> <C-T>
"inoremap <S-Tab> <C-D>
"" [<Ctrl>+V <Tab> still inserts an actual tab character.]

"" Highlight searched patterns
set hlsearch

"" Press Space to turn off highlighting and clear any messages already
"" displayeds
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR> 


"" Estas tres lineas definen comandos ficticios para "Q", "W" y "Wq" que
"" equivalen respectivamente a "q", "w" y "wq".
command! -bang W write<bang>
command! -nargs=0 -bang Q q<bang>
command! -nargs=0 -bang Wq wq<bang>
command! -nargs=0 -bang Qa qa<bang>
command! -nargs=0 -bang Wqa wqa<bang>
command! -nargs=0 -bang WQa wqa<bang>

"" Por defecto se usan las combinaciones de teclas "Ctrl-N" y "Ctrl-P" para
"" autocompletar texto. Esta funcion hace una reasignacion de teclas para
"" poder completar usando el tabulador.
"function InsertTabWrapper()
"    let col = col('.') - 1
"    if !col || getline('.')[col - 1] !~ '\k'
"        return "\<tab>"
"    else
"        return "\<c-p>"
"    endif
"endfunction
"
"inoremap <Tab> <C-R>=InsertTabWrapper()<CR>

"set list
"set listchars=tab:>.

"" Pulsando "%" (es decir: Mayusculas-5) se puede saltar entre los pares de
"" corchetes, llaves y parentesis. Cargando "matchit" podemos usar esa misma
"" tecla para saltar entre los grupos de palabras "if else endif", "begin end"
"" y sentencias similares de cada lenguaje de programacion.
runtime! macros/matchit.vim

"" use 'vim -t <funtion_name>' or 'vim -t <filename>':
set tags=$RVR/syn/mainsh/tags
"set tags=$RVR_ICC/syn/icc_sh/tags

"set verbose=9

"" virtualedit permite situar el cursor en posiciones de la pantalla donde
"" no hay texto 
"set virtualedit=all

" Map \v to open a new tab and edit this .vimrc file. Use \V to load it.
map \v :tabnew $MYVIMRC<CR><C-W> 
map <silent> \V :source $MYVIMRC<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Use \h and \l to move between tabs
map \h :tabprevious<CR>
map \l :tabnext<CR>

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

if exists("*strftime")
  " Map \d to insert the current date
  nnoremap \d "=strftime("%b %d, %Y")<CR>P 
  inoremap \d <C-R>=strftime("%b %d, %Y")<CR> 
endif

"" Configuracion especifica para vimdiff o vim -d
if &diff 
  colorscheme josee
  set nonumber 
  set diffopt=filler,iwhite

endif

"" Para que, al hacer diff dentro de Vi, el split sea vertical por defecto,
"" junto con las settings antes definidas
set diffopt=filler,iwhite,vertical

" When vertically splitting the window, make the new window appear on the right
set splitright

" When horizontally splitting the window, make the new window appear below
set splitbelow

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

fixdel

