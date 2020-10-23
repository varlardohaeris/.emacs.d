;;; init-prog.el --- config prog mode
;;; Commentary:
;;; Code:
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package smartparens
  :ensure t
  :init
  (progn
    (smartparens-global-mode 1)
    (show-smartparens-global-mode 1))
  :config
  (progn
    ;; (setq smartparens-strict-mode t)
    ;; (sp-local-pair 'emacs-lisp-mode "`" nil :when '(sp-in-string-p)))
    (require 'smartparens-config)))

(use-package bnf-mode
  :defer t
  :ensure t)

(provide 'init-prog)
;;; init-prog.el ends here
