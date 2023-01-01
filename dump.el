(when (member "NATIVE_COMP" (split-string system-configuration-features " "))
  (error "only run this w/o native compilation enabled"))
  
(message "collecting packages...")

(require 'package)

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)
(package-refresh-contents)

(setq dumped-load-path load-path
      dumpedp t)

(dolist (package '(
		   exec-path-from-shell
		   doom-themes
		   ;;general
		   ;;evil
		   ;;evil-terminal-cursor-changer
		   dired-subtree
		   dired-git-info
		   wdired
		   bind-key
		   vertico
		   orderless
		   consult
		   all-the-icons
		   all-the-icons-completion
		   marginalia
		   corfu
		   pcmpl-args
		   cape
		   kind-icon
		   ;;lsp-mode
		   ;;lsp-ui
		   ))
  (progn
    (unless (package-installed-p package)
      (message "installing %s" package)
      (package-install package))
    (message "loading %s..." package)
    `(require ',package)))

(load-theme 'doom-moonlight t)

(if dumpedp
    (progn
      (setq load-path dumped-load-path)
      (global-font-lock-mode)
      (transient-mark-mode)
      (when (dump-emacs-portable "~/.emacs.d/emacs.pdmp")
	(message "pdump successful"))))
