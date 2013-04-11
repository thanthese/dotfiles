;;; thanthese -- My emacs customizations.

;;; Commentary:
;;
;; Yes, everything lives in this one file.  Everything else comes from
;; prelude.  This file lives at ~/.emacs.d/personal/thanthese.el.

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; remote packages setup

;; install packages
(prelude-ensure-module-deps
 '(multiple-cursors
   smex))

;; multiple-cursors
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C->") 'mc/mark-all-like-this)

;; smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; functions

(defun sm/pretty-lambdas ()
  "Turn on displaying 'lambda's as lambda symbols."
  (interactive)
  (font-lock-add-keywords
   nil `(("(?\\(lambda\\>\\)"
          (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                    ,(make-char 'greek-iso8859-7 107))
                    nil))))))

(defun sm/add-to-path (path)
  "Add path to PATH.

By default Emacs doesn't seem to know things."
  (setenv "PATH" (concat path path-separator (getenv "PATH")))
  (push path exec-path)
  (add-to-list 'load-path path))

(defun sm/is-mac-p ()
  "Determine if we're on a mac."
  (eq system-type 'darwin))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; settings

;; show keystrokes in progress
(setq echo-keystrokes 0.1)

;; indictate empty lines at end of buffer
(set-default 'indicate-empty-lines t)

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
