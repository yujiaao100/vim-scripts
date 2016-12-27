#个人vimrc配置 方便使用和管理

## depend on 
	1.git
	2.curl

## intall
	1.	git clone https://github.com/yujiaao100/vim-scripts.git
	2.	cd vim-scripts
	3.  cp vimrc ~/.vimrc
	4. 可选 如果使用suan/vim-instant-markdown 插件 需要 安装instant-markdown-d [sudo] npm -g install instant-markdown-d
	5. 可选 vCoolor.vim 必须带图形界面(mvim 或者gvim  否则会失效~~~)
	6. https://github.com/powerline/fonts 安装airline 额外字体
	7. 可选 gem install sqlint  安装sql语法检测 但是语法检查居然不是基于mysql的 所以放弃 默认关闭sql语法检测
	8.brew install fcitx-remote-for-osx  
	+ fcitx-remote --with-input-method=general
	+ 使用fcitx框架解决normal模式下的冲突问题
	+ 然后在系统设置中将『选择「输入法」菜单中的下一个输入法』快捷键改为 Ctrl-Shift-z
