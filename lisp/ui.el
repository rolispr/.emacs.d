;; -*- lexical-binding: t -*-

(when window-system
  (let* ((home-monitor "C32HG7x")
	 (current (cdr (assoc 'name (car (display-monitor-attributes-list))))))
    (when (or (string= home-monitor current) (string= "HDMI-1" current))
      (message "Welcome home!")
      (set-frame-position (selected-frame) 0 0)
      (set-frame-size (selected-frame) 140 65))))

(when (load-theme 'ef-cherie)
  (set-face-attribute 'mode-line nil
		      ;;		    :height 110
		      :box '(:line-width 3 :color "#771a4f"))
  (set-face-attribute 'mode-line-inactive nil
		      ;;		    :height 110
		      :box '(:line-width 3 :color "#392a2f")))

(dolist (face '(window-divider
		window-divider-first-pixel
		window-divider-last-pixel
		))
  (face-spec-reset-face face)
  (set-face-foreground face (face-attribute 'default :background)))

(set-face-background 'fringe (face-attribute 'default :background))

(fset #'display-startup-echo-area-message #'ignore)
(fset 'yes-or-no-p 'y-or-n-p)
(setq inhibit-startup-message           t
      inhibit-default-init              t
      inhibit-startup-echo-area-message user-login-name)

(use-package window
  :config
  (unless (display-graphic-p)
    (set-face-background 'default "unspecified-bg"))

  (setq-default bidi-display-reordering  'left-to-right
 		bidi-paragraph-direction 'nil
		fringes-outside-margins  t)
  
  (setq-default truncate-lines t)

  ;;(setq switch-to-buffer-obey-display-actions t)

  (setq split-height-threshold        nil
	split-width-threshold         200
	highlight-nonselected-windows nil
	auto-window-vscroll           nil
	fast-but-imprecise-scrolling  t
	ring-bell-function            'ignore
	scroll-conservatively         101)

  (setq pixel-scroll-precision-large-scroll-height 10)
  (pixel-scroll-precision-mode))

(use-package magit
  :bind ("C-x g" . magit-status)
  :config
  (put 'magit-clean 'disabled nil))

(use-package git-gutter
  :hook (prog-mode . git-gutter-mode)
  :config
  (setq git-gutter:update-interval 0.02))

(use-package git-gutter-fringe
  :config
  (define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240] nil nil 'bottom))

(use-package tab-bar
  :config
  (add-to-list 'tab-bar-format 'tab-bar-format-align-right t)
  (add-to-list 'tab-bar-format 'tab-bar-format-global t)
  (setq tab-bar-show              nil
	tab-bar-close-button-show nil
	tab-bar-new-button-show   nil
	tab-bar-forward-button    nil
	tab-bar-back-button       nil
	tab-bar-history-mode      t)
  (tab-bar-mode))


(keymap-global-set "M-o" 'other-window)
(keymap-global-set "C-w" 'backward-kill-word)
(keymap-global-set "C-x C-k" 'kill-region)
(keymap-global-set "C-x C-m" 'execute-extended-command)
(keymap-global-set "C-z" 'zap-up-to-char)

(add-hook 'prog-mode-hook #'display-line-numbers-mode)
(add-hook 'prog-mode-hook #'electric-pair-mode)
(add-hook 'prog-mode-hook #'show-paren-mode)

(provide 'ui)
