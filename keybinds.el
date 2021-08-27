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
      :states 'normal 
      :keymaps maps 
      key def)
    (setq key (pop bindings) def (pop bindings))))

(defun set-keys (key def &rest bindings)
  (while key
    (general-define-key 
      :states 'normal
      :prefix leader-key
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
  ;; config
  "ci" 'open-init
  "cp" 'open-packages
  "ck" 'open-keybinds
  "cd" 'open-defaults
  ;; files
  "ff" 'find-file
  ;; git
  "gs" 'magit-status
  ;; projects
  "pt" 'neotree-toggle
  ;; quit
  "qr" 'restart-emacs
  )

(declare-prefixes-for-major-mode 
 'org-mode
 "e"  "export"
 "x"  "text"
 "h"  "headings"
 "i"  "insert"
 "t"  "tables"
 ;; omitted
 "tt" "toggle")

(declare-prefixes-for-major-mode 
 'emacs-lisp-mode
 "e"  "eval")


(set-keys-for-major-mode 'emacs-lisp-mode-map
			 "eb" 'eval-buffer
			 "ee" 'eval-last-sexp
			 "er" 'eval-region
			 )


(set-keys-for-major-mode 'org-mode-map 
 "'" 'org-edit-special
 "c" 'org-capture
 "d" 'org-deadline
 ;; omitted
 "b" 'org-tree-to-indirect-buffer
 "A" 'org-archive-subtree)

;; end 
