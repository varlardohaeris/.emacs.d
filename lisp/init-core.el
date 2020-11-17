;;; init-core.el 
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
(setq inhibit-startup-message t)

(setq-default initial-scratch-message
              (concat ";; Happy hacking, " user-login-name " - Emacs ♥ you!\n\n"))
(global-hl-line-mode 1)
(global-linum-mode 1)
(setq create-lockfiles nil)
(setq company-dabbrev-downcase nil)

(defconst *is-a-mac* (eq system-type 'darwin))

(global-auto-revert-mode 1)
(delete-selection-mode 1)
(setq create-lockfiles nil)

(setq load-prefer-newer t)

(setq inhibit-compacting-font-caches nil)

(setq ring-bell-function 'ignore blink-cursor-mode nil)

(set-charset-priority 'unicode) 
(setq locale-coding-system   'utf-8)    ; pretty
(set-terminal-coding-system  'utf-8)    ; pretty
(set-keyboard-coding-system  'utf-8)    ; pretty
(set-selection-coding-system 'utf-8)    ; please
(prefer-coding-system        'utf-8)    ; with sugar on top
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

(setq scroll-step 2
      scroll-margin 2
      hscroll-step 2
      hscroll-margin 2
      scroll-conservatively 101
      scroll-up-aggressively 0.01
      scroll-down-aggressively 0.01
      scroll-preserve-screen-position 'always)

(global-set-key (kbd "RET") 'newline-and-indent)

(setq mouse-yank-at-point nil)
(setq-default fill-column 120)
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer

(add-to-list 'default-frame-alist
	     '(font . "JetBrains Mono Medium-18"))
(show-paren-mode 1)

(defalias 'yes-or-no-p 'y-or-n-p)

(require 'saveplace)
(save-place-mode 1)
(setq save-place-file (expand-file-name "saveplace" user-emacs-directory))
(setq-default save-place t)

(setq frame-title-format
      (list (format "%s %%S: %%j " (system-name))
            '(buffer-file-name "%f" (dired-directory dired-directory "%b"))))

;; Always load newest byte code
(setq load-prefer-newer t)

;; reduce the frequency of garbage collection by making it happen on
;; each 50MB of allocated data (the default is on every 0.76MB)
(setq gc-cons-threshold 50000000)

;; warn when opening files bigger than 100MB
(setq large-file-warning-threshold 100000000)

;; quit Emacs directly even if there are running processes
(setq confirm-kill-processes nil)

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)


;; Wrap lines at 80 characters
(setq-default fill-column 80)

;; revert buffers automatically when underlying files are changed externally
(global-auto-revert-mode t)

(which-function-mode t)
(provide 'init-core)
;;; init-core.el ends here
