;;; init-ivy.el --- Use ivy for minibuffer completion and more -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require 'ivy)
(setq ivy-use-selectable-prompt t)

(require 'swiper)
	     
(require 'counsel)
(counsel-mode 1)

(require 'counsel-projectile)

(require 'smex)

(provide 'init-ivy)
;;; init-ivy.el ends here
