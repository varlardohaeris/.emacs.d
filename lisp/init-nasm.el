;;; init-nasm.el
;;; Commentary:
;;; Code:

(require-package 'nasm-mode)
(add-to-list 'auto-mode-alist '("\\.\\(asm\\|s\\)$" . nasm-mode))

(provide 'init-nasm)
;;; init-nasm.el ends here
