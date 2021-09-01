;;-*- lexical-binding: t -*-

;; use tab bar history instead of winner
;; move elisp to sep file to load during dump

(defvar dumpedp nil)
(if dumpedp
    (progn
      (setq load-path dumped-load-path)
      (global-font-lock-mode)
      (transient-mark-mode))
  (progn
    (package-initialize)
    (setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			     ("melpa" . "https://melpa.org/packages/")))
    (unless (package-installed-p 'use-package)
      (package-refresh-contents)
      (package-install 'use-package))))

(use-package emacs
  :ensure nil
  :config
  ;;(setq package-user-dir (concat user-emacs-directory "modules"))
  ;;(set-frame-font "Fira Code 16" nil t)
  ;;(add-to-list 'default-frame-alist '(font . "Fira Code 16"))  
  ;;(fset #'display-startup-echo-area-message #'ignore)

  ;; (setq inhibit-startup-message t
  ;;       initial-scratch-message ";;hello!"
  ;;       inhibit-startup-echo-area-message user-login-name
  ;;       inhibit-default-init t)

  ;; (fset 'yes-or-no-p 'y-or-n-p)

  ;; (setq-default bidi-display-reordering 'left-to-right
  ;; 	      bidi-paragraph-direction 'nil
  ;; 	      cursor-in-non-selected-windows nil)

  ;; (setq highlight-nonselected-windows nil
  ;;       auto-window-vscroll nil
  ;;       fast-but-imprecise-scrolling t)

  (setq kill-buffer-query-functions
        (remq 'process-kill-buffer-query-function
              kill-buffer-query-functions)
        echo-keystrokes .05 
        enable-recursive-minibuffers t
        sentence-end-double-space nil 
        help-window-select t 
        enable-local-variables :all)
 
  (setq-default mode-line-format "%-")

  (setq completions-detailed t)
  (fido-mode 1)
  (icomplete-vertical-mode 1)

  (global-tab-line-mode t)
  (setq tab-bar-show nil)
  (tab-bar-mode t)

  (setq inhibit-splash-screen t)
  (setq inhibit-startup-message t)

  (winner-mode 1)
  (show-paren-mode 1))

(use-package dired
  :ensure nil
  :config
  (setq dired-recursive-copies 'always)
  (setq dired-recursive-deletes 'always)
  (when (memq window-system '(mac ns))
    (let ((gls "/usr/local/bin/gls"))
      (and (file-exists-p gls)
           (setq insert-directory-program gls))))
  (setq dired-listing-switches "-AFhlv --group-directories-first")
  (setq dired-dwim-target t)
  :hook ((dired-mode . dired-hide-details-mode)
         (dired-mode . hl-line-mode)))

(use-package wdired
  :after dired
  :commands wdired-change-to-wdired-mode
  :config
  (setq wdired-allow-to-change-permissions t)
  (setq wdired-create-parent-directories t))

(use-package savehist
  :ensure nil
  :commands execute-extended-command
  :config
  (setq savehist-file "~/.emacs.d/savehist")
  (setq history-length 30000)
  (setq history-delete-duplicates nil)
  (setq savehist-save-minibuffer-history t)
  (savehist-mode 1))

(use-package saveplace
  :ensure nil
  :defer 2
  :config
  (setq save-place-file "~/.emacs.d/saveplace")
  (setq save-place-forget-unreadable-files t)
  (save-place-mode 1))

(when (string= system-type "darwin")
  (use-package exec-path-from-shell
    :ensure t
    :config
    (exec-path-from-shell-initialize)))

(use-package evil
  :ensure t
  ;;:custom
  ;;(evil-esc-delay 0.001)
  :config
  (setq evil-default-state 'emacs)
  (evil-set-initial-state 'shell-mode 'emacs)
  (evil-set-initial-state 'dired-mode 'emacs)
  (evil-mode 1))

(unless (display-graphic-p)
  (use-package evil-terminal-cursor-changer
    :ensure t
    :config
    (setq evil-insert-state-cursor '(bar "yellow")
	  evil-normal-state-cursor '(box "cyan")
	  evil-emacs-state-cursor '(box "purple"))
    (setq evil-move-cursor-back nil)
    (evil-terminal-cursor-changer-activate)))

(use-package magit
  :ensure t
  :commands magit-status
  :bind (("C-x g" . magit-status)))

(use-package general
  :ensure t
  :config
  (general-evil-setup t)

  (general-define-key
   :states '(normal insert visual emacs)
   :prefix "SPC"
   :non-normal-prefix "M-SPC"
   "d" '(dired :which-key "Edit files & dirs") 
   "b" 'ibuffer
   "g" '(:ignore t :which-key "Git")
   "gs" '(magit-status :which-key "Git status")
   "!" '(shell-command :which-key "Run shell cmd")
   ":" '(eval-expression :which-key "Eval expr")))

(use-package which-key
  :ensure t
  :defer 2
  :config
  (which-key-mode)
  (which-key-setup-side-window-bottom)
  (setq which-key-sort-order 'which-key-key-order-alpha
	which-key-idle-delay 0.05))

(use-package window
  :ensure nil
  :init
  (setq display-buffer-alist
	'(;; top side window
	  ("\\*\\(Flycheck\\|Package-Lint\\).*"
	   (display-buffer-in-side-window)
	   (window-height . 0.16)
	   (side . top)
	   (slot . 0)
	   (window-parameters . ((no-other-window . t))))
	  ("\\*\\(Backtrace\\|Warnings\\|Compile-Log\\|Messages\\)\\*"
	   (display-buffer-in-side-window)
	   (window-height . 0.20)
	   (side . top)
	   (slot . 1)
	   (window-parameters . ((no-other-window . t))))
	  ;; bottom side window
	  ("\\*Ibuffer.*"
	   (display-buffer-in-side-window)
	   (window-width . 0.35)
	   (side . right)
	   (slot . 0)
	   (window-parameters . ((no-other-window . t))))
	  ("\\*e?shell.*"
	   (display-buffer-in-side-window)
	   (window-width . 1.5)
	   (side . bottom)
	   (slot . 1))
	  ("vterm"
	   (display-buffer-in-side-window)
	   (window-height . 0.20)
	   (side . bottom)
	   (slot . 2))
	  ;; left side window
	  ("\\*Help.*"
	   (display-buffer-in-side-window)
	   (window-width . 0.20)       ; See the :hook
	   (side . left)
	   (slot . 0)
	   (window-parameters . ((no-other-window . t))))
	  ))
  (setq switch-to-buffer-obey-display-actions t)
  (setq window-combination-resize t)
  (setq even-window-sizes 'height-only)
  (setq window-sides-vertical nil)
  :hook ((help-mode . visual-line-mode)
	 (custom-mode . visual-line-mode))
  ;; :bind (("s-n" . next-buffer)
  ;;        ("s-p" . previous-buffer)
  ;;        ("s-o" . other-window)
  ;;        ("s-2" . split-window-below)
  ;;        ("s-3" . split-window-right)
  ;;        ("s-0" . delete-window)
  ;;        ("s-1" . delete-other-windows)
  ;;        ("s-5" . delete-frame)
  ;;        ("C-x +" . balance-windows-area)
  ;;        ("<f8>" . window-toggle-side-windows))
  )

(use-package peep-dired
  :disabled
  :after dired
  :config
  (setq peep-dired-cleanup-on-disable t)
  (setq peep-dired-enable-on-directories t)
  (setq peep-dired-cleanup-eagerly t)
  (setq peep-dired-ignored-extensions
        '("mkv" "webm" "mp4" "mp3" "ogg" "iso"))
  :bind (:map dired-mode-map
              ("P" . peep-dired)))

(use-package image-dired
  :disabled
  :ensure nil
  :straight nil
  :config
  (setq image-dired-external-viewer "xdg-open")
  (setq image-dired-thumb-size 80)
  (setq image-dired-thumb-margin 2)
  (setq image-dired-thumb-relief 0)
  (setq image-dired-thumbs-per-row 4)
  :bind (:map image-dired-thumbnail-mode-map
              ("<return>" . image-dired-thumbnail-display-external)))

(use-package dired-subtree
  :ensure t
  :bind (:map dired-mode-map
              ("TAB" . dired-subtree-toggle)
              ("<C-tab>" . dired-subtree-cycle)
              ("<S-iso-lefttab>" . dired-subtree-remove)))

(use-package diredfl
  :disabled
  :hook (dired-mode . diredfl-mode))

(use-package dired-git-info
  :ensure t
  :config
  (setq dgi-commit-message-format "%h\t%s\t%cr")
  :bind (:map dired-mode-map
              (")" . dired-git-info-mode)))

(use-package wgrep
  :ensure t
  :commands wgrep-toggle-readonly-area
  :config
  (setq wgrep-auto-save-buffer t)
  (setq wgrep-change-readonly-file t))

(setq tab-bar-close-button-show nil)
(setq tab-line-close-button-show nil)
(setq tab-line-new-button-show nil)
(setq tab-line-separator "")

(defcustom tab-line-tab-min-width 10
  "Minimum width of a tab in characters."
  :type 'integer
  :group 'tab-line)

(defcustom tab-line-tab-max-width 30
  "Maximum width of a tab in characters."
  :type 'integer
  :group 'tab-line)

(defun my/tab-line-name-buffer (buffer &rest _buffers)
  (with-current-buffer buffer
    (let* ((window-width (window-width (get-buffer-window)))
           (close-button-size (if tab-line-close-button-show
                                  (length (substring-no-properties tab-line-close-button))
                                0))
           (tab-amount (length (tab-line-tabs-window-buffers)))
           (window-max-tab-width (/ window-width tab-amount))
           (tab-width (- (cond ((>= window-max-tab-width tab-line-tab-max-width)
                                tab-line-tab-max-width)
                               ((< window-max-tab-width tab-line-tab-min-width)
                                tab-line-tab-min-width)
                               (t window-max-tab-width))
                         close-button-size))
           (buffer-name (string-trim (buffer-name)))
           (name-width (length buffer-name)))
      (if (>= name-width (- tab-width 3))
	  (concat  " " (truncate-string-to-width buffer-name (- tab-width 3)) "… ")
	(let* ((padding (make-string (/ (- tab-width name-width) 2) ?\s))
	       (buffer-name (concat padding buffer-name))
	       (name-width (length buffer-name)))
	  (concat buffer-name (make-string (- tab-width name-width) ?\s)))))))


(defun my/tab-line-tab-name-buffer (buffer &optional _buffers)
  (powerline-render (list my/tab-left
                          (format " %s  " (buffer-name buffer))
                          my/tab-right)))

(setq tab-line-tab-name-function #'my/tab-line-name-buffer)

;;(setq tab-bar-format '(tab-bar-format-global))
;;(setq display-time-day-and-date t)
;;(setq display-time-default-load-average nil)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(which-key magit use-package tab-bar-echo-area rust-mode evil-terminal-cursor-changer)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:height 0.1 :background "black" :foreground "grey75"))))
 '(mode-line-inactive ((t (:height 0.1 :background "black" :foreground "grey25")))))

;;mmm but y? https://gist.github.com/progfolio/1c96a67fcec7584b31507ef664de36cc
