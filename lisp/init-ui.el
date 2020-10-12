;;; init-ui.el --- Some base config
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

(use-package dracula-theme
  :init (load-theme 'dracula t)
  :ensure t)

(use-package nyan-mode
  :ensure t
  :hook (after-init . nyan-mode)
  :config
  (setq nyan-wavy-trail t
        nyan-animate-nyancat nil))

(use-package beacon
  :ensure t
  :hook (after-init . beacon-mode))

(use-package dired-posframe)

(use-package popwin
  :config
  (popwin-mode 1))

(use-package imenu-list
  :config
  (setq imenu-list-focus-after-activation t))


(use-package rainbow-delimiters
  :config
  (set-face-foreground 'rainbow-delimiters-depth-1-face "chartreuse3") 
  (set-face-foreground 'rainbow-delimiters-depth-2-face "DodgerBlue1") 
  (set-face-foreground 'rainbow-delimiters-depth-3-face "DarkOrange2")
  (set-face-foreground 'rainbow-delimiters-depth-4-face "deep pink") 
  (set-face-foreground 'rainbow-delimiters-depth-5-face "medium orchid") 
  (set-face-foreground 'rainbow-delimiters-depth-6-face "turquoise") 
  (set-face-foreground 'rainbow-delimiters-depth-7-face "lime green") 
  (set-face-foreground 'rainbow-delimiters-depth-8-face "gold") 
  (set-face-foreground 'rainbow-delimiters-depth-9-face "cyan") 
  (set-face-bold 'rainbow-delimiters-depth-1-face "t") 
  (set-face-bold 'rainbow-delimiters-depth-2-face "t") 
  (set-face-bold 'rainbow-delimiters-depth-3-face "t") 
  (set-face-bold 'rainbow-delimiters-depth-4-face "t") 
  (set-face-bold 'rainbow-delimiters-depth-5-face "t") 
  (set-face-bold 'rainbow-delimiters-depth-6-face "t") 
  (set-face-bold 'rainbow-delimiters-depth-7-face "t") 
  (set-face-bold 'rainbow-delimiters-depth-8-face "t") 
  (set-face-bold 'rainbow-delimiters-depth-9-face "t") 
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package
  page-break-lines
  :ensure t
  :hook (after-init . page-break-lines-mode)
  :config (turn-on-page-break-lines-mode))

(use-package
  dashboard
  :ensure t
  :init
  (dashboard-setup-startup-hook)
  (dashboard-modify-heading-icons '((recents . "file-text")
                                    (bookmarks . "book")))
  (setq dashboard-banner-logo-title
        (concat "Happy hacking, " user-login-name " - Emacs ♥ you!\n\n"))
  (setq dashboard-center-content t)
  (setq dashboard-set-heading-icons t)
  ;; (setq dashboard-set-file-icons t)
  (setq dashboard-set-navigator t))

(use-package doom-modeline
  :init
  (doom-modeline-mode 1))

(provide 'init-ui)
;;; init-base.el ends here
