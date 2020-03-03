;;; init-doom-mode-line.el --- Config doom-mode-line
;;; Commentary:
;;; Code:

(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode))

(use-package all-the-icons)

(provide 'init-doom-modeline)
;;; init-doom-modeline.el ends here
