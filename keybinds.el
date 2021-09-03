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
     :states '(normal visual)
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
 ;; buffers
 "bp"  'previous-buffer
 "bn"  'next-buffer
 "bs"  'switch-to-buffer
 ;; config
 "ci" 'open-init
 "cp" 'open-packages
 "ck" 'open-keybinds
 "cd" 'open-defaults
 "ct" 'counsel-load-theme
 ;; files
 "ff" 'counsel-find-file
 ;; git
 "gs" 'magit-status
 ;; projects
 "pt" 'neotree-toggle
 ;; quit
 "qr" 'restart-emacs  )

(set-keys-hidden
 ;; winum
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
