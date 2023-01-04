;;-*- lexical-binding: t -*-

;;;;;;;;;;
;;
;; Ensure we're at least emacs 26.1. *Should* be set for 29 but...
(when (version< emacs-version "26.1")
  (error "This config requires at least version 26.1, but you're running %s"
         emacs-version))

;; Basic layout of this
(defvar _core-dir (file-name-directory load-file-name)
  "Main dir to load modules from.")

(defvar _emacs-dir (expand-file-name user-emacs-directory)
  "Root dir of Emacs")

(defvar _cache-dir (expand-file-name "cache" _emacs-dir)
  "Location for packages to place their respective cache.")

(unless (file-exists-p _cache-dir)
  (make-directory _cache-dir))

(add-to-list 'load-path _core-dir)

;; Store/load custom vars from elsewhere. Otw, it will dump those in init.el
(setq custom-file (expand-file-name "custom.el" _core-dir))
(load-file custom-file)

(require 'package)
(package-initialize)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

;; MacOS specific
(when (eq system-type 'darwin)
  (require 'macos))
;; Linux specific
(when (eq system-type 'gnu/linux)
  (require 'linux))
(require 'ui)
(require 'misc)
(require 'completions)
;;(require 'editing)
;;(require 'project)
;;(require 'workspaces)

(use-package git-gutter
  :ensure t
  :hook (prog-mode . git-gutter-mode)
  :config
  (setq git-gutter:update-interval 0.02))

(use-package git-gutter-fringe
  :config
  (define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated))
  (define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240] nil nil 'bottom))

(global-set-key (kbd "M-o") 'other-window)
;; live and die by BASH
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)

(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(setq password-cache-expiry (* 60 15))
(setq use-dialog-box nil)
(setq switch-to-buffer-obey-display-actions t)



