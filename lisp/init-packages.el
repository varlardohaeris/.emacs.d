;;; init-packages.el 
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

(setq package-archives '(("gnu" . "http://mirrors.bfsu.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.bfsu.edu.cn/elpa/melpa/")))

;;; Install into separate package dirs for each Emacs version, to prevent bytecode incompatibility
;; (setq package-user-dir
;;       (expand-file-name (format "elpa-%s.%s" emacs-major-version emacs-minor-version)
;;                         user-emacs-directory))

;;; Init Use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(setq use-package-hook-name-suffix nil)

(setq use-package-always-ensure t)
(setq use-package-always-defer t)
(setq use-package-always-demand nil)
(setq use-package-expand-minimally t)
(setq use-package-verbose t)


;;; Set load path
(defconst my-emacs-d (file-name-as-directory user-emacs-directory)
  "Directory of emacs.d")

(defconst my-site-lisp-dir (concat my-emacs-d "site-lisp")
  "Directory of site-lisp")

(defconst my-lisp-dir (concat my-emacs-d "lisp")
  "Directory of lisp.")

(defun my-add-subdirs-to-load-path (lisp-dir)
  "Add sub-directories under LISP-DIR into `load-path'."
  (let* ((default-directory lisp-dir))
    (setq load-path
          (append
           (delq nil
                 (mapcar (lambda (dir)
                           (unless (string-match-p "^\\." dir)
                             (expand-file-name dir)))
                         (directory-files my-site-lisp-dir)))
           load-path))))

(my-add-subdirs-to-load-path (file-name-as-directory my-site-lisp-dir))

(add-to-list 'load-path "~/.emacs.d/site-lisp/magit/lisp")
(add-to-list 'load-path "~/.emacs.d/site-lisp/transient/lisp")

(add-to-list 'load-path "~/.emacs.d/site-lisp/treemacs/src/elisp")
(add-to-list 'load-path "~/.emacs.d/site-lisp/treemacs/src/extra")

(add-to-list 'load-path "~/.emacs.d/site-lisp/utop/src/top")

(provide 'init-packages)
;;; init-packages.el ends here
