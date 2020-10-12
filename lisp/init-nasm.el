;;; init-nasm.el
;;; Commentary:
;;; Code:

(use-package nasm-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.\\(asm\\|s\\)$" . nasm-mode)))

(provide 'init-nasm)
;;; init-nasm.el ends here
