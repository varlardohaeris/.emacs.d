;;; init-utils.el --- Elisp helper functions and commands -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defun been/open-init-file()
  "Open init.el."
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun been/open-zsh-file()
  "Open init.el."
  (interactive)
  (find-file "~/.zshrc"))


(defun been/ivy-with-thing-at-point (cmd)
  (let ((ivy-initial-inputs-alist
         (list
          (cons cmd (thing-at-point 'symbol)))))
    (funcall cmd)))

(defun been/counsel-ag-thing-at-point ()
  (interactive)
  (been/ivy-with-thing-at-point 'counsel-ag))

(defun been/swiper-thing-at-point ()
  (interactive)
  (been/ivy-with-thing-at-point 'swiper))

(provide 'init-utils)
;;; init-utils.el ends here
