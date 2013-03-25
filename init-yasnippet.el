(require-package 'yasnippet)

;; Don't use yasnippet's trigger key, "TAB"
(setq yas/trigger-key "")
(define-key global-map (kbd "M-RET") 'yas/expand)
(setq yas/next-field-key "C-p")
(setq yas/next-field-key "C-n")

(yas-global-mode t)

;; (setq yas/field-highlight-face "#FF0000")
;; (setq yas/mirror-highlight-face "#FF0000")

(global-set-key (kbd "C-c y n") `yas/new-snippet)
(global-set-key (kbd "C-c y v") `yas-visit-snippet-file)
(global-set-key (kbd "C-c y f") `yas/find-snippets)
(global-set-key (kbd "C-c y r") `yas/reload-all)


(provide 'init-yasnippet)
