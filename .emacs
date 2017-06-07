;;help edit lisp
(show-paren-mode 1)
(transient-mark-mode 1)
(electric-pair-mode 1)

;;dired-details.el
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor"))
(require 'dired-details)
(dired-details-install)

(load "yinyonggang.el")

;;; define tab size
(setq default-tab-width 2)

;; 让javascript 缩进为为2
(setq js-indent-level 2)

;; 让js2-mode 缩进为为2
(setq js2-basic-offset 2)

;;; set word wrapeval
(setq linum-format "%d ")
(global-visual-line-mode t) 

;; Interactively Do Things
(require 'ido)
(ido-mode t)

;;; define copy/cut/paset valid for 'a current line'
(defadvice kill-ring-save (before slick-copy activate compile)
  "When called interactively with no active region, copy the current line."
  (interactive
   (if mark-active
       (list (region-beginning) (region-end))
     (progn
       (message "Current line is copied.")
       (list (line-beginning-position) (line-beginning-position 2)) ) ) ))

(defadvice kill-region (before slick-copy activate compile)
  "When called interactively with no active region, cut the current line."
  (interactive
   (if mark-active
       (list (region-beginning) (region-end))
     (progn
       (list (line-beginning-position) (line-beginning-position 2)) ) ) ))


(add-to-list 'load-path (expand-file-name "/usr/share/emacs/site-lisp/org"))
(require 'org-install)
 
;;;windresize
(require 'windresize)
 (global-set-key (kbd "C-c m") 'windresize)


;;;Winner-mode
;;可以使用 Ctrl-c ← （就是向左的箭头键）组合键，退回你的上一个窗口设置。）
;;可以使用 Ctrl-c → （前进一个窗口设置。）
(when (fboundp 'winner-mode) 
  (winner-mode) 
  (windmove-default-keybindings)) 

;;;windmove-mode
(when (fboundp 'windmove-default-keybindings)
      (windmove-default-keybindings)
    (global-set-key (kbd "C-c j")  'windmove-left)
    (global-set-key (kbd "C-c l") 'windmove-right)
    (global-set-key (kbd "C-c i")    'windmove-up)
    (global-set-key (kbd "C-c k")  'windmove-down))

;; Comment or uncomment line
;; comment-or-uncomment-region-or-line
 ; it's almost the same as in textmate.el but I wrote it before I know about
 ; textmate.el, in fact that's how I found textmate.el, by googling this
 ; function to see if somebody already did that in a better way than me.
 (defun comment-or-uncomment-region-or-line ()
   "Like comment-or-uncomment-region, but if there's no mark \(that means no
 region\) apply comment-or-uncomment to the current line"
   (interactive)
   (if (not mark-active)
       (comment-or-uncomment-region
         (line-beginning-position) (line-end-position))
       (if (< (point) (mark))
           (comment-or-uncomment-region (point) (mark))
         (comment-or-uncomment-region (mark) (point)))))
 (global-set-key (kbd "C-c ;") 'comment-or-uncomment-region-or-line)

;;;auto-complete
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/auto-complete-1.3.1"))
; Load the default configuration
(require 'auto-complete-config)
; Make sure we can find the dictionaries
(add-to-list 'ac-dictionary-directories "~/.emacs.d/vendor/auto-complete-1.3.1/dict")
; Use dictionaries by default
(setq-default ac-sources (add-to-list 'ac-sources 'ac-source-dictionary))
(global-auto-complete-mode t)
; Start auto-completion after 2 characters of a word
(setq ac-auto-start 2)
; case sensitivity is important when finding matches
(setq ac-ignore-case nil)

;;yasnippet
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/yasnippet"))
(setq yas/snippet-dirs (expand-file-name "~/.emacs.d/vendor/yasnippet/snippets"))
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/vendor/yasnippet/snippets")
;; Let's have snippets in the auto-complete dropdown
(add-to-list 'ac-sources 'ac-source-yasnippet)


;;php-mode
(add-to-list 'load-path "~/.emacs.d/vendor/php-mode-1.5.0")
(require 'php-mode)
(setq php-completion-file "~/.emacs.d/vendor/php-mode-1.5.0/php-completion-file")
(global-set-key [(f9)] 'php-complete-function)

;;php use html-mode
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

;;javascript use js2-mode
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;;jsp use html-mode
(add-to-list 'auto-mode-alist '("\\.jsp$" . html-mode))

;;yml use conf-mode
(add-to-list 'auto-mode-alist '("\\.yml$" . conf-mode))

;;package
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
;The package-initialize load the packages that be installed by package.
(package-initialize)


;; 设置Tab, space 等的显示
(setq whitespace-display-mappings
			'(
				(space-mark   ?\     [? ]) ;; use space not dot
				(space-mark   ?\xA0  [?\u00A4]     [?_])
				(space-mark   ?\x8A0 [?\x8A4]      [?_])
				(space-mark   ?\x920 [?\x924]      [?_])
				(space-mark   ?\xE20 [?\xE24]      [?_])
				(space-mark   ?\xF20 [?\xF24]      [?_])
				(newline-mark ?\n    [?$ ?\n])
				(tab-mark     ?\t    [?\u00BB ?\t] [?\\ ?\t])))

;; (custom-set-faces
;;  '(whitespace-space
;; 	 ((((class color) (background dark)) (:background "black" :foreground "LightGray"))
;; 		(((class color) (background light)) (:background "yellow" :foreground "black"))
;; 		(t (:inverse-video t)))))

(custom-set-faces
 '(whitespace-space
	 ((((class color) (background dark)) (:foreground "gray"))
		(((class color) (background light)) (:foreground "black"))
		(t (:inverse-video t)))))

(setq whitespace-style (quote
						(face spaces tabs newline space-mark tab-mark newline-mark)))

(global-set-key "\C-c_w" 'whitespace-mode)
(global-set-key "\C-c_t" 'whitespace-toggle-options)
(global-set-key "\C-c=w" 'global-whitespace-mode)
(global-set-key "\C-c=t" 'global-whitespace-toggle-options)


