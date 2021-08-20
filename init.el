;; -*- Ledical-binding: t -*-

(defun after-init-setup ()
  (setq gc-cons-threshold 8388608 ; 8mb
	file-name-handler-alist restore-file-name-handler-alist)
  (message "Startup complete in %s" (emacs-init-time)))

(add-hook 'after-init-hook 'after-init-setup)

;;(setq load-path dumped-load-path)

(fset #'display-startup-echo-area-message #'ignore)

(setq inhibit-startup-message t
      inintial-scratch-message "hello!"
      inhibit-startup-echo-area-message user-login-name
      inhibit-default-init t)

(fset 'yes-or-no-p 'y-or-n-p)

(setq-default bidi-display-reordering 'left-to-right
	      bidi-paragraph-direction 'nil
	      cursor-in-non-selected-windows nil)

(setq highlight-nonselected-windows nil
      auto-window-vscroll nil
      fast-but-imprecise-scrolling t)

(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
            kill-buffer-query-functions)
      echo-keystrokes .05 
      enable-recursive-minibuffers t
      sentence-end-double-space nil 
      help-window-select t 
      enable-local-variables :all)

;; (blink-cursor-mode 0)
;; (winner-mode 0)

;;      find-function-C-source-directory "~/.emacs.d/src")
;;      custom-file (concat user-emacs-directory "custom.el"))
;; TODO:
 ;; ;
;; (require 'org)
;; (setq-default indent-s-mode nil)
;; (setq org-display-inline-images t)
;; (setq org-redisplay-inline-images t)
;; (setq org-startup-with-inline-images "inlineimages")

;; (setq default-frame-alist
;;       (append (list '(width . 72) '(height . 40))))

;; (setq org-confirm-elisp-link-function nil)
      
				  
;; ;(global-set-key [(control z)]         'undo)
;; ;(global-set-key "\C-x\C-x"            'execute-extended-command)

;; ;(set-frame-font "Roboto Mono Light 14")

;;(set-frame-parameter (selected-frame) 'internal-border-width 0)
;; (setq x-underline-at-descent-line t)
;; (setq initial-major-mode 'text-mode)
;; (setq-default line-spacing 0)
;;(set-default 'cursor-type 'box)


;; (setq frame-background-mode 'light)
;; (set-background-color "#ffffff")
;; (set-foreground-color "#666666")

;; ;;(setq inhibit-startup-screen t)
;; ;;(setq inhibit-startup-echo-area-message t)
;; ;;(setq inhibit-startup-message t)   ;; Show/hide startup page
;; (setq initial-scratch-message nil) ;; Show/hide *scratch* buffer message
;; ;; (menu-bar-mode 0)                  ;; Show/hide menubar
;; ;;(tool-bar-mode 0)                  ;; Show/hide toolbar
;; ;;(tooltip-mode  0)                  ;; Show/hide tooltip
;; ;;(scroll-bar-mode 0)                ;; Show/hide scrollbar


;;(desktop-save-mode t)
;; (defun mode-line-render (left right)
;;   "Return a string of `window-width' length containing left, and
;;    right aligned respectively."
;;   (let* ((available-width (- (window-total-width) (length left) )))
;;     (format (format "%%s %%%ds" available-width) left right)))


;; (setq-default header-line-format
;;   '(:eval (mode-line-render

;;    (format-mode-line
;;     (list
;;      (propertize "Buffer: " 'face `(:weight regular))
;;      "%b "
;;      '(:eval (if (and buffer-file-name (buffer-modified-p))
;;          (propertize "(modified)" 
;; 		     'face `(:weight light
;; 			     :foreground "#aaaaaa"))))))
   
;;    (format-mode-line
;;     (propertize "%3l:%2c "
;; 	'face `(:weight light :foreground "#aaaaaa"))))))

;; (set-face-attribute 'region nil
;; 		    :background "#f0f0f0")
;; (set-face-attribute 'highlight nil
;; 		    :foreground "black"
;; 		    :background "#f0f0f0")
;; (set-face-attribute 'org-level-1 nil
;; 		    :foreground "black"
;; 		    :weight 'regular)
;; (set-face-attribute 'org-link nil
;; 		    :underline nil
;; 		    :foreground "dark blue")
;; (set-face-attribute 'org-verbatim nil
;; 		    :foreground "dark blue")
;; (set-face-attribute 'bold nil
;;  		    :foreground "black"
;; 		    :weight 'regular)
;;(setq-default mode-line-format   "")
;; (set-face-attribute 'header-line nil
;;                     :weight 'regular
;; 		    :height 140
;;                     :underline "black"
;;                     :background "#fafafa")
;;                     :foreground "black"
;; 		    :background "white"
;;                     :box `(:line-width 3 :color "white" :style nil))
;;(set-face-attribute 'mode-line nil
;;                     :height 10
;;                     :background "white"
;;                     :foreground "black"
;;                     :box nil)
;; (set-face-attribute 'mode-line-inactive nil
;;                     :box nil
;; :background "gray98"
;; :foreground "gray98")
;; (set-face-attribute 'mode-line-buffer-id nil 
;;                     :weight 'light)
;; (setq org-hide-emphasis-markers t)

;; (use-package minibuffer
;;   :ensure nil
;;   :straight nil
;;   :config
;;   (setq completion-cycle-threshold 3)
;;   (setq completion-flex-nospace nil)
;;   (setq completion-pcm-complete-word-inserts-delimiters t)
;;   (setq completion-pcm-word-delimiters "-_./:| ")
;;   ;; NOTE: flex completion is introduced in Emacs 27
;;   (setq completion-show-help nil)
;;   (setq completion-styles '(partial-completion substring initials flex))
;;   (setq completion-category-overrides
;; 	'((file (styles initials basic))
;; 	  (buffer (styles initials basic))
;; 	  (info-menu (styles basic))))
;;   (setq completions-format 'vertical)   ; *Completions* buffer
;;   (setq enable-recursive-minibuffers t)
;;   (setq read-answer-short t)
;;   (setq read-buffer-completion-ignore-case t)
;;   (setq read-file-name-completion-ignore-case t)
;;   (setq resize-mini-windows t)

;;   (file-name-shadow-mode 1)
;;   (minibuffer-depth-indicate-mode 1)
;;   (minibuffer-electric-default-mode 1))

;;   (defun prot/describe-symbol-at-point (&optional arg)
;;     "Get help (documentation) for the symbol at point.

;; With a prefix argument, switch to the \\*Help\\* window.  If that
;; is already focused, switch to the most recently used window
;; instead."
;;     (interactive "P")
;;     (let ((symbol (symbol-at-point)))
;;       (when symbol
;; 	(describe-symbol symbol)))
;;     (when current-prefix-arg
;;       (let ((help (get-buffer-window "*Help*")))
;; 	(when help
;; 	  (if (not (eq (selected-window) help))
;; 	      (select-window help)
;; 	    (select-window (get-mru-window)))))))

;;   (defun prot/focus-minibuffer ()
;;     "Focus the active minibuffer.

;; Bind this to `completion-list-mode-map' to M-v to easily jump
;; between the list of candidates present in the \\*Completions\\*
;; buffer and the minibuffer (because by default M-v switches to the
;; completions if invoked from inside the minibuffer."
;;     (interactive)
;;     (let ((mini (active-minibuffer-window)))
;;       (when mini
;; 	(select-window mini))))

;;   (defun prot/focus-minibuffer-or-completions ()
;;     "Focus the active minibuffer or the \\*Completions\\*.

;; If both the minibuffer and the Completions are present, this
;; command will first move per invocation to the former, then the
;; latter, and then continue to switch between the two.

;; The continuous switch is essentially the same as running
;; `prot/focus-minibuffer' and `switch-to-completions' in
;; succession."
;;     (interactive)
;;     (let* ((mini (active-minibuffer-window))
;; 	   (completions (get-buffer-window "*Completions*")))
;;       (cond ((and mini
;; 		  (not (minibufferp)))
;; 	     (select-window mini nil))
;; 	    ((and completions
;; 		  (not (eq (selected-window)
;; 			   completions)))
;; 	     (select-window completions nil)))))

;;   :bind (("s-f" . find-file)
;; 	 ("s-F" . find-file-other-window)
;; 	 ("s-d" . dired)
;; 	 ("s-D" . dired-other-window)
;; 	 ("s-b" . switch-to-buffer)
;; 	 ("s-B" . switch-to-buffer-other-window)
;; 	 ("s-h" . prot/describe-symbol-at-point)
;; 	 ("s-H" . (lambda ()
;; 		      (interactive)
;; 		      (let ((current-prefix-arg t))
;; 			(prot/describe-symbol-at-point))))
;; 	 ("s-v" . prot/focus-minibuffer-or-completions)
;; 	 :map completion-list-mode-map
;; 	 ("h" . prot/describe-symbol-at-point)
;; 	 ("n" . next-line)
;; 	 ("p" . previous-line)
;; 	 ("f" . next-completion)
;; 	 ("b" . previous-completion)
;; 	 ("M-v" . prot/focus-minibuffer)))

;; (use-package icomplete
;;   :demand
;;   :straight nil
;;   :config
;;   (setq icomplete-delay-completions-threshold 0)
;;   (setq icomplete-max-delay-chars 0)
;;   (setq icomplete-compute-delay 0)
;;   (setq icomplete-show-matches-on-no-input t)
;;   (setq icomplete-hide-common-prefix nil)
;;   (setq icomplete-prospects-height 1)
;;   (setq icomplete-separator " • ")
;;   (setq icomplete-with-completion-tables t)
;;   (setq icomplete-in-buffer t)

;;   (fido-mode -1)                        ; Emacs 27.1
;;   (icomplete-mode 1)
;; :bind (:map icomplete-minibuffer-map
;;        ("C-n" . icomplete-forward-completions)
;;        ("<right>" . icomplete-forward-completions)
;;        ("<down>" . icomplete-forward-completions)
;;        ("C-p" . icomplete-backward-completions)
;;        ("<left>" . icomplete-backward-completions)
;;        ("<up>" . icomplete-backward-completions)))

;;  (defun prot/icomplete-show-vertical (&optional str)
;;    "Allow `icomplete' to present results vertically.

;; This is meant to be used by other functions that need to show
;; their results as a vertical list, with an optional string marking
;; the demarcation line.

;; For an interactive version see `prot/icomplete-toggle-vertical'."
;;    (when (bound-and-true-p icomplete-mode)
;;      (setq icomplete-prospects-height 10)
;;      (if str
;; 	 (setq icomplete-separator
;; 	       (concat "\n" (propertize str 'face 'shadow) "\n "))
;;        (setq icomplete-separator "\n "))))

;;  (defun prot/icomplete-restore-horizontal ()
;;    "Restore `icomplete' to its horizontal layout.

;; This is meant to be run by the `minibuffer-exit-hook'."
;;    (unless (string= icomplete-separator " · ")
;;      (setq icomplete-prospects-height 1)
;;      (setq icomplete-separator " · ")))

;;  (defun prot/icomplete-recentf ()
;;    "Open `recent-list' item in a new buffer.

;; The user's $HOME directory is abbreviated as a tilde."
;;    (interactive)
;;    (prot/icomplete-show-vertical)
;;    (let ((files (mapcar 'abbreviate-file-name recentf-list)))
;;      (find-file
;;       (completing-read "Open recentf entry: " files nil t))))

;;  (defun prot/icomplete-font-family-list ()
;;    "Add item from the `font-family-list' to the `kill-ring'.

;; This allows you to save the name of a font, which can then be
;; used in commands such as `set-frame-font'."
;;    (interactive)
;;    (prot/icomplete-show-vertical)
;;    (kill-new
;;     (completing-read "Copy font family: "
;; 		     (print (font-family-list))
;; 		     nil t)))

;;  (defun prot/icomplete-yank-kill-ring ()
;;    "Insert the selected `kill-ring' item directly at point.

;; Defaults to a vertical layout.  This is restored on exit by means
;; of `prot/icomplete-restore-horizontal'."
;;    (interactive)
;;    (prot/icomplete-show-vertical "··········")
;;    (insert
;;     (completing-read "Yank from kill ring: " kill-ring nil t)))

;;  (defun prot/icomplete-toggle-vertical ()
;;    "Toggle vertical view for `icomplete'.

;; This is intended as a temporary adjustment of the layout,
;; possibly to read a list of long names.  It is for this reason
;; that `prot/icomplete-restore-horizontal' exists and is called by
;; the `minibuffer-exit-hook'.

;; NOTE: there still needs to be a way to show the minibuffer input
;; on its own line while also displaying the list of candidates."
;;    (interactive)
;;    (when (and (minibufferp)
;; 	      (bound-and-true-p icomplete-mode))
;;      (if (not (string= icomplete-separator "\n "))
;; 	 (progn
;; 	   (setq-local icomplete-prospects-height 10)
;; 	   (setq-local icomplete-separator "\n "))
;;        (setq icomplete-prospects-height 1)
;;        (setq icomplete-separator " · "))))

;;  (defun prot/icomplete-toggle-flex ()
;;    "Toggle between flex and partial-completion (regexp)."
;;    (interactive)
;;    (when (and (minibufferp)
;; 	      (bound-and-true-p icomplete-mode))
;;      (if (not (eq (car completion-styles) 'flex))
;; 	 (progn
;; 	   (setq-local completion-styles '(flex initials substring partial-completion))
;; 	   (message "%s" (propertize "Prioritising FLEX" 'face 'highlight)))
;;        (setq-local completion-styles '(partial-completion substring initials flex))
;;        (message "%s" (propertize "Prioritising PREFIX REGEXP" 'face 'highlight)))))

;;  (defun prot/icomplete-toggle-basic ()
;;    "Toggle between basic and partial-completion (regexp)."
;;    (interactive)
;;    (when (and (minibufferp)
;; 	      (bound-and-true-p icomplete-mode))
;;      (if (not (eq (car completion-styles) 'basic))
;; 	 (progn
;; 	   (setq-local completion-styles '(basic))
;; 	   (message "%s" (propertize "Prioritising BASIC matching" 'face 'highlight)))
;;        (setq-local completion-styles '(partial-completion substring initials flex))
;;        (message "%s" (propertize "Prioritising PREFIX REGEXP" 'face 'highlight)))))

;;  (defun prot/icomplete-force-complete-and-exit ()
;;    "Complete the current `icomplete' match and exit the minibuffer.

;; Contrary to `icomplete-force-complete-and-exit', this will
;; confirm your choice without complaining about incomplete matches.

;; Those incomplete matches can block you from performing legitimate
;; actions, such as defining a new tag in an `org-capture' prompt.

;; In my testing, this is necessary when the variable
;; `icomplete-with-completion-tables' is non-nil, because then
;; `icomplete' will be activated practically everywhere it can."
;;    (interactive)
;;    (icomplete-force-complete)
;;    (exit-minibuffer))

;;  (defun prot/icomplete-kill-ring-save (&optional arg)
;;    "Expand and save current `icomplete' match to the kill ring.

;; With a prefix argument, insert the match to the point in the
;; current buffer and switch focus back to the minibuffer."
;;    (interactive "*P")
;;    (when (and (minibufferp)
;; 	      (bound-and-true-p icomplete-mode))
;;      (icomplete-force-complete)
;;      (kill-new (field-string-no-properties))
;;      (when current-prefix-arg
;;        (kill-new (field-string-no-properties))
;;        (select-window (get-mru-window))
;;        (insert (car kill-ring))
;;        (prot/focus-minibuffer))))

;;  :hook (minibuffer-exit . prot/icomplete-restore-horizontal)
;;  :bind (("s-y" . prot/icomplete-yank-kill-ring)
;; 	("s-r" . prot/icomplete-recentf)
;; 	:map icomplete-minibuffer-map
;; 	("C-n" . icomplete-forward-completions)
;; 	("<right>" . icomplete-forward-completions)
;; 	("<down>" . icomplete-forward-completions)
;; 	("C-p" . icomplete-backward-completions)
;; 	("<left>" . icomplete-backward-completions)
;; 	("<up>" . icomplete-backward-completions)
;; 	("<return>" . prot/icomplete-force-complete-and-exit)
;; 	("M-o w" . prot/icomplete-kill-ring-save)
;; 	("M-o i" . (lambda ()
;; 		     (interactive)
;; 		     (let ((current-prefix-arg t))
;; 		       (prot/icomplete-kill-ring-save))))
;; 	("C-M-|" . prot/icomplete-toggle-vertical)
;; 	("C-M-," . prot/icomplete-toggle-flex)
;; 	("C-M-." . prot/icomplete-toggle-basic)))

;; (use-package mini-frame
;;   :straight (mini-frame :type git :host github :repo "muffinmad/emacs-mini-frame"))

;; (use-package prescient
;; :disabled
;; :config (prescient-persist-mode 1))

;; (use-package selectrum
;;   :disabled
;;   :straight (selectrum :host github :repo "raxod502/selectrum")
;;   :config (selectrum-mode +1))

;; (use-package selectrum-prescient
;;   :disabled
;;   :straight (selectrum-prescient :host github :repo "raxod502/prescient.el" :files ("selectrum-prescient.el"))
;;   :config (selectrum-prescient-mode +1))

;; (use-package window
;;   :ensure nil
;;   :straight nil
;;   :init
;;   (setq display-buffer-alist
;; 	'(;; top side window
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
;; 	  ("\\*Ibuffer.*"
;; 	   (display-buffer-in-side-window)
;; 	   (window-width . 0.35)
;; 	   (side . right)
;; 	   (slot . 0)
;; 	   (window-parameters . ((no-other-window . t))))
;; 	  ("\\*e?shell.*"
;; 	   (display-buffer-in-side-window)
;; 	   (window-width . 1.5)
;; 	   (side . bottom)
;; 	   (slot . 1))
;; 	  ("vterm"
;; 	   (display-buffer-in-side-window)
;; 	   (window-height . 0.20)
;; 	   (side . bottom)
;; 	   (slot . 2))
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

;; (use-package dashboard
;;   :disabled t
;;   :config
;;   (setq dashboard-set-init-info t)
;;   (setq dashboard-set-footer nil)
;;   (setq dashboard-center-content t)
;;   (setq dashboard-items '((recents  . 5)
;; 			(bookmarks . 5)
;; 			(projects . 5)
;; 			(agenda . 5)
;; 			(registers . 5)))
;;   :hook
;;   (after-init . dashboard-setup-startup-hook))

;; (use-package perspective
;;   :disabled
;;   :after counsel
;;   :bind (("C-x C-b" .
;; 	  (lambda (arg)
;; 	    (interactive "P")
;; 	    (if (fboundp 'persp-counsel-switch-buffer)
;; 		(persp-counsel-switch-buffer arg))
;; 	    (counsel-switch-buffer "all"))))
;;   :config (persp-mode t)
  
;;   (setq display-buffer-alist
;; 	'(("\\*compilation\\*"
;;            (display-buffer-reuse-window display-buffer-same-window)
;;            ;; default
;;            (".*"
;;             (display-buffer-same-window)))))

;;   (setq display-buffer-reuse-frames t)         ; reuse windows in other frames
;;   (setq pop-up-windows nil)                    ; display-buffer: avoid splitting
;;   (setq even-window-heights nil))               ; display-buffer: avoid resizing

;; (use-package projectile
;;   :config
;;   (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
;;   (projectile-mode +1))

;; (use-package savehist
;;   :ensure nil
;;   :straight nil
;;   :config
;;   (setq savehist-file "~/.emacs.d/savehist")
;;   (setq history-length 30000)
;;   (setq history-delete-duplicates nil)
;;   (setq savehist-save-minibuffer-history t)
;;   (savehist-mode 1))

;; (use-package saveplace
;;   :ensure nil
;;   :straight nil
;;   :config
;;   (setq save-place-file "~/.emacs.d/saveplace")
;;   (setq save-place-forget-unreadable-files t)
;;   (save-place-mode 1))

;; (use-package org
;;   :ensure nil
;;   :straight nil
;; ;;  :mode ("\\.org\\'" . org-mode)
;;   :config
;;   (setq org-directory "~/.emacs.d/org")
;;   (setq org-agenda-files '("~/.emacs.d/org"))
;;   ;;  (setq org-default-notes-file (concat org-directory "/.org"))
;;   ;; Set how deep refile can go.
;;   ;;  (setq org-refile-targets '((org-agenda-files :maxlevel . 3)))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;   ;;   (setq org-agenda-restore-windows-after-quit t)   ;;
;;   ;;   (setq org-hide-emphasis-markers t)      	      ;;
;;   ;;   (setq org-catch-invisible-edits 'show-and-error) ;;
;;   ;;   (setq org-startup-indented t)		      ;;
;;   ;; 						      ;;
;;   ;; (org-babel-do-load-languages			      ;;
;;   ;;  'org-babel-load-languages			      ;;
;;   ;;  '())					      ;;
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;   ;; Let's have pretty source code blocks
;;   (setq org-edit-src-content-indentation 0
;; 	org-src-tab-acts-natively t
;; 	org-src-fontify-natively t
;; 	org-confirm-babel-evaluate nil)
;;   ;; Run/highlight code using babel in org-mode
;;   (org-babel-do-load-languages 'org-babel-load-languages
;; 			       '((shell . t)
;; 				 (emacs-lisp . t)
;; 				 (clojure . t)))
;;   ;; Use cider as the clojure execution backend
;;   (setq org-babel-clojure-backend 'cider)
;;   ;; Syntax highlight in #+BEGIN_SRC blocks
;;   (setq org-src-fontify-natively t)
;;   ;; Don't prompt before running code in org
;;   (setq orgp-confirm-babel-evaluate nil)

;;   ;; Keybindings Ill need. Workflow revolves around these three commands.
;;   (define-key global-map "\C-ca" 'org-agenda)
;;   (define-key global-map "\C-cc" 'org-capture)
;;   (define-key global-map "\C-cr" 'org-refile)

;;   ;; List of todo keywords. Will modify as needed. Oh btw, the space key will remove any todo-keyword.
;;   ;; May change the binding...right now its C-c C-t (key). A bit unweidly? Meh? Idk.
;;   ;; todo keywords will be for denoting where I am with the task.
;;   (setq org-todo-keywords
;; 	'((sequence "TODO(t!)" "IN-PROGRESS(p!)" "WAITING(w@/!)" "|" "DONE(d!)")
;; 	  (sequence "|" "CANCELLED(c@/!)" "DELEGATED(e@/!)" "SOMEDAY(s@/!)")))

;;   ;; Capture templates
;;   (setq org-capture-templates
;; 	'(("t" "Todo" entry (file "~/.emacs.d/org/Tasks.org")
;; 	   "* TODO %?" :empty-lines 1)
;; 	  ("j" "Journal" entry (file+olp+datetree "~/.emacs.d/org/Journal.org")
;; 	   "* %?\nEntered on: %<%r>" :tree week)
;; 	  ("h" "Habit" entry (file "~/.emacs.d/org/Habits.org")
;; 	   "* TODO %?\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+2d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:END:")))
;;   ;; Tags
;;   (setq org-tag-persistent-alist '(("Leisure" . ?l)("Moderate" . ?m) ("Urgent" . ?u)
;; 				   (:newline . nil)
;; 				   ("Work" . ?w) ("Personal" . ?p)
;; 				   (:newline . nil)
;; 				   ("Practice" . ?P) ("Read" . ?r))))

;; (use-package sublime-themes)
;; (use-package doom-themes)

;; ;(use-package vterm)

;; (use-package eshell-toggle
;;   :disabled
;;   :ensure t
;;   :bind ("C-c s" . eshell-toggle)
;;   :config
;;   (setq eshell-toggle-size-fraction 3)
;;   (setq eshell-toggle-run-command nil)
;;   (setq eshell-toggle-use-projectile-root nil)) ;?

;; (use-package dired
;;   :ensure nil
;;   :straight nil
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

;; (use-package peep-dired
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
;;   :ensure nil
;;   :straight nil
;;   :config
;; ;  (setq image-dired-external-viewer "xdg-open")
;;   (setq image-dired-thumb-size 80)
;;   (setq image-dired-thumb-margin 2)
;;   (setq image-dired-thumb-relief 0)
;;   (setq image-dired-thumbs-per-row 4)
;;   :bind (:map image-dired-thumbnail-mode-map
;;               ("<return>" . image-dired-thumbnail-display-external)))

;; ;;(use-package image-dired+)

;; (use-package dired-subtree
;;   :after dired
;;   :bind (:map dired-mode-map
;;               ("<tab>" . dired-subtree-toggle)
;;               ("<C-tab>" . dired-subtree-cycle)
;;               ("<S-iso-lefttab>" . dired-subtree-remove)))

;; (use-package diredfl
;;   :hook (dired-mode . diredfl-mode))

;; (use-package dired-git-info
;;   :after dired
;;   :config
;;   (setq dgi-commit-message-format "%h\t%s\t%cr")
;;   :bind (:map dired-mode-map
;;               (")" . dired-git-info-mode)))

;; (use-package wgrep
;;   :config
;;   (setq wgrep-auto-save-buffer t)
;;   (setq wgrep-change-readonly-file t))

;; (use-package exec-path-from-shell
;;   :config
;;   (when (memq window-system '(mac ns))
;;     (exec-path-from-shell-initialize))
;;     (setq mac-command-modifier 'meta))

;; (use-package lsp-mode)

;; (use-package flycheck)

;; (use-package yaml-mode)

;; (use-package elfeed
;;   :config
;;   (setq elfeed-feeds
;;         '(("http://nullprogram.com/feed/" blog emacs)
;;           "http://planet.emacsen.org/atom.xml"
;;           ("https://www.youtube.com/feeds/videos.xml?channel_id=UC0aanx5rpr7D1M7KCFYzrLQw")
;;           ("https://www.youtube.com/feeds/videos.xml?channel_id=UC0aanx5rpr7D1M7KCFYzrLQ" youtube)
;;           ("https://www.youtube.com/feeds/videos.xml?channel_id=UCgPClNr5VSYC3syrDUIlzLw" youtube)
;;           ("https://www.youtube.com/feeds/videos.xml?channel_id=UC6nSFpj9HTCZ5t-N3Rm3-HA" youtube)
;;           ("https://www.youtube.com/feeds/videos.xml?channel_id=UC6nSFpj9HTCZ5t-N3Rm3-HA" youtube)
;;           ("https://www.youtube.com/feeds/videos.xml?channel_id=UCzQUP1qoWDoEbmsQxvdjxgQ" youtube)
;;           ("https://www.youtube.com/feeds/videos.xml?channel_id=UCq6VFHwMzcMXbuKyG7SQYIg" youtube)
;;           ("https://www.youtube.com/feeds/videos.xml?channel_id=UCDWIvJwLJsE4LG1Atne2blQ" youtube)
;;           ("https://www.youtube.com/feeds/videos.xml?channel_id=UC7UiChjgT_LDKcr_8NEEbMA" youtube)
;;           ("https://www.youtube.com/feeds/videos.xml?channel_id=UCwoTj-pZgZZ8DInOXSSLMmA" youtube)
;;           ("https://www.youtube.com/feeds/videos.xml?channel_id=UC2riBMG3qf1Di20ouRc76BA" youtube)
;;           ("https://www.youtube.com/feeds/videos.xml?channel_id=UClqhvGmHcvWL9w3R48t9QXQ" youtube)
;;           ("https://www.youtube.com/feeds/videos.xml?channel_id=UCkitABalXafr-NqceQdDXtg" youtube)
;;           ("https://www.youtube.com/feeds/videos.xml?channel_id=UC4USoIAL9qcsx5nCZV_QRnA" youtube)
;;           ("https://www.youtube.com/feeds/videos.xml?channel_id=UCtUId5WFnN82GdDy7DgaQ7w" youtube)
;;           ("https://www.youtube.com/feeds/videos.xml?channel_id=UCmYTgpKxd-QOJCPDrmaXuqQ" youtube)
;;           ("https://www.youtube.com/feeds/videos.xml?channel_id=UC9CuvdOVfMPvKCiwdGKL3cQ" youtube)
;;           ("https://www.youtube.com/feeds/videos.xml?channel_id=UCFk8kgNu_bqsRZewxMGqkzQ" youtube)
;;           ("https://www.youtube.com/feeds/videos.xml?channel_id=UC91V6D3nkhP89wUb9f_h17g" youtube)
;;           ("https://www.youtube.com/feeds/videos.xml?channel_id=UCtMVHI3AJD4Qk4hcbZnI9ZQ" youtube)
;;           ("https://www.youtube.com/feeds/videos.xml?channel_id=UCJJDD-Hy76jvUMRG-dpFkcw" youtube)))
;;   :bind ("C-x w" . elfeed))
;; (put 'set-goal-column 'disabled nil)


;; ;; setup to switch between lisps
;; (setq inferior-lisp-program "sbcl")

;; (use-package slime-company
;;   :disabled
;;   :after (slime company)
;;   :config
;;   (load (expand-file-name "~/quicklisp/slime-helper.el"))
;;   (setq slime-company-completion 'fuzzy
;;         slime-company-after-completion 'slime-company-just-one-space))

;; ;(use-package sly
;; ;  :config
;; ;  )
;; ;
;; ;(use-package ac-sly
;; ;  :config
;; ;  (add-hook 'sly-mode-hook 'set-up-sly-ac)
;; ;  (eval-after-load 'auto-complete
;; ;    '(add-to-list 'ac-modes 'sly-mrepl-mode)))


;; (defun my-terminal-mode-hook ()
;;   "Do some things when opening a terminal."

;;   ;; for terminals only, we want the default face to be reversed
;;   (face-remap-add-relative 'default '((:background "black") (:foreground "white")))

;;   ;; our terminal doesn't need a mode- or header-line
;;   (setq mode-line-format nil)
;;   (setq header-line-format nil) ; why doesn't this work?
;;   (centaur-tabs-local-mode)
;;   ;; it doesn't need fringes either
;;   ;; ...but all of the fringe-set functions either don't work or apply to the whole frame :(
;;   (face-remap-add-relative 'fringe '((:background "black")))

;;   ;; we don't need line/column numbers in our header line either
;;   (setq-local header-line-format
;;               '((:eval
;;                  (status-line-render
;;                   (format "%%b")
;;                   (format " "))))))
;; (add-hook 'shell-mode-hook 'my-terminal-mode-hook)

;; (use-package doom-themes
;;   :config (load-theme 'doom-one-light t))

;; (use-package doom-modeline
;;   :config (doom-modeline-mode t))
;;(use-package centaur-tabs)

;; ;; No sound
;; (setq visible-bell t)
;; (setq ring-bell-function 'ignore)

;; (fringe-mode '(0 . 0))
;; (defface fallback '((t :family "Fira Code Light"
;;                        :inherit 'face-faded)) "Fallback")
;; (set-display-table-slot standard-display-table 'truncation
;;                         (make-glyph-code ?… 'fallback))
;; (set-display-table-slot standard-display-table 'wrap
;;                         (make-glyph-code ?↩ 'fallback))
;; (set-display-table-slot standard-display-table 'selective-display
;;                         (string-to-vector " …"))

;; (set-face-font 'default "Fira Code Light 12")
;; (setq default-frame-alist
;;       (append (list '(width  . 72) '(height . 40)
;;                     '(vertical-scroll-bars . nil)
;; ;;                    '(internal-border-width . 24)
;;                     '(font . "Fira Code Light 12"))))
 ;; (set-frame-parameter (selected-frame)
 ;;                      'internal-border-width 0)

;; (defun status-line-render (left-content right-content)
;;   "Render LEFT-CONTENT and RIGHT-CONTENT, appropriately justified."
;;   (let* ((left-str (format-mode-line left-content))
;;          (right-str (format-mode-line right-content))
;;          (available-width
;;           (- (window-total-width)
;;              (length left-str)
;;              (length right-str)
;;              2))) ; left and right padding
;;     (format " %s%s%s "
;;             (propertize left-str 'face nil)
;;             (format (format "%%%ds" available-width) "")
;;             (propertize right-str 'face nil))))

;; (defun set-modeline-faces ()

;;   ;; Mode line at top
;;   (set-face 'header-line                                 'face-strong)
;;   (set-face-attribute 'header-line nil
;;                                 :underline (face-foreground 'default))
;;   (set-face-attribute 'mode-line nil
;;                       :height 10
;;                       :underline (face-foreground 'default)
;;                       :overline nil
;;                       :box nil 
;;                       :foreground (face-background 'default)
;;                       :background (face-background 'default))
;;   (set-face 'mode-line-inactive                            'mode-line)
  


;;   (set-face-attribute 'cursor nil
;;                       :background (face-foreground 'default))
;;   (set-face-attribute 'window-divider nil
;;                       :foreground (face-background 'mode-line))
;;   (set-face-attribute 'window-divider-first-pixel nil
;;                       :foreground (face-background 'default))
;;   (set-face-attribute 'window-divider-last-pixel nil
;;                       :foreground (face-background 'default))
;;   )
;; (set-modeline-faces)


;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(frame-title-format '("%f") t)
;; ;; '(fringe-mode '(24 . 8) nil (fringe))
;;  '(header-line-format
;;    '((:eval
;;       (status-line-render
;;        (format "%s %%b"
;;                (if
;;                    (and
;;                     (buffer-file-name)
;;                     (buffer-modified-p))
;;                    "*" " "))
;;        (format "%s"
;;                (format-mode-line "%l:%c"))))) t))

;; (use-package solaire-mode
;;   :hook
;;   ((change-major-mode after-revert ediff-prepare-buffer) . turn-on-solaire-mode)
;;   (minibuffer-setup . solaire-mode-in-minibuffer)
;;   :config
;;   (solaire-global-mode +1)
;;   (solaire-mode-swap-bg))


;; No sound
;;(setq visible-bell t)
;;(setq ring-bell-function 'ignore)

;;(fringe-mode '(0 . 0))
;; (defface fallback '((t :family "Fira Code Light"
;;                        :inherit 'face-faded)) "Fallback")
;; (set-display-table-slot standard-display-table 'truncation
;;                         (make-glyph-code ?… 'fallback))
;; (set-display-table-slot standard-display-table 'wrap
;;                         (make-glyph-code ?↩ 'fallback))
;; (set-display-table-slot standard-display-table 'selective-display
;;                         (string-to-vector " …"))

;; (set-face-font 'default "Fira Code Light 12")
;; (setq default-frame-alist
;;       (append (list '(width  . 72) '(height . 40)
;;                     '(vertical-scroll-bars . nil)
;; ;;                    '(internal-border-width . 24)
;;                     '(font . "Fira Code Light 12"))))
 ;; (set-frame-parameter (selected-frame)
 ;;                      'internal-border-width 0)

;; (setq straight-use-package-by-default t)
;; (defvar bootstrap-version)
;; (let ((bootstrap-file
;; (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
;;       (bootstrap-version 5))
;;   (unless (file-exists-p bootstrap-file)
;;     (with-current-buffer
;;         (url-retrieve-synchronously
;;          "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
;;          'silent 'inhibit-cookies)
;;       (goto-char (point-max))
;;       (eval-print-last-sexp)))
;;   (load bootstrap-file nil 'nomessage))

;; (straight-use-package 'use-package) ; configure packages with use-package
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(custom-safe-themes
;;    '("12d55f309ad358446807a2e6e9931f8e16c5148e13c158e0f56fed352d098133" default)))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )
