(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes (quote ("8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(inhibit-startup-screen t)
 '(nyan-animate-nyancat t)
 '(nyan-mode t)
 '(nyan-wavy-trail t)
 '(package-archives (quote (("gnu" . "http://elpa.gnu.org/packages/") ("melpa" . "http://melpa.org/packages/")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 128 :width normal :foundry "unknown" :family "Ubuntu Mono")))))
 ;;IDO mode preferences
(global-set-key (kbd "C-c c") 'org-capture)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-use-filename-at-point 'guess)
(setq ido-create-new-buffer 'always)
(setq ido-file-extensions-order '(".org" ".txt" ".py" ".emacs" ".xml" ".el" ".ini" ".cfg" ".cnf" ".html"))
(setq ido-ignore-extensions t)
(setq org-capture-templates
  '(    ;; ... other templates

    ("j" "Journal Entry"
         entry (file+datetree "~/Documents/journal/journal.org")
         "* %?"
         :empty-lines 1)

        ;; ... other templates
    ))
(setq org-capture-templates '(
    ("j" "Journal Entry"
         entry (file+datetree "~/Documents/journal/journal.org/")
         "* Event: %?\n\n  %i\n\n  From: %a"
         :empty-lines 1)
))
(defun get-journal-file-today ()
  "Return filename for today's journal entry."
  (let ((daily-name (format-time-string "%Y%m%d")))
    (expand-file-name (concat org-journal-dir daily-name))))
(defun journal-file-today ()
  "Create and load a journal file based on today's date."
  (interactive)
  (find-file (get-journal-file-today)))

(global-set-key (kbd "C-c f j") 'journal-file-today)
(add-to-list 'auto-mode-alist '(".*/[0-9]*$" . org-mode))
(defun journal-file-insert ()
  "Insert's the journal heading based on the file's name."
  (interactive)
  (when (string-match "\\(20[0-9][0-9]\\)\\([0-9][0-9]\\)\\([0-9][0-9]\\)"
                      (buffer-name))
    (let ((year  (string-to-number (match-string 1 (buffer-name))))
          (month (string-to-number (match-string 2 (buffer-name))))
          (day   (string-to-number (match-string 3 (buffer-name))))
          (datim nil))
      (setq datim (encode-time 0 0 0 day month year))
      (insert (format-time-string
                 "#+TITLE: Journal Entry- %Y-%b-%d (%A)\n\n" datim)))))

(add-hook 'find-file-hook 'auto-insert)
(add-to-list 'auto-insert-alist '(".*/[0-9]*$" . journal-file-insert))

(setq org-capture-templates '(
    ;; ...
    ("j" "Journal Note"
         entry (file (get-journal-file-today))
         "* Event: %?\n\n  %i\n\n  From: %a"
         :empty-lines 1)
    ;; ..
))

(defun find-file-increment ()
  "Takes the current buffer, and loads the file that is 'one
more' than the file contained in the current buffer. This
requires that the current file contain a number that can be
incremented."
  (interactive)
  (find-file (find-file-number-change '1+)))

(defun find-file-decrement ()
  "Takes the current buffer, and loads the file that is 'one
less' than the file contained in the current buffer. This
requires that the current file contain a number that can be
decremented."
  (interactive)
  (find-file (find-file-number-change '1-)))

(global-set-key (kbd "C-c f +") 'find-file-increment)
(global-set-key (kbd "C-c f n") 'find-file-increment)
(global-set-key (kbd "C-c f -") 'find-file-decrement)
(global-set-key (kbd "C-c f p") 'find-file-decrement)
