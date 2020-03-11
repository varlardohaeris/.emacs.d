;;; init-ivy.el --- Use ivy for minibuffer completion and more -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package ivy
  :ensure t)


(use-package swiper
  :ensure t)
	     
(use-package counsel
  :ensure t
  :config
  (counsel-mode 1))

(use-package counsel-projectile
  :ensure t)

(provide 'init-ivy)
;;; init-ivy.el ends here
