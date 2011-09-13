;;; require additional plugins

;; vim
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

;; vim-style surround
(require 'surround)
(global-surround-mode 1)

;;; don't require additional plugins

;; highlight lines longer than 80 chars
(require 'whitespace)
(setq whitespace-style '(trailing lines space-before-tab
                                  indentation space-after-tab)
      whitespace-Line-column 80)
(global-whitespace-mode 1)

;; spelling correct
(add-hook 'text-mode-hook
          (lambda () (flyspell-mode 1)))
(global-set-key (kbd "C->") 'flyspell-auto-correct-word)

;; number lines
(global-linum-mode 1)
(setq linum-format "%d ")

;; find-file-in-project
(setq ffip-patterns '("*.rb"
                      "*.html"
                      "*.el"
                      "*.js"
                      "*.clj"
                      "*.sh"
                      "*.groovy"
                      "*.rhtml"))
