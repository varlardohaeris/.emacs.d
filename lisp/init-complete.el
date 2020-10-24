;;; init-complete.el --- Completion with company -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode)

  (with-eval-after-load 'company
    (define-key company-active-map (kbd "M-n") nil)
    (define-key company-active-map (kbd "M-p") nil)
    (define-key company-active-map (kbd "C-n") #'company-select-next)
    (define-key company-active-map (kbd "C-p") #'company-select-previous))
  (setq company-tooltip-align-annotations t)
  (setq company-idle-delay 0)
  (setq company-echo-delay 0)
  (setq company-minimum-prefix-length 2)
  (setq company-require-match nil)
  (setq company-dabbrev-code-ignore-case nil)
  (setq company-show-numbers t)

  (setq company-dabbrev-code-other-buffers 'all)
  (setq company-dabbrev-code-everywhere t)
  (require 'company-files)
  (push 'company-files company-backends)
  (add-to-list 'company-backends '(company-capf :with company-dabbrev)))

(use-package company-box
  :ensure t
  :hook (company-mode . company-box-mode))

(use-package yasnippet
  :ensure t)
(use-package yasnippet-snippets
  :ensure t
  :config
  (setq yas-snippet-dirs '("~/.emacs.d/elpa/yasnippet-snippets-20200909.1058/snippets")))
(provide 'init-complete)
;;; init-complete.el ends here
