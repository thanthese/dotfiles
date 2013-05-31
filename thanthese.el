;;; thanthese -- My emacs customizations.

;;; Commentary:
;;
;; Yes, everything lives in this one file.  Everything else comes from
;; prelude.  This file lives at ~/.emacs.d/personal/thanthese.el.
;;
;; Great source of organization ideas (that I'm not using):
;;   http://milkbox.net/note/single-file-master-emacs-configuration/

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; remote packages setup

;; install packages
(prelude-ensure-module-deps
 '(multiple-cursors
   smex
   move-text
   skewer-mode
   visual-regexp
   wrap-region))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; settings

;; show keystrokes in progress
(setq echo-keystrokes 0.1)

;; indictate empty lines at end of buffer
(set-default 'indicate-empty-lines t)

;; single space sentences
(setq sentence-end-double-space nil)

;; make matching parens obvious
(show-paren-mode)
(setq show-paren-delay 0)
(setq show-paren-style 'expression)

;; cache the passphrase for encrypted files
(setq epa-file-cache-passphrase-for-symmetric-encryption t)

;; wrap-region is cool
(wrap-region-mode t)

;;;; disable stuff

;; the beep is really annoying
(setq ring-bell-function 'ignore)

;; there's no reason for the scratch buffer to say anything
(setq initial-scratch-message nil)

;; whitespace-mode in programming environments only, please
(setq prelude-whitespace nil)
(add-hook 'prog-mode-hook 'whitespace-mode)

;; electric-pair-mode never works right
(setq electric-pair-mode -1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; functions and macros

(defmacro sm/after (mode &rest body)
  "`eval-after-load' MODE evaluate BODY."
  `(eval-after-load ,mode
     '(progn ,@body)))

(defun sm/pretty-lambdas ()
  "Turn on displaying 'lambda's as lambda symbols."
  (interactive)
  (font-lock-add-keywords
   nil `(("(?\\(lambda\\>\\)"
          (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                    ,(make-char 'greek-iso8859-7 107))
                    nil))))))

(defun sm/add-to-path (path)
  "Add path to PATH, because Emacs can't figure it out."
  (setenv "PATH" (concat path path-separator (getenv "PATH")))
  (push path exec-path)
  (add-to-list 'load-path path))

(defun sm/is-mac-p ()
  "Determine if we're on a mac."
  (eq system-type 'darwin))

(defun sm/generate-random-password ()
  "Drop randomly generated password in current buffer at point."
  (interactive)
  (shell-command "gpg --gen-random --armor 1 20" t))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; keybindings

;; smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;; easier "other window"
(global-set-key (kbd "H-o") 'other-window)

;; move text
(global-set-key (kbd "H-p") 'move-text-up)
(global-set-key (kbd "H-n") 'move-text-down)

;; package: multiple cursors
(global-set-key (kbd "H-e") 'mc/edit-lines)
(global-set-key (kbd "H-.") 'mc/mark-next-like-this)
(global-set-key (kbd "H-,") 'mc/mark-previous-like-this)
(global-set-key (kbd "H->") 'mc/mark-all-like-this)
(global-set-key (kbd "H-=") 'mc/mark-more-like-this-extended)

;; package: visual regex
(define-key global-map (kbd "H-r") 'vr/query-replace)

;; package: ace jump mode
(define-key global-map (kbd "H-SPC") 'ace-jump-char-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; hooks

(add-hook 'text-mode-hook
          (lambda ()
            (toggle-word-wrap +1)))

(add-hook 'org-mode-hook
          (lambda ()
            (visual-line-mode)
            (org-indent-mode)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; mac-specific

(when (sm/is-mac-p)
  (progn

    ;; add paths that emacs forgets
    (mapc 'sm/add-to-path
          '("/usr/local/bin"
            "/usr/local/git/bin"
            "/usr/texbin"))

    ;; super keys!
    (setq mac-function-modifier 'hyper)

    ;; move to trash instead of delete
    (setq delete-by-moving-to-trash t
          trash-directory "~/.Trash/emacs")

    ;; make open browser work
    (setq browse-url-browser-function 'browse-url-default-macosx-browser)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; footer

(provide 'thanthese)
;;; thanthese.el ends here
