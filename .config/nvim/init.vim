"----------------------------------PLUGINS-------------------------------------
call plug#begin() 
"airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes' 
"nerdtree
Plug 'preservim/nerdtree' 
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'shougo/denite.nvim' 
Plug 'tpope/vim-fugitive' 
Plug 'neoclide/coc.nvim' 
Plug 'vim-syntastic/syntastic' 
Plug 'edkolev/tmuxline.vim' 
Plug 'lambdalisue/battery.vim'
call plug#end()


"----------------------------------VIM-AIRLINE-------------------------------------
"add other plugins to statusline
let g:airline#extensions#battery#enabled = 1
let g:airline#extensions#nerdtree_statusline = 1
let g:airline_theme='kanagawa'
let g:airline#extensions#whitespace#enabled = 0
"powerline
let g:airline_symbols = {}
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"----------------------------------NERDTREE-------------------------------------
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
"remaps
nnoremap <C-n> :NERDTree<CR>
"----------------------------------NERDTREE-SYNTAX-HIGHLIGHTING-------------------------------------
" you can add these colors to your .vimrc to help customizing
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

let g:WebDevIconsDefaultFolderSymbolColor = s:beige " sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue " sets the color for files that did not match any rule
"----------------------------------TMUXLINE-------------------------------------
let g:tmuxline_preset={
	\'a'	:	'#H',
	\'b'	:	'#S',
	\'c'	:	'#{pane_current_path}',
	\'win'	:	['#I', '#W'],
	\'cwin'	:	['#I', '#W', '#F'],
	\'x'	:	'#(python3 $HOME/checkbat.py)',
	\'y'	:	'#(uptime | cut -d " " -f 1,2,3)',
	\'z'	:	['%R', '%a', '%m', '%Y']}
let g:tmuxline_theme={
    \   'a'    : [ 0, 231, '' ],
    \   'b'    : [ 231, 10 , ''],
    \   'c'    : [ 231, 2, ''],
    \   'x'    : [ 253, 239, 'bold'],
    \   'y'    : [ 0, 14, 'bold'],
    \   'z'    : [ 231, 6, ''],
    \   'cwin' : [ 231, 1, ''],
    \   'win'  : [ 1, 236, ''],
    \   'bg'   : [ 236, 236, ''],
    \ }

"----------------------------------OPTIONS-------------------------------------
"encoding
set encoding=utf-8
"position in file
set number
set ruler
"search options
set incsearch
set hlsearch
"silent bell
set visualbell
"don't write backups
set nobackup
set nowritebackup
"indenting
set autoindent
set smartindent
set wrap
syntax on
set mouse=a
imap jk <esc>

