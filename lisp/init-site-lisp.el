;;; init-site-lisp.el --- Support elisp manually installed in the site-lisp dir -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;;; Set load path

(defconst my-emacs-d (file-name-as-directory user-emacs-directory)
  "Directory of emacs.d")

(defconst my-site-lisp-dir (concat my-emacs-d "site-lisp")
  "Directory of site-lisp")

(defconst my-lisp-dir (concat my-emacs-d "lisp")
  "Directory of lisp.")

(defun my-add-subdirs-to-load-path (lisp-dir)
  "Add sub-directories under LISP-DIR into `load-path'."
  (let* ((default-directory lisp-dir))
    (setq load-path
          (append
           (delq nil
                 (mapcar (lambda (dir)
                           (unless (string-match-p "^\\." dir)
                             (expand-file-name dir)))
                         (directory-files my-site-lisp-dir)))
           load-path))))


(my-add-subdirs-to-load-path (file-name-as-directory my-site-lisp-dir))

(provide 'init-site-lisp)
;;; init-site-lisp.el ends here
