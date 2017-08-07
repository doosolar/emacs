;;;The elisp written by yin yonggang
;;;version:1.0
;;;date:20130930
;;;author homepage:www.doosolar.com
;;;The elisp written by yin yonggang

;;在目录模式（dired-mode）中，把文件在指定的窗口中打开。
(global-set-key (kbd "<f8>") 
		(lambda () (interactive) (progn (message "Current windows is assigned.") (setq assigned-window (selected-window))))
)

(eval-after-load 'dired
  '(define-key dired-mode-map (kbd "\C-o")
     (lambda ()
       (interactive)
       (let ((target-window assigned-window))
         (set-window-buffer target-window
                            (find-file-noselect 
                             (dired-get-file-for-visit)))
         (select-window target-window))))
)

;;当选中了部分文字，进行yank的时候，在默认的情况下，这些选中的文字，不被删除
;;下面的扩展，可以让你自动的删除选中的文字，然后yank（paste）在剪贴板中的文字。
(defadvice yank(before delete-then-yank activate compile)
	"delete then yank written by yin yonggang"
	(interactive 
	 (if mark-active 
			 (save-excursion (delete-region (region-beginning) (region-end))
		 ))))

;; (global-set-key (kbd "<f3>") 'kill-ring-save) ; copy.
;; (global-set-key (kbd "<f4>") 'yank) ; paste.

;; (global-set-key (kbd "<f2>") 'kill-region) ; cut.
(global-set-key
 (kbd "<f2>") (lambda()
								(interactive)
								(message "current buffer evaluated")
								(eval-buffer)
								)
 )
;;rgrep
(global-set-key (kbd "<f3>") 'rgrep)
;; (global-set-key
;;  (kbd "<f3>") (lambda()
;; 								(interactive)
;; 								(message "rgrep")
;; 								(rgrep)
;; 								)
;;  )

(global-set-key (kbd "<f4>") 'find-name-dired)
;; 在多个文件中正则替换，find-name-dired 是第一步，找出想替换的文件
;; 第二步：t , 选中第一步得到的列表中的所有文件
;; 第三步：Q 执行：Query-Replace in Files...，就可以了。

;; 如果希望替换的是文件本身的名字
;; 前两步和在多个文件中正则替换是一样的，区别只有第三步：
;; 第三步：%R 随后的又都一样了。

;;revert
(global-auto-revert-mode 0)
(setq auto-revert-verbose 1)
(global-set-key (kbd "<f5>") 'revert-buffer)

(global-set-key (kbd "<f6>") 'rename-buffer)
(global-set-key (kbd "<f7> c") 'conf-mode)
(global-set-key (kbd "<f7> n") 'normal-mode)
(global-set-key (kbd "<f7> l") 'lisp-mode)
(global-set-key (kbd "<f7> h") 'html-mode)
(global-set-key (kbd "<f7> p") 'php-mode)
(global-set-key (kbd "<f7> r") 'ruby-mode)
(global-set-key (kbd "<f7> j") 'js2-mode)
(global-set-key (kbd "<f7> v") 'java-mode)
(global-set-key (kbd "<f10>") 'menu-bar-open)

;; Shell
(global-set-key (kbd "C-c z") 'shell)

;; Goto line
(global-set-key (kbd "C-c g") 'goto-line)

;; Trigger display line numbers
(global-set-key (kbd "C-c 1") 'global-linum-mode)

;;tramp 打开远程文件时候 ControlPath too long 问题解决
(put 'temporary-file-directory 'standard-value '((file-name-as-directory "/tmp")))

(add-hook 'ruby-mode-hook
  (lambda () (hs-minor-mode)))

(eval-after-load "hideshow"
  '(add-to-list 'hs-special-modes-alist
    `(ruby-mode
      ,(rx (or "def" "class" "module" "do" "{" "[" "if" "else")) ; Block start
      ,(rx (or  "}" "]" "end" "else" ))                       ; Block end
      ,(rx (or "#" "=begin"))                        ; Comment start
      ruby-forward-sexp nil)))

(global-set-key (kbd "C-c h") 'hs-hide-block)
(global-set-key (kbd "C-c s") 'hs-show-block)
