;;-*- lexical-binding: t -*-
;;;;
;; Startup eshell
;;(add-hook 'eshell-mode-hook (lambda () (setq mode-line-format nil)))
;;(eshell)
(defun my/edwina--window-list (&optional frame)
   "Return a list of windows on FRAME in layout order."
   (window-list frame (frame-first-window frame)))

(advice-add 'edwina--window-list :override #'my/edwina--window-list)
;; Load configuration
(load (expand-file-name "lisp/core.el" user-emacs-directory))

