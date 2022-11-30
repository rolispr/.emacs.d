;;-*- lexical-binding: t -*-

;;;; Check if we're on mac
(when (string= system-type "darwin")
  (setq mac-command-modifier 'meta)
  (setq dired-use-ls-dired t
        insert-directory-program "/opt/homebrew/bin/gls"))

(provide 'macos)
