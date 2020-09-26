;;; init-info-colors.el --- config info colors
;;; Commentary:
;;; Code:

(require 'info-colors)
(add-hook 'Info-selection-hook 'info-colors-fontify-node)
(provide 'init-info-colors)
;;; init-info-colors.el ends here
