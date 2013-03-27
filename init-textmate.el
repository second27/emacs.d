(require-package 'textmate)
(textmate-mode)
(global-unset-key (kbd "M-/"))
(global-set-key (kbd "M-/") 'comment-or-uncomment-region-or-line)

(global-set-key (kbd "M-t") 'textmate-goto-file)
(global-set-key (kbd "C-M-t") 'textmate-goto-symbol)

(provide 'init-textmate)


