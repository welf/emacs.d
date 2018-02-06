;;; package --- Emacs' init file

;;; Commentary:
;; This file bootstraps initial Emacs' configuration only.
;; Main configuration is located in config.org file.

;;; Code:
(setq gc-cons-threshold 400000000)

;;; Set up package
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
;; (add-to-list 'package-archives
;;              '("org" . "http://orgmode.org/elpa/"))
(package-initialize)

;;; Bootstrap use-package
;; Install use-package if it's not already installed.
;; use-package is used to configure the rest of the packages.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; From use-package README
(eval-when-compile
  (require 'use-package))
;; (require 'diminish)                ;; if you use :diminish
(require 'bind-key)
;; (setq use-package-verbose t)

;;Keep track of where time is being spent during Emacs startup
(use-package benchmark-init
  :load-path "./packages/benchmark-init"
  :ensure benchmark-init
  :init
  (progn
    (require 'benchmark-init-loaddefs)
    (benchmark-init/activate)
    ;; (benchmark-init/show-durations-tabulated)
    ;; (add-hook 'after-init-hook 'benchmark-init/deactivate)
    ))

;;; Load the config
(org-babel-load-file (concat user-emacs-directory "config.org"))

(setq gc-cons-threshold 800000)

(provide 'init)
;;; init.el ends here
