;; clean up emacs's user interface, make it more minimal
(setq inhibit-startup-message t)
(setq package-check-signature nil)
(global-auto-revert-mode t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)

(menu-bar-mode -1)

(setq visible-bell t)

(defalias 'yes-or-no-p 'y-or-n-p)

(set-face-attribute 'default nil :font "Jetbrains Mono" :height 200)
(load-theme 'tango-dark)

;; ;; set transparent
;; (set-frame-parameter nil 'alpha '(90 .100))



;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(defconst *is-a-mac* (eq system-type 'darwin))

(if *is-a-mac*
    (setq url-proxy-services
          '(("no_proxy" . "^\\(localhost\\|10.*\\)")
            ("http" . "127.0.0.1:7890")
            ("https" . "127.0.0.1:7890")))
  (setq url-proxy-services
        '(("no_proxy" . "^\\(localhost\\|10.*\\)")
          ("http" . "192.168.0.105:7890")
          ("https" . "192.168.0.105:7890"))))

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

;; (use-package exec-path-from-shell
;;   :ensure
;;   :init (exec-path-from-shell-initialize))

(use-package command-log-mode
  :commands command-log-mode)

(use-package page-break-lines
  :diminish
  :hook (after-init . global-page-break-lines-mode))

(use-package ivy
  :diminish
  :init
  (ivy-mode)
  :bind (("C-c C-r" . ivy-resume)
         ("C-x B" . ivy-switch-buffer-other-window))
  :custom
  (ivy-count-format "(%d/%d) ")
  (ivy-use-virtual-buffers t)
  :config
  (setq ivy-use-selectable-prompt t))


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




(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))


(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 0.1))


(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key)
  )


(use-package all-the-icons)

(use-package doom-themes
  :config
  (load-theme 'doom-palenight t))

(use-package doom-modeline
      :ensure t
      :defer t
      :hook (after-init . doom-modeline-init))


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
  (setcdr evil-insert-state-map nil)
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
  "cl" '(evilnc-comment-or-uncomment-lines :which-key "evil nerd comment"))


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


(defun been/org-mode-setup ()
  (org-indent-mode)
  (auto-fill-mode)
  (visual-line-mode 1)
  (setq evil-auto-indent nil))

(use-package org
  :hook (org-mode . been/org-mode-setup)
  :config
  (setq org-ellipsis " ▾"))

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


(use-package dashboard
  :diminish (dashboard-mode page-break-lines-mode)
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-banner-logo-title "Welcome wujiahua, Happy hacking")
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  )


(use-package restart-emacs
  :ensure t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)))

;; (require 'org-tempo)
;; (add-to-list 'org-structure-template-alist '("sh" . "src shell"))
;; (add-to-list 'org-structure-template-alist '("el" . "src emacs-lisp"))
;; (add-to-list 'org-structure-template-alist '("py" . "src python"))


;; (use-package smartparens
;;   :ensure t
;;   :config
;;   (smartparens-global-mode t))

(setq electric-pair-inhibit-predicate 'electric-pair-conservative-inhibit)
(electric-pair-mode 1)
(show-paren-mode 1)


(defun been/lsp-mode-setup ()
  (setq lsp-headerline-breadcrumb-segments '(path-up-to-project file symbols))
  (lsp-headerline-breadcrumb-mode))

(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook
  (
   (lsp-mode . been/lsp-mode-setup)
   (c-mode . lsp)
   (c++-mode . lsp)
   (js-mode . lsp)
   (LaTeX-mode . lsp)
   )
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (lsp-enable-which-key-integration t)
  (if *is-a-mac*
      (setq lsp-clients-clangd-executable "/usr/local/opt/llvm/bin/clangd")
    (setq lsp-clients-clangd-executable "clangd"))
  ;; set clangd path on mac
  )

(use-package flycheck
  :after lsp-mode
  :init (global-flycheck-mode))

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :custom
  (lsp-ui-doc-position 'bottom))
;; lsp-ui-peek-find-references is really cool !

(use-package lsp-treemacs
  :after lsp)
;; lsp-treemacs-symbols && treemacs

(use-package lsp-ivy)
;; lsp-ivy-workspace-symbol
;; lsp-treemacs-symbols


(use-package dap-mode
  :bind
  (:map lsp-mode-map
        ("<tab>" . company-indent-or-complete-common)))



(use-package typescript-mode
  :mode "\\.ts\\'"
  :hook (typescript-mode . lsp-deferred)
  :config
  (setq typescript-indent-level 2))

(use-package smex)
(use-package company
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :hook (lsp-mode . company-mode)
  ;; :bind (:map company-active-map
  ;;        ("<tab>" . company-complete-selection))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package evil-nerd-commenter
  :bind ("M-/" . evilnc-comment-or-uncomment-lines))

(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :bind (("C-x C-j" . dired-jump))
  :config
   (evil-collection-define-key 'normal 'dired-mode-map
    "h" 'dired-single-up-directory
    "l" 'dired-single-buffer)
  )

(use-package dired-single)

(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

;; (use-package auto-package-update
;;   :custom
;;   (auto-package-update-interval 7)
;;   (auto-package-update-prompt-before-update t)
;;   (auto-package-update-hide-results t)
;;   :config
;;   (auto-package-update-maybe)
;;   (auto-package-update-at-time "09:00"))



(use-package hungry-delete
  :init
  (global-hungry-delete-mode))

;; make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)



;; ocaml merlin
(use-package tuareg
  :mode ("\\.ml[ily]?$" . tuareg-mode))

(let ((opam-share (ignore-errors (car (process-lines "opam" "config" "var"
						     "share")))))
  (when (and opam-share (file-directory-p opam-share))
    ;; Register Merlin
    (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
    (autoload 'merlin-mode "merlin" nil t nil)
    ;; Automatically start it in OCaml buffers
    (add-hook 'tuareg-mode-hook 'merlin-mode t)
    (add-hook 'caml-mode-hook 'merlin-mode t)
    ;; Use opam switch to lookup ocamlmerlin binary
    (setq merlin-command 'opam)))


;; smlnl

(use-package sml-mode
  :commands sml-run)

;; rust
(use-package rust-mode
  :hook (rust-mode . lsp)
  :config
  (setq rustic-format-on-save t))
