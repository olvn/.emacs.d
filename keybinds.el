;; https://gist.github.com/yaodong/532e5b31781724ea2566503edcc498c3

;; the code below comes from that gist. these are helpers for defining keys and such

(setq-default
 leader-key "SPC"
 leader-for-major-mode ",")

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(defun set-keys-for-major-mode (maps key def &rest bindings)
  (while key
    (general-define-key
     :prefix ","
     :states '(normal visual)
     :keymaps maps
     key def)
    (setq key (pop bindings) def (pop bindings))))

(defun set-keys (key def &rest bindings)
  (while key
    (general-define-key
     :states '(motion)
     :keymaps 'override
     :prefix leader-key
     key def)
    (setq key (pop bindings) def (pop bindings))))

(defun set-keys-hidden (key def &rest bindings)
  (while key
    (general-define-key
     :states '(normal visual)
     :prefix leader-key
     :which-key "foobar"
     key def)
    (setq key (pop bindings) def (pop bindings))))

(defun declare-prefixes (prefix name &rest bindings)
  (while prefix
    (which-key-add-key-based-replacements (concat leader-key " " prefix) name)
    (setq prefix (pop bindings) name (pop bindings))))

(defun declare-prefixes-for-major-mode (mode key def &rest bindings)
  (while key
    (which-key-add-major-mode-key-based-replacements mode (concat leader-for-major-mode key) def)
    (setq key (pop bindings) def (pop bindings))))

(defun open-init ()
  (interactive)
  (find-file (expand-file-name "~/.emacs.d/init.el")))

(defun open-packages ()
  (interactive)
  (find-file (expand-file-name "~/.emacs.d/packages.el")))

(defun open-keybinds ()
  (interactive)
  (find-file (expand-file-name "~/.emacs.d/keybinds.el")))

(defun open-defaults ()
  (interactive)
  (find-file (expand-file-name "~/.emacs.d/defaults.el")))

(defun open-work-todos ()
  (interactive)
  (find-file-other-window (expand-file-name "~/work/org/composer.org")))

(defun capture-work-todo ()
  (interactive)
  (org-capture nil "w"))

(defun treemacs-project-toggle ()
  "Toggle and add the current project to treemacs if not already added."
  (interactive)
  (if (eq (treemacs-current-visibility) 'visible)
      (delete-window (treemacs-get-local-window))
    (let ((path (projectile-ensure-project (projectile-project-root)))
          (name (projectile-project-name)))
      (unless (treemacs-current-workspace)
        (treemacs--find-workspace))
      (treemacs-do-add-project-to-workspace path name)
      (treemacs-select-window))))

(declare-prefixes
 "a"   "applications"
 "b"   "buffers"
 "c"   "config"
 "f"   "files"
 "g"   "git"
 "p"   "projects"
 "q"   "quit"
 ;; omitted
 "w"   "windows")

(set-keys
 "SPC" 'counsel-M-x
 ;; shell
 "!"   'shell-command
 ":"   'eshell
 ;; buffers
 "bp"  'previous-buffer
 "bn"  'next-buffer
 "bs"  'switch-to-buffer
 "br"  'rename-buffer
 ;; config
 "ci" 'open-init
 "cp" 'open-packages
 "ck" 'open-keybinds
 "cd" 'open-defaults
 "ct" 'counsel-load-theme
 ;; files
 "ff" 'counsel-projectile-find-file
 "fs" 'swiper-isearch
 ;; git
 "gs" 'magit-status
 ;; org
 "ocw" 'capture-work-todo
 "otw" 'open-work-todos
 ;; projects
 "pt" 'treemacs-project-toggle
 "ps" 'projectile-switch-project
 "pf" 'counsel-projectile-ag
 ;; quit
 "qr" 'restart-emacs  )

(set-keys-hidden
 ;; winum
 "0" 'treemacs-select-window
 "1" 'winum-select-window-1
 "2" 'winum-select-window-2
 "3" 'winum-select-window-3
 "4" 'winum-select-window-4)


(defun update-other-buffer ()
  (interactive)
  (other-window 1)
  (revert-buffer nil t)
  (other-window -1))

(defun org-export-and-preview ()
  (interactive)
  (org-latex-export-to-pdf)
  (update-other-buffer))

(declare-prefixes-for-major-mode
 'org-mode
 "e"  "export"
 "x"  "text"
 "h"  "headings"
 "i"  "insert"
 "t"  "tables"
 ;; omitted
 "tt" "toggle")

(set-keys-for-major-mode 'org-mode-map
			 "ep" 'org-export-and-preview
			 )




(declare-prefixes-for-major-mode
 'emacs-lisp-mode
 "e"  "eval"
 "g"  "go")


(set-keys-for-major-mode 'emacs-lisp-mode-map
			 ;; eval
			 "eb" 'eval-buffer
			 "ee" 'eval-last-sexp
			 "er" 'eval-region
			 "et" 'eval-defun
			 ;; go
			 "gf" 'xref-find-definitions
			 "gb" 'xref-pop-marker-stack
			 )

(declare-prefixes-for-major-mode 'clojure-mode
				 "e"  "eval"
				 "g"  "go"
				 "f"  "fmt"
				 )


(set-keys-for-major-mode 'clojure-mode-map
			 ;; jack
			 "c" 'cider-connect-cljs
			 "j" 'cider-jack-in
			 "q" 'cider-quit
			 "!" 'cider-drink-a-sip

			 ;; eval
			 "ea" 'cider-eval-all-files
			 "eb" 'cider-eval-buffer
			 "ee" 'cider-eval-last-sexp
			 "et" 'cider-eval-defun-at-point
			 "ek" 'cider-interrupt
			 "ei" 'cider-inspect

			 ;; go
			 "gr" 'cider-find-resource
			 "gj" 'cider-switch-to-repl-buffer
			 "gd" 'cider-doc
			 "ga" 'cider-apropos
			 "gf" 'cider-find-var
			 "gb" 'cider-pop-back

			 ;; fmt
			 "fb" 'cider-format-buffer
			 "fr" 'cider-format-region
			 "ft" 'cider-format-defun)



(set-keys-for-major-mode 'org-mode-map
			 "'" 'org-edit-special
			 "c" 'org-capture
			 "d" 'org-deadline
			 ;; omitted
			 "b" 'org-tree-to-indirect-buffer
			 "A" 'org-archive-subtree)

;; end
