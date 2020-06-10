;;; init-magit.el --- Config magit
;;; Commentary:
;;; Code:

(require-package 'magit)
(global-set-key (kbd "C-x g") 'magit-status)

(provide 'init-magit)
;;; init-local.el ends here
