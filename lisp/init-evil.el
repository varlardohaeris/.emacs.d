;;; init-evil.el -- init evil related settings
;;; Commentary:
;;; Code:

(use-package evil
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
						      (evil-normal-state)))

  (define-key evil-motion-state-map (kbd "C-]") 'counsel-etags-find-tag-at-point))

(use-package evil-leader
  :ensure t
  :config
  (global-evil-leader-mode))

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
