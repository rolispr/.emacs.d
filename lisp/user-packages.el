;;-*- lexical-binding: t -*-

;;(require 'package)

;; (setq package-selected-packages
;;       '((vertico (list :url "https://github.com/minad/vertico"
;; 		       :lisp-dir "site-lisp"))))

;; (package-vc-install "https://github.com/minad/vertico")

;; ;; Full list of packages
;; (dolist (package '(
;; 		   ;; MacOS specific
;; 		   exec-path-from-shell
;; 		   ;; Vim emulation
;; 		   general
;; 		   evil
;; 		   evil-terminal-cursor-changer
;; 		   ;; directory editing
;; 		   dired-subtree
;; 		   dired-git-info
;; 		   wgrep
;; 		   ;; themes
;; 		   all-the-icons
;; 		   doom-themes
;; 		   ;; ui
;; 		   embark
;; 		   which-key
;; 		   ;; lsp
;; 		   lsp-mode
;; 		   lsp-ui
;; 		   ;; langs
;; 		   ;;; go
;; 		   go-mode
;; 		   go-playground
;; 		   go-gen-test
;; 		   ;;; py
;; 		   elpy
;; 		   ;;; ruby
;; 		   ;;; perl
;; 		   ;;; yaml
;; 		   ;; Vcs
;; 		   magit
;; 		   ;; completions
;; 		   vertico
;; 		   consult
;; 		   orderless		   
;; 		   ))
;;   (progn
;; ;;    (package-refresh-contents)
;;     (unless (package-installed-p package)
;;       (message "installing %s" package)
;;       (package-install package))
;;     (message "loading %s..." package)
;;     `(require ',package)))

;;;; Pkgs
;; Enable vertico
;; (use-package vertico
;;   :ensure t
;;   :init
;;   (vertico-mode)

;;   ;; Different scroll margin
;;   ;; (setq vertico-scroll-margin 0)

;;   ;; Show more candidates
;;   ;; (setq vertico-count 20)

;;   ;; Grow and shrink the Vertico minibuffer
;;   ;; (setq vertico-resize t)

;;   ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
;;   ;; (setq vertico-cycle t)
;;   )

;; ;; Persist history over Emacs restarts. Vertico sorts by history position.
;; (use-package savehist
;;   :init
;;   (savehist-mode))

;; (use-package all-the-icons
;;   :ensure t
;;   :config
;;   (require 'all-the-icons))

;; (use-package all-the-icons-completion
;;   :ensure t
;;   :after (marginalia all-the-icons)
;;   :hook (marginalia-mode . all-the-icons-completion-marginalia-setup)
;;   :init
;;   (all-the-icons-completion-mode))

;; (use-package orderless
;;   :ensure t
;;   :init
;;   ;; Configure a custom style dispatcher (see the Consult wiki)
;;   ;; (setq orderless-style-dispatchers '(+orderless-dispatch)
;;   ;;       orderless-component-separator #'orderless-escapable-split-on-space)
;;   (setq completion-styles '(orderless basic)
;;         completion-category-defaults nil
;;         completion-category-overrides '((file (styles partial-completion)))))
;; ;; A few more useful configurations...
;; (use-package emacs
;;   :init
;;   ;; Add prompt indicator to `completing-read-multiple'.
;;   ;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
;;   (defun crm-indicator (args)
;;     (cons (format "[CRM%s] %s"
;;                   (replace-regexp-in-string
;;                    "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
;;                    crm-separator)
;;                   (car args))
;;           (cdr args)))
;;   (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

;;   ;; Do not allow the cursor in the minibuffer prompt
;;   (setq minibuffer-prompt-properties
;;         '(read-only t cursor-intangible t face minibuffer-prompt))
;;   (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

;;   ;; Emacs 28: Hide commands in M-x which do not work in the current mode.
;;   ;; Vertico commands are hidden in normal buffers.
;;   ;; (setq read-extended-command-predicate
;;   ;;       #'command-completion-default-include-p)

;;   ;; Enable recursive minibuffers
;;   (setq enable-recursive-minibuffers t))



;; (use-package anzu
;;   :ensure t)

;; (use-package mood-line
;;   :disabled
;;   :config
;;   (mood-line-mode))

;; (use-package hide-mode-line
;;   :ensure t
;;   :config
;;   (add-hook 'completion-list-mode-hook #'hide-mode-line-mode)
;;   (add-hook 'neotree-mode-hook #'hide-mode-line-mode)
;;   (add-hook 'vterm-mode-hook #'hide-mode-line-mode)
;;   (add-hook 'compilation-mode-hook #'hide-mode-line-mode))

;; (use-package doom-modeline
;;   :disabled
;;   :hook (after-init . doom-modeline-mode))

;; (use-package dired
;;   :ensure nil
;;   :config
;;   (setq dired-recursive-copies 'always)
;;   (setq dired-recursive-deletes 'always)
;;   (when (memq window-system '(mac ns))
;;     (let ((gls "/usr/local/bin/gls"))
;;       (and (file-exists-p gls)
;;            (setq insert-directory-program gls))))
;;   (setq dired-listing-switches "-AFhlv --group-directories-first")
;;   (setq dired-dwim-target t)
;;   :hook ((dired-mode . dired-hide-details-mode)
;;          (dired-mode . hl-line-mode)))

;; (use-package wdired
;;   :after dired
;;   :commands wdired-change-to-wdired-mode
;;   :config
;;   (setq wdired-allow-to-change-permissions t)
;;   (setq wdired-create-parent-directories t))

;; (use-package savehist
;;   :ensure nil
;;   :commands execute-extended-command
;;   :config
;;   (setq savehist-file "~/.emacs.d/savehist")
;;   (setq history-length 30000)
;;   (setq history-delete-duplicates nil)
;;   (setq savehist-save-minibuffer-history t)
;;   (savehist-mode 1))

;; (use-package saveplace
;;   :ensure nil
;;   :defer 2
;;   :config
;;   (setq save-place-file "~/.emacs.d/saveplace")
;;   (setq save-place-forget-unreadable-files t)
;;   (save-place-mode 1))

;; (use-package evil
;;   :disabled
;;   :custom
;;   (evil-esc-delay 0.001)
;;   :config
;;   (setq evil-default-state 'emacs)
;;   (evil-set-initial-state 'shell-mode 'emacs)
;;   (evil-set-initial-state 'dired-mode 'emacs)
;;   (setq evil-move-cursor-back nil)
;;   (setq evil-insert-state-cursor '((hbar . 1) "yellow")
;;       evil-normal-state-cursor '((box . 1) "SkyBlue2")
;;       evil-emacs-state-cursor '(box "SkyBlue2"))
;;   (evil-mode 1))

;; (unless (display-graphic-p)
;;   (use-package evil-terminal-cursor-changer
;;     :disabled
;;     :config
;;     (setq evil-insert-state-cursor '(bar "yellow")
;; 	  evil-normal-state-cursor '(box "cyan")
;; 	  evil-emacs-state-cursor '(box "purple"))
;;     (evil-terminal-cursor-changer-activate)))

;; (use-package magit
;;   :ensure t
;;   :commands magit-status
;;   :bind (("C-x g" . magit-status)))

;; (use-package which-key
;;   :disabled
;;   :defer 2
;;   :config
;;   (which-key-mode)
;;   (which-key-setup-side-window-bottom)
;;   (setq which-key-sort-order 'which-key-key-order-alpha
;; 	which-key-idle-delay 2))

;; ;; (use-package window
;; ;;   :ensure nil
;; ;;   :init
;; ;;   (setq display-buffer-alist
;; ;; 	'(;; top side window
;; ;; 	  ("\\*\\(Flycheck\\|Package-Lint\\).*"
;; ;; 	   (display-buffer-in-side-window)
;; ;; 	   (window-height . 0.16)
;; ;; 	   (side . top)
;; ;; 	   (slot . 0)
;; ;; 	   (window-parameters . ((no-other-window . t))))
;; ;; 	  ("\\*\\(Backtrace\\|Warnings\\|Compile-Log\\|Messages\\)\\*"
;; ;; 	   (display-buffer-in-side-window)
;; ;; 	   (window-height . 0.20)
;; ;; 	   (side . top)
;; ;; 	   (slot . 1)
;; ;; 	   (window-parameters . ((no-other-window . t))))
;; ;; 	  ("\\*compliation*"
;; ;; 	   (display-buffer-in-side-window)
;; ;; 	   (window-height . 0.20)
;; ;; 	   (side . right)
;; ;; 	   (slot . 1))
;; ;; 	   ;;(window-parameters . ((no-other-window . t))))
;; ;; 	  ;; bottom side window
;; ;; 	  ("\\*Ibuffer.*"
;; ;; 	   (display-buffer-in-side-window)
;; ;; 	   (window-width . 0.35)
;; ;; 	   (side . right)
;; ;; 	   (slot . 0)
;; ;; 	   (window-parameters . ((no-other-window . t))))
;; ;; 	  ("\\*e?shell.*"
;; ;; 	   (display-buffer-in-side-window)
;; ;; 	   (window-width . 1.5)
;; ;; 	   (side . bottom)
;; ;; 	   (slot . 1))
;; ;; 	  ("\\*vterminal - dedicated.*"
;; ;; 	   (display-buffer-in-side-window)
;; ;; 	   (window-height . 0.10)
;; ;; 	   (side . bottom)
;; ;; 	   (slot . 1))
;; ;; 	  ("\\*vterminal<.*"
;; ;; 	   (display-buffer-in-side-window)
;; ;; 	   (window-height . 0.40)
;; ;; 	   (side . right)
;; ;; 	   (slot . -1))
;; ;; 	  ;;left side window
;; ;; 	  ("\\*Help.*"
;; ;; 	   (display-buffer-in-side-window)
;; ;; 	   (window-width . 0.20)       ; See the :hook
;; ;; 	   (side . left)
;; ;; 	   (slot . 0)
;; ;; 	   (window-parameters . ((no-other-window . t))))
;; ;; 	  ))
;; ;;   (setq switch-to-buffer-obey-display-actions t)
;; ;;   (setq window-combination-resize t)
;; ;;   (setq even-window-sizes 'height-only)
;; ;;   (setq window-sides-vertical nil)
;; ;;   :hook ((help-mode . visual-line-mode)
;; ;; 	 (custom-mode . visual-line-mode))
;; ;;   :bind (("s-n" . next-buffer)
;; ;;          ("s-p" . previous-buffer)
;; ;;          ("s-o" . other-window)))

;; (use-package peep-dired
;;   :disabled
;;   :after dired
;;   :config
;;   (setq peep-dired-cleanup-on-disable t)
;;   (setq peep-dired-enable-on-directories t)
;;   (setq peep-dired-cleanup-eagerly t)
;;   (setq peep-dired-ignored-extensions
;;         '("mkv" "webm" "mp4" "mp3" "ogg" "iso"))
;;   :bind (:map dired-mode-map
;;               ("P" . peep-dired)))

;; (use-package image-dired
;;   :disabled
;;   :ensure nil
;;   :config
;;   (setq image-dired-external-viewer "xdg-open")
;;   (setq image-dired-thumb-size 80)
;;   (setq image-dired-thumb-margin 2)
;;   (setq image-dired-thumb-relief 0)
;;   (setq image-dired-thumbs-per-row 4)
;;   :bind (:map image-dired-thumbnail-mode-map
;;               ("<return>" . image-dired-thumbnail-display-external)))

;; (use-package dired-subtree
;;   :ensure t
;;   :bind (:map dired-mode-map
;;               ("TAB" . dired-subtree-toggle)
;;               ("<C-tab>" . dired-subtree-cycle)
;;               ("<S-iso-lefttab>" . dired-subtree-remove)))

;; (use-package diredfl
;;   :disabled
;;   :hook (dired-mode . diredfl-mode))

;; (use-package dired-git-info
;;   :ensure t
;;   :config
;;   (setq dgi-commit-message-format "%h\t%s\t%cr")
;;   :bind (:map dired-mode-map
;;               (")" . dired-git-info-mode)))

;; (use-package wgrep
;;   :ensure t
;;   :commands wgrep-toggle-readonly-area
;;   :config
;;   (setq wgrep-auto-save-buffer t)
;;   (setq wgrep-change-readonly-file t))

;; (use-package elpy
;;   :disabled
;;   :init
;;   (elpy-enable))

;; (use-package lispy
;;   :disabled
;;   :hook (emacs-lisp-mode . lispy-mode)
;;   (cider-mode-hook . lispy-mode))

;; (provide 'user-packages)

;; (package-initialize)
