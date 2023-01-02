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

