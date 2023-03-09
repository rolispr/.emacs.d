;; -*- lexical-binding: t -*-

;; Prevent compilation from popping up warnings *NOTE: not working as intended..
(setq native-comp-async-report-warnings-errors 'silent)

;; Main hook to run after core loads
(add-hook 'emacs-startup-hook
	  ;; restore the disabled checking against file handler alist
	  ;; and set a smaller gc threshold to gc more but have shorter gc's as well
	  (let ((restore-list file-name-handler-alist)
		(threshold (* 16 1024 1024)))
	    (lambda ()
	      (message "startup in %s with %d gc's."
		       (format "%.2f seconds"
			       (float-time
				(time-subtract after-init-time before-init-time)))
		       gcs-done)
	      (setq file-name-handler-alist restore-list
		    gc-cons-threshold threshold)
	      (garbage-collect)))
	  ;; wait later to restore in case others are using `emacs-startup-hook'
	  100)

(add-hook 'window-setup-hook
	  (lambda ()
	    (setq-default inhibit-redisplay nil
			  inhibit-message nil)
	    (modify-all-frames-parameters
	     '((right-divider-width . 25)
	       (internal-border-width . 25)
	       (right-fringe . 10)
	       (left-fringe . 10)))
	    (redisplay)))

;; Some simple performance tweaks
;; 
;;;; First let's set the gc threshold to 100 mb so we gc less during startup.
;;;; `most-positive-fixnum' is another option if there is more demand during startup
(setq gc-cons-threshold 100000000
      ;; always load new bytecode
      load-prefer-newer noninteractive
      ;; dont load packages until we're ready
      package-enable-at-startup nil
      ;; disable checking against file handler alist when using file primitives for startup
      file-name-handler-alist nil)

(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
(setq frame-inhibit-implied-resize t)
(add-to-list 'default-frame-alist '(font . "Hack 11"))

(set-language-environment "UTF-8")
(setq default-input-method nil)

(setq package-quickstart t)
(setq use-package-compute-statistics t)
