;;-*- lexical-binding: t -*-

;;;;
;;
;; Ensure we're at least emacs 26.1. *Should* be set for 29 but...
(when (version< emacs-version "26.1")
  (error "This config requires at least version 26.1, but you're running %s"
         emacs-version))

;;; Basic layout of this
(defvar user/core-dir (file-name-directory load-file-name)
  "Main dir to load modules from.")

(defvar user/emacs-dir (expand-file-name user-emacs-directory)
  "Root dir of Emacs")

(defvar user/cache-dir (expand-file-name "cache" user/emacs-dir)
  "Location for packages to place their respective cache.")

(unless (file-exists-p user/cache-dir)
  (make-directory user/cache-dir))

(add-to-list 'load-path user/core-dir)

;; Store/load custom vars from elsewhere. Otw, it will dump those in init.el
(setq custom-file (expand-file-name "custom.el" user/core-dir))
(load-file custom-file)

(require 'package)
(package-initialize)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

;; MacOS specific
(when (eq system-type 'darwin)
  (require 'macos))
;; Linux specific
;;(when (eq system-type 'gnu/linux)
;;  (require 'linux))
(require 'ui)
(require 'misc)
(require 'completions)
;;(require 'editing)
;;(require 'project)
;;(require 'workspaces)

;;; Find me a home 🐵...

(global-set-key (kbd "M-o") 'other-window)
;; live and die by BASH
(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)

(global-set-key (kbd "C-x C-m") 'execute-extended-command)
(setq password-cache-expiry (* 60 15))
(setq use-dialog-box nil)
;;(setq switch-to-buffer-obey-display-actions t)


(defun my/set-gnome-bg ()
  (interactive)
   (let ((files '("*.png" "*.jpg"))
	 (result))
     (dolist (elt files result)
       (setq result (cons (mapcar #'file-truename (file-expand-wildcards (concat "~/Downloads/" elt))) result)))
     (set-gnome-bg (completing-read "Choose one: " (flatten-list result)))))

(defun set-gnome-bg (path)
  "Set background for Gnome given a PATH string"
  (shell-command
   (format "gsettings set org.gnome.desktop.background picture-uri file:///%s" path)))
