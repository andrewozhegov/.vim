
"         _
"  __   _(_)_ __ ___  _ __ ___
"  \ \ / / | '_ ` _ \| '__/ __|
"   \ V /| | | | | | | | | (__
"    \_/ |_|_| |_| |_|_|  \___|
"

set nocompatible              " be iMproved, required
filetype off                  " required


"  Vundle Plugins

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Functionality plugins
Plugin 'tpope/vim-surround'

" Navigation plugins
Plugin 'wincent/command-t'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'christoomey/vim-tmux-navigator'

" Development tools
Plugin 'Valloric/YouCompleteMe'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-syntastic/syntastic'
Plugin 'sgur/vim-gitgutter'
Plugin 'mhinz/vim-signify'
Plugin 'tpope/vim-commentary'
Plugin 'ekalinin/dockerfile.vim'

" Decoration plugins
Plugin 'morhetz/gruvbox'
Plugin 'ryanoasis/vim-devicons'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()
filetype plugin indent on


" General settings

syntax on
set number
set noswapfile
set splitbelow	    " open files in splitscreen below
set splitright	    " open files in splitscreen on right
set encoding=UTF-8
colorscheme gruvbox

set expandtab	    " use spaces instead of tabs
set shiftwidth=4
set smarttab
set smartindent
set tabstop=4	    " one tab equals four spacesset splitbelow

set mouse=a	        " enable full mouse support + wheel scrolling
set ttymouse=xterm2 " enable splits resizing by mouse
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

set wildmode=longest:list,full	" comandline autocompletion

let &colorcolumn=&textwidth	" highlight max line width
highlight ColorColumn ctermbg=darkgray


" Use system clipboard
" Required +xterm_clipboard
" Install vim-gui-common package

set clipboard=unnamed

" Search settings

set hlsearch	" highlite search
set incsearch	" realtime search
set ic		" ignore character case while search
set hls		" highlight search results
set is		" ability to get next search result

" Gruvbox theme settings

set background=dark    " Setting dark mode
let g:gruvbox_contrast_dark = 'soft'


" airline symbols

let g:airline_theme='gruvbox' 
let g:airline_powerline_fonts = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


" DevIcons

let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1


" NERDtree settings

map <c-n> :NERDTreeToggle<cr>	


" run NERDtree if vim been runned without file specified
autocmd StdinReadPre * let s:std_in=1	
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


" TagbarToggle (class tree) settings

nmap <F6> :TagbarToggle<CR>


" Open list of buffers by Ctrl + b

nnoremap <C-b> :Buffers<CR>


" Syntastic settings

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


" fzf settings

command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)


for addon in split(globpath("~/.vim/addons", "*.vim"), '\n')
    execute('source '.addon)
endfor
