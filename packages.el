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
  :ensure t
  :config (load-theme 'acme t))

(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  :config
  (progn
    (evil-mode 1)
    (setq evil-default-cursor t)))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package which-key
  :ensure t
  :config
  (progn
    (setq which-key-idle-delay 0.5)
    (which-key-setup-minibuffer)
    (which-key-mode +1)))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))

;; Ivy & friends
(use-package ivy
  :ensure t
  :init
  (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy))))

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

(use-package neotree
  :ensure t
  :init
  (setq ranger-show-hidden t)
  :config
  (evil-define-key 'normal neotree-mode-map (kbd "TAB")
    'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "SPC")
    'neotree-quick-look)
  (evil-define-key 'normal neotree-mode-map (kbd "q")
    'neotree-hide)
  (evil-define-key 'normal neotree-mode-map (kbd "RET")
    'neotree-enter)
  (evil-define-key 'normal neotree-mode-map (kbd "g")
    'neotree-refresh)
  (evil-define-key 'normal neotree-mode-map (kbd "n")
    'neotree-next-line)
  (evil-define-key 'normal neotree-mode-map (kbd "p")
    'neotree-previous-line)
  (evil-define-key 'normal neotree-mode-map (kbd "A")
    'neotree-stretch-toggle)
  (evil-define-key 'normal neotree-mode-map (kbd "H")
    'neotree-hidden-file-toggle))

(use-package lispy)

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

(use-package general
  :ensure t)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

(use-package clojure-mode
  :ensure t)

(use-package cider
  :ensure t)

(use-package org
  :mode (("\\.org$" . org-mode))
  :ensure org-plus-contrib)

(use-package magit
  :ensure t)

(use-package restart-emacs
  :ensure t)

(provide 'packages)

;;; packages.el ends here
