;;-*- lexical-binding: t -*-

(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)
(setq mac-command-modifier 'meta)
(setq dired-use-ls-dired t
      insert-directory-program "/opt/homebrew/bin/gls")

(provide 'macos)
