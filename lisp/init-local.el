;;; init-local.el --- Config font
;;; Commentary:
;;; Code:

(add-to-list 'default-frame-alist
	     '(font . "JetBrains Mono-16"))

(use-package dracula-theme
  :init (load-theme 'dracula t)
  :ensure t)
(use-package hungry-delete
  :ensure t
  :config
  (global-hungry-delete-mode))

(use-package popwin
  :diminish popwin
  :config
  (progn
    (push '("*Occur*" :position bottom :height .3) popwin:special-display-config)
    (push '("*Org Select*" :position bottom :height .3) popwin:special-display-config)
    (push '("*compilation*" :position right :width 80 :noselect t) popwin:special-display-config)
    (popwin-mode 1)))


(setq electric-pair-inhibit-predicate 'electric-pair-conservative-inhibit)
(electric-pair-mode 1)

(provide 'init-local)
;;; init-local.el ends here
