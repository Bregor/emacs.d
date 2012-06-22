;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

;; Save a list of recent files visited.
(recentf-mode 1)

;; If non-nil, `kill-line' with no arg at beg of line kills the whole line.
(setq kill-whole-line t)

;; whenever an external process changes a file underneath emacs, and there
;; was no unsaved changes in the corresponding buffer, just revert its
;; content to reflect what's on-disk.
(global-auto-revert-mode 1)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(setq file-name-coding-system 'utf-8)


(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))

(global-set-key (kbd "C-x f") 'recentf-ido-find-file)

(provide 'essentials-kit)
