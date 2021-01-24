;;; init-local.el --- My own custom file -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;;; my favoriate color theme
(require-package 'color-theme-sanityinc-tomorrow)
(setq-default custom-enabled-themes '(sanityinc-tomorrow-day))

;;; ivy-bibtex
(require-package 'ivy-bibtex)
(setq
 bibtex-completion-notes-path "~/Dropbox/References/bib"
 bibtex-completion-bibliography "~/Dropbox/References/bib/References.bib"
 bibtex-completion-pdf-field "file"
 bibtex-completion-notes-template-multiple-files
 (concat
  "#+TITLE: ${title}\n"
  "#+ROAM_KEY: cite:${=key=}\n"
  "* TODO Notes\n"
  ":PROPERTIES:\n"
  ":Custom_ID: ${=key=}\n"
  ":NOTER_DOCUMENT: %(orb-process-file-field \"${=key=}\")\n"
  ":AUTHOR: ${author-abbrev}\n"
  ":JOURNAL: ${journaltitle}\n"
  ":DATE: ${date}\n"
  ":YEAR: ${year}\n"
  ":DOI: ${doi}\n"
  ":URL: ${url}\n"
  ":END:\n\n"
  )
 )


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
