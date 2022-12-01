;;-*- lexical-binding: t -*-

(require 'doom-themes)
(require 'magit)
(require 'which-key)

;;; Theme
; For current frame
;;(set-frame-parameter (selected-frame) 'alpha '(100 100))
;;(add-to-list 'default-frame-alist '(alpha 85 85))
(set-frame-parameter nil 'alpha-background 95)
(add-to-list 'default-frame-alist '(alpha-background . 95)) ; For all new frames henceforth
(set-frame-parameter nil 'internal-border-width 1)
(setq-default cursor-type 'bar)
(setq blink-cursor-blinks -1)

;;; Fonts
(add-to-list 'default-frame-alist '(font . "Fira Code 14"))
;;(set-face-attribute 'default nil :font "Terminus-18" )
;;;; Startup display
(fset #'display-startup-echo-area-message #'ignore)
(fset 'yes-or-no-p 'y-or-n-p)
(setq inhibit-startup-message t
      initial-scratch-message ";;hello!
"
      ;;      inhibit-startup-echo-area-message user-login-name
      inhibit-default-init t)

;; Disable bidi
(setq-default bidi-display-reordering 'left-to-right
 	      bidi-paragraph-direction 'nil)

;; (setq highlight-nonselected-windows nil
;;       auto-window-vscroll nil
;;       fast-but-imprecise-scrolling t)

;;; Initial frame position
(when window-system
  (set-frame-position (selected-frame) 0 0)
  (set-frame-size (selected-frame) 95 50))

(setq split-height-threshold nil)
(setq split-width-threshold 0)

;; disable all alerts
(setq ring-bell-function 'ignore) 

(setq tab-bar-show t)
;;(tab-bar-history-mode 1) doesnt work
;;(setq tab-bar-format '(tab-bar-format-global))
;;(setq display-time-day-and-date t)
;;(setq display-time-default-load-average nil)

(global-set-key (kbd "C-x g") 'magit-status)

(setq which-key-sort-order 'which-key-key-order-alpha
      which-key-idle-delay 2)

(load-theme 'doom-moonlight)
(tab-bar-mode t)
(winner-mode 1)
(show-paren-mode 1)
(which-key-mode)

(provide 'ui)
