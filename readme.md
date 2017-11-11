## Emacs配置、运行、按键说明
	1 只需要将 .emacs, .emacs.d 作软链接到用户的home目录下（当然也可以复制）,就完成了配置：
	  以 git库在 /emacs.git/ 为例：	  
	  ln -s /emacs.git/.emacs ~/.emacs
	  ln -s /emacs.git/.emacs.d ~/.emacs.d
	  
	2 运行：建议以非图形窗口的模式运行，命令如下：
	  emacs -nw

	3 按键的说明：

	  Control键：简写为 C
	  Meta键：简写为 M
	  比如：下面的按键操作：
	    第一步：按 Ctrl-x （按下Ctrl键不放，然后按 x 键）
	    第二步：按 Ctrl-c （按下Ctrl键不放，然后按 c 键）
	  按照约定俗成，下面就简写为： C-x C-c

## 常用操作
### 窗口分割
	 C-x 3  : 左右分割
	 C-x 2  : 上下分割
	 C-x 1  : 将当前窗口变为最大
	 C-x 0  : 关闭当前窗口
	 C-c 左箭头 ： 恢复上一个窗口布局（比如C-x 1 之后，想恢复到多窗口布局的时候就可以用）
	 C-c 右箭头 ： 前进一个窗口布局（也就是 "C-c 左箭头" 的逆向操作）
### 窗口跳转
	 C-c i  : 跳转到上边窗口
	 C-c k  : 跳转到下边窗口
	 C-c j  : 跳转到右边窗口
	 C-c l  : 跳转到左边窗口
	 C-c m  : 然后利用箭头，调整窗口的大小,最后按回车键，结束窗口的调整

