;;; init.el --- Load the full configuration -*- lexical-binding: t -*-
;;; Commentary:

;; This file bootstraps the configuration, which is divided into
;; a number of other files.

;;; Code:

;; Produce backtraces when errors occur: can be helpful to diagnose startup issues
;;(setq debug-on-error t)

(let ((minver "24.4"))
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version< emacs-version "25.1")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

;;----------------------------------------------------------------------------
;; Adjust garbage collection thresholds during startup, and thereafter
;;----------------------------------------------------------------------------
(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'emacs-startup-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(require 'init-base)
(require 'init-utils)
(require 'init-site-lisp)
(require 'init-elpa)      
(require 'init-benchmarking)
(require 'init-theme)
(require 'init-doom-modeline)
(require 'init-evil)
(require 'init-ivy)
(require 'init-org)
(require 'init-hungry-delete)
(require 'init-company)
(require 'init-popwin)
(require 'init-counsel-gtags)
(require 'init-imenu)
(require 'init-exec-path)
(require 'init-keybindings)
(require 'init-magit)
(require 'init-javascript)
(require 'init-haskell)
(require 'init-treemacs)
(require 'init-ocaml)
(require 'init-ruby)
(require 'init-rails)
(require 'init-common-lisp)
(require 'init-agda)
(require 'init-nasm)
(require 'init-restart-emacs)
(require 'init-lsp-mode)
(require 'init-c-c++)
(require 'init-sessions)
(when (file-exists-p custom-file)
  (load custom-file))

;; (setq inhibit-startup-screen t)
;; (switch-to-buffer "*scratch*")

(provide 'init)

;; Local Variables:
;; coding: utf-8
;; no-byte-compile: 
;; End:
;;; init.el ends here

