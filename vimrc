
"windows
set runtimepath+=~/.vim
source $VIMRUNTIME/delmenu.vim  
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
source $VIMRUNTIME/delmenu.vim  


"set runpath
" bacicnnn
set ts=4
syntax on

"set encodings

set fileencoding=utf-8
set fileencodings=utf-8,chinese,latin-1
set termencoding=utf-8
set encoding=utf-8
set autoindent

"设置ruler 和showmode 可以显示右下角显示行号和 当前模式（插入 选择 行底等） 默认开启
set ruler
set showmode
"设置宽提示命令模式下的补全更好用
set wildmenu
"高亮显示当前行 列搜索结果
set cursorline
set cursorcolumn
set hlsearch
"set guifont=YaHei\ Consolas\ Hybrid\ 11.5
"新建splite窗口默认出现在下面 上面很不习惯
set splitbelow

"设置mapleader 键
let mapleader = "\\"

"粘贴模式
set pastetoggle=<F5>
"gn go to next file  
"gb go back to the old file
nnoremap gn :bNext!<CR>
nnoremap gb :bprev!<CR>
"gm{a-z}  标记为书签{a-z}  而m 为书签插件的书签 gma 记录书签标记为a  ma 是列出书签
nnoremap gm m
function FormatCode()
		execute  "normal ggVG="
endfunction 
"W means sudo w for permition
command W w !sudo tee % > /dev/null
 
"for long lines 
nnoremap j gj
nnoremap k gk
"no plugin_settings"
"
" Bundle settings
let iCanHazVundle=1
let has_mac_fcitx_for_mac=1
"let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
"let vundle_readme=expand('~/.vim/bundle/junegunn/vim-plug/README.md')
"if !filereadable(vundle_readme)
"  	echo "Installing Vundle..."
"  	echo ""
"  	silent !mkdir -p ~/.vim/bundle
"  	"silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/Vundle.vim
"  	silent !git clone https://github.com/junegunn/vim-plug.git  ~/.vim/bundle/vim-plug
"    let iCanHazVundle=0
"endif

let auto_plug_file=expand('~/.vim/autoload/plug.vim')
if !filereadable(auto_plug_file)
	echo "Install plug"
	silent !mkdir ~/.vim/autoload
	silent !mkdir ~/.vim/bundle
	"silent !curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim  2> /dev/null
	silent !curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim  > /dev/null
	let iCanHazVundle=0
endif

"for paste
"gc 可以切换用p粘贴的空寄存器 和用<C-v>粘贴的*寄存器 的reg为列模式然后可以直接进行列粘贴
nnoremap gc :call Set_mode_v_paste()<CR>
function Set_mode_v_paste()
	let a:tmp=getregtype('*')
	call setreg(@*,@*,'b')
	normal! "*p 
	call setreg(@*,@*,a:tmp)
endfunction

"load Plugin
"Plug 'neomake/neomake'
"Plug 'tracyone/neomake-multiprocess'
set nocompatible
filetype off
"set rtp+=~/.vim/bundle/vim-plug
call plug#begin("~/.vim/bundle")
"Plug 'gmarik/Vundle.vim'
Plug 'scrooloose/nerdtree'
Plug 'terryma/vim-multiple-cursors'
Plug 'mattn/emmet-vim'
Plug 'mileszs/ack.vim'
Plug 'yegappan/grep'
Plug 'KabbAmine/vCoolor.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'plasticboy/vim-markdown'
Plug 'jlanzarotta/bufexplorer'
Plug 'suan/vim-instant-markdown'
"for 异步搜索
Plug 'neomake/neomake'
Plug 'tracyone/neomake-multiprocess'
"sublime配色
Plug 'sickill/vim-monokai'
Plug 'vim-scripts/taglist.vim'
"Plug 'winmanager'
"Plug 'simplyzhao/cscope_maps.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"ctrl-p 已经不维护了 unite.vim 代替
"Plug 'kien/ctrlp.vim'
Plug 'kshenoy/vim-ctrlp-args'
Plug 'scrooloose/syntastic'
"ale 支持vim8.0 的异步 比 syntastic 快很多
"Plug 'w0rp/ale'
Plug 'vim-scripts/project.tar.gz'
Plug 'Lokaltog/vim-easymotion'
Plug 'vim-scripts/a.vim'
Plug 'nelstrom/vim-qargs'
"Plug 'luochen1990/rainbow'
"这个rainbow插件在某些时候回导致vim卡住 
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'yujiaao100/vim-smartcopy'
Plug 'severin-lemaignan/vim-minimap'
Plug 'rosenfeld/conque-term'
"vim 8.0异步执行特性
Plug 'skywind3000/asyncrun.vim'
"文件搜索 Shougo/denite.nvim 还没开发完成 
Plug 'Yggdroot/LeaderF', { 'do': './install.bat' }
Plug 'Shougo/unite.vim'
"test
Plug 'Shougo/denite.nvim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/vimshell.vim'
"Plug 'Shougo/neocomplete.vim'
Plug 'maralla/completor.vim'
"Plug 'prabirshrestha/asyncomplete.vim' 还有一个类似的 没有测试过 先标记在这里
"for lua
Plug 'xolox/vim-misc'
Plug 'xolox/vim-lua-ftplugin'
Plug 'yujiaao100/lua-support'
Plug 'vim-scripts/luarefvim'
Plug 'vim-scripts/DfrankUtil'
Plug 'vim-scripts/vimprj'
"Dash 插件
Plug 'rizzatti/dash.vim'
Plug 'junegunn/vim-emoji'
Plug 'godlygeek/tabular'
"Plug 'Ignotus/vim-cmake-project'
Plug 'airblade/vim-gitgutter'
"Plug 'yujiaao100/vim-cmake-project'
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
"nerd 字体库  太大了 就不安装了
"Plug 'ryanoasis/nerd-fonts'
Plug 'leafgarland/typescript-vim'
Plug 'othree/csscomplete.vim'
Plug 'python-mode/python-mode'
"Plug 'davidhalter/jedi-vim'
"I can use 一个css兼容性测试扩展
Plug 'zoeesilcock/vim-caniuse'
"for ts
Plug 'Quramy/tsuquyomi'
"Plug 'sigidagi/vim-cmake-project'
Plug 'benmills/vimux'
"https://github.com/luzhlon/popup.vim
"弹出插件（带测试）
"Plug 'MattesGroeger/vim-bookmarks'
"Plug 'hjdivad/vimlocalhistory'

"Plug 'KabbAmine/zeavim.vim', {'on': [
            "\   'Zeavim', 'Docset',
            "\   '<Plug>Zeavim',
            "\   '<Plug>ZVVisSelection',
            "\   '<Plug>ZVKeyDocset',
            "\   '<Plug>ZVMotion'
            "\ ]}
call plug#end()
filetype plugin indent on

if iCanHazVundle == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  PlugInstall
endif


if has("gui_running")
	"do nothing
	set mouse=a
	"vcoolor runs when gui
	if has("mac")
	
	"mac 保存桌面 ：WW
		command WW browse confirm w ~/Desktop 
		"open -a MacVim.app 11.txt
		"open -a Google\ Chrome 
		nnoremap <F6> :!open -a Google\ Chrome %<CR><CR>
	else
		command WW browse confirm w  
	endif
	let g:vcoolor_map = "<leader>co"
	"define menu
	try
			menu Useful.IDEModeToggle  :call  OpenIDEmode() <CR>
			menu Useful.FormateCode  :call FormatCode() <CR>
			menu Useful.OpenCloolorChooser :VCoolor    <CR>
			menu Useful.ToggleShell         :call Toggle_shell() <CR>
			menu Useful.MinimapToggle :MinimapToggle <CR>
			menu Useful.Bash.Split          :ConqueTermSplit bash <CR>
			menu Useful.Bash.Tab          	:ConqueTermTab bash <CR>
			menu Useful.Bash.VSplit         :ConqueTermVSplit bash <CR>
	catch
	endtry
	try
			"set guifont=Source\ Code\  Pro:h21
			set guifont=Source\ Code\ Variable:h21
			"for windows
			"windows和mac字体格式不一样没测试过
	catch
	endtry
endif

"插件配置默认关闭vim-markdown的自动折叠（太恶心了）
let g:vim_markdown_folding_disabled = 1
"使用monokai的sublime配色
try
	colorscheme monokai  
catch
endtry

"python mode conf
"关闭默认文档和打开文档 选择模式下K 为查找文档
"关闭默认折叠 关闭自动补全 同一使用<C-n> 手动补全 
let g:pymode_doc = 0
let g:pymode_doc_bind = 'K'
let g:pymode_rope_complete_on_dot = 0
let g:pymode_folding = 0
let g:pymode_lint = 0
let g:pymode_rope = 0
"
let g:jedi#show_call_signatures = "0"
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = ""
let g:jedi#rename_command = "<leader>r"


"let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_expandabbr_key = '<C-e>'  



""ide  模式 打开使用winmannger管理nerdtree 和 taglist
let Tlist_Show_One_File=1  
let Tlist_Exit_OnlyWindow=1
let NERDTreeWinSize=15
let g:ide_mode_is_open=0
function OpenIDEmode()
		if 	g:ide_mode_is_open==0
				let g:ide_mode_is_open=1
				"execute "WMToggle"
				execute "NERDTreeToggle"
				execute "TagbarToggle"
		else
				let g:ide_mode_is_open=0
				execute "NERDTreeToggle"
				execute "TagbarToggle"
endif
"两个nerd的辅助函数
"TlistToggle
endfunction
""fix a bug when close vim  close ide mode first if it is open.
function ExitIDEmode()
		if g:ide_mode_is_open==1
				call OpenIDEmode()
		endif
endfunction

noremap <F7> :call OpenIDEmode() <CR>
autocmd VimLeave  * :call ExitIDEmode()

"leader n m 单行注释和多行注释
map gz  <leader>cm
map gx  <leader>c<space>
"leader co color open

let g:DoxygenToolkit_briefTag_pre="@synopsis  "
let g:DoxygenToolkit_paramTag_pre="@param "
let g:DoxygenToolkit_returnTag="@returns   "
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="yujiaao"
let g:DoxygenToolkit_licenseTag="My own license"



let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
"scrooloose/syntastic" settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_sql_checkers=[]

"unite instead of ctrl-p
"ack setting
if executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif

""neomakemp setting
"autodetect the existence of commands and select the faster one(rg > ag > grep)
let g:neomakemp_grep_command = "ag"
"following is default value
let g:neomakemp_exclude_files=['*.jpg', '*.png', '*.min.js', '*.swp', '*.pyc','*.out','*.o']
let g:neomakemp_exclude_dirs=[ '.git', 'bin', 'log', 'build', 'node_modules', '.bundle', '.tmp','.svn' ]

if has("mac")
"only for mac
	map <Command-c> :w !pbcopy<CR><CR>
	map <Command-v> :r !pbpaste<CR><CR>
	set backspace=indent,eol,start
	set pythonthreehome=$HOME/.pyenv/versions/3.6.0
	set pythonthreedll=$HOME/.pyenv/versions/3.6.0/lib/libpython3.6m.dylib
"diffent between mac and windows
"	unite.vim
"	<M-o> 搜索关键字找文件 <M-p> 按照文件名找文件
	"nnoremap π :<C-u>Unite -start-insert file_rec/async:!<CR>
	"nnoremap ø :<C-u>Unite grep <CR><CR>
	"思路 leaderf + neomakemp 做文件名字和内容的检索
	"ƒ Alt-f
	"ø Alt-o
	"π Alt-p
	"˙∆˚¬ Alt-hjkl 插入模式下 alt +hjkl 表示上下左右这样用着挺舒服的
	nmap ø 	<Plug>(neomakemp_global_search2)
	vmap ø  <Plug>(neomakemp_global_search)
	nnoremap π :LeaderfFile <CR>
	nnoremap ƒ :LeaderfFunctionAll <CR>
	inoremap ˙ <Left>
	inoremap ∆ <Down>
	inoremap ˚ <Up>
	inoremap ¬ <Right>
	"mac下使用DashSearch找文档
	"windows 下需要配置 KabbAmine/zeavim.vim 使用zeal
	nmap <C-k> <Plug>DashSearch
else
	"windows 下没测试过Alt绑定  用windows的时候再说
	"let g:ctrlp_map = '<M-p>'
	"nnoremap <M-p> :Unite -start-insert file<CR>
	"windows 和mac alt按键不一样 需要处理
	"nnoremap <M-o> :<C-u>Unite grep <CR><CR>
	"nnoremap <M-p> :<C-u>Unite -start-insert file_rec/async:!<CR>
endif
"https://zhuanlan.zhihu.com/p/23578381
"解决输入模式下输入中文后切换成normal模式下还是中文导致normal模式下经常出错的问题
"https://github.com/vim-scripts/fcitx.vim/tree/master/plugin
if has_mac_fcitx_for_mac==1 
function! Fcitx2en()
		let input_status = system('fcitx-remote')
		if input_status == 2
				let b:inputtoggle = 1
				call system('fcitx-remote -c')
		endif
endfunction
function! Fcitx2zh()
		try
				if b:inputtoggle == 1
						call system('fcitx-remote -o')
						let b:inputtoggle = 0
				endif
		catch /inputtoggle/
				let b:inputtoggle = 0
		endtry
endfunction
"Autocmds
au InsertLeave * call Fcitx2en()
au InsertEnter * call Fcitx2zh()
endif

"vim-easymotion 快速查找快捷操作
nmap  <Space><Space>w  <leader><leader>w


"for ConqueTerm 关闭时关闭buffer 否则关闭shell 会变成普通缓冲区 
let g:ConqueTerm_CloseOnEnd = 1 
"let g:vimshell-options-toggle=1
function! Toggle_shell()
		let tmp=&splitbelow
		set splitbelow
		execute  "VimShell -toggle -split-command=split -buffer-name=VimShell___buffer"
		if tmp==0
		set nosplitbelow
		endif
endfunction
noremap <F8> :call Toggle_shell() <CR>
":terminal
let g:lua_complete_omni = 1
let g:lua_complete_dynamic=0
let g:lua_compiler_name = '/usr/local/bin/luac'
let g:Lua_InsertFileHeader='no'
let g:lua_path='/Users/stone/.luarocks/share/lua/5.2/?.lua;/Users/stone/.luarocks/share/lua/5.2/?/init.lua;/usr/local/share/lua/5.2/?.lua;/usr/local/share/lua/5.2/?/init.lua;/usr/local/Cellar/lua/5.2.4_3/libexec/share/lua/5.2/?.lua;/usr/local/lib/lua/5.2/?.lua;/usr/local/lib/lua/5.2/?/init.lua;./?.lua'
let g:lua_internal = 0

let g:completor_auto_trigger=0
let g:completor_set_options=0

function Yujiaao_complete()
				"补全函数的特殊处理
				" &omnifunc
				"if (&completefunc !='')
				"if (&omnifunc !='')
				"			if (&filetype=="python")
				"			return "\<C-x>\<C-o>"
				"		else
				"			return "\<C-x>\<C-u>"
				"		endif
				"else
				"		return "\<C-x>\<C-n>"
				"endif"\<C-x>\<C-u>\<C-p>"
				""\<C-x>\<C-u>\<C-p>"
				if (&filetype=="lua")
						return  "\<C-x>\<C-n>"
				endif
				"default
				"return "\<C-x>\<C-u>\<C-p>"
				return  "\<C-x>\<C-n>"
endfunction
let g:completor_auto_trigger = 0
inoremap <expr> <C-n> pumvisible() ? "\<C-n>" : Yujiaao_complete()

"yujiaao lua-support 插件的默认浏览器
let g:Templates_InternetBrowserExec = 'open'
let g:Templates_InternetBrowserFlags='-a Google\ Chrome.app'
