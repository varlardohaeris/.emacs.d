;;; init.el --- entry for my configuration
;;; Commentary:
;;; Code:

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-packages)
(require 'init-utils)
(require 'init-core)
(require 'init-tools)
(require 'init-evil)
(require 'init-ivy)
(require 'init-treemacs)
(require 'init-prog)
(require 'init-complete)
(require 'init-lsp-mode)
(require 'init-common-lisp)
(require 'init-javascript)
(when *is-a-mac*
 (require 'init-agda))
(require 'init-nasm)
(require 'init-ocaml)
(require 'init-python)
(require 'init-c-c++)
(require 'init-org)
(require 'init-ui)
;; (when (file-exists-p custom-file)
;;   (load custom-file))
(provide 'init)
;;; init.el ends here
