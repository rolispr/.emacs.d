;;-*- lexical-binding: t -*-

(require 'vertico)
(require 'orderless)
(require 'consult)
(require 'all-the-icons)
(require 'all-the-icons-completion)
(require 'marginalia)

;;(fido-vertical-mode 1)

(setq marginalia-align 'right)

;;(setq completions-detailed t)
(setq completion-styles '(orderless basic)
      completion-category-defaults nil
      completion-category-overrides '((file (styles partial-completion))))

;; Add prompt indicator to `completing-read-multiple'.
;; We display [CRM<separator>], e.g., [CRM,] if the separator is a comma.
(defun crm-indicator (args)
  (cons (format "[CRM%s] %s"
                (replace-regexp-in-string
                 "\\`\\[.*?]\\*\\|\\[.*?]\\*\\'" ""
                 crm-separator)
                (car args))
        (cdr args)))

;; Do not allow the cursor in the minibuffer prompt
(setq minibuffer-prompt-properties
      '(read-only t cursor-intangible t face minibuffer-prompt))

;; Emacs 28: Hide commands in M-x which do not work in the current mode.
;; Vertico commands are hidden in normal buffers.
;; (setq read-extended-command-predicate
;;       #'command-completion-default-include-p)

;; Enable recursive minibuffers
(setq enable-recursive-minibuffers t)


(advice-add #'completing-read-multiple :filter-args #'crm-indicator)
(add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)
(add-hook 'marginalia-mode-hook #'all-the-icons-completion-marginalia-setup)

(vertico-mode)
(marginalia-mode)
(all-the-icons-completion-mode)

(provide 'completions)
