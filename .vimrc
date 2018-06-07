""""""""""""""""""" GENERAL """"""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""
"set encoding=utf8
set colorcolumn=81
set nocompatible          " be iMproved, required
filetype off              " required
syntax enable
set backspace=indent,eol,start

" Terminal color config
"set t_Co=256
"set t_8f=[38;2;%lu;%lu;%lum
"set t_8b=[48;2;%lu;%lu;%lum
"set termguicolors

let mapleader = ","
set noswapfile
set nu
set tabstop=2       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=2    " Indents will have a width of 4

set softtabstop=2   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces
set cul
set laststatus=2

""""""""""" NERDTREE AND SILVER SEARCH """"""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'
" Use ag because it's lightning fast and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden'.
       \  ' --ignore .git '.
             \  ' --ignore _build'.
                   \  ' --ignore node_modules'.
                         \  ' -g ""'
let g:ctrlp_use_caching = 0 " ag is fast enough so cache isn't needed

nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>
nmap <leader>g :IndentGuidesToggle<CR>
nmap <leader>i ggVG=<C-o><C-o>zz

let hlstate=0
let NERDTreeQuitOnOpen =  0
let NERDTreeShowHidden =  1
"let g:NERDTreeWinSize  = 25

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
inoremap jk <esc>

"""""""""""""""""""""" VUNDLE """"""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'sheerun/vim-polyglot'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-scripts/EasyGrep'
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/tpope-vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'ggreer/the_silver_searcher'
Plugin 'airblade/vim-gitgutter'
Plugin 'jpo/vim-railscasts-theme'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'itchyny/lightline.vim'
Plugin 'ervandew/supertab'
Plugin 'morhetz/gruvbox'
Plugin 'dracula/vim'
Plugin 'beigebrucewayne/hacked_ayu.vim'
Plugin 'beigebrucewayne/Turtles'
Plugin 'hzchirs/vim-material'
Plugin 'skielbasa/vim-material-monokai'
Plugin 'ajmwagar/vim-deus'
Plugin 'kudabux/vim-srcery-drk'
Plugin 'NewProggie/NewProggie-Color-Scheme'
Plugin 'exitface/synthwave.vim'
Plugin 'ayu-theme/ayu-vim'
Plugin 'carakan/new-railscasts-theme'
Plugin 'liuchengxu/space-vim-dark'
Plugin 'rhysd/vim-color-spring-night'
Plugin 'hauleth/blame.vim'
Plugin 'vim-scripts/dante.vim'
Plugin 'nightsense/simplifysimplify'
Plugin 'nightsense/office'
Plugin 'nightsense/seagrey'
Plugin 'nightsense/vrunchbang'
Plugin 'nightsense/carbonized'
Plugin 'nightsense/forgotten'
Plugin 'fneu/breezy'
Plugin 'davidklsn/vim-sialoquent'
Plugin 'arcticicestudio/nord-vim'
Plugin 'monkoose/boa.vim'
Plugin 'davb5/wombat256dave'
Plugin 'KeitaNakamura/neodark.vim'
Plugin 'tyrannicaltoucan/vim-quantum'
Plugin 'mbbill/vim-seattle'
Plugin 'chriskempson/base16-vim'
Plugin 'colepeters/spacemacs-theme.vim'
Plugin 'YorickPeterse/happy_hacking.vim'
Plugin 'rakr/vim-two-firewatch'
Plugin 'tyrannicaltoucan/vim-deep-space'
Plugin 'joshdick/onedark.vim'
Plugin 'scwood/vim-hybrid'
Plugin 'AlessandroYorba/Sierra'
Plugin 'junegunn/vim-easy-align'
Plugin 'ryanoasis/vim-devicons'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'stephenmckinney/vim-dochub'
Plugin 'vim-syntastic/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'rking/ag.vim'
Plugin 'slashmili/alchemist.vim'


" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
set runtimepath^=~/.vim/bundle/ag
cab ag Ag

set mouse=a
set updatetime=300

set splitbelow
set splitright

let g:polyglot_disabled = ['jsx']

autocmd BufWritePre * StripWhitespace

""""  VIM DEVICONS
" ctrlp glyphs
let g:webdevicons_enable_ctrlp = 1
" use double-width(1) or single-width(0) glyphs
" only manipulates padding, has no effect on terminal or set(guifont) font
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
" whether or not to show the nerdtree brackets around flags
let g:webdevicons_conceal_nerdtree_brackets = 0
" the amount of space to use after the glyph character (default ' ')
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
" Force extra padding in NERDTree so that the filetype icons line up vertically
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

" adding the flags to NERDTree
let g:webdevicons_enable_nerdtree = 1

let g:lightline = {
      \ 'component_function': {
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \ }
      \ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

" NERDTress File highlighting only the glyph/icon
" test highlight just the glyph (icons) in nerdtree:
autocmd filetype nerdtree highlight haskell_icon ctermbg=none ctermfg=Yellow guifg=#ffa500
autocmd filetype nerdtree highlight html_icon ctermbg=none ctermfg=Yellow guifg=#ffa500
autocmd filetype nerdtree highlight go_icon ctermbg=none ctermfg=Yellow guifg=#ffa500
autocmd filetype nerdtree highlight yml_icon ctermbg=none ctermfg=Magenta guifg=#EEEE00
autocmd filetype nerdtree highlight config_icon ctermbg=none ctermfg=White guifg=#DDDD00
autocmd filetype nerdtree highlight conf_icon ctermbg=none ctermfg=White guifg=#FFFF00
autocmd filetype nerdtree highlight json_icon ctermbg=none ctermfg=Yellow guifg=#FF7F24
autocmd filetype nerdtree highlight html_icon ctermbg=none ctermfg=Green guifg=#ffc125
autocmd filetype nerdtree highlight css_icon ctermbg=none ctermfg=Blue guifg=#87cefa
autocmd filetype nerdtree highlight coffee_icon ctermbg=none ctermfg=Yellow guifg=#cd3700
autocmd filetype nerdtree highlight js_icon ctermbg=none ctermfg=Blue guifg=#ffa500
autocmd filetype nerdtree highlight php_icon ctermbg=none ctermfg=Magenta guifg=#ff00ff
autocmd filetype nerdtree highlight gitconfig_icon ctermbg=none ctermfg=White guifg=#fff5ee
autocmd filetype nerdtree highlight gitignore_icon ctermbg=none ctermfg=White guifg=#fff5ee
autocmd filetype nerdtree highlight bashrc_icon ctermbg=none ctermfg=White guifg=#686868
autocmd filetype nerdtree highlight bashprofile_icon ctermbg=none ctermfg=White guifg=#686868
autocmd filetype nerdtree highlight python_icon ctermbg=none ctermfg=Blue guifg=#686868
autocmd filetype nerdtree highlight ruby_icon ctermbg=none ctermfg=Red guifg=#FF0000

autocmd filetype nerdtree syn match haskell_icon ## containedin=NERDTreeFile
" if you are using another syn highlight for a given line (e.g.
" NERDTreeHighlightFile) need to give that name in the 'containedin' for this
" other highlight to work with it
autocmd filetype nerdtree syn match html_icon ## containedin=NERDTreeFile,html
autocmd filetype nerdtree syn match go_icon ## containedin=NERDTreeFile
autocmd filetype nerdtree syn match gitignore_icon ## containedin=NERDTreeFile
autocmd filetype nerdtree syn match gitconfig_icon ## containedin=NERDTreeFile
autocmd filetype nerdtree syn match yml_icon ## containedin=NERDTreeFile
autocmd filetype nerdtree syn match json_icon ## containedin=NERDTreeFile
autocmd filetype nerdtree syn match css_icon ## containedin=NERDTreeFile
autocmd filetype nerdtree syn match coffee_icon ## containedin=NERDTreeFile
autocmd filetype nerdtree syn match js_icon ## containedin=NERDTreeFile
autocmd filetype nerdtree syn match python_icon ## containedin=NERDTreeFile
autocmd filetype nerdtree syn match php_icon ## containedin=NERDTreeFile
autocmd filetype nerdtree syn match bashprofile_icon ## containedin=NERDTreeFile
autocmd filetype nerdtree syn match ruby_icon ## containedin=NERDTreeFile

" VIM Devicons bugfix
" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

" Syntastic
" set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_mode_map = { 'passive_filetypes': ['java'] }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

autocmd BufNewFile,BufRead *.js.coffee set filetype=coffee
autocmd BufNewFile,BufRead *.ex set filetype=elixir
autocmd BufNewFile,BufRead *.eex set filetype=elixir
autocmd BufNewFile,BufRead *.exs set filetype=elixir

hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
let g:indent_guides_guide_size=1

let g:neodark#terminal_transparent = 1 " default: 0
let g:lightline.colorscheme = 'neodark'
let g:space_vim_dark_background = 234

set background=dark
colorscheme onedark

