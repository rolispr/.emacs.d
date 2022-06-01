;;-*- lexical-binding: t -*-

(package-initialize)
(setq package-archives
      `(
	("localelpa" . ,(concat "/home/bret.horne/" ".elpa-mirror/org/"))
	("melpa"     . ,(concat "/home/bret.horne/" ".elpa-mirror/melpa/"))
        ("org"       . ,(concat "/home/bret.horne/" ".elpa-mirror/org/"))
        ("gnu"       . ,(concat "/home/bret.horne/" ".elpa-mirror/gnu/")))
      )
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;;; (defvar dumpedp nil)
;; (if dumpedp
;;     (progn
;;       (setq load-path dumped-load-path)
;;       (global-font-lock-mode)
;;       (transient-mark-mode))
;;   (progn
;;     (package-initialize)
;;     (setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
;; 			     ("melpa" . "https://melpa.org/packages/")))
;;     (unless (package-installed-p 'use-package)
;;       (package-refresh-contents)
;;       (package-install 'use-package))))

(setq inhibit-startup-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t
      initial-scratch-message nil
      initial-buffer-choice nil
      frame-title-format nil
      use-file-dialog nil
      use-dialog-box nil
      pop-up-windows t
      indicate-empty-lines nil
      cursor-in-non-selected-windows nil
      initial-major-mode 'text-mode
      default-major-mode 'text-mode
      font-lock-maximum-decoration t
      font-lock-maximum-size nil
      auto-fill-mode nil
      visible-bell nil
      ring-bell-function 'ignore
      fill-column 80)
(setq-default cursor-type '(box .  2))
(setq-default cursor-in-non-selected-windows nil)

(setq default-frame-alist
      (append (list
               '(min-height . 1)  '(height . 45)
               '(min-width  . 1)  '(width  . 81)
               '(vertical-scroll-bars . nil)
               '(internal-border-width . 24)
               '(left-fringe . 0)
               '(right-fringe . 0)
;;               '(tool-bar-lines . 0)
               '(menu-bar-lines . 0))))
(when window-system
  (set-frame-position (selected-frame) 0 0)
  (set-frame-size (selected-frame) 90 150))

(set-face-attribute 'default nil :font "Terminus-16")

(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
            kill-buffer-query-functions)
      echo-keystrokes .05 
      enable-recursive-minibuffers t
      sentence-end-double-space nil 
      help-window-select t 
      enable-local-variables :all)

;;(setq header-line-format '("%e" mode-line-front-space mode-line-mule-info mode-line-client mode-line-modified mode-line-remote mode-line-frame-identification mode-line-buffer-identification "   " mode-line-position evil-mode-line-tag (vc-mode vc-mode) ...))
;;(set-face-attribute 
;(setq-default header-line-format '("%b"))
;(setq mode-line-format " ")
(set-display-table-slot standard-display-table
                        'truncation (make-glyph-code ?…))
(set-display-table-slot standard-display-table
                        'wrap (make-glyph-code ?- ))

;; pkg

(use-package gtk-variant
  :disabled
  :config
  (add-hook 'window-setup-hook #'gtk-variant-set-frame)
  (add-hook 'after-make-frame-functions #'gtk-variant-set-frame)
  ;; :hook (
  ;; 	 ('window-setup-hook #'gtk-variant-set-frame)
  ;; 	 ('after-make-frame-functions #'gtk-variant-set-frame)
  ;; 	 )
  )

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
  :defer 5
  :config
  (setq savehist-file "~/.emacs.d/savehist")
  (setq history-length 30000)
  (setq history-delete-duplicates t)
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
  :disabled
  :custom
  (evil-esc-delay 0.001)
  :config
  (setq evil-default-state 'normal)
  (evil-set-initial-state 'shell-mode 'emacs)
  (evil-set-initial-state 'dired-mode 'emacs)
  (evil-mode 1))

(unless (display-graphic-p)
  (use-package evil-terminal-cursor-changer
    :disabled
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
	which-key-idle-delay 2))

;; (use-package window
;;   :ensure nil
;;   :init
;;   (setq display-buffer-alist
;; 	'(
;; 	  (".*"
;; 	   (display-buffer-reuse-window display-buffer-same-window)
;; 	   (resuable-frames . t))
;; 	  ;; top side window
;; 	  ("\\*\\(Flycheck\\|Package-Lint\\).*"
;; 	   (display-buffer-in-side-window)
;; 	   (window-height . 0.16)
;; 	   (side . top)
;; 	   (slot . 0)
;; 	   (window-parameters . ((no-other-window . t))))
;; 	  ("\\*\\(Backtrace\\|Warnings\\|Compile-Log\\|Messages\\)\\*"
;; 	   (display-buffer-in-side-window)
;; 	   (window-height . 0.20)
;; 	   (side . top)
;; 	   (slot . 1)
;; 	   (window-parameters . ((no-other-window . t))))
;; 	  ;; bottom side window
;; 	  ;; ("\\*Ibuffer.*"
;; 	  ;;  (display-buffer-in-side-window)
;; 	  ;;  (window-width . 0.35)
;; 	  ;;  (side . right)
;; 	  ;;  (slot . 0)
;; 	  ;;  (window-parameters . ((no-other-window . t))))
;; 	  ("\\*e?shell.*"
;; 	   (display-buffer-in-side-window)
;; 	   (window-width . 1.5)
;; 	   (side . bottom)
;; 	   (slot . 1))
;; 	  ;; ("vterm"
;; 	  ;;  (display-buffer-in-side-window)
;; 	  ;;  (window-height . 0.20)
;; 	  ;;  (side . bottom)
;; 	  ;;  (slot . 2))
;; 	  ;; left side window
;; 	  ("\\*Help.*"
;; 	   (display-buffer-in-side-window)
;; 	   (window-width . 0.20)       ; See the :hook
;; 	   (side . left)
;; 	   (slot . 0)
;; 	   (window-parameters . ((no-other-window . t))))
;; 	  ))
;;   (setq switch-to-buffer-obey-display-actions t)
;;   (setq window-combination-resize t)
;;   (setq even-window-sizes 'height-only)
;;   (setq window-sides-vertical nil)
;;   :hook ((help-mode . visual-line-mode)
;; 	 (custom-mode . visual-line-mode))
;;   ;; :bind (("s-n" . next-buffer)
;;   ;;        ("s-p" . previous-buffer)
;;   ;;        ("s-o" . other-window)
;;   ;;        ("s-2" . split-window-below)
;;   ;;        ("s-3" . split-window-right)
;;   ;;        ("s-0" . delete-window)
;;   ;;        ("s-1" . delete-other-windows)
;;   ;;        ("s-5" . delete-frame)
;;   ;;        ("C-x +" . balance-windows-area)
;;   ;;        ("<f8>" . window-toggle-side-windows))
;;   )

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

(use-package elpy
  :ensure t
  :init
  (elpy-enable))

(use-package equake
  :disabled
  ;; some examples of optional settings follow:
  :custom
  ;; set width a bit less than full-screen (prevent 'overflow' on multi-monitor):
  (equake-size-width 0.99)
  ;; set distinct face for Equake: white foreground with dark blue background, and different font:
  :custom-face
;;  (equake-buffer-face
;;   ((t (:inherit 'default :family "DejaVu Sans Mono" :background "#000022" :foreground "white"))))
  :config
  ;; prevent accidental frame closure:
  (advice-add #'save-buffers-kill-terminal :before-while #'equake-kill-emacs-advice)
  ;; binding to restore last Equake tab when viewing a non-Equake buffer
  (global-set-key (kbd "C-M-^") #'equake-restore-last-etab)
  ;; set default shell
  (setq equake-default-shell 'eshell)
  ;; set list of available shells
  (setq equake-available-shells
   '("shell"
     "vterm"
     "eshell")))
(load-theme 'doom-oceanic-next t)
 ;;'challenger-deep t)

(use-package vertico
  :init
  (vertico-mode)

  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)

  ;; Show more candidates
  ;; (setq vertico-count 20)

  ;; Grow and shrink the Vertico minibuffer
  ;; (setq vertico-resize t)

  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
  ;; (setq vertico-cycle t)
  )

(use-package corfu
  :ensure t
  ;; Optional customizations
  ;; :custom
  ;; (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  ;; (corfu-auto t)                 ;; Enable auto completion
  ;; (corfu-separator ?\s)          ;; Orderless field separator
  ;; (corfu-quit-no-match nil)      ;; Never quit, even if there is no match
  ;; (corfu-preview-current nil)    ;; Disable current candidate preview
  ;; (corfu-preselect-first nil)    ;; Disable candidate preselection
  ;; (corfu-on-exact-match nil)     ;; Configure handling of exact matches
  ;; (corfu-echo-documentation nil) ;; Disable documentation in the echo area
  ;; (corfu-scroll-margin 5)        ;; Use scroll margin

  ;; You may want to enable Corfu only for certain modes.
  ;; :hook ((prog-mode . corfu-mode)
  ;;        (shell-mode . corfu-mode)
  ;;        (eshell-mode . corfu-mode))

  ;; Recommended: Enable Corfu globally.
  ;; This is recommended since dabbrev can be used globally (M-/).
  :init
  (corfu-global-mode))

;; Optionally use the `orderless' completion style. See `+orderless-dispatch'
;; in the Consult wiki for an advanced Orderless style dispatcher.
;; Enable `partial-completion' for files to allow path expansion.
;; You may prefer to use `initials' instead of `partial-completion'.
;; Optionally use the `orderless' completion style. See
;; `+orderless-dispatch' in the Consult wiki for an advanced Orderless style
;; dispatcher. Additionally enable `partial-completion' for file path
;; expansion. `partial-completion' is important for wildcard support.
;; Multiple files can be opened at once with `find-file' if you enter a
;; wildcard. You may also give the `initials' completion style a try.
(use-package orderless
  :ensure t
  :init
  ;; Configure a custom style dispatcher (see the Consult wiki)
  ;; (setq orderless-style-dispatchers '(+orderless-dispatch)
  ;;       orderless-component-separator #'orderless-escapable-split-on-space)
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles . (partial-completion))))))

;; Use dabbrev with Corfu!
(use-package dabbrev
  ;; Swap M-/ and C-M-/
  :bind (("M-/" . dabbrev-completion)
         ("C-M-/" . dabbrev-expand)))

(use-package ruby-mode
  :ensure t
  :mode "\\.rb\\'"
  :mode "Rakefile\\'"
  :mode "Gemfile\\'"
  :mode "Berksfile\\'"
  :mode "Vagrantfile\\'"
  :interpreter "ruby"

  :init
  (setq ruby-indent-level 2
        ruby-indent-tabs-mode nil)
  (add-hook 'ruby-mode 'superword-mode)

  :bind
  (([(meta down)] . ruby-forward-sexp)
   ([(meta up)]   . ruby-backward-sexp)
   (("C-c C-e"    . ruby-send-region))))  ;; Rebind since Rubocop uses C-c C-r

(use-package inf-ruby
  :ensure t
  :init
  (add-hook 'ruby-mode-hook 'inf-ruby-minor-mode))

(use-package smartparens
  :ensure t
  :diminish (smartparens-mode .  "()")
  :init
    (use-package smartparens-ruby)
    (add-hook 'ruby-mode-hook 'smartparens-strict-mode))

(use-package rubocop
  :ensure t
  :init
  (add-hook 'ruby-mode-hook 'rubocop-mode)
  :diminish rubocop-mode)

(use-package robe
  :ensure t
  :bind ("C-M-." . robe-jump)

  :init
  (add-hook 'ruby-mode-hook 'robe-mode)

  :config
  (defadvice inf-ruby-console-auto
    (before activate-rvm-for-robe activate)
    (rvm-activate-corresponding-ruby)))

(use-package company
  :no-require t
  :config
  (push 'company-robe company-backends))

(use-package emacs
  :init
  ;; Add prompt indicator to `completing-read-multiple'.
  ;; Alternatively try `consult-completing-read-multiple'.
  (defun crm-indicator (args)
    (cons (concat "[CRM] " (car args)) (cdr args)))
  (advice-add #'completing-read-multiple :filter-args #'crm-indicator)

  ;; Do not allow the cursor in the minibuffer prompt
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

  (setq read-extended-command-predicate
        #'command-completion-default-include-p))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("246a9596178bb806c5f41e5b571546bb6e0f4bd41a9da0df5dfbca7ec6e2250c" "745d03d647c4b118f671c49214420639cb3af7152e81f132478ed1c649d4597d" "97db542a8a1731ef44b60bc97406c1eb7ed4528b0d7296997cbb53969df852d6" "613aedadd3b9e2554f39afe760708fc3285bf594f6447822dd29f947f0775d6c" "f91395598d4cb3e2ae6a2db8527ceb83fed79dbaf007f435de3e91e5bda485fb" "a7b20039f50e839626f8d6aa96df62afebb56a5bbd1192f557cb2efb5fcfb662" "5784d048e5a985627520beb8a101561b502a191b52fa401139f4dd20acb07607" "3e335d794ed3030fefd0dbd7ff2d3555e29481fe4bbb0106ea11c660d6001767" "b89a4f5916c29a235d0600ad5a0849b1c50fab16c2c518e1d98f0412367e7f97" "4b0e826f58b39e2ce2829fab8ca999bcdc076dec35187bf4e9a4b938cb5771dc" "d47f868fd34613bd1fc11721fe055f26fd163426a299d45ce69bef1f109e1e71" "8d7b028e7b7843ae00498f68fad28f3c6258eda0650fe7e17bfb017d51d0e2a2" "4a5aa2ccb3fa837f322276c060ea8a3d10181fecbd1b74cb97df8e191b214313" "6b5c518d1c250a8ce17463b7e435e9e20faa84f3f7defba8b579d4f5925f60c1" "da186cce19b5aed3f6a2316845583dbee76aea9255ea0da857d1c058ff003546" "850bb46cc41d8a28669f78b98db04a46053eca663db71a001b40288a9b36796c" "234dbb732ef054b109a9e5ee5b499632c63cc24f7c2383a849815dacc1727cb6" "cbdf8c2e1b2b5c15b34ddb5063f1b21514c7169ff20e081d39cf57ffee89bc1e" "e6f3a4a582ffb5de0471c9b640a5f0212ccf258a987ba421ae2659f1eaa39b09" "7a7b1d475b42c1a0b61f3b1d1225dd249ffa1abb1b7f726aec59ac7ca3bf4dae" "835868dcd17131ba8b9619d14c67c127aa18b90a82438c8613586331129dda63" "a9a67b318b7417adbedaab02f05fa679973e9718d9d26075c6235b1f0db703c8" "b5803dfb0e4b6b71f309606587dd88651efe0972a5be16ece6a958b197caeed8" "23c806e34594a583ea5bbf5adf9a964afe4f28b4467d28777bcba0d35aa0872e" "9b54ba84f245a59af31f90bc78ed1240fca2f5a93f667ed54bbf6c6d71f664ac" "1d44ec8ec6ec6e6be32f2f73edf398620bb721afeed50f75df6b12ccff0fbb15" "846b3dc12d774794861d81d7d2dcdb9645f82423565bfb4dad01204fa322dbd5" "1d5e33500bc9548f800f9e248b57d1b2a9ecde79cb40c0b1398dec51ee820daf" "cc0dbb53a10215b696d391a90de635ba1699072745bf653b53774706999208e3" "4780d7ce6e5491e2c1190082f7fe0f812707fc77455616ab6f8b38e796cbffa9" "3325e2c49c8cc81a8cc94b0d57f1975e6562858db5de840b03338529c64f58d1" "21055a064d6d673f666baaed35a69519841134829982cbbb76960575f43424db" "6df412e59dbfe7f72f24319b9ee4513e40bb0e44384fc93a2c77399e641348f6" "d14f3df28603e9517eb8fb7518b662d653b25b26e83bd8e129acea042b774298" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "7661b762556018a44a29477b84757994d8386d6edee909409fabe0631952dad9" "78c4238956c3000f977300c8a079a3a8a8d4d9fee2e68bad91123b58a4aa8588" "83e0376b5df8d6a3fbdfffb9fb0e8cf41a11799d9471293a810deb7586c131e6" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "2050674326d536ddd3dcea87e077d27071cfbbe974a4540b1a57b6b672f64c51" default))
 '(mini-frame-color-shift-step 0)
 '(mini-frame-internal-border-color "medium spring green")
 '(mini-frame-mode t)
 '(mini-frame-show-parameters '((left . 0.5) (top . 0.0) (width . 1.0) (height . 1)))
 '(package-selected-packages
   '(robe rubocop smartparens inf-ruby cider ansible-vault multiple-cursors doom-modeline golden-ratio ansible w3m ibuffer-git ibuffer-project ibuffer-sidebar org-jira equake gtk-variant corfu selectrum ivy completions-frame doom-themes minimal-theme nyx-theme ayu-theme jazz-theme gruvbox-theme sublime-themes jinja2-mode ibuffer-vc multi-vterm orderless vertico popper go-playground go-mode dockerfile-mode sly-asdf sly helm-posframe helm mini-frame wisp-mode crystal-mode crystal-playground vterm yaml-mode challenger-deep-theme elpy which-key magit use-package tab-bar-echo-area rust-mode evil-terminal-cursor-changer)))

;;mmm but y? https://gist.github.com/progfolio/1c96a67fcec7584b31507ef664de36cc
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))

;; Experimental
;;
;; Line spacing (in pixels)
;; (setq line-spacing 0)

;; Vertical window divider
;; (setq window-divider-default-right-width 24)
;; (setq window-divider-default-places 'right-only)
;; (window-divider-mode 1)

;; (setq window-combination-resize t)
;; (setq even-window-heights nil)
;; (setq window-combination-resize t)
;; (setq resize-mini-windows 'grow-only)
;; (setq max-mini-window-height 0.25)

;; (setq scroll-margin 3
;;       scroll-conservatively 101
;;       scroll-up-aggressively 0.01
;;       scroll-down-aggressively 0.01
;;       scroll-preserve-screen-position t
;;       auto-window-vscroll nil)
      
(setq vterm-environment '("TMOUT="))
(global-set-key (kbd "M-o") #'other-window)

;;(setq package-user-dir (concat user-emacs-directory "modules"))
;;(set-frame-font "Fira Code 16" nil t)
;;(add-to-list 'default-frame-alist '(font . "Fira Code 16"))  
;;(fset #'display-startup-echo-area-message #'ignore)

;; (setq inhibit-startup-message t
;;       initial-scratch-message ";;hello!"
;;       inhibit-startup-echo-area-message user-login-name
;;       inhibit-default-init t)

(fset 'yes-or-no-p 'y-or-n-p)

;; (setq-default bidi-display-reordering 'left-to-right
;; 	      bidi-paragraph-direction 'nil
;; 	      cursor-in-non-selected-windows nil)

;; (setq highlight-nonselected-windows nil
;;       auto-window-vscroll nil
;;       fast-but-imprecise-scrolling t)
(setq completions-detailed t)
;;(fido-mode 1)
;;(icomplete-vertical-mode 1)
;;  (setq-default mode-line-format "%-")
;;  (global-tab-line-mode t)

;;(setq-default mode-line-format " ")
;;(setq tab-bar-format '(tab-bar-format-global))
;;(setq tab-bar-format '(tab-bar-format-global))
;;(setq display-time-day-and-date t)
;;(setq display-time-default-load-average nil)

(setq tab-bar-show t)
(tab-bar-mode t)
(tab-bar-history-mode 1)
;;(winner-mode 1)
(show-paren-mode 1)

;; TAB cycle if there are only few candidates
(setq completion-cycle-threshold 3)

;; Emacs 28: Hide commands in M-x which do not apply to the current mode.
;; Corfu commands are hidden, since they are not supposed to be used via M-x.
;; (setq read-extended-command-predicate
;;       #'command-completion-default-include-p)

;; Enable indentation+completion using the TAB key.
;; `completion-at-point' is often bound to M-TAB.
(setq tab-always-indent 'complete)
