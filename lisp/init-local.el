;;; init-local.el --- Config font
;;; Commentary:
;;; Code:

(add-to-list 'default-frame-alist
	     '(font . "JetBrains Mono-16"))

(use-package dracula-theme
  :init (load-theme 'dracula t)
  :ensure t)

(provide 'init-local)
;;; init-local.el ends here
