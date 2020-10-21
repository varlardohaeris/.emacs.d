;;; init-tools.el
;;; Commentary:
;;; Code:

(use-package benchmark-init
  :ensure t
  :config
  ;; To disable collection of benchmark data after init is done.
  (add-hook 'after-init-hook 'benchmark-init/deactivate))


(use-package which-key
  :ensure t
  :defer t
  :config
  (which-key-mode))


(use-package magit
  :ensure t
  :defer t
  :config
  (global-set-key (kbd "C-x g") 'magit-status))

(use-package hungry-delete
  :ensure t
  :defer t
  :config
  (global-hungry-delete-mode))

;; (use-package restart-emacs
;;   :defer t
;;   :ensure t)

(provide 'init-tools)
;;; init-tools.el ends here
