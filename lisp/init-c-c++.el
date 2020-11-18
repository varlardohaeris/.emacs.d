;;; init-c-c++.el --- config c, c++ with eglot
;;; Commentary:
;;; Code:
(use-package eglot
  :load-path "~/.emacs.d/site-lisp/eglot"
  :config
  (progn
    (if *is-a-mac*
	(add-to-list 'eglot-server-programs '((c++-mode c-mode) "/usr/local/Cellar/llvm/11.0.0/bin/clangd"))
      (add-to-list 'eglot-server-programs '((c++-mode c-mode) ("clangd-10" "-std=c++2a"))))

    (add-hook 'c-mode-hook 'eglot-ensure)
    (add-hook 'c++-mode-hook 'eglot-ensure)))


(use-package company-c-headers
  :ensure t
  :config
  (add-to-list 'company-backends 'company-c-headers))

(provide 'init-c-c++)
;;; init-c-c++.el ends here
