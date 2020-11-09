;;; init-utils.el --- Elisp helper functions and commands -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defun been/open-init-file()
  "Open init.el."
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun been/open-zsh-file()
  "Open init.el."
  (interactive)
  (find-file "~/.zshrc"))


(defun been/ivy-with-thing-at-point (cmd)
  (let ((ivy-initial-inputs-alist
         (list
          (cons cmd (thing-at-point 'symbol)))))
    (funcall cmd)))

(defun been/counsel-projectile-ag-thing-at-point ()
  (interactive)
  (setq counsel-projectile-ag-initial-input (thing-at-point 'symbol))
  (been/ivy-with-thing-at-point 'counsel-projectile-ag))

(defun been/swiper-thing-at-point ()
  (interactive)
  (been/ivy-with-thing-at-point 'swiper))

(define-obsolete-function-alias 'after-load 'with-eval-after-load "")

;;----------------------------------------------------------------------------
;; Handier way to add modes to auto-mode-alist
;;----------------------------------------------------------------------------
(defun add-auto-mode (mode &rest patterns)
  "Add entries to `auto-mode-alist' to use `MODE' for all given file `PATTERNS'."
  (dolist (pattern patterns)
    (add-to-list 'auto-mode-alist (cons pattern mode))))


;;----------------------------------------------------------------------------
;; String utilities missing from core emacs
;;----------------------------------------------------------------------------
(defun sanityinc/string-all-matches (regex str &optional group)
  "Find all matches for `REGEX' within `STR', returning the full match string or group `GROUP'."
  (let ((result nil)
        (pos 0)
        (group (or group 0)))
    (while (string-match regex str pos)
      (push (match-string group str) result)
      (setq pos (match-end group)))
    result))


;;----------------------------------------------------------------------------
;; Delete the current file
;;----------------------------------------------------------------------------
(defun delete-this-file ()
  "Delete the current file, and kill the buffer."
  (interactive)
  (unless (buffer-file-name)
    (error "No file is currently being edited"))
  (when (yes-or-no-p (format "Really delete '%s'?"
                             (file-name-nondirectory buffer-file-name)))
    (delete-file (buffer-file-name))
    (kill-this-buffer)))


;;----------------------------------------------------------------------------
;; Rename the current file
;;----------------------------------------------------------------------------
(defun rename-this-file-and-buffer (new-name)
  "Renames both current buffer and file it's visiting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (unless filename
      (error "Buffer '%s' is not visiting a file!" name))
    (progn
      (when (file-exists-p filename)
        (rename-file filename new-name 1))
      (set-visited-file-name new-name)
      (rename-buffer new-name))))

;;----------------------------------------------------------------------------
;; Browse current HTML file
;;----------------------------------------------------------------------------
(defun browse-current-file ()
  "Open the current file as a URL using `browse-url'."
  (interactive)
  (let ((file-name (buffer-file-name)))
    (if (and (fboundp 'tramp-tramp-file-p)
             (tramp-tramp-file-p file-name))
        (error "Cannot open tramp file")
      (browse-url (concat "file://" file-name)))))

;; Custom functions/hooks for persisting/loading frame geometry upon save/load
(defun save-frameg ()
  "Gets the current frame's geometry and saves to ~/.emacs.frameg."
  (let ((frameg-font (frame-parameter (selected-frame) 'font))
	(frameg-left (frame-parameter (selected-frame) 'left))
	(frameg-top (frame-parameter (selected-frame) 'top))
	(frameg-width (frame-parameter (selected-frame) 'width))
	(frameg-height (frame-parameter (selected-frame) 'height))
	(frameg-file (expand-file-name "~/.emacs.frameg")))
    (with-temp-buffer
      ;; Turn off backup for this file
      (make-local-variable 'make-backup-files)
      (setq make-backup-files nil)
      (insert
       ";;; This file stores the previous emacs frame's geometry.\n"
       ";;; Last generated " (current-time-string) ".\n"
       "(setq initial-frame-alist\n"
       ;; " '((font . \"" frameg-font "\")\n"
       " '("
       (format " (top . %d)\n" (max frameg-top 0))
       (format " (left . %d)\n" (max frameg-left 0))
       (format " (width . %d)\n" (max frameg-width 0))
       (format " (height . %d)))\n" (max frameg-height 0)))
      (when (file-writable-p frameg-file)
	(write-file frameg-file)))))

(defun load-frameg ()
  "Loads ~/.emacs.frameg which should load the previous frame's geometry."
  (let ((frameg-file (expand-file-name "~/.emacs.frameg")))
    (when (file-readable-p frameg-file)
      (load-file frameg-file))))

;; Special work to do ONLY when there is a window system being used
(if window-system
    (progn
      (add-hook 'after-init-hook 'load-frameg)
      (add-hook 'kill-emacs-hook 'save-frameg)))

(provide 'init-utils)
;;; init-utils.el ends here
