;;; init-nasm.el -- Nasm mode
;;; Commentary:
;;; Code:
(use-package nasm-mode
  :ensure t
  :defer t
  :config
  (add-to-list 'auto-mode-alist '("\\.\\(asm\\|s\\)$" . nasm-mode)))
(provide 'init-nasm)
;;; init-nasm.el ends here
