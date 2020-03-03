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

(provide 'init-counsel-etags)
;;; init-counsel-etags.el ends here
