;; -*- lexical-binding: t -*-

(when (version< emacs-version "26.1")
  (error "This config requires at least version 26.1, but you're running %s"
         emacs-version))

(defvar vex/core-dir (file-name-directory load-file-name)
  "Main dir to load modules from.")

(defvar vex/emacs-dir (expand-file-name user-emacs-directory)
  "Root dir of Emacs")

(defvar vex/cache-dir (expand-file-name "cache" vex/emacs-dir)
  "Location for packages to place their respective cache.")

(unless (file-exists-p vex/cache-dir)
  (make-directory vex/cache-dir))

(add-to-list 'load-path vex/core-dir)

(setq custom-file (expand-file-name "custom.el" vex/core-dir))
(load-file custom-file)

(require 'package)
(package-initialize)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")))

(when (eq system-type 'darwin)
  (require 'macos))
(when (eq system-type 'gnu/linux)
  (require 'linux))
(when (eq system-type 'openbsd))
(require 'ui)
(require 'misc)
(require 'completions)
(require 'fns.el)
