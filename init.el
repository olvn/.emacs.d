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
 '(ansi-color-names-vector
   ["#000000" "#880000" "#005500" "#663311" "#004488" "#770077" "#007777" "#eeeecc"])
 '(custom-safe-themes
   '("c5a81a42df109b02a9a68dfe0ed530080372c1a0bbcb374da77ee3a57e1be719" "1d44ec8ec6ec6e6be32f2f73edf398620bb721afeed50f75df6b12ccff0fbb15" default))
 '(fci-rule-color "#f8fce8")
 '(hl-paren-background-colors '("#e8fce8" "#c1e7f8" "#f8e8e8"))
 '(hl-paren-colors '("#40883f" "#0287c8" "#b85c57"))
 '(org-drill-done-count-color "#663311")
 '(org-drill-failed-count-color "#880000")
 '(org-drill-mature-count-color "#005500")
 '(org-drill-new-count-color "#004488")
 '(package-selected-packages
   '(color-theme-modern xp-theme plan9-theme acme-theme parchment-theme restart-emacs evil-collection format-all neotree flx-ido flx magit org-mode lispy company flycheck cider clojure-mode doom-modeline srcery-theme use-package))
 '(pdf-view-midnight-colors '("#000000" . "#ffffea"))
 '(projectile-mode t nil (projectile))
 '(sml/active-background-color "#98ece8")
 '(sml/active-foreground-color "#424242")
 '(sml/inactive-background-color "#4fa8a8")
 '(sml/inactive-foreground-color "#424242"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

