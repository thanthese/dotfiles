;; vim
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

;; surround
(require 'surround)
(global-surround-mode 1)

;; highlight lines longer than 80 chars
(require 'whitespace)
(setq whitespace-style '(trailing lines space-before-tab
                                  indentation space-after-tab)
      whitespace-Line-column 80)
(global-whitespace-mode 1)

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
