;;; init-tools.el
;;; Commentary:
;;; Code:
(use-package which-key
  :config
  (which-key-mode))

(use-package command-log-mode)

(use-package magit
  :config
  (global-set-key (kbd "C-x g") 'magit-status))

(use-package hungry-delete
  :ensure t
  :config
  (global-hungry-delete-mode))

(use-package restart-emacs)

(use-package exec-path-from-shell
  :init
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(provide 'init-tools)
;;; init-tools.el ends here
