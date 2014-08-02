scriptencoding utf-8

execute pathogen#infect()

" editor font
set guifont=Consolas:h10:cDEFAULT
set encoding=utf-8

" syntax highlighting on
syntax on

" window size
"set lines=69 columns=120

" No tool bar in GUI
set guioptions-=T

" ignore pattern for wildcards
set wildignore=

" tab stops
set tabstop=4
set shiftwidth=4
set backspace=indent,eol,start

" buffer switching with <tab> and <shift>-<tab>
nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <S-Tab> :bp<CR>
" allow switching of modified buffers by autowriting them
set autowrite

" show BufExplorer with <F12>
nnoremap <silent> <F12> :BufExplorer<CR>

" show SessionList with <F11>
nnoremap <silent> <F11> :SessionList<CR>

" Append modeline after last line in buffer.
" Use substitute() (not printf()) to handle '%%s' modeline in LaTeX files.
function! AppendModeline()
	let save_cursor = getpos('.')
	let append = ' vim: set ts='.&tabstop.' sw='.&shiftwidth.' tw='.&textwidth.': '
	$put =substitute(&commentstring, '%s', append, '')
	call setpos('.', save_cursor)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" omni completion
if has("autocmd") && exists("+omnifunc")
autocmd Filetype *
	\	if &omnifunc == "" |
	\		setlocal omnifunc=syntaxcomplete#Complete |
	\	endif
endif

" persistent undo
au BufReadPre C:/MSE/* setlocal undofile
au BufReadPre C:/home/* setlocal undofile
set undodir=C:/home/vimundo/,.
set undolevels=1000
set undoreload=10000

" line numbers
set number

" colored column at 76 chars
"set colorcolumn=76

" highlight current line, no cursor blinking
set cursorline
set guicursor=a:blinkon0

" spell checking
" set spell
" no spell checking
set nospell

" incremental search
set incsearch

" edit line always 2 lines away from edge
set scrolloff=2

" command line filename matching
set wildmode=longest,list

" auto indentation
set smartindent

" auto change dir to file in buffer
" set autochdir

" color scheme
colorscheme wombat

" ftplugin on - e.g. for python_flake8
filetype plugin on

" status line
set laststatus=2
set statusline=[%2n]\ %<%F%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}\ %1*%M%*%R%H\ %-19(%3l,%02c%6p%%%)
hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red

" Display tabs using '▸ ' (Unicode 25B8 00A0), and
" trailing white space using ˽ (Unicode 02FD)
" Other characters :
"    · (Unicode 00B7)
"    ‼ (Unicode 203C)
"    ▸ (Unicode 25B8)
"    ˽ (Unicode 02FD)

set list
set listchars=tab:▸ 
set listchars+=trail:˽


" ctrlp plugin
let g:ctrlp_cmd='CtrlPMixed'
