;;; init-prog.el --- config prog mode
;;; Commentary:
;;; Code:
(require 'flycheck)

(setq flycheck-global-modes '(not text-mode outline-mode fundamental-mode org-mode diff-mode
                                  shell-mode eshell-mode term-mode vterm-mode)
      flycheck-emacs-lisp-load-path 'inherit
      ;; Only check while saving and opening files
      flycheck-check-syntax-automatically '(save mode-enabled) flycheck-indication-mode
      'right-fringe)
(when (fboundp 'define-fringe-bitmap) 
  (define-fringe-bitmap 'flycheck-fringe-bitmap-double-arrow [16 48 112 240 112 48 16] nil nil
    'center))

(require 'flycheck-posframe)
(add-hook 'flycheck-mode 'flycheck-posframe-mode)
(setq flycheck-posframe-border-width 1 flycheck-posframe-inhibit-functions '((lambda 
                                                                               (&rest 
                                                                                _) 
                                                                               (bound-and-true-p
                                                                                company-backend))))
(add-hook 'global-flycheck-mode 'flycheck-pos-tip-mode)
(setq flycheck-pos-tip-timeout 30)

(add-hook 'flycheck-mode 'flycheck-popup-tip-mode)

(require 'smartparens-config)
(smartparens-global-mode)

(require 'bnf-mode)
(provide 'init-prog)
;;; init-prog.el ends here
