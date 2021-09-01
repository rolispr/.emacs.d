;;-*- lexical-binding: t -*-

(add-hook 'emacs-startup-hook
	  (let ((restore-list file-name-handler-alist)
		(threshold 8388608)) ; 8mb
	    (lambda ()
	      (message "startup in %s with %d gc's."
		       (format "%.2f seconds"
			       (float-time
				(time-subtract after-init-time before-init-time)))
		       gcs-done)
	      (setq file-name-handler-alist restore-list
		    gc-cons-threshold threshold)
	      (garbage-collect)))
	  t)

(setq gc-cons-threshold 100000000;;lets try 100mb;;most-positive-fixnum
      load-prefer-newer noninteractive
      package-enable-at-startup nil
      file-name-handler-alist nil)

(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
(setq frame-inhibit-implied-resize t)
