;;; init-tools.el
;;; Commentary:
;;; Code:
(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package command-log-mode
  :ensure t)

(use-package magit
  :ensure t
  :config
  (global-set-key (kbd "C-x g") 'magit-status))

(use-package hungry-delete
  :ensure t
  :config
  (global-hungry-delete-mode))

(use-package restart-emacs
  :ensure t)

(use-package exec-path-from-shell
  :ensure t
  :init
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(provide 'init-tools)
;;; init-tools.el ends here
