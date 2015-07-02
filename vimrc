" bacic settings
set ts=4
syntax on

"set encodings

:set fileencoding=utf-8
set fileencodings=utf-8,chinese,latin-1
set termencoding=utf-8
set encoding=utf-8
set autoindent
set mouse=a
" Bundle settings
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
  	echo "Installing Vundle..."
  	echo ""
  	silent !mkdir -p ~/.vim/bundle
  	silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
	
	"vundle install
	set nocompatible 
	filetype off 
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
		Plugin 'gmarik/Vundle.vim'
		Plugin 'scrooloose/nerdtree'
		call vundle#end() 
   	 filetype plugin indent on 
	"vundle map
		map <F7> :NERDTreeMirror<CR>
		map <F7> :NERDTreeToggle<CR> 
	"vundle end
	"PluginInstall
		PluginInstall
  let iCanHazVundle=0
endif

if has("gui_running")
	"do nothing
endif
