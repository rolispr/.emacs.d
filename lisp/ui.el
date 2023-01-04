;;-*- lexical-binding: t -*-

(require 'doom-themes)
(autoload #'magit-status "magit" nil t)
(run-with-idle-timer 2 nil #'require 'which-key nil t)

;;; Theme
; For current frame
;;(set-frame-parameter (selected-frame) 'alpha '(100 100))
;;(add-to-list 'default-frame-alist '(alpha 85 85))
(set-frame-parameter nil 'alpha-background 95)
(add-to-list 'default-frame-alist '(alpha-background . 95)) ; For all new frames henceforth
(set-frame-parameter nil 'internal-border-width 1)
(setq-default cursor-type 'bar)
(setq blink-cursor-blinks -1)

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
(setq tab-bar-close-button-show nil
      tab-bar-new-button-show nil)
;;(tab-bar-history-mode 1) doesnt work
;;(setq tab-bar-format '(tab-bar-format-global))
;;(setq display-time-day-and-date t)
;;(setq display-time-default-load-average nil)

(global-set-key (kbd "C-x g") 'magit-status)

(setq which-key-sort-order 'which-key-key-order-alpha
      which-key-idle-delay 2)

(use-package edwina
  :ensure t
  :config

  (setq display-buffer-base-action '(display-buffer-below-selected))

  (setq edwina-dwm-key-alist
        '(("r" edwina-arrange)
          ("j" edwina-select-next-window)
          ("k" edwina-select-previous-window)
	  ("J" edwina-swap-next-window)
          ("K" edwina-swap-previous-window)
          ("h" edwina-dec-mfact)  
          ("l" edwina-inc-mfact)    
          ("D" edina-dec-nmaster)  
          ("I" edwina-inc-nmaster)  
          ("C" edwina-delete-window) 
          ("RET" edwina-zoom t)     
          ("return" edwina-zoom t)
          ("S-RET" edwina-clone-window t) 
          ("S-return" edwina-clone-window t)))
  (edwina-setup-dwm-keys)
  (edwina-mode 1))

(use-package meow
  
  :ensure t
  :init

  (defun meow-setup ()
    
    (setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)
    
    (meow-motion-overwrite-define-key
     '("j" . meow-next)
     '("k" . meow-prev)
     '("<escape>" . ignore))
    
    (meow-leader-define-key
     ;; SPC j/k will run the original command in MOTION state.
     '("j" . "H-j")
     '("k" . "H-k")
     ;; Use SPC (0-9) for digit arguments.
     '("1" . meow-digit-argument)
     '("2" . meow-digit-argument)
     '("3" . meow-digit-argument)
     '("4" . meow-digit-argument)
     '("5" . meow-digit-argument)
     '("6" . meow-digit-argument)
     '("7" . meow-digit-argument)
     '("8" . meow-digit-argument)
     '("9" . meow-digit-argument)
     '("0" . meow-digit-argument)
     '("/" . meow-keypad-describe-key)
     '("?" . meow-cheatsheet))

    (meow-normal-define-key
     '("0" . meow-expand-0)
     '("9" . meow-expand-9)
     '("8" . meow-expand-8)
     '("7" . meow-expand-7)
     '("6" . meow-expand-6)
     '("5" . meow-expand-5)
     '("4" . meow-expand-4)
     '("3" . meow-expand-3)
     '("2" . meow-expand-2)
     '("1" . meow-expand-1)
     '("-" . negative-argument)
     '(";" . meow-reverse)
     '("," . meow-inner-of-thing)
     '("." . meow-bounds-of-thing)
     '("[" . meow-beginning-of-thing)
     '("]" . meow-end-of-thing)
     '("a" . meow-append)
     '("A" . meow-open-below)
     '("b" . meow-back-word)
     '("B" . meow-back-symbol)
     '("c" . meow-change)
     '("d" . meow-delete)
     '("D" . meow-backward-delete)
     '("e" . meow-next-word)
     '("E" . meow-next-symbol)
     '("f" . meow-find)
     '("g" . meow-cancel-selection)
     '("G" . meow-grab)
     '("h" . meow-left)
     '("H" . meow-left-expand)
     '("i" . meow-insert)
     '("I" . meow-open-above)
     '("j" . meow-next)
     '("J" . meow-next-expand)
     '("k" . meow-prev)
     '("K" . meow-prev-expand)
     '("l" . meow-right)
     '("L" . meow-right-expand)
     '("m" . meow-join)
     '("n" . meow-search)
     '("o" . meow-block)
     '("O" . meow-to-block)
     '("p" . meow-yank)
     '("q" . meow-quit)
     '("Q" . meow-goto-line)
     '("r" . meow-replace)
     '("R" . meow-swap-grab)
     '("s" . meow-kill)
     '("t" . meow-till)
     '("u" . meow-undo)
     '("U" . meow-undo-in-selection)
     '("v" . meow-visit)
     '("w" . meow-mark-word)
     '("w" . meow-mark-symbol)
     '("x" . meow-line)
     '("X" . meow-goto-line)
     '("y" . meow-save)
     '("Y" . meow-sync-grab)
     '("z" . meow-pop-selection)
     '("'" . repeat)
     '("<escape>" . ignore)))
  
  :config
  (meow-setup)
  (meow-global-mode t))

(load-theme 'doom-moonlight)
(tab-bar-mode t)
(winner-mode 1)
(show-paren-mode 1)
(which-key-mode)

(provide 'ui)
