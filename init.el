;;-*- lexical-binding: t -*-
;;;
;; Startup eshell
;;(add-hook 'eshell-mode-hook (lambda () (setq mode-line-format nil)))
;;(eshell)
;;; Load configuration
(load (expand-file-name "lisp/core.el" user-emacs-directory))

