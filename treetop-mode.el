;; Copyright 2012 Paul Madden (maddenp@colorado.edu)
;;
;; Licensed under the Apache License, Version 2.0 (the "License");
;; you may not use this file except in compliance with the License.
;; You may obtain a copy of the License at
;;
;; http://www.apache.org/licenses/LICENSE-2.0
;;
;; Unless required by applicable law or agreed to in writing, software
;; distributed under the License is distributed on an "AS IS" BASIS,
;; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;; See the License for the specific language governing permissions and
;; limitations under the License.

(require 'generic-x)

(define-generic-mode 'treetop-mode-base
  '("#")
  '("end" "include" "grammar" "require" "rule")
  '(("\\(<[A-Za-z0-9_]+>\\)" 1 'font-lock-variable-name-face)
    ("rule\\s-+\\([A-Za-z_][A-Za-z0-9_]*\\)\\s-*$" 1 'font-lock-function-name-face) 
    ("grammar\\s-+\\([A-Za-z_][A-Za-z0-9_]*\\)\\s-*$" 1 'font-lock-type-face)
    ("include\\s-+\\(.+\\)" 1 'font-lock-variable-name-face)
    ("[^\\]'[^']*[^\\]'" . 'font-lock-string-face))
  nil
  nil
  "A base mode for Treetop grammar files")

(defun end     () (looking-at "^\\s-*end[^A-Za-z0-9_]"))
(defun grammar () (looking-at "^\\s-*grammar[^A-Za-z0-9_]"))
(defun rule    () (looking-at "^\\s-*rule[^A-Za-z0-9_]"))

(defun set-indent (iend irule igrammar)
  (let ((searching t))
    (save-excursion
      (while searching
        (forward-line -1)
        (cond ((end)     (setq treetop-indent (funcall iend) searching nil))
              ((rule)    (setq treetop-indent irule searching nil))
              ((grammar) (setq treetop-indent igrammar searching nil))
              ((bobp)    (setq searching nil)))))))

(defun treetop-indent-line ()
  "Indent current line of Treetop grammar"
  (setq treetop-indent 0)
  (beginning-of-line)
  (cond ((rule)          (setq treetop-indent tab-width))
        ((end)           (set-indent (lambda () 0) tab-width 0))
        ((not (grammar)) (set-indent #'current-indentation (* tab-width 2) tab-width)))
  (indent-line-to treetop-indent))

(define-derived-mode treetop-mode treetop-mode-base "Treetop"
  "A major mode for Treetop grammar files"
  (local-set-key (kbd "RET") 'reindent-then-newline-and-indent)
  (set (make-local-variable 'indent-line-function) 'treetop-indent-line)
  (set (make-local-variable 'indent-tabs-mode) nil)
  (set (make-local-variable 'tab-always-indent) t)
  (set (make-local-variable 'tab-width) 2))

(add-to-list 'auto-mode-alist '("\\.tt\\'" . treetop-mode))

(provide 'treetop-mode)
