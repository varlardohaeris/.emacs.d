;;; init-treemacs.el --- config treemacs
;;; Commentary:
;;; Code:
(require-package 'use-package)

(require-package 'treemacs-evil)
(require-package 'treemacs-projectile)
(require-package 'treemacs-icons-dired)
(treemacs-icons-dired-mode)

(require-package 'treemacs-magit)
(require-package 'treemacs-persp)

(provide 'init-treemacs)
;;; init-treemacs.el ends here
