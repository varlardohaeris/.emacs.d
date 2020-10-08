;;; init-python.el
;;; Commentary:
;;; Code:

(setq-default python-indent-offset 2)
;; (require 'lsp-pyright)
(add-hook 'python-mode-hook #'(lambda () (require 'lsp-pyright)(lsp)))

;;; Folding
(add-hook 'python-mode-hook #'(lambda () (outline-minor-mode t)))
(provide 'init-python)
;;; init-python.el ends here
