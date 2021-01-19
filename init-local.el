;;; init-local.el --- My own custom file -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;;; my favoriate color theme
(require-package 'color-theme-sanityinc-tomorrow)
(setq-default custom-enabled-themes '(sanityinc-tomorrow-day))

;;; org-noter stuffs
(require-package 'pdf-tools)
(require-package 'org-noter-pdftools)

(provide 'init-local)
;;; init-local.el ends here
