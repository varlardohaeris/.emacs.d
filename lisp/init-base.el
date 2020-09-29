;;; init-base.el --- Some base config
;;; Commentary:
;;; Code:

(tool-bar-mode -1)
(scroll-bar-mode -1)
(add-to-list 'exec-path "/usr/local/bin")
(set-keyboard-coding-system nil)
(menu-bar-mode -1)
(setq make-backup-files nil)
(set-frame-parameter nil 'alpha '(90 .100))
(set-cursor-color "green2")

(setq-default initial-scratch-message
              (concat ";; Happy hacking, " user-login-name " - Emacs ♥ you!\n\n"))
(global-hl-line-mode 1)
(global-linum-mode 1)
(setq create-lockfiles nil)
(setq company-dabbrev-downcase nil)

(defconst *is-a-mac* (eq system-type 'darwin))

(when *is-a-mac*
  (setq url-proxy-services
	'(("no_proxy" . "^\\(localhost\\|10.*\\)")
	  ("http" . "127.0.0.1:7890")
	  ("https" . "127.0.0.1:7890"))))


(setq custom-file (expand-file-name "custom.el" user-emacs-directory))


(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer

(add-to-list 'default-frame-alist
	     '(font . "JetBrains Mono Medium-18"))

(defalias 'yes-or-no-p 'y-or-n-p)

(require 'saveplace)
(save-place-mode 1)
(setq save-place-file (expand-file-name "saveplace" user-emacs-directory))
(setq-default save-place t)


(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
            '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

(provide 'init-base)
;;; init-base.el ends here
