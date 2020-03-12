;;; init-popwin.el --- Add popwin
;;; Commentary:
;;; Code:
(use-package popwin
  :diminish popwin
  :config
  (progn
    (push '("*Occur*" :position bottom :height .3) popwin:special-display-config)
    (push '("*Org Select*" :position bottom :height .3) popwin:special-display-config)
    (push '("*compilation*" :position right :width 80 :noselect t) popwin:special-display-config)
    (popwin-mode 1)))

(provide 'init-popwin)
;;; init-popwin.el ends here
