;;; init-base.el --- Some base config
;;; Commentary:
;;; Code:

(tool-bar-mode -1)
(scroll-bar-mode -1)
(add-to-list 'exec-path "/usr/local/bin")
(set-keyboard-coding-system nil)
(menu-bar-mode -1)
(setq make-backup-files nil)

(setq electric-pair-inhibit-predicate 'electric-pair-conservative-inhibit)
(electric-pair-mode 1)

(setq-default initial-scratch-message
              (concat ";; Happy hacking, " user-login-name " - Emacs ♥ you!\n\n"))

(global-linum-mode 1)

(provide 'init-base)
;;; init-base.el ends here
