;;-*- lexical-binding: t -*-

(use-package emacs
  :hook ((prog-mode . display-line-numbers-mode)
	 (prog-mode . electric-pair-mode)
	 (prog-mode . show-paren-mode))
  :config
;;; Initial frame position
  (when window-system
    (let ((home-monitor "C32HG7x")
	  (current (cdr (assoc 'name (car (display-monitor-attributes-list))))))
      (when (or (string= home-monitor current) (string= "HDMI-1" current))
	(message "Welcome home!")
	(set-frame-position (selected-frame) 0 0) ;; doesnt work with pgtk
	(set-frame-size (selected-frame) 255 75))))

;;; Simple ui improvements
  (set-frame-parameter nil 'internal-border-width 17)

  (setq-default cursor-type 'bar)
  (setq blink-cursor-mode nil)

;;; Startup display
  (fset #'display-startup-echo-area-message #'ignore)
  (fset 'yes-or-no-p 'y-or-n-p)
  (setq inhibit-startup-message           t
	inhibit-default-init              t
	inhibit-startup-echo-area-message user-login-name)

;;; Setup theme  
  (require-theme 'modus-themes)

  (setq modus-themes-italic-constructs  t
        modus-themes-bold-constructs    nil
	modus-themes-mixed-fonts        t
	modus-themes-variable-pitch-ui  nil
	modus-themes-custom-auto-reload t)

  (setq modus-themes-common-palette-overrides
	`(
	  (border-mode-line-active   unspecified)
          (border-mode-line-inactive unspecified)
	  (fg-line-number-inactive   "gray50")
	  (fg-line-number-active     fg-main)
	  (bg-line-number-inactive   unspecified)
	  (bg-line-number-active     unspecified)
	  (fringe                    unspecified)
	  ,@modus-themes-preset-overrides-intense))

  (load-theme 'modus-vivendi-tinted)
  :bind ("<f5>" . modus-themes-toggle))

(use-package window
  :config

  (setq-default bidi-display-reordering  'left-to-right
 		bidi-paragraph-direction 'nil
		fringes-outside-margins  t)

  (setq split-height-threshold        nil
	split-width-threshold         0
	highlight-nonselected-windows nil
	auto-window-vscroll           nil
	fast-but-imprecise-scrolling  t
	ring-bell-function            'ignore
	scroll-conservatively         101))

(use-package magit
  :bind ("C-x g" . magit-status))

(use-package git-gutter
  :hook (prog-mode . git-gutter-mode)
  :config
  (setq git-gutter:update-interval 0.02
	git-gutter:added-sign      " "
	git-gutter:modified-sign   " "
	git-gutter:deleted-sign    " "))

(use-package tab-bar
  :config
  (setq display-time-day-and-date         t
	display-time-default-load-average nil
	display-time-mode                 t)
  
  (add-to-list 'tab-bar-format 'tab-bar-format-align-right t)
  (add-to-list 'tab-bar-format 'tab-bar-format-global t)

  (setq tab-bar-show              t
	tab-bar-close-button-show nil
	tab-bar-new-button-show   nil
	tab-bar-forward-button    nil
	tab-bar-back-button       nil
	tab-bar-mode              t
	tab-bar-history-mode      t))

(provide 'ui)
