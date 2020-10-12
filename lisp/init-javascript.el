;;; init-javascript.el --- Support for Javascript and derivatives -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package json-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.\\(js\\|es6\\)\\(\\.erb\\)?\\'" . js2-mode))
  (add-to-list 'interpreter-mode-alist (cons "node" 'js2-mode)))


(use-package typescript-mode)

(use-package js2-mode)

(use-package coffee-mode)

(provide 'init-javascript)
;;; init-javascript.el ends here
