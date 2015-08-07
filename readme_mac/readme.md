#记录mac和vim相关技巧 

1. 让mac中的macvim像sublime一样支持打开多个文件使用分割窗口
vim 的默认打开多个文件的方式真的很不爽 只是打开一个 其他的就放在后台呆着也不显示 但是有个参数 -p 可以实现多个文件使用分割窗口
mac 下需要进行操作如下

	1.0  	安装MacVim（废话）

	1.1		打开shell 输入下面命令将MacVim的可执行程序变成MacVim.run

	```
	cd /Applications/MacVim.app/Contents/MacOS
	mv MacVim MacVim.run
	```

	1.2 	编辑MacVim 的启动脚本 增加-p 参数 (照着网上mac增加	chrome启动参数抄的 不知道为什么要cd)
	vim MacVim

	```
	#!/bin/bash
	cd /Applications/MacVim.app/Contents/MacOS
	/Applications/MacVim.app/Contents/MacOS/MacVim.run 	-p
	```

	1.3 	chmod +x MacVim
2. 关于Fn建的使用
     系统偏好设置---键盘---F1 F2 等用作标准功能键（可以让f1 f2 恢复正常功能 防止快捷键干扰 ）