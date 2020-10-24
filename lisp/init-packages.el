;;; init-packages.el  -- init packages
;;; Commentary:
;;; Code:

;;; Init Packages
(package-initialize)

(require 'package)
(require 'cl-lib) ; Common Lisp

(defconst *is-a-mac* (eq system-type 'darwin))

(if *is-a-mac*
    (setq url-proxy-services
	  '(("no_proxy" . "^\\(localhost\\|10.*\\)")
            ("http" . "127.0.0.1:7890")
            ("https" . "127.0.0.1:7890")))
  (setq url-proxy-services
	'(("no_proxy" . "^\\(localhost\\|10.*\\)")
          ("http" . "192.168.0.102:7890")
          ("https" . "192.168.0.102:7890"))))

;; (setq package-archives '(("gnu" . "http://mirrors.bfsu.edu.cn/elpa/gnu/")
;;                         ("melpa" . "http://mirrors.bfsu.edu.cn/elpa/melpa/")))
;; 

(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))

;;; Install into separate package dirs for each Emacs version, to prevent bytecode incompatibility
;; (setq package-user-dir
;;       (expand-file-name (format "elpa-%s.%s" emacs-major-version emacs-minor-version)
;;                         user-emacs-directory))

;;; Init Use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
;; (setq use-package-always-defer t)
(setq use-package-always-ensure t)
(setq use-package-hook-name-suffix nil)

(use-package auto-package-update
  :ensure t
  :config
  (setq auto-package-update-delete-old-versions t)
  (setq auto-package-update-hide-results t)
  (auto-package-update-maybe))


(provide 'init-packages)
;;; init-packages.el ends here
