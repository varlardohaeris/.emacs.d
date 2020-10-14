;;; init-ocaml.el --- ocaml related configuration
;;; Commentary:
;;; Code:

(use-package tuareg
  :ensure t
  :config
  (after-load 'tuareg-mode
    (add-hook 'tuareg-mode-hook #'electric-pair-local-mode)
    ;; (add-hook 'tuareg-mode-hook 'tuareg-imenu-set-imenu)
    (setq auto-mode-alist
          (append '(("\\.ml[ily]?$" . tuareg-mode)
                    ("\\.topml$" . tuareg-mode))
                  auto-mode-alist)))
  
  (autoload 'merlin-mode "merlin" nil t nil)
  ;; Automatically start it in OCaml buffers
  (add-hook 'tuareg-mode-hook 'merlin-mode t)
  (add-hook 'caml-mode-hook 'merlin-mode t)
  ;; Use opam switch to lookup ocamlmerlin binary
  (setq merlin-command 'opam))


(use-package utop
  :ensure t)

(provide 'init-ocaml)
;;; init-ocaml.el ends here
