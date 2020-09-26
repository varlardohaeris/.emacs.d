;;; init-c-c++.el
;;; Commentary:
;;; Code:
(require 'eglot)
(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)
(provide 'init-c-c++)
;;; init-c-c++.el ends here
