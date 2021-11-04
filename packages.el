;;; package --- summary

;;; Commentary
;; hey

(require 'package)

(setq package-enable-at-startup nil) ; tells emacs not to load any packages before starting up
;; the following lines tell emacs where on the internet to look up
;; for new packages.
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "https://melpa.org/packages/")))

(package-initialize) ; guess what this one does ?

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package) ; unless it is already installed
  (package-refresh-contents) ; updage packages archive
  (package-install 'use-package)) ; and install the most recent version of use-package

(require 'use-package) ; guess what this one does too ?

(use-package srcery-theme
  :ensure t)

(use-package acme-theme

 :ensure t)
(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  :config
  (progn
    (evil-mode 1)
    (setq evil-default-cursor t)))

(use-package which-key
  :ensure t
  :config
  (progn
    (setq which-key-idle-delay 0.25)
    (which-key-setup-minibuffer)
    (which-key-mode +1)))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-dabbrev-downcase nil))

;; Ivy & friends
(use-package ivy
  :ensure t
  :init
  (setq ivy-re-builders-alist '((counsel-projectile-ag . ivy--regex-plus)
				(counsel-ag . ivy--regex-plus)
				(t . ivy--regex-fuzzy)))
  :config
  (ivy-mode 1))

(use-package counsel
  :ensure t)

(use-package flx-ido
  :ensure t
  :config
  (require 'flx-ido)
  (flx-ido-mode 1)
  ;; disable ido faces to see flx highlights.
  (setq ido-enable-flex-matching t)
  (setq ido-use-faces nil))

;; Ranger
(use-package ranger
  :ensure t
  :init
  (setq ranger-show-hidden t))

;; lisp

(use-package lispy
  :ensure t)

;; (use-package lispyville
;;   :config
;;   (lispyville-set-key-theme '(operators c-w additional slurp/barf-cp))
;;   (add-hook 'lispy-mode-hook #'lispyville-mode))

;; Project management
(use-package projectile
  :ensure t
  :init
  (setq projectile-completion-system 'ivy)
  (setq projectile-indexing-method 'alien)
  (setq projectile-sort-order 'recently-active)

					; Route errors to /dev/null
  (setq projectile-git-submodule-command "git submodule --quiet foreach 'echo $path' 2>/dev/null | tr '\\n' '\\0'")
  :config
  (projectile-mode))

(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-mode))

;; Workspaces
(use-package perspective
  :ensure t
  :config
  (persp-mode))

(use-package persp-projectile
  :ensure t)

;; Surround
(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

(use-package winum
  :ensure t
  :config
  (winum-mode 1))

(use-package general
  :ensure t)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package clojure-mode
  :ensure t
  ;; :init
 ;; (add-hook 'clojure-mode-hook #'lispy-mode)
  )

(use-package cider
  :ensure t)

(use-package org
  :mode (("\\.org$" . org-mode))
  :ensure org-plus-contrib
  :config
  (setq org-capture-templates
      '(("w" "Work todo" entry (file+headline "~/work/org/composer.org" "small things")
         "* TODO %?\n  %i\n")
        )))

(use-package magit
  :ensure t)

(use-package restart-emacs
  :ensure t)

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package pdf-tools
  :ensure t
  :config
  (pdf-loader-install))

(use-package elpy
  :ensure t
  :init
  (elpy-enable))

(use-package darkroom
  :ensure t)

(use-package format-all
  :ensure t)

(use-package treemacs
  :ensure t
  :config
  (progn
    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-project-follow-mode t)
    (setq treemacs-width 25
	  treemacs-git-mode 'simple)))

(use-package treemacs-projectile
  :ensure t
  :after (treemacs projectile))

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

;; (use-package treemacs-persp ;;treemacs-perspective if you use perspective.el vs. persp-mode
;;   :after (treemacs persp-mode) ;;or perspective vs. persp-mode
;;   :ensure t
;;   :config (treemacs-set-scope-type 'Perspectives))

(use-package treemacs-evil
  :ensure t
  :defer t)

(use-package undo-tree
  :ensure t
  :after evil
  :diminish
  :config
  (evil-set-undo-system 'undo-tree)
  (global-undo-tree-mode 1))

(provide 'packages)

;;; packages.el ends here
