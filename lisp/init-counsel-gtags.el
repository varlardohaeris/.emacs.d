;;; init-counsel-gtags.el --- Config counsel-gtags
;;; Commentary:
;;; Code:
(require-package 'counsel-gtags)
(add-hook 'c-mode-hook 'counsel-gtags-mode)
(add-hook 'c++-mode-hook 'counsel-gtags-mode)
(provide 'init-counsel-gtags)
;;; init-counsel-gtags.el ends here
