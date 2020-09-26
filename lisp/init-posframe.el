;;; init-postframe.el --- config posframe 
;;; Commentary:
;;; Code:
(require 'posframe)
(require 'ivy-posframe)

(setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display)))
(setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-bottom-window-center)))

(ivy-posframe-mode 1)
(provide 'init-posframe)
;;; init-posframe.el ends here
