" bacic settings
set ts=4
syntax on
set ruler

"set encodings

:set fileencoding=utf-8
set fileencodings=utf-8,chinese,latin-1
set termencoding=utf-8
set encoding=utf-8
set autoindent
set mouse=a

" Bundle settings
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme)
  	echo "Installing Vundle..."
  	echo ""
  	silent !mkdir -p ~/.vim/bundle
  	silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/Vundle.vim
    let iCanHazVundle=0
endif

"W for permition 
command W w !sudo tee % > /dev/null

"load Plugin
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mattn/emmet-vim'
Plugin 'mileszs/ack.vim'
Plugin 'yegappan/grep'
call vundle#end()
filetype plugin indent on

if iCanHazVundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  PluginInstall
endif

"map
map <F7> :NERDTreeMirror<CR>
map <F7> :NERDTreeToggle<CR> 

if has("gui_running")
	"do nothing
endif
