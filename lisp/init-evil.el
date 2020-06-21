;;; init-evil.el -- init evil related settings
;;; Commentary:
;;; Code:

(require-package 'evil)

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

;; (define-key evil-motion-state-map (kbd "C-]") 'counsel-etags-find-tag-at-point)
(define-key evil-normal-state-map (kbd "C-]") 'counsel-gtags-dwim)
(define-key evil-normal-state-map (kbd "C-t") 'counsel-gtags-go-backward)




(require-package 'evil-leader)

(global-evil-leader-mode)

(require-package 'evil-matchit)
(global-evil-matchit-mode 1)

(require-package 'evil-surround)
(global-evil-surround-mode)

(require-package 'evil-nerd-commenter)
(evilnc-default-hotkeys)


(provide 'init-evil)
;;; init-evil.el ends here
