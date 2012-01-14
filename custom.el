;;; require additional plugins

;; vim
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

;; vim-style surround
(require 'surround)
(global-surround-mode 1)

;; autocomplete
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
;; (ac-config-default)

;; magit (git support)
(require 'magit)
(global-set-key (kbd "M-g") 'magit-status)

;; groovy support
(autoload 'groovy-mode "groovy-mode" "Major mode for editing Groovy code." t)
(add-to-list 'auto-mode-alist '("\.groovy$" . groovy-mode))
(add-to-list 'interpreter-mode-alist '("groovy" . groovy-mode))
(add-hook 'groovy-mode-hook
          '(lambda ()
             (require 'groovy-electric)
             (groovy-electric-mode)))

;;; don't require additional plugins

;; highlight lines longer than 80 chars
(require 'whitespace)
(setq whitespace-style '(trailing lines space-before-tab
                                  indentation space-after-tab)
      whitespace-line-column 80)
(global-whitespace-mode 1)

;; spelling correct
(add-hook 'text-mode-hook (lambda () (flyspell-mode 1)))
(global-set-key (kbd "C->") 'flyspell-auto-correct-word)

;; number lines
(setq linum-format "%d ")
;(add-hook 'javascript-mode-hook (lambda () (linum-mode 1)))
(global-linum-mode 1)

;; find-file-in-project
(setq ffip-patterns '("*.rb"
                      "*.html"
                      "*.el"
                      "*.js"
                      "*.clj"
                      "*.sh"
                      "*.groovy"
                      "*.gsp"
                      "*.rhtml"))
