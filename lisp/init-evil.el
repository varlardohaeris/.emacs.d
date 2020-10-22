;;; init-evil.el -- init evil related settings
;;; Commentary:
;;; Code:

(use-package evil-leader
  :commands (evil-leader-mode)
  :ensure evil-leader
  :demand evil-leader
  :init (global-evil-leader-mode)
  (progn
    (global-set-key (kbd "C-w") 'backward-kill-word)
    (evil-leader/set-leader "SPC")
    (evil-leader/set-key
      "al"  'clm/toggle-command-log-buffer
      "bb"  'ivy-switch-buffer
      "bi"  'imenu-list-smart-toggle
      "cd"  'comment-dwim
      "ci"  'evilnc-comment-or-uncomment-lines
      "cl"  'evilnc-quick-comment-or-uncomment-to-the-line
      "ll"  'evilnc-quick-comment-or-uncomment-to-the-line
      "cc"  'evilnc-copy-and-comment-lines
      "cp"  'evilnc-comment-or-uncomment-paragraphs
      "cr"  'comment-or-uncomment-region
      "cv"  'evilnc-toggle-invert-comment-line-by-line
      "fed" 'been/open-init-file
      "ff"  'counsel-find-file
      "fr"  'counsel-recentf
      "fs"  'save-buffer
      "ft"  'treemacs
      "fz"  'been/open-zsh-file
      "mm"  'evilmi-jump-items
      "pf"  'counsel-projectile
      "ps"  'counsel-ag
      "pS"  'been/counsel-ag-thing-at-point
      "ss"  'swiper
      "sS"  'been/swiper-thing-at-point
      "SPC" 'counsel-M-x
      "tt"  'counsel-gtags-dwim
      "tb"  'counsel-gtags-go-backward
      "TAB" 'mode-line-other-buffer
      "wh"  'windmove-left
      "wl"  'windmove-right
      "wk"  'windmove-up
      "wj"  'windmove-down
      "wd"  'delete-other-windows)))


(use-package evil
  :ensure t
  :config

  (evil-mode 1)

  ;; config evil
  (setcdr evil-insert-state-map nil)
  (define-key evil-insert-state-map [escape] 'evil-normal-state)

  ;; j/k for browsing wrapped lines
  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)


  ;; page up with Ctrl-k
  (define-key evil-normal-state-map (kbd "C-k") (lambda()
						  (interactive)
						  (evil-scroll-up nil)))

  ;; page down with Ctrl-j
  (define-key evil-normal-state-map (kbd "C-j") (lambda()
						  (interactive)
						  (evil-scroll-down nil)))

  (define-key evil-insert-state-map (kbd "C-c C-c") (lambda()
						      (interactive)
						      (evil-normal-state)))


  (define-key evil-insert-state-map (kbd "C-c C-c") (lambda()
						      (interactive)
						      (evil-normal-state))))
(use-package evil-matchit
  :ensure t
  :config
  (global-evil-matchit-mode 1))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode))


(use-package evil-nerd-commenter
  :ensure t
  :config
  (evilnc-default-hotkeys))

(provide 'init-evil)
;;; init-evil.el ends here
