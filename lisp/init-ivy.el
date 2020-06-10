;;; init-ivy.el --- Use ivy for minibuffer completion and more -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require-package 'ivy)
(setq ivy-use-selectable-prompt t)

(require-package 'swiper)
	     
(require-package 'counsel)
(counsel-mode 1)

(require-package 'counsel-projectile)

(require-package 'smex)

(provide 'init-ivy)
;;; init-ivy.el ends here
