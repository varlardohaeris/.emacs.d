;;; init-company.el --- Completion with company -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require 'company)
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

(require 'company-dabbrev)
(push 'company-dabbrev company-backends)
(setq company-dabbrev-char-regexp "[\\.0-9a-z-_'/]")
(setq company-dabbrev-code-other-buffers 'all)
(setq company-dabbrev-code-everywhere t)

(require 'company-box)
(add-hook 'company-mode-hook 'company-box-mode)

(require 'company-files)
(push 'company-files company-backends)

(provide 'init-company)
;;; init-company.el ends here
