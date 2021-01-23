;;; init-local.el --- My own custom file -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;;; my favoriate color theme
(require-package 'color-theme-sanityinc-tomorrow)
(setq-default custom-enabled-themes '(sanityinc-tomorrow-day))

;;; org-noter stuffs
(require-package 'pdf-tools)
(require-package 'org-noter-pdftools)

;;; org to twiki
(require-package 'ox-tiddly)
(require-package 'ox-twiki)

;;; org gtd
(setq org-default-notes-file "~/Dropbox/Org/TODO/inbox.org")
(setq org-agenda-files "~/Dropbox/Org/TODO/inbox.org")

(provide 'init-local)
;;; init-local.el ends here
