(add-to-list 'load-path "~/.emacs.d/vendor/debian-el")
(add-to-list 'load-path "~/.emacs.d/vendor/dpkg-dev-el")

(require 'debian-el)
(require 'dpkg-dev-el)

(setq debian-changelog-mailing-address '"bregor@evilmartians.com")
(setq debian-changelog-full-name user-full-name)

(defun readme-debian-date-string ()
  "Return RFC-822 format date string."
  ;; this function could be simpler if xemacs supported %z, but
  ;; it doesn't, so we're shelling out to invoke date -R to obtain
  ;; Debian-policy-compliant date string.
  (let* ((date-program "gdate -R")
	 (system-time-locale "C"))
    (if (featurep 'xemacs)
	(replace-in-string (exec-to-string date-program) "\n" "")
      ;; if it's not xemacs, just use format-time-string
      (format-time-string "%a, %e %b %Y %T %z" (current-time)))))

(provide 'debian-kit)
