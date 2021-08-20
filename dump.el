(require 'package)
(package-initialize)

(setq community-packages-directory (concat user-emacs-directory "community-packages"))
(let ((cpkg-path (directory-files community-packages-directory
                                  t directory-files-no-dot-files-regexp)))
  (mapc (apply-partially 'add-to-list 'load-path) cpkg-path))

(setq dumped-load-path load-path)

(dolist (package '(use-package))
  (require package))

(dump-emacs-portable "~/.emacs.d/emacs.pdmp")
