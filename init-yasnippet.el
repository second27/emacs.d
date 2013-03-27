(require-package 'yasnippet)

(setq yas/indent-line 'auto)
(define-key global-map (kbd "M-RET") 'yas/expand)

(add-hook 'yas-minor-mode-hook
          (lambda () (define-key yas-minor-mode-map
                       (kbd "TAB") nil)))

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
