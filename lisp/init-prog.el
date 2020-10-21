;;; init-prog.el --- config prog mode
;;; Commentary:
;;; Code:
(use-package 
  flycheck 
  :ensure t
  :defer t
  :commands (flycheck-mode)
  ;; :hook (prog-mode . flycheck-mode)
  :bind (:map leader-key
              ("t t" . global-flycheck-mode)) 
  :config (which-key-add-key-based-replacements "M-SPC t t" "开关flycheck")
  (setq flycheck-global-modes '(not text-mode outline-mode fundamental-mode org-mode diff-mode
                                    shell-mode eshell-mode term-mode vterm-mode)
        flycheck-emacs-lisp-load-path 'inherit
        ;; Only check while saving and opening files
        flycheck-check-syntax-automatically '(save mode-enabled) flycheck-indication-mode
        'right-fringe)

  (when (fboundp 'define-fringe-bitmap) 
    (define-fringe-bitmap 'flycheck-fringe-bitmap-double-arrow [16 48 112 240 112 48 16] nil nil
      'center))

  (push '(progn
	   (use-package 
	     flycheck-posframe 
	     :ensure t
	     :defer t
	     :custom-face (flycheck-posframe-border-face ((t 
							   (:inherit default)))) 
	     :hook (flycheck-mode . flycheck-posframe-mode) 
	     :init (setq flycheck-posframe-border-width 1 flycheck-posframe-inhibit-functions '((lambda 
												  (&rest 
												   _) 
												  (bound-and-true-p
												   company-backend))))) 
	   (use-package 
	     flycheck-pos-tip 
	     :ensure t
	     :defer t
	     :defines flycheck-pos-tip-timeout 
	     :hook (global-flycheck-mode . flycheck-pos-tip-mode) 
	     :config (setq flycheck-pos-tip-timeout 30)) 
	   (use-package 
	     flycheck-popup-tip 
	     :ensure t
	     :defer t
	     :hook (flycheck-mode . flycheck-popup-tip-mode))) graphic-only-plugins-setting))

(push '(use-package 
	 lsp-ui 
	 :ensure t
	 :defer t
	 :hook (lsp-mode . lsp-ui-mode) 
	 :custom (lsp-ui-doc-delay 1) 
	 :init (setq lsp-ui-doc-enable t lsp-ui-doc-use-webkit nil lsp-ui-doc-delay 0.2
                     lsp-ui-doc-include-signature t lsp-ui-doc-position 'at-point lsp-ui-doc-border
                     (face-foreground 'default) lsp-eldoc-enable-hover nil ; Disable eldoc displays in minibuffer
                     lsp-ui-sideline-enable t lsp-ui-sideline-show-hover nil
                     lsp-ui-sideline-show-diagnostics nil lsp-ui-sideline-ignore-duplicate t
                     lsp-ui-imenu-enable t lsp-ui-imenu-colors `(,(face-foreground
								   'font-lock-keyword-face) 
								 ,(face-foreground
								   'font-lock-string-face) 
								 ,(face-foreground
								   'font-lock-constant-face) 
								 ,(face-foreground
								   'font-lock-variable-name-face)))) graphic-only-plugins-setting)


(use-package smartparens
  :ensure t
  :init
  (progn
    (smartparens-global-mode 1)
    (show-smartparens-global-mode 1))
  :config
  (progn
    (setq smartparens-strict-mode t)
    (sp-local-pair 'emacs-lisp-mode "`" nil :when '(sp-in-string-p)))
  :bind
  (("C-M-k" . sp-kill-sexp-with-a-twist-of-lime)
   ("C-M-f" . sp-forward-sexp)
   ("C-M-b" . sp-backward-sexp)
   ("C-M-n" . sp-up-sexp)
   ("C-M-d" . sp-down-sexp)
   ("C-M-u" . sp-backward-up-sexp)
   ("C-M-p" . sp-backward-down-sexp)
   ("C-M-w" . sp-copy-sexp)
   ("M-s" . sp-splice-sexp)
   ("M-r" . sp-splice-sexp-killing-around)
   ("C-)" . sp-forward-slurp-sexp)
   ("C-}" . sp-forward-barf-sexp)
   ("C-(" . sp-backward-slurp-sexp)
   ("C-{" . sp-backward-barf-sexp)
   ("M-S" . sp-split-sexp)
   ("M-J" . sp-join-sexp)
   ("C-M-t" . sp-transpose-sexp)))

(use-package bnf-mode
  :defer t
  :ensure t)

(provide 'init-prog)
;;; init-prog.el ends here
