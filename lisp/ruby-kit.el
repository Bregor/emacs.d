(eval-after-load 'ruby-mode
  '(progn
     ;; work around possible elpa bug
     (ignore-errors (require 'ruby-compilation))
     (setq ruby-use-encoding-map nil)
     (add-hook 'ruby-mode-hook 'inf-ruby-minor-mode)
     (add-hook 'ruby-mode-hook
	       (lambda () (ruby-electric-mode t)))
     (require 'rcodetools)
     (rvm-use-default)
     (fset 'run-xmp [?\M-\; ?\M-\; ?\M-x ?x ?m ?p return])
     (define-key ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent)
     (define-key ruby-mode-map (kbd "C-M-h") 'backward-kill-word)
     (define-key ruby-mode-map (kbd "C-c l") "lambda")
     (define-key ruby-mode-map (kbd "C-c C-c") 'run-xmp)))

;; Rake files are ruby, too, as are gemspecs, rackup files, etc.
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Berksfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Cheffile$" . ruby-mode))

;; We never want to edit Rubinius bytecode
(add-to-list 'completion-ignored-extensions ".rbc")

;; Safe local variables
(setq safe-local-variable-values (quote ((encoding . utf-8)
					  (ruby-compilation-executable . "ruby")
					  (ruby-compilation-executable . "ruby1.8")
					  (ruby-compilation-executable . "ruby1.9")
					  (ruby-compilation-executable . "rbx")
					  (ruby-compilation-executable . "jruby"))))

(provide 'ruby-kit)
