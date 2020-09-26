(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-base)
(require 'init-utils)
(require 'init-site-lisp)
(require 'init-theme)
(require 'init-doom-modeline)
(require 'init-evil)
(require 'init-ivy)
(require 'init-org)
(require 'init-hungry-delete)
(require 'init-company)
(require 'init-popwin)
(require 'init-imenu)
(require 'init-exec-path)
(require 'init-keybindings)
(require 'init-javascript)
(require 'init-common-lisp)
(require 'init-agda)
(require 'init-nasm)
(require 'init-restart-emacs)
(require 'init-magit)
(require 'init-treemacs)
(require 'init-ocaml)
(require 'init-lsp-mode)
(require 'init-c-c++)
(require 'init-which-key)
(require 'init-smooth-scrolling)
(require 'init-dashboard)
(require 'init-posframe)
;; (require 'init-sessions)

;; (when (file-exists-p custom-file)
;;  (load custom-file))

;; (setq inhibit-startup-screen t)
;; (switch-to-buffer "*scratch*")

(provide 'init)
