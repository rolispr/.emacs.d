;; -*- lexical-binding: t -*-

(defun vex/set-gnome-bg ()
  (interactive)
   (let ((files '("*.png" "*.jpg"))
	 (result))
     (dolist (elt files result)
       (setq result (cons (mapcar #'file-truename (file-expand-wildcards (concat "~/Downloads/" elt))) result)))
     (lambda () (completing-read "Choose one: " (flatten-list result)))))

(defun set-gnome-bg (path)
  "Set background for Gnome given a PATH string"
  (shell-command
   (format "gsettings set org.gnome.desktop.background picture-uri file:///%s" path)))

(provide 'fns.el)
