;; clean up emacs's user interface, make it more minimal
(setq inhibit-startup-message t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)

(menu-bar-mode -1)

(setq visible-bell t)


(set-face-attribute 'default nil :font "Jetbrains Mono" :height 200)
(load-theme 'tango-dark)

;; make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)


;; Initialize package sources
(require 'package)

(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))

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

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(column-number-mode)
(global-display-line-numbers-mode t)

;; disable line numbers for some modes
(dolist (mode '(org-mode-hook
		term-mode-hook
		eshell-mode-hoo))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(use-package command-log-mode)


(use-package ivy
  :defer 0.1
  :diminish
  :bind (("C-c C-r" . ivy-resume)
         ("C-x B" . ivy-switch-buffer-other-window))
  :custom
  (ivy-count-format "(%d/%d) ")
  (ivy-use-virtual-buffers t)
  :config (ivy-mode))

;; (global-set-key (kbd "C-S-j") 'counsel-switch-buffer)




(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)
         ("C-r" . swiper)))

(use-package counsel
  :after ivy
  :bind
  (("M-x" . counsel-M-x)
   ("C-x b" . counsel-ibuffer)
   ("C-x C-f" . counsel-find-file))
   :config (counsel-mode))

(use-package ivy-rich
  :after ivy
  :init
  (ivy-rich-mode 1))


(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))


(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))


(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.1))


(use-package helpful
  :ensure
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key)
  )


(use-package doom-themes
  :config
  (load-theme 'doom-palenight t))

(use-package all-the-icons)
  
(use-package general
  :config
  (general-create-definer been/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")

  (been/leader-keys
    "t"  '(:ignore t :which-key "toggles")
    "tt" '(counsel-load-theme :which-key "choose theme")))


(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))


(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package hydra)

(defhydra hydra-text-scale (:timeout 4)
  "scale text"
  ("j" text-scale-increase "in")
  ("k" text-scale-decrease "out")
  ("f" nil "finished" :exit t))

(been/leader-keys
  "ts" '(hydra-text-scale/body :which-key "scale text"))

(been/leader-keys
  "SPC" '(counsel-M-x :which-key "counsel-M-x"))

(been/leader-keys
  "bb" '(counsel-switch-buffer :which-key "counsel-switch-buffer"))

(been/leader-keys
  "fs" '(save-buffer :which-key "save-buffer"))

(been/leader-keys
  "ff" '(counsel-find-file :which-key "counsel-find-file"))

(been/leader-keys
  "ss" '(swiper :which-key "swiper"))


(use-package smex)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; toggle between most recent buffers                                     ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; http://www.emacswiki.org/emacs/SwitchingBuffers#toc5
(defun switch-to-previous-buffer ()
  "Switch to most recent buffer. Repeated calls toggle back and forth between the most recent two buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))

(been/leader-keys
  "TAB" '(switch-to-previous-buffer :which-key "switch-to-previous-buffer"))

(been/leader-keys
  "wd" '(delete-other-windows :which-key "save-buffer"))

(been/leader-keys
  "cl" '(comment-dwim :which-key "comment-dwim"))


(use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map))

(use-package counsel-projectile
  :config (counsel-projectile-mode))

(use-package magit
  :custom
  (magit-display-buffer-function #'magit-display-buffer-same-window-except-diff-v1))

(setq custom-file "~/.emacs.d/custom.el")

(defun been/open-init-file()
  "Open init.el."
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun been/open-zsh-file()
  "Open init.el."
  (interactive)
  (find-file "~/.dotfiles/.zshrc"))

(been/leader-keys
  "fed" '(been/open-init-file :which-key "open init file"))

(been/leader-keys
  "fz" '(been/open-zsh-file :which-key "open .zshrc"))

(been/leader-keys
  "fr" '(counsel-recentf :which-key "counsel recentf"))

;; disable emacs's automatic backup~ file	
(setq make-backup-files nil)

(use-package company
  :ensure t
  :config
  (global-company-mode))

(use-package smartparens
  :ensure t
  :config
  (smartparens-global-mode t))

(defun been/org-mode-setup ()
  (org-indent-mode)
  (auto-fill-mode)
  (visual-line-mode 1)
  (setq evil-auto-indent nil))

(use-package org
  :hook (org-mode . been/org-mode-setup)
  :config
  (setq org-ellipsis " ▾")
  )

(use-package org-bullets
  :after org
  :hook (org-mode . org-bullets-mode)
  :custom
  (org-bullets-bullet-list '("◉" "○" "●" "○" "●" "○" "●")))

(defun been/org-mode-visual-fill ()
  (setq visual-fill-column-width 100
        visual-fill-column-center-text t)
  (visual-fill-column-mode 1))

(use-package visual-fill-column
  :hook (org-mode . been/org-mode-visual-fill))
