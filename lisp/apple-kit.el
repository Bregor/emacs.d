(when (string-match "apple-darwin" system-configuration)
  (setq mac-allow-anti-aliasing t)
  (set-face-font 'default "-apple-Inconsolata-medium-normal-normal-*-18-*-*-*-m-0-iso10646-1")
  (set-face-font 'bold "-apple-Inconsolata-bold-normal-normal-*-18-*-*-*-m-0-iso10646-1")
  (global-set-key [(backtab)] 'hippie-expand)
  (global-set-key [s-right] 'move-end-of-line)
  (global-set-key [s-left] 'move-beginning-of-line)
  (global-set-key (kbd "M-SPC") 'set-mark-command)

  ;; Get environment variables properly
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "EDITOR")
  (exec-path-from-shell-copy-env "LANG")
  (exec-path-from-shell-copy-env "LC_COLLATE")
  (exec-path-from-shell-copy-env "INFOPATH")
  (exec-path-from-shell-copy-env "HOMEBREW_KEEP_INFO")

)

(provide 'apple-kit)
