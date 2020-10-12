;;; init-agda.el
;;; Commentary:
;;; Code:
(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))

(provide 'init-agda)
;;; init-agda.el ends here
