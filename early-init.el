(setq gc-cons-threshold most-positive-fixnum)
(setq load-prefer-newer noninteractive)
(setq package-enable-at-startup nil)
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
;;(setq frame-inhibit-implied-resize t)
(setq restore-file-name-handler-alist file-name-handler-alist
      file-name-handler-alist nil)
