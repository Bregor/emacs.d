(setq my:el-get-packages
      '(el-get
	smex
	color-theme-twilight
	egg
	org-mode
	ido-ubiquitous
	inf-ruby
	apache-mode
	applescript-mode
	clojure-mode
	coffee-mode
	crontab-mode
	darkroom-mode
	dash
	erlang-mode
	erlware-mode
	exec-path-from-shell
	fiplr
	ggtags
	gist
	haml-mode
	magit
	markdown-mode
	nav
	nginx-mode
	org-mode
	org-reveal
	php-mode-improved
	puppet-mode
	request
	rspec-mode
	ruby-compilation
	ruby-electric
	rvm
	sass-mode
	scss-mode
	smart-operator
	tabulated-list
	textmate
	wtf
	yaml-mode
	irfc
	less
	sudo-ext
	)
      )

(setq my:el-get-packages
      (append my:el-get-packages
	      (loop for src in el-get-sources collect (el-get-source-name src))))
(el-get 'sync my:el-get-packages)

(provide 'packages-kit)
