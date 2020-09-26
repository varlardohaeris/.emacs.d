;;; init-dashboard.el --- config dashboard
;;; Commentary:
;;; Code:
(require 'page-break-lines)
(turn-on-page-break-lines-mode)

(require 'dashboard)
(dashboard-setup-startup-hook)

(dashboard-modify-heading-icons '((recents . "file-text") 
                                  (bookmarks . "book")))
(setq dashboard-banner-logo-title
              (concat "Happy hacking, " user-login-name " - Emacs ♥ you!\n\n"))
(setq dashboard-center-content t) 
(setq dashboard-set-heading-icons t) 
(setq dashboard-set-file-icons t) 
(setq dashboard-set-navigator t)

(provide 'init-dashboard)
;;; init-dashboard.el ends here
