;;-*- lexical-binding: t -*-

(use-package emacs
  :hook (prog-mode . display-line-numbers-mode)

  :config

  (setq-default cursor-type 'bar)
  (setq blink-cursor-mode nil)
  ;;(setq blink-cursor-blinks -1) yes im a sadist 🤷

;;;; Startup display
  (fset #'display-startup-echo-area-message #'ignore)
  (fset 'yes-or-no-p 'y-or-n-p)
  (setq inhibit-startup-message t
	inhibit-startup-echo-area-message user-login-name
	inhibit-default-init t)

  (setq ring-bell-function 'ignore)
  
  (show-paren-mode 1)

  (require-theme 'modus-themes)

  (setq-default fringes-outside-margins t)
  (setq scroll-conservatively 101)

  (setq modus-themes-italic-constructs t
        modus-themes-bold-constructs nil
	modus-themes-mixed-fonts t
	modus-themes-variable-pitch-ui nil
	modus-themes-custom-auto-reload t)

  (setq modus-themes-common-palette-overrides
	`(
	  (border-mode-line-active unspecified)
          (border-mode-line-inactive unspecified)
	  (fg-line-number-inactive "gray50")
	  (fg-line-number-active fg-main)
	  (bg-line-number-inactive  unspecified)
	  (bg-line-number-active  unspecified)
	  (fringe unspecified)
	  ,@modus-themes-preset-overrides-intense))

  (load-theme 'modus-vivendi-tinted)
  :bind ("<f5>" . modus-themes-toggle))

(use-package window
  :config

  (set-frame-parameter nil 'internal-border-width 17)

;;; Initial frame position
  (when window-system
    (let ((home-monitor "C32HG7x")
	  (current (cdr (assoc 'name (car (display-monitor-attributes-list))))))
      (when (or (string= home-monitor current) (string= "HDMI-1" current))
	(message "Welcome home!")
	(set-frame-position (selected-frame) 0 0) ;; doesnt work with pgtk
	(set-frame-size (selected-frame) 255 75))))

  ;; Disable bidi
  (setq-default bidi-display-reordering 'left-to-right
 		bidi-paragraph-direction 'nil)

  (setq split-height-threshold nil)
  (setq split-width-threshold 0)
  (setq highlight-nonselected-windows nil
	auto-window-vscroll nil
	fast-but-imprecise-scrolling t))

(use-package magit
  :bind ("C-x g" . magit-status))

(use-package git-gutter
  :hook (prog-mode . git-gutter-mode)
  :config
  (setq git-gutter:update-interval 0.02)
  (setq git-gutter:added-sign " ")
  (setq git-gutter:modified-sign " ")
  (setq git-gutter:deleted-sign " "))

(use-package tab-bar
  :config
  (setq display-time-day-and-date t)
  (setq display-time-default-load-average nil)
  (display-time-mode)
  
  (add-to-list 'tab-bar-format 'tab-bar-format-align-right t)
  (add-to-list 'tab-bar-format 'tab-bar-format-global t)
  (setq tab-bar-show t)
  (tab-bar-history-mode 1)
  (setq tab-bar-close-button-show nil
	tab-bar-new-button-show nil)
  (setq tab-bar-forward-button nil
	tab-bar-back-button nil)
  (tab-bar-mode t))

(provide 'ui)
