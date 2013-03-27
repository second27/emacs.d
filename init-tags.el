(require-package 'etags-select)
;; http://mattbriggs.net/blog/2012/03/18/awesome-emacs-plugins-ctags/
(defun ctags-root (&optional dir home)
  "Return the root directory of the project within which DIR is found.
Optional argument HOME is ignored."
  (let ((default-directory (or dir default-directory)))
    (cond ((or (file-exists-p ".git"))
           default-directory)
          ((not (string-match "\\(^[[:alpha:]]:/$\\|^/[^\/]+:/?$\\|^/$\\)" default-directory))
               (rinari-root (expand-file-name (file-name-as-directory "..")))))))

(defun build-ctags ()
  (interactive)
  (let ((root (ctags-root)))
    (shell-command (concat "ctags -R " root "TAGS " root " `rvm gemset dir`/gems")))
  (visit-project-tags)
  (message "tags built successfully"))

(defun visit-project-tags ()
  (interactive)
  (let ((tags-file (concat (ctags-root) "TAGS")))
    (visit-tags-table tags-file)
    (message (concat "Loaded " tags-file))))


(defun my-find-tag ()
  (interactive)
  (if (file-exists-p (concat (ctags-root) "TAGS"))
      (visit-project-tags)
    (build-ctags))
  (etags-select-find-tag-at-point))

(global-unset-key (kbd "M-."))
(global-set-key (kbd "M-.") 'my-find-tag)

(provide 'init-tags)
