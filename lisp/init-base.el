;;; init-base.el --- Some base config
;;; Commentary:
;;; Code:

(tool-bar-mode -1)
(scroll-bar-mode -1)
(add-to-list 'exec-path "/usr/local/bin")
(set-keyboard-coding-system nil)
(menu-bar-mode -1)
(setq make-backup-files nil)

(setq electric-pair-inhibit-predicate 'electric-pair-conservative-inhibit)
(electric-pair-mode 1)

(setq-default initial-scratch-message
              (concat ";; Happy hacking, " user-login-name " - Emacs ♥ you!\n\n"))

(global-linum-mode 1)
(setq create-lockfiles nil)
(setq company-dabbrev-downcase nil)

(setq url-proxy-services
      '(("no_proxy" . "^\\(localhost\\|10.*\\)")
	("http" . "127.0.0.1:7890")
	("https" . "127.0.0.1:7890")))
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))


(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'emacs-startup-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))

(add-to-list 'default-frame-alist
	     '(font . "JetBrains Mono-20"))

(provide 'init-base)
;;; init-base.el ends here
