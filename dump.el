(require 'package)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq dumped-load-path load-path
      dumpedp t)

(dolist (package '(use-package
		   ;;exec-path-from-shell
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
    (package-install package)
    (require package)));needed? 

(load-theme 'modus-vivendi)

(dump-emacs-portable "~/.emacs.d/emacs.pdmp")

