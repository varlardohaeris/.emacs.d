;;; init-counsel-etags.el --- Config counsel-etags
;;; Commentary:
;;; Code:

(use-package counsel-etags
  :ensure t
  :init
  (add-hook 'prog-mode-hook
            (lambda ()
              (add-hook 'after-save-hook
                        'counsel-etags-virtual-update-tags 'append 'local)))
  :config
  (setq counsel-etags-update-interval 60)
  (push "build" counsel-etags-ignore-directories))

(when *is-a-mac*
  ;; Mac's default ctags does not support -e option
  ;; If you install Emacs by homebrew, another version of etags is already installed which does not need -e too
  ;; the best option is to install latest ctags from sf.net
  (setq ctags-command "/usr/local/bin/ctags -e -R "))

(provide 'init-counsel-etags)
;;; init-counsel-etags.el ends here
