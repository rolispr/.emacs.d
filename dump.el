(message "collecting packages...")

(require 'package)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(setq dumped-load-path load-path
      dumpedp t)

(dolist (package '(;;exec-path-from-shell
		   general
		   evil
		   evil-terminal-cursor-changer
		   dired-subtree
		   dired-git-info
		   wgrep
		   ;;lsp-mode
		   ;;lsp-ui
		   ))
  (progn
    (package-refresh-contents)
    (unless (package-installed-p package)
      (message "installing %s" package)
      (package-install package))
    (message "loading %s..." package)
    `(require ',package)))

(load-theme 'modus-vivendi)

(when (dump-emacs-portable "~/.emacs.d/emacs.pdmp")
  (message "pdump successful"))


;;;; Check if image is dumped
(defvar dumpedp nil) ;; Disable reading dumped file
(if dumpedp
    (progn
      (setq load-path dumped-load-path)
      (global-font-lock-mode)
      (transient-mark-mode))
;;;; Then initialize `package'
  (progn
    (package-initialize)
    (setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			     ("melpa" . "https://melpa.org/packages/")))
    (unless (package-installed-p 'use-package)
      (package-refresh-contents)
      (package-install 'use-package))))
