" bacic settings
set ts=4
syntax on
set ruler

"set encodings

set fileencoding=utf-8
set fileencodings=utf-8,chinese,latin-1
set termencoding=utf-8
set encoding=utf-8
set autoindent
set mouse=a

"设置ruler 和showmode 可以显示右下角显示行号和 当前模式（插入 选择 行底等） 默认开启
"set ruler
"set showmode
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
"markdown 插件
"Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'
"Plugin 'suan/vim-instant-markdown'
"Plugin 'KabbAmine/vCoolor.vim'
"Plugin 'editorconfig/editorconfig-vim'
"sublime配色
Plugin 'sickill/vim-monokai'
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

"关闭markdown文件折叠
let g:vim_markdown_folding_disabled = 1
"使用monokai的sublime配色
"colorscheme monokai
