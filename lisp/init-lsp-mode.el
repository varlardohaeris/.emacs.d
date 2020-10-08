;;; init-lsp-mode.el
;;; Commentary:
;;; Code:
(require 'lsp-mode)
(add-hook 'prog-mode 'lsp-mode)

(require 'lsp-ui)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)

(setq lsp-ui-doc-enable t lsp-ui-doc-use-webkit nil lsp-ui-doc-delay 0.2
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
                                                              'font-lock-variable-name-face))) 


(require 'yasnippet)
(require 'yasnippet-snippets)
(setq yas-snippet-dirs '("~/.emacs.d/site-lisp/yasnippet-snippets/snippets"))

(provide 'init-lsp-mode)
;;; init-lsp-mode.el ends here
