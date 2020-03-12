;;; init-utils.el --- Elisp helper functions and commands -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defun been/open-init-file()
  "Open init.el."
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(provide 'init-utils)
;;; init-utils.el ends here
