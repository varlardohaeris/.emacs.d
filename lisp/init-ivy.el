;;; init-ivy.el --- Use ivy for minibuffer completion and more -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'ivy)
(setq ivy-use-selectable-prompt t)

(setq ivy-sort-matches-functions-alist '((t . ivy-fuz-sort-fn)))
(setq ivy-re-builders-alist '((t . ivy-fuz-regex-fuzzy)))

(with-eval-after-load 'ivy
  (require 'ivy-fuz)
  (add-to-list 'ivy-highlight-functions-alist '(ivy-fuz-regex-fuzzy . ivy-fuz-highlight-fn)))

(require 'swiper)
	     
(require 'counsel)
(counsel-mode 1)

(require 'counsel-projectile)
(add-hook 'counsel-mode 'counsel-projectile-mode)
(setq counsel-projectile-grep-initial-input '(ivy-thing-at-point))

(require 'smex)

(require 'all-the-icons-ivy-rich)
(all-the-icons-ivy-rich-mode 1)
(ivy-rich-mode 1)

(require 'ivy-rich)
(ivy-rich-mode 1)
(setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)

(setq ivy-rich-display-transformers-list '(ivy-switch-buffer 
					   (:columns ((ivy-rich-switch-buffer-icon 
						       (:width 2)) 
						      (ivy-rich-candidate 
						       (:width 30)) 
						      (ivy-rich-switch-buffer-size 
						       (:width 7)) 
						      (ivy-rich-switch-buffer-indicators 
						       (:width 4 
							       :face error 
							       :align right)) 
						      (ivy-rich-switch-buffer-major-mode 
						       (:width 12 
							       :face warning)) 
						      (ivy-rich-switch-buffer-project 
						       (:width 15 
							       :face success)) 
						      (ivy-rich-switch-buffer-path 
						       (:width (lambda (x) 
								 (ivy-rich-switch-buffer-shorten-path
								  x
								  (ivy-rich-minibuffer-width
								   0.3)))))) 
						     :predicate (lambda (cand) 
								  (get-buffer cand)))
					   counsel-find-file 
					   (:columns ((ivy-read-file-transformer) 
						      (ivy-rich-counsel-find-file-truename 
						       (:face font-lock-doc-face))))
					   counsel-M-x 
					   (:columns ((counsel-M-x-transformer 
						       (:width 40)) 
						      (ivy-rich-counsel-function-docstring 
						       (:face font-lock-doc-face)))) ; return docstring of the command
					   counsel-recentf 
					   (:columns ((ivy-rich-candidate 
						       (:width 0.8)) 
						      (ivy-rich-file-last-modified-time 
						       (:face font-lock-comment-face)))) ; return last modified time of the file
					   counsel-describe-function 
					   (:columns
					    ((counsel-describe-function-transformer 
					      (:width 40)) 
					     (ivy-rich-counsel-function-docstring 
					      (:face font-lock-doc-face)))) ; return docstring of the function
					   counsel-describe-variable 
					   (:columns
					    ((counsel-describe-variable-transformer 
					      (:width 40)) 
					     (ivy-rich-counsel-variable-docstring 
					      (:face font-lock-doc-face)))) ; return docstring of the variable
					   ))



(provide 'init-ivy)
;;; init-ivy.el ends here
