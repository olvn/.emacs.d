;; Helpful links:
;; 
;; - https://sam217pa.github.io/2016/09/02/how-to-build-your-own-spacemacs/
;; - https://dev.to/huytd/emacs-from-scratch-1cg6
;; - https://sam217pa.github.io/2016/09/13/from-helm-to-ivy/#fnref:2
;; - http://www.petecorey.com/blog/2019/07/01/building-my-own-spacemacs/

(load "~/.emacs.d/defaults")
(load "~/.emacs.d/packages")
(load "~/.emacs.d/theme")
(load "~/.emacs.d/keybinds")
(load "~/.emacs.d/layers")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("c5a81a42df109b02a9a68dfe0ed530080372c1a0bbcb374da77ee3a57e1be719" "1d44ec8ec6ec6e6be32f2f73edf398620bb721afeed50f75df6b12ccff0fbb15" default))
 '(package-selected-packages
   '(plan9-theme acme-theme parchment-theme restart-emacs evil-collection format-all neotree flx-ido flx magit org-mode lispy company flycheck cider clojure-mode doom-modeline srcery-theme use-package))
 '(projectile-mode t nil (projectile)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

