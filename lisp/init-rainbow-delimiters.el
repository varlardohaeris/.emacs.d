;;; init-rainbow-delimiters.el --- config rainbow delimiters
;;; Commentary:
;;; Code:

(require 'rainbow-delimiters)
(set-face-foreground 'rainbow-delimiters-depth-1-face "chartreuse3") 
(set-face-foreground 'rainbow-delimiters-depth-2-face "DodgerBlue1") 
(set-face-foreground 'rainbow-delimiters-depth-3-face "DarkOrange2")
(set-face-foreground 'rainbow-delimiters-depth-4-face "deep pink") 
(set-face-foreground 'rainbow-delimiters-depth-5-face "medium orchid") 
(set-face-foreground 'rainbow-delimiters-depth-6-face "turquoise") 
(set-face-foreground 'rainbow-delimiters-depth-7-face "lime green") 
(set-face-foreground 'rainbow-delimiters-depth-8-face "gold") 
(set-face-foreground 'rainbow-delimiters-depth-9-face "cyan") 
(set-face-bold 'rainbow-delimiters-depth-1-face "t") 
(set-face-bold 'rainbow-delimiters-depth-2-face "t") 
(set-face-bold 'rainbow-delimiters-depth-3-face "t") 
(set-face-bold 'rainbow-delimiters-depth-4-face "t") 
(set-face-bold 'rainbow-delimiters-depth-5-face "t") 
(set-face-bold 'rainbow-delimiters-depth-6-face "t") 
(set-face-bold 'rainbow-delimiters-depth-7-face "t") 
(set-face-bold 'rainbow-delimiters-depth-8-face "t") 
(set-face-bold 'rainbow-delimiters-depth-9-face "t") 
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
(provide 'init-rainbow-delimiters)

;;; init-rainbow-delimiters.el ends here
