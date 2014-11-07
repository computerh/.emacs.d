;;; org-screenshot-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (org-screenshot) "org-screenshot" "org-screenshot.el"
;;;;;;  (21589 26726 156945 0))
;;; Generated autoloads from org-screenshot.el

(autoload 'org-screenshot "org-screenshot" "\
take an area screenshot and place it in the entry's attachment
  directory

The user is interactively prompted for a base file name for the
screenshot. If the name is empty, a generic name will be
generated.  If the org entry has no defined attachment directory,
the user will be offered the choice to create one through the
`org-screenshot-get-attach-dir' function.

The frame invoking the function gets hidden while taking the
screenshot unless a prefix argument is passed (this allows taking
screenshots of the emacs session itself).  If no filename
extension is provided, .png will be added.

The command for invoking the external screenshot utility can be
customized using the `org-screenshot-command-line' variable.

Note that the screenshots are not stored as actual attachments
which would mean that entries for the Attachments would be
written to the PROPERTIES section of a headline in addition to
the links being already placed inside the text.

\(fn PRFX FILENAME)" t nil)

;;;***

;;;### (autoloads nil nil ("org-screenshot-pkg.el") (21589 26726
;;;;;;  259268 720000))

;;;***

(provide 'org-screenshot-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; org-screenshot-autoloads.el ends here
