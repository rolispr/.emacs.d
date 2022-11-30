;;-*- lexical-binding: t -*-

(setq inferior-lisp-program "ros -Q run")

(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
            kill-buffer-query-functions)
      echo-keystrokes .05 
      enable-recursive-minibuffers t
      sentence-end-double-space nil 
      help-window-select t 
      enable-local-variables :all)

(provide 'misc)
