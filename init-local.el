;;; init-local.el --- My own custom file -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;;; my favoriate color theme
(require-package 'color-theme-sanityinc-tomorrow)
(setq-default custom-enabled-themes '(sanityinc-tomorrow-day))

;;; ivy-bibtex
;;; I use a lot of stuffs taken from https://rgoswami.me/posts/org-note-workflow/
;;; I did not make the template work. org-process-file-field is obscure to me.
(require-package 'ivy-bibtex)
(setq
 bibtex-completion-notes-path "~/Dropbox/Org/Notes/"
 bibtex-completion-bibliography "~/Dropbox/References/bib/References.bib"
 bibtex-completion-pdf-field "file"
 bibtex-completion-library-path '("~/Dropbox/References/zotero/")
 ;; bibtex-completion-notes-template-multiple-files
 ;; (concat
 ;;  "#+TITLE: ${title}\n"
 ;;  "#+ROAM_KEY: cite:${=key=}\n"
 ;;  "* TODO Notes\n"
 ;;  ":PROPERTIES:\n"
 ;;  ":Custom_ID: ${=key=}\n"
 ;;  ":NOTER_DOCUMENT: %(orb-process-file-field \"${=key=}\")\n"
 ;;  ":AUTHOR: ${author-abbrev}\n"
 ;;  ":JOURNAL: ${journaltitle}\n"
 ;;  ":DATE: ${date}\n"
 ;;  ":YEAR: ${year}\n"
 ;;  ":DOI: ${doi}\n"
 ;;  ":URL: ${url}\n"
 ;;  ":END:\n\n"
 ;;  )
 )

;;; I cannot figure out the following
;; (require-package 'org-roam-bibtex)
;; (require 'org-roam-bibtex)
;; (require-package 'org-ref)
;; (require 'org-ref)

;; (setq org-roam-directory "~/Dropbox/Org/Notes/")

;; (setq
;;  org-ref-completion-library 'org-ref-ivy-cite
;;  org-ref-get-pdf-filename-function 'org-ref-get-pdf-filename-ivy-bibtex
;;  org-ref-default-bibliography (list "~/Dropbox/References/bib/References.bib")
;;  org-ref-bibliography-notes "~/Dropbox/Org/Notes/bibnotes.org"
;;  org-ref-note-title-format "* TODO %y - %t\n :PROPERTIES:\n  :Custom_ID: %k\n  :NOTER_DOCUMENT: %F\n :ROAM_KEY: cite:%k\n  :AUTHOR: %9a\n  :JOURNAL: %j\n  :YEAR: %y\n  :VOLUME: %v\n  :PAGES: %p\n  :DOI: %D\n  :URL: %U\n :END:\n\n"
;;  org-ref-notes-directory "~/Dropbox/Org/Notes/"
;;  org-ref-notes-function 'orb-edit-notes

;;  )
;; (setq orb-note-actions-interface 'ivy)

;;; org-noter stuffs
(require-package 'pdf-tools)
(require-package 'org-noter)
(require-package 'org-noter-pdftools)

;; (setq org-noter-default-file-names
;;       '((concat
;;          (file-name-base (file-name-nondirectory (buffer-file-name)))
;;          ".org")))
(setq org-noter-notes-search-path '("~/Dropbox/Org/Notes"))


;;; org to twiki
(require-package 'ox-tiddly)
(require-package 'ox-twiki)

;;; org gtd
(setq org-default-notes-file "~/Dropbox/Org/TODO/inbox.org")
(setq org-agenda-files "~/Dropbox/Org/TODO/inbox.org")

(provide 'init-local)
;;; init-local.el ends here
