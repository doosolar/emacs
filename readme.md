## Emacs配置文件的安装，Emacs的运行
	1 请将 .emacs, .emacs.d 作软链接到用户的home目录下（当然也可以复制）:
	  以git库在 /emacs.git/ 为例：
	  ln -s /emacs.git/.emacs ~/.emacs
	  ln -s /emacs.git/.emacs.d ~/.emacs.d
	  
	2 运行：建议以非图形窗口的模式运行，命令如下：
	  emacs -nw

## 常用操作
### 窗口分割
	 C-x 3  : 左右分割
	 C-x 2  : 上下分割
	 C-x 1  : 将当前窗口变为最大
	 C-c 左箭头 ： 恢复上一个窗口布局（比如C-x 1 之后，想恢复到多窗口布局的时候就可以用）
	 C-c 右箭头 ： 前进一个窗口（C-c 左箭头的逆向操作）
### 窗口跳转
	 C-C i  : 跳转到上边窗口
	 C-C k  : 跳转到右边窗口
	 C-C J  : 跳转到右边窗口
	 C-c l  : 跳转到左边窗口
	 C-c m  : 然后利用箭头，调整窗口的大小,最后按回车键，结束窗口的调整

