;;; init-javascript.el --- Support for Javascript and derivatives -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package json-mode
  :ensure t)

(add-to-list 'auto-mode-alist '("\\.\\(js\\|es6\\)\\(\\.erb\\)?\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist (cons "node" 'js2-mode))

(use-package typescript-mode
  :ensure t)

(use-package js2-mode
  :ensure t)
(use-package coffee-mode
  :ensure t)


(provide 'init-javascript)
;;; init-javascript.el ends here
