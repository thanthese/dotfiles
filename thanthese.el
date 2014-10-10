;; install packages if not already installed
(prelude-require-packages '())

;; turn off whitespace mode, unless in programming environment
(setq prelude-whitespace nil)
(add-hook 'prog-mode-hook 'whitespace-mode)

;; pretend .txt files are .org files
(add-to-list 'auto-mode-alist '("\\.txt$" . org-mode))

;; indent the org outline
(setq org-startup-indented t)

;; fast movement between org headlines
(setq org-use-speed-commands t) 

;; easy org link navigation
(setq org-return-follows-link t) 

;; on-load org settings
(add-hook 'org-mode-hook
          (lambda ()
            ;; sensible word wrapping
            (visual-line-mode)))

;; a single space ends a sentence
(setq sentence-end-double-space nil)

;; the beep is really annoying
(setq ring-bell-function 'ignore)

;; there's no reason for the scratch buffer to say anything
(setq initial-scratch-message nil)

;; cache the passphrase for encrypted files
(setq epa-file-cache-passphrase-for-symmetric-encryption t)

;; indictate empty lines at end of buffer
(set-default 'indicate-empty-lines t)

;; show keystrokes in progress
(setq echo-keystrokes 0.1)

