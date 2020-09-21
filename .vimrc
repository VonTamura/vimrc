" ---------------------------------------------------------------------------
" General
"---------------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" --------------------------------------------------------------------------
" Vundle
" --------------------------------------------------------------------------
"Default
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}


"Personal Plugins
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-ruby/vim-ruby'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'  " check youre syntax errors
Plugin 'kien/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'sonicpi.vim'
Plugin 'ericbn/vim-relativize'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'scrooloose/nerdcommenter'
Plugin 'gregsexton/matchtag'
Plugin 'ryanoasis/vim-devicons'
Plugin 'ivalkeen/nerdtree-execute'
Plugin 'ferranpm/vim-autopairs'
Plugin 'elixir-lang/vim-elixir'

"Langs
Plugin 'othree/yajs.vim'
"Plugin 'pangloss/vim-javascript'

"Colors
Plugin 'dracula/vim', { 'name': 'dracula' }




" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" ----------------------------------------------------------------------------
" Config 
" ----------------------------------------------------------------------------

"Airline
let g:airline#extensions#tabline#enabled = 1

"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_Ruby_exec = 'path/to/ruby/executable'
let g:syntastic_javascript_checkers = ['standard']
let g:syntastic_html_tidy_exec = 'tidy5'
"javascript syntax
let g:javascript_plugin_flow = 1


"Relativize
set number
set mouse+=a

"colorscheme
syntax on
colorscheme dracula

"Search
:set hlsearch
:set incsearch

"NerdFont
set encoding=utf-8
" ---------------------------------------------------------------------------
"  Open URL on current line in browser
" ---------------------------------------------------------------------------

"function! Browser ()
"  let line0 = getline (".")
"  let line = matchstr (line0, "http[^ )]*")
"  let line = escape (line, "#?&;|%")
"  exec ':silent !open ' . "\"" . line . "\""
"endfunction
"map <F2> :call Browser ()<CR>

" ----------------------------------------------------------------------------
" Map 
" ----------------------------------------------------------------------------
" Open Nerdtree
map ,n :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "right"
let NERDTreeMapOpenInTab='\r'
"autocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif
function! NERDTreeToggleInCurDir()
  " If NERDTree is open in the current buffer
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
  else
    if (expand("%:t") != '')
      exe ":NERDTreeFind"
    else
      exe ":NERDTreeToggle"
    endif
  endif
endfunction

" nnoremap <leader>nf :NERDTreeFind<cr>
nmap <C-n> :call NERDTreeToggleInCurDir()<cr>

" ----------------------------------------------------------------------------
" Keybinding 
" ----------------------------------------------------------------------------
"  Copy on clipboar
vmap <F1> :w !pbcopy<CR><CR>
" Open current file on chrome
nnoremap <F2> :!open %<CR><CR>


" NERDTrees File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')
call NERDTreeHighlightFile('rb', 'Red', 'none', '#686868', '#151515')



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

" NERDTress File highlighting
