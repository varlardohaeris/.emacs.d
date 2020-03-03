;;; init-undo-tree.el --- Config undo-tree
;;; Commentary:
;;; Code:

(use-package undo-tree
  :config
  (progn
    (global-undo-tree-mode)
    (setq undo-tree-visualizer-timestamps t)
    (setq undo-tree-visualizer-diff t)
    ))

(provide 'init-undo-tree)
;;; init-undo-tree.el ends here
