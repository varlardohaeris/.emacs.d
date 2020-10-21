;;; init-ivy.el --- Use ivy for minibuffer completion and more -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package ivy
  :ensure t
  :config
  (setq ivy-use-selectable-prompt t))

;; (setq ivy-sort-matches-functions-alist '((t . ivy-fuz-sort-fn)))
;; (setq ivy-re-builders-alist '((t . ivy-fuz-regex-fuzzy)))
;; (with-eval-after-load 'ivy
;;   (require 'ivy-fuz)
;;   (add-to-list 'ivy-highlight-functions-alist '(ivy-fuz-regex-fuzzy . ivy-fuz-highlight-fn)))

(use-package swiper
  :ensure t)

(use-package counsel
  :ensure t
  :config
  (counsel-mode 1))

(use-package counsel-projectile
  :ensure t
  :config
  (add-hook 'counsel-mode 'counsel-projectile-mode)
  (setq counsel-projectile-grep-initial-input '(ivy-thing-at-point)))

(use-package smex
  :defer t
  :ensure t)

(use-package all-the-icons-ivy-rich
  :ensure t
  :config
  (all-the-icons-ivy-rich-mode 1)
  (ivy-rich-mode 1))

(use-package ivy-rich
  :ensure t
  :config
  (ivy-rich-mode 1)
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line))


(use-package ivy-xref
  :ensure t
  :defer t
  :config
  ;; xref initialization is different in Emacs 27 - there are two different
  ;; variables which can be set rather than just one
  (when (>= emacs-major-version 27)
    (setq xref-show-definitions-function #'ivy-xref-show-defs))
  ;; Necessary in Emacs <27. In Emacs 27 it will affect all xref-based
  ;; commands other than xref-find-definitions (e.g. project-find-regexp)
  ;; as well
  (setq xref-show-xrefs-function #'ivy-xref-show-xrefs))

(use-package posframe
  :ensure t)
(use-package ivy-posframe
  :ensure t
  :config
  (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display)))
  (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)))
  (ivy-posframe-mode 1))

(provide 'init-ivy)
;;; init-ivy.el ends here
