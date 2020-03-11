;;; init-company.el --- Completion with company -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package company
  :ensure t)

(add-hook 'after-init-hook 'global-company-mode)

(provide 'init-company)
;;; init-company.el ends here
