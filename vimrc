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

"设置ruler 和showmode 可以显示右下角显示行号和 当前模式（插入 选择 行底等） 默认开启
"set ruler
"set showmode
"高亮显示当前行 列搜索结果
set cursorline
set cursorcolumn
set hlsearch
"set guifont=YaHei\ Consolas\ Hybrid\ 11.5

"设置mapleader 键
let mapleader = "\\"
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

"W means sudo w for permition
command W w !sudo tee % > /dev/null

"load Plugin
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mattn/emmet-vim'
Plugin 'mileszs/ack.vim'
Plugin 'yegappan/grep'
Plugin 'KabbAmine/vCoolor.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'suan/vim-instant-markdown'
"sublime配色
Plugin 'sickill/vim-monokai'
Plugin 'taglist.vim'
Plugin 'winmanager'
Plugin 'simplyzhao/cscope_maps.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'majutsushi/tagbar'
Plugin 'DoxygenToolkit.vim'
call vundle#end()
filetype plugin indent on

if iCanHazVundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  PluginInstall
endif

"map

if has("gui_running")
	"do nothing
	set mouse=a
	"vcoolor runs when gui
	let g:vcoolor_map = "<leader>co"
endif

"turn off erryma/vim-multiple-cursors
let g:multi_cursor_use_default_mapping=0
"插件配置默认关闭vim-markdown的自动折叠（太恶心了）
let g:vim_markdown_folding_disabled = 1
"使用monokai的sublime配色
colorscheme monokai  

"let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_expandabbr_key = '<C-e>'  
"gn go to next file  
"gb go back to the old file
noremap gn :next!<Enter>
noremap gb :prev!<Enter>
"

""ide  模式 打开使用winmannger管理nerdtree 和 taglist
let Tlist_Show_One_File=1  
let Tlist_Exit_OnlyWindow=1
"let  g:winManagerWindowLayout = "FileExplorer|TagList,BufExplorer"
"let g:winManagerWindowLayout = "NERDTree|TagList,BufExplorer"
let g:ide_mode_is_open=0
function OpenIDEmode()
		if 	g:ide_mode_is_open==0
				let g:ide_mode_is_open=1
				"execute "WMToggle"
				execute "NERDTreeToggle"
				execute "TagbarToggle"
				echo "1"
		else
				let g:ide_mode_is_open=0
				execute "NERDTreeToggle"
				execute "TagbarToggle"
				echo "0"
endif
"两个nerd的辅助函数
"TlistToggle
endfunction


noremap <F7> :call OpenIDEmode() <CR>

"leader n m 单行注释和多行注释
map <leader>n <leader>cm
map <leader>m <leader>c<space>
"leader co color open
"粘贴模式
set pastetoggle=<F6>
"for mac
if has("mac")
	map <Command-c> :w !pbcopy<CR><CR>
	map <Command-v> :r !pbpaste<CR><CR>
	set backspace=indent,eol,start
endif


let g:DoxygenToolkit_briefTag_pre="@synopsis  "
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@returns   "
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="Mathias Lorente"
let g:DoxygenToolkit_licenseTag="My own license"
