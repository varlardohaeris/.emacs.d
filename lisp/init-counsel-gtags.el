;;; init-counsel-gtags.el --- Config counsel-gtags
;;; Commentary:
;;; Code:
(require-package 'counsel-gtags)
(add-hook 'c-mode-hook 'counsel-gtags-mode)
(add-hook 'c++-mode-hook 'counsel-gtags-mode)

(with-eval-after-load 'counsel-gtags
  (define-key counsel-gtags-mode-map (kbd "C-]") 'counsel-gtags-dwim)
  (define-key counsel-gtags-mode-map (kbd "C-t") 'counsel-gtags-go-backward))

(provide 'init-counsel-gtags)
;;; init-counsel-gtags.el ends here
