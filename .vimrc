set nocompatible
syntax on
set nowrap
scriptencoding utf-8
set encoding=utf-8
set path+=**


"""" START Vundle Configuration 

" Disable file type for vundle
filetype off                  " required

" If installed using Homebrew
set rtp+=/usr/local/opt/fzf

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"""""""""""""""""""""
" Plugins
"""""""""""""""""""""

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Utility
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Townk/vim-autoclose'
Plugin 'ryanoasis/vim-devicons'
Plugin 'ervandew/supertab'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

"""
" @note: the command here is Ctrl+P
"""
" If installed using Homebrew
"Plugin '/usr/local/opt/fzf'

"""
" @note: The command here is Ctrl+N
" @link: https://github.com/terryma/vim-multiple-cursors#quick-start
"""
Plugin 'terryma/vim-multiple-cursors'  

"""
" @link: https://github.com/airblade/vim-gitgutter
"""
Plugin 'airblade/vim-gitgutter'

" Programming
Plugin 'vim-syntastic/syntastic'

""" Javascript
Plugin 'pangloss/vim-javascript'

""" Docker
Plugin 'ekalinin/Dockerfile.vim'
Plugin 'kevinhui/vim-docker-tools'

""" Markdown
Plugin 'JamshedVesuna/vim-markdown-preview'

" Themes
Plugin 'ajh17/Spacegray.vim'


call vundle#end()
filetype plugin indent on

"""""""""""""""""""""
" Configurations
"""""""""""""""""""""

set number
set ruler

" Set Proper Tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Always display the status line
set laststatus=2

" Enable highlighting of the current line
set cursorline

" Neocomplete Settings
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
let g:airline_powerline_fonts = 1

" Neocomplete Plugin mappins
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Syntastic Configuration
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1

"""""""""""""""""""""
" Theme Configurations
"""""""""""""""""""""

set t_Co=256
set background=dark

if (has("termguicolors"))
  set termguicolors
endif

let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme spacegray

"""""""""""""""""""""
" Keyboard Mappings
"""""""""""""""""""""

map <C-n> :NERDTreeToggle<CR>
map <C-p> :Files<CR>
map <C-q> :q
map <C-s> :w
map <C-t> :vsplit
map <C-c> :DockerToolsToggle<CR>
map <C-l> :DockerToolsSetHost 192.168.99.100:2376

" OSX stupid backspace fix
set backspace=indent,eol,start

