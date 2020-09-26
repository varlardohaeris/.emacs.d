;;; init-javascript.el --- Support for Javascript and derivatives -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'json-mode)

(add-to-list 'auto-mode-alist '("\\.\\(js\\|es6\\)\\(\\.erb\\)?\\'" . js2-mode))
(add-to-list 'interpreter-mode-alist (cons "node" 'js2-mode))

(require 'typescript-mode)

(require 'js2-mode)

(require 'coffee-mode)

(provide 'init-javascript)
;;; init-javascript.el ends here
