;;; init-c-c++.el
;;; Commentary:
;;; Code:
(use-package eglot
  :ensure t
  :config
  (progn
    (if *is-a-mac*
	(add-to-list 'eglot-server-programs '((c++-mode c-mode) "/usr/local/Cellar/llvm/10.0.1_1/bin/clangd"))
      (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd")))

    (add-hook 'c-mode-hook 'eglot-ensure)
    (add-hook 'c++-mode-hook 'eglot-ensure)))

(use-package company-c-headers
  :ensure t
  :config
  (add-to-list 'company-backends 'company-c-headers))

(provide 'init-c-c++)
;;; init-c-c++.el ends here
