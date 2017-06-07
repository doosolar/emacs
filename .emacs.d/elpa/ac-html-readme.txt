Configuration:
Add these lines
(add-to-list 'ac-sources 'ac-source-html-tag)
(add-to-list 'ac-sources 'ac-source-html-attribute)
If you are using web-mode:
Additionally you need to add these lines:
(add-to-list 'web-mode-ac-sources-alist
             '("html" . (ac-source-html-tag
                         ac-source-html-attribute)))
If you are using haml-mode:
use `ac-source-haml-tag' and `ac-source-haml-attribute'
