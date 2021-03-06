;; Use IDO if installed
(if (fboundp 'ido-mode) (ido-mode 1))

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

;; Use readable buffer designations when names are the same
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)

(setq exec-path (quote ("/usr/local/bin" "/usr/local/sbin" "/usr/bin" "/bin" "/usr/sbin" "/sbin" "/Applications/Emacs.app/Contents/MacOS/bin")))

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq require-final-newline t)

(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-unset-key (kbd "C-z"))
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)
(global-set-key (kbd "C-*") 'mc/mark-all-like-this) ;; needs mark-multiple (M-x el-get-install RET multiple-cursors RET)

(setq file-name-coding-system 'utf-8)

(setq confirm-kill-emacs 'yes-or-no-p) ;; Ask for confirmation when leaving Emacs

;; set the title bar to show file name if available, buffer name otherwise
(setq frame-title-format '(buffer-file-name "%f" ("%b")))

;; Backups are stored inside user-emacs-directory. (Usually ~/.emacs.d)
(setq backup-directory-alist `(("." . ,(concat user-emacs-directory "backups"))))

(require 'bar-cursor)
(bar-cursor-mode)
(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))

(add-to-list 'auto-mode-alist '("\\rfc[0-9]+.txt$" . irfc-mode))

(provide 'essentials-kit)
