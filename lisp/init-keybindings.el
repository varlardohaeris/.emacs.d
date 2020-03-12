;;; init-keybindings.el -- init keybindings
;;; Commentary:
;;; Code:

(global-set-key (kbd "C-w") 'backward-kill-word)

(evil-leader/set-leader "SPC")

(evil-leader/set-key
  "bb"  'ivy-switch-buffer
  "bi"  'imenu-list-smart-toggle
  "cd"  'comment-dwim
  "ci"  'evilnc-comment-or-uncomment-lines
  "cl"  'evilnc-quick-comment-or-uncomment-to-the-line
  "ll"  'evilnc-quick-comment-or-uncomment-to-the-line
  "cc"  'evilnc-copy-and-comment-lines
  "cp"  'evilnc-comment-or-uncomment-paragraphs
  "cr"  'comment-or-uncomment-region
  "cv"  'evilnc-toggle-invert-comment-line-by-line
  "fed" 'been/open-init-file
  "ff"  'counsel-find-file
  "fr"  'counsel-recentf
  "fs"  'save-buffer
  "ft"  'treemacs
  "mm"  'evilmi-jump-items
  "pf"  'counsel-projectile
  "ps"  'counsel-ag
  "ss"  'swiper
  "SPC" 'counsel-M-x
  "TAB" 'mode-line-other-buffer
  "wh"  'windmove-left
  "wl"  'windmove-right
  "wk"  'windmove-up
  "wj"  'windmove-down
  "wd"  'delete-other-windows)


(provide 'init-keybindings)
;;; init-keybindings.el ends here
