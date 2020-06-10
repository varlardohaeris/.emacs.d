;;; init-counsel-etags.el --- Config counsel-etags
;;; Commentary:
;;; Code:
(require-package 'counsel-etags)
(with-eval-after-load 'counsel-etags
  (add-hook 'prog-mode-hook
	    (lambda ()
	      (add-hook 'after-save-hook
			'counsel-etags-virtual-update-tags 'append 'local)))
  (setq counsel-etags-update-interval 60)
  (push "build" counsel-etags-ignore-directories)
  ;; counsel-etags-ignore-directories does NOT support wildcast
  (push "build_clang" counsel-etags-ignore-directories)
  (push "build_clang" counsel-etags-ignore-directories)
  ;; counsel-etags-ignore-filenames supports wildcast
  (push "TAGS" counsel-etags-ignore-filenames)
  (push "*.json" counsel-etags-ignore-filenames))

(when *is-a-mac*
  ;; Mac's default ctags does not support -e option
  ;; If you install Emacs by homebrew, another version of etags is already installed which does not need -e too
  ;; the best option is to install latest ctags from sf.net
  (setq ctags-command "/usr/local/bin/ctags -e -R "))

(provide 'init-counsel-etags)
;;; init-counsel-etags.el ends here
