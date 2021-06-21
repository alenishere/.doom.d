;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
;; (setq user-full-name "John Doe"
;;      user-mail-address "john@doe.com")
(load! "~/.doom.d/personal.el")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; setq doom-font (font-spec :family "cascadia code" :size 14 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "cascadia code" :size 16 :weight 'semi-light))


;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-tomorrow-night)
(after! doom-theme
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/pCloud Drive/My Documents/Org")
(setq org-agenda-files (quote ("~/pCloud Drive/My Documents/Org/todo.org" "~/pCloud Drive/My Documents/Org/projects.org" "~/pCloud Drive/My Documents/Org/trickler.org" "~/pCloud Drive/My Documents/Org/dates.org" "~/pCloud Drive/My Documents/Org/notes.org")))
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)
(map! :leader
      (:prefix ("t" . "toggle")
       :desc "Toggle line highlight in frame" "h" #'hl-line-mode
       :desc "Toggle line highlight globally" "H" #'global-hl-line-mode
       :desc "Toggle truncate lines" "t" #'toggle-truncate-lines))

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Better image for doom start
(setq fancy-splash-image "~/.doom.d/icon_128x128@2.png")

;; Better Fonts
;; (setq doom-font (font-spec :family "cascadia code"
;;                            :size 20))

;; Windows Path configuration
;; ------------------------------------------------------------------------------
(when (string-equal system-type "windows-nt")
  (let (
        (mypaths
         '(;; Emacs
           "c:/Users/aaninan/emax64/bin"

           ;; Git
           "C:/Program Files/Git/bin"
           ;; "C:/Program Files/Git/cmd"
           ;; "C:/Program Files/Git"
           ;; "C:/Program Files/Git/mingw64/bin"
           ;; "C:/Program Files/Git/usr/bin"

           ;; Mingwin tools
           ;; "c:/Users/aaninan/Home/.doom.d/extras/mingw64/bin"
           "C:/msys64/mingw64/bin"
           "C:/msys64"
           "C:/msys64/usr/bin"

           ;; Java runtime
           "C:/Program Files (x86)/Java/jre1.8.0_251/bin"

           ;; Anaconda path
           "c:/Users/aaninan/anaconda3"
           "c:/Users/aaninan/anaconda3/condabin"
           ;; "c:/Users/aaninan/anaconda3/Library/bin"

           ;; Searchtools
           "C:/Users/aaninan/Home/.doom.d/extras/fd"
           "c:/Users/aaninan/Home/.doom.d/extras/ripgrep"
           "C:/Users/aaninan/Home/.doom.d/extras/ag"
           "c:/Users/aaninan/Home/.doom.d/extras/languagetool"

           ;; Rust
           "C:/Users/aaninan/.cargo/bin"
           "C:/Users/aaninan/.rustup/toolchains/stable-x86_64-pc-windows-msvc/bin"

           ;; Graphviz
           "c:/Users/aaninan/Home/.doom.d/extras/graphviz/bin"


           ;; Firefox
           "C:/Program Files/Mozilla Firefox"
           "C:/Program Files (x86)/Mozilla Firefox/"

           ;; Miketex
           "c:/Users/aaninan/AppData/Local/Programs/MiKTeX/miktex/bin/x64/"

           ;; Music
           "C:/Program Files (x86)/LilyPond/usr/bin"
           ) )
        )

    (setenv "PATH" (mapconcat 'identity mypaths ";") )

    (setq exec-path (append mypaths (list "." exec-directory)) )
    ) )

;; Window switch - ace window face
(after! ace-window
  (custom-set-faces
   '(aw-leading-char-face
     ((t (:inherit ace-jump-face-foreground :height 5.0)))))
  )

;; Truncate line
(setq truncate-string-ellipsis "…")
;; Org mode
;; Org ellipsis
(setq org-ellipsis " ▼")
;; Org superstar symbols
(setq org-superstar-headline-bullets-list '("●" "○" "▷" "▸" "◆" "◇" "◉" "◎"))
;; Enabling inline images by default
(setq org-display-inline-images t)
(setq org-redisplay-inline-images t)
(setq org-startup-with-inline-images "inlineimages")
(setq org-hide-emphasis-markers t)
(setq org-indent-indentation-per-level 2)

(after! org
  ;; Drawer use
  (setq org-clock-into-drawer t)
  (setq org-log-done t)
  (setq org-log-into-drawer t)
  (setq org-clock-persist t)

  ;; Org-attach
  (setq org-attach-id-dir ".attach/")
  ;; Link type to use
  (setq org-link-file-path-type 'relative)

  ;; Personal config
  ;; (setq org-passwords-file "~/.doom.d/extras/personal/passwords.org")

  ;; Tags for org mode
  (setq org-tag-alist '((:startgrouptag)
                        ("LOCATION")
                        (:grouptags)
                        ("@HOME" . ?h)
                        ("@OFFICE" . ?f)
                        ("@PHONE" . ?p)
                        ("@OUTSIDE" . ?t)
                        ("@COMPUTER" . ?c)
                        (:endgrouptag)
                        (:startgrouptag)
                        ("ENERGY")
                        (:grouptags)
                        ("enLO" . ?l)
                        ("enMD" . ?m)
                        ("enHI" . ?i)
                        (:endgrouptag)
                        (:startgrouptag)
                        ("TYPE")
                        (:grouptags)
                        ("#ONESTEP" . ?s)
                        ("#MULTI" . ?u)
                        ("#LEARNING" . ?n)
                        ("#IDEA" . ?q )
                        ("#BUY" . ?y)
                        ("#REFERENCE" . ?r)
                        (:endgrouptag)
                        (:startgrouptag)
                        ("ACTION")
                        (:grouptags)
                        ("BIG" . ?b)
                        ("DO" . ?o)
                        ("DECIDE" . ?e)
                        ("DELEGATE" . ?g)
                        ("DELETE" . ?d)
                        (:endgrouptag)
                        (:startgrouptag)
                        ("DAILY")
                        (:grouptags)
                        ("FOREBURNER" . ?v)
                        ("BACKBURNER" . ?w)
                        (:endgrouptag)
                        ))
  ;; Tag colour
  (setq org-tag-faces
        '(
          ("@HOME" . (:foreground "GoldenRod" :weight bold))
          ("@OFFICE" . (:foreground "GoldenRod" :weight bold))
          ("@PHONE" . (:foreground "GoldenRod" :weight bold))
          ("@OUTSIDE" . (:foreground "GoldenRod" :weight bold))
          ("@COMPUTER" . (:foreground "GoldenRod" :weight bold))
          ("DEV" . (:foreground "IndianRed1" :weight bold))
          ("#ONESTEP" . (:foreground "IndianRed1" :weight bold))
          ("#LEARNING" . (:foreground "IndianRed1" :weight bold))
          ("#IDEA" . (:foreground "IndianRed1" :weight bold))
          ("#MULTI" . (:foreground "IndianRed1" :weight bold))
          ("#BUY" . (:foreground "IndianRed1" :weight bold))
          ("#REFERENCE" . (:foreground "IndianRed1" :weight bold))
          ("URGENT" . (:foreground "Red" :weight bold))
          ("enHI" . (:foreground "Red" :weight bold))
          ("enLO" . (:foreground "LimeGreen" :weight bold))
          ("enMD" . (:foreground "OrangeRed" :weight bold))
          ("BIG" . (:foreground "Red" :weight bold))
          ("DO" . (:foreground "LimeGreen" :weight bold))
          ("DECIDE" . (:foreground "GoldenRod" :weight bold))
          ("DELEGATE" . (:foreground "LimeGreen" :weight bold))
          ("DELETE" . (:foreground "OrangeRed" :weight bold))
          ))
  ;; Including diary entries in agenda

  (setq org-agenda-include-diary t)

  ;; Custom org capture
  (require 'org-protocol)
  ;; Fix some link issues
  (defun transform-square-brackets-to-round-ones(string-to-transform)
    "Transforms [ into ( and ] into ), other chars left unchanged."
    (concat
     (mapcar #'(lambda (c) (if (equal c ?\[) ?\( (if (equal c ?\]) ?\) c))) string-to-transform))
    )
  (add-to-list 'org-capture-templates
               '("c" "Org-protocol"))
  ;; Firefox
  (add-to-list 'org-capture-templates
               '("cp" "Protocol" entry
                 (file+headline +org-capture-notes-file "Inbox")
                 "* %^{Title}\nSource: %u, %c\n #+BEGIN_QUOTE\n%i\n#+END_QUOTE\n\n\n%?"
                 :prepend t
                 :kill-buffer t))
  (add-to-list 'org-capture-templates
               '("cl" "Protocol Link" entry
                 (file+headline +org-capture-notes-file "Inbox")
                 "* %? [[%:link][%(transform-square-brackets-to-round-ones \"%:description\")]]\n"
                 :prepend t
                 :kill-buffer t))
  (add-to-list 'org-capture-templates
               '("cw" "Article"
                 entry (file+headline +org-capture-notes-file "Inbox")
                 "* [ ] %a\nSCHEDULED: %t\n%U\n%:initial\n\n"
                 :immediate-finish t)
               )

  (defvar +org-capture-review-file "review/review.org"
    "Default target for storing review files.
Is relative to `org-directory', unless it is absolute")
  (setq +org-capture-review-file
        (expand-file-name +org-capture-review-file org-directory))
  (add-to-list 'org-capture-templates
               '("v" "Review"))
  (add-to-list 'org-capture-templates
               '("vw" "Weekly review" entry
                 (file+headline +org-capture-review-file "Weekly")
                 (file "~/.doom.d/org_capture_templates/weekly_review.txt")
                 )
               )
  (add-to-list 'org-capture-templates
               '("vm" "Monthly review" entry
                 (file+headline +org-capture-review-file "Monthly")
                 (file "~/.doom.d/org_capture_templates/monthly_review.txt")
                 )
               )
  ;; Setting default capture template
  (setq org-protocol-default-template-key "cw")

  ;; Additional babel languages
  (add-to-list 'org-structure-template-alist '("p" . "src jupyter-python :session python_default :kernal python3 :async no"))
  (add-to-list 'org-structure-template-alist '("i" . "src emacs-lisp"))
  (add-to-list 'org-structure-template-alist '("d" . "src dot :file %?.png :async no :cmdline -Kdot -Tpng"))
  ;; :file ./fig_1?

  ;; Additional Org modules
  (add-to-list 'org-modules 'org-checklist)
  (add-to-list 'org-modules 'org-habit)
  ;; (require 'org-habit)
  ;; Enabling image scaling
  (setq org-image-actual-width nil)


  ;;;  Orgmode count done
;;;-----------------------------------------------------------------------------
(defun +my/count-done ()
  (interactive)
  (save-excursion
    ;; we need to end up *before* the start of the drawer in order
    ;; to parse it correctly, so we back up one line from where org-log-beginning tells us.
    (goto-char (org-log-beginning))
    (forward-line -1)
    (let ((contents (cadr (org-element-drawer-parser nil nil))))
      (count-lines (plist-get contents :contents-begin)
                   (plist-get contents :contents-end)))))

(defun +my/put-count ()
  (interactive)
  (let ((count (+my/count-done)))
    (org-entry-put (point) "DONE-COUNT" (format "%d" count))))

  (map! :localleader
        :map org-mode-map
        :prefix ("d")
        :desc "Put rep count" "p" '+my/put-count
        )
  ;; Org config completed
  )


;; Ox clip for formatted copy
(after! ox-clip
  (map! :localleader
        :map org-mode-map
        :prefix ("y" . "OX-clip")
        :desc "HTML copy table"    "y" 'ox-clip-formatted-copy
        :desc "HTML copy image"    "i" 'ox-clip-image-to-clipboard
        )
  )
;;; Agenda view custom commands
(map! :after org-agenda
        :map org-agenda-mode-map
        :m "C-SPC" #'org-agenda-show-and-scroll-up
        :localleader
        (:prefix ("v" . "views")
         "y" #'org-agenda-year-view
         "m" #'org-agenda-month-view
         "d" #'org-agenda-day-view
         )
        )
(map! :prefix "SPC"
      :nv "a" #'org-agenda
      )
(map! :localleader
      :map org-mode-map
      :prefix ("w" ."Org-buffers")
      :desc "Org write all org" "w" 'org-save-all-org-buffers
      :desc "Org revert all buffers" "i" 'org-revert-all-org-buffers
      )

;;; Org archiving and custom view
;;; -----------------------------------------------------------------------------
;; Custom agenda skip function to skip entries with activity in the
;; past month used to find candidates for archiving. Adapted from
;; http://doc.norang.ca/org-mode.html#Archiving
(after! (org-agenda)
  (defun +my/skip-non-archivable-tasks ()
    "Skip trees that are not available for archiving"
    (let ((next-headline (save-excursion (or (outline-next-heading) (point-max)))))
      ;; consider only tasks with done todo headings as archivable tasks
      (if (member (org-get-todo-state) org-done-keywords)
          (let* ((subtree-end (save-excursion (org-end-of-subtree t)))
                 (daynr (string-to-number (format-time-string "%d" (current-time))))
                 (a-month-ago (* 60 60 24 (+ daynr 1)))
                 (last-month (format-time-string "%Y-%m-" (time-subtract (current-time) (seconds-to-time a-month-ago))))
                 (this-month (format-time-string "%Y-%m-" (current-time)))
                 (subtree-is-current (save-excursion
                                       (forward-line 1)
                                       (and (< (point) subtree-end)
                                            (re-search-forward (concat last-month "\\|" this-month) subtree-end t)))))
            (if subtree-is-current
                next-headline ;; has a date in this month or last month, so skip it
              nil)) ;; available to archive
        (or next-headline (point-max)))))
  ;; Add an agenda view that utilises this skip function.
  (setq org-agenda-custom-commands
        (cons
         '("A" "Candidate trees for archiving" tags "-NOARCHIVE"
           ((org-agenda-overriding-header "Candidate tasks for archiving")
            (org-agenda-skip-function '+my/skip-non-archivable-tasks)))
         org-agenda-custom-commands))
)

;;; Org calendar view using calf
;;; -----------------------------------------------------------------------------
;;; Setup the function below in private file to have view of google calendar in Calf.
;; (defun my-open-calendar ()
;;   (interactive)
;;   (cfw:open-calendar-buffer
;;    :contents-sources
;;    (list
;;     (cfw:org-create-source "Green")  ; org-agenda source
;;     ;;(cfw:org-create-file-source "cal" "/path/to/cal.org" "Cyan")  ; other org source
;;     ;;(cfw:howm-create-source "Blue")  ; howm source
;;     (cfw:cal-create-source "Orange") ; diary source
;;     ;; (cfw:ical-create-source "Moon" "~/moon.ics" "Gray")  ; ICS source1
;;     (cfw:ical-create-source "gcal-main" "https://calendar.google.com/calendar/ical/samplecalendar" "IndianRed") ; google calendar ICS
;;     )))
;; My personal calendar setting in the Personal file
(setq cfw:org-overwrite-default-keybinding t)
(map! :leader
      :prefix "oa"
      :desc "Calendar view" "c" #'my-open-calendar
      )

;;; Org mode map to file extensions
(after! org
  (add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|org_done\\)$" . org-mode))
  )
;;; Org roam server settings
(after! org-roam
;; Set default org-roam directory
  (setq org-roam-directory "~/pCloud Drive/My Documents/Org/Org-Roam")

  (setq org-roam-dailies-capture-templates '(("d" "daily" plain (function org-roam-capture--get-point) ""
                                              :immediate-finish t
                                              :file-name "Dailies/%<%Y-%m-%d>"
                                              :head "#+TITLE: %<%Y-%m-%d>")))
  (setq  org-roam-capture-ref-templates '(("w" "Web site" plain (function org-roam-capture--get-point)
                                           "%?"
                                           :file-name "Websites/%<%Y%m%d>-${slug}"
                                           :head "#+TITLE: ${title}\n#+CREATED: %U\n#+ROAM_KEY: ${ref}\n#+roam_tags: website fleeting\n\n"
                                           :unnarrowed t)))
  ;; Remove org-roam back link buffer from operning by default
  (remove-hook! 'find-file-hook #'+org-roam-open-buffer-maybe-h)
  ;; Org-roam server configuration
  (use-package! org-roam-server
    :config
    (setq org-roam-server-host "127.0.0.1"
          org-roam-server-port 8080
          org-roam-server-authenticate nil
          org-roam-server-export-inline-images t
          org-roam-server-serve-files nil
          org-roam-server-served-file-extensions '("pdf" "mp4" "ogv")
          org-roam-server-network-poll t
          org-roam-server-network-arrows nil
          org-roam-server-network-label-truncate t
          org-roam-server-network-label-truncate-length 60
          org-roam-server-network-label-wrap-length 20)
  (defun org-roam-server-open ()
    "Ensure the server is active, then open the roam graph."
    (interactive)
    (org-roam-server-mode 1)
    (browse-url-xdg-open (format "http://localhost:%d" org-roam-server-port)))
    )
  (org-roam-server-mode)

  (when (string-equal system-type "windows-nt")
    ;; (setq org-roam-graph-executable "neato")
    (setq org-roam-graph-viewer
          (lambda (file)
            (let ((org-roam-graph-viewer "firefox.exe"))
              (org-roam-graph--open (concat "file:///" file))))))
  (setq org-roam-graph-exclude-matcher '("private" "dailies" "archives"))
  )

(map! :after org
      :map org-mode-map
      :localleader
      :prefix ("mc" . "cache")
      "c" #'org-roam-store-link
      "d" #'org-roam-jump-to-index
      )
(map! :leader
      :prefix ("nr")
      "l" #'org-roam-store-link
      "n" #'org-roam-jump-to-index
      "z" #'org-roam-random-note
      )
(map! :after org-roam
      :map org-mode-map
      :localleader
      :prefix ("ma" . "alias")
      "a" #'org-roam-alias-add
      "d" #'org-roam-alias-delete
      )

;; Org noter
(after! pdf-view
  ;; open pdfs scaled to fit page
  (setq-default pdf-view-display-size 'fit-width)
  ;; automatically annotate highlights
  (setq pdf-annot-activate-created-annotations t
        pdf-view-resize-factor 1.1)
   ;; faster motion
 (map!
   :map pdf-view-mode-map
   :n "g g"          #'pdf-view-first-page
   :n "G"            #'pdf-view-last-page
   :n "N"            #'pdf-view-next-page-command
   :n "E"            #'pdf-view-previous-page-command
   :n "e"            #'evil-collection-pdf-view-previous-line-or-previous-page
   :n "n"            #'evil-collection-pdf-view-next-line-or-next-page
   :localleader
   (:desc "Insert note" "i" #'org-noter-insert-note
    :desc "Insert precise note" "p" #'org-noter-insert-precise-note
    :desc "Toggle note" "t" #'org-noter-insert-note-toggle-no-questions
     )
 ))

(use-package! org-noter
  :after (:any org pdf-view)
  :config
  (setq
   ;; The WM can handle splits
   org-noter-notes-window-location 'other-frame
   ;; Please stop opening frames
   org-noter-always-create-frame nil
   ;; I want to see the whole file
   org-noter-hide-other nil
   org-noter-notes-search-path (list (concat org-roam-directory "/Notes"))
   )
  )

;; Org-projectile
;; ------------------------------------------------------------------------------
;; (use-package! org-projectile
;;   :config
;;     ;; (map! :leader
;;     ;;   (:prefix "n"
;;     ;;     :desc "projectile-project-complete-read" "p" #'org-projectile-project-todo-completing-read))
;;     ;; (defun org-projectile-get-project-todo-file (project-path)
;;     ;;   (message "Called")
;;     ;;   (message project-path)
;;     ;;   (concat org-directory "/projects/" (file-name-nondirectory (directory-file-name project-path)) ".org"))
;;   (setq org-projectile-per-project-filepath "todo.org")
;;   (setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
;;     )
;; (push (org-projectile-project-todo-entry) org-capture-templates)

;; Company completion
(after! company-box
  (setq company-show-numbers t)
  )

;; Time-stamp hook
;; ------------------------------------------------------------------------------
(add-hook! 'before-save-hook #'time-stamp)

;;; Ispell personal dictionary
;;; -----------------------------------------------------------------------------
(setq ispell-personal-dictionary "~/.doom.d/extras/personal/personal_dict.txt")
(after! spell-fu
  (setq spell-fu-idle-delay 0.5 ; default is 0.25
        ispell-dictionary "en_GB" ; needed for Macs in particular
        )
)

;;; Markdown
;;; -----------------------------------------------------------------------------
(map! :localleader
      :map markdown-mode-map
      :prefix ("i" . "Insert")
      :desc "Blockquote"    "q" 'markdown-insert-blockquote
      :desc "Bold"          "b" 'markdown-insert-bold
      :desc "Code"          "c" 'markdown-insert-code
      :desc "Emphasis"      "e" 'markdown-insert-italic
      :desc "Footnote"      "f" 'markdown-insert-footnote
      :desc "Code Block"    "s" 'markdown-insert-gfm-code-block
      :desc "Image"         "i" 'markdown-insert-image
      :desc "Link"          "l" 'markdown-insert-link
      :desc "List Item"     "n" 'markdown-insert-list-item
      :desc "Pre"           "p" 'markdown-insert-pre
      (:prefix ("h" . "Headings")
        :desc "One"   "1" 'markdown-insert-atx-1
        :desc "Two"   "2" 'markdown-insert-atx-2
        :desc "Three" "3" 'markdown-insert-atx-3
        :desc "Four"  "4" 'markdown-insert-atx-4
        :desc "Five"  "5" 'markdown-insert-atx-5
        :desc "Six"   "6" 'markdown-insert-atx-6))

;; Anki editor
;; ------------------------------------------------------------------------------
(use-package! anki-editor
  :config
  (setq anki-editor-create-decks 't)
  (map! :localleader
        :map org-mode-map
        (:prefix ("z" . "Anki")
         :desc "Push" "p" 'anki-editor-push-notes
         :desc "Retry" "r" 'anki-editor-retry-failure-notes
         :desc "Insert" "n" 'anki-editor-insert-note
         (:prefix ("c" . "Cloze")
          :desc "Dwim" "d" 'anki-editor-cloze-dwim
          :desc "Region" "r" 'anki-editor-cloze-region
          )
         )
        )
  )


;;; Org-ref
;;; -----------------------------------------------------------------------------
(use-package! org-ref
    :config
    (setq
         org-ref-completion-library 'org-ref-ivy-cite
         org-ref-get-pdf-filename-function 'org-ref-get-pdf-filename-helm-bibtex
         org-ref-default-bibliography (list (concat org-roam-directory "/Notes/zotLib.bib"))
         org-ref-bibliography-notes (concat org-roam-directory "/Notes/Notes.org")
         org-ref-note-title-format "* TODO %y - %t\n :PROPERTIES:\n  :Custom_ID: %k\n  :NOTER_DOCUMENT: %F\n :ROAM_KEY: cite:%k\n  :AUTHOR: %9a\n  :JOURNAL: %j\n  :YEAR: %y\n  :VOLUME: %v\n  :PAGES: %p\n  :DOI: %D\n  :URL: %U\n :END:\n\n"
         org-ref-notes-directory (concat org-roam-directory "/Notes/")
         org-ref-notes-function 'orb-edit-notes
    ))

(after! org-ref
  (setq
   bibtex-completion-notes-path (concat org-roam-directory "/Notes/")
   bibtex-completion-bibliography (concat org-roam-directory "/Notes/zotLib.bib")
   bibtex-completion-pdf-field "file"
   bibtex-completion-notes-template-multiple-files
   (concat
    "#+TITLE: ${title}\n"
    "#+ROAM_KEY: cite:${=key=}\n"
    "#+ROAM_TAGS: ${keywords}\n"
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
)
(after! org-ref
  (defun my/org-ref-open-pdf-at-point ()
    "Open the pdf for bibtex key under point if it exists."
    (interactive)
    (let* ((results (org-ref-get-bibtex-key-and-file))
           (key (car results))
           (pdf-file (car (bibtex-completion-find-pdf key))))
      (if (file-exists-p pdf-file)
          (funcall bibtex-completion-pdf-open-function pdf-file)
        (message "No PDF found for %s" key))))
  (setq org-ref-open-pdf-function 'my/org-ref-open-pdf-at-point)
  )

 (use-package! org-roam-bibtex
  :after (org-roam)
  :hook (org-roam-mode . org-roam-bibtex-mode)
  :config
  (setq org-roam-bibtex-preformat-keywords
   '("=key=" "title" "url" "file" "author-or-editor" "keywords"))
  (setq orb-templates
        '(("r" "ref" plain (function org-roam-capture--get-point)
           ""
           :file-name "${slug}"
           :head "#+TITLE: ${=key=}: ${title}\n#+ROAM_KEY: ${ref}\n#+ROAM_TAGS:

- keywords :: ${keywords}

\n* ${title}\n  :PROPERTIES:\n  :Custom_ID: ${=key=}\n  :URL: ${url}\n  :AUTHOR: ${author-or-editor}\n  :NOTER_DOCUMENT: %(orb-process-file-field \"${=key=}\")\n  :NOTER_PAGE: \n  :END:\n\n"

           :unnarrowed t))))

(package! org-re-reveal-ref)

;;; Doom emacs start maximised
;;; -----------------------------------------------------------------------------
(add-to-list 'initial-frame-alist '(fullscreen . maximized))


;;; Deft config
;;; -----------------------------------------------------------------------------
(setq deft-directory org-directory)
(setq deft-recursive t)

;;; Python programming
;;; -----------------------------------------------------------------------------
(when (string-equal system-type "windows-nt")
  (after! conda
    (setq conda-anaconda-home "C:/Users/aaninan/anaconda3")
    ;; (setq conda-anaconda-home (expand-file-name "~/anaconda3"))
    ;; (setq conda-env-home-directory (expand-file-name "~/anaconda3"))
    (conda-env-initialize-interactive-shells)
    ;; if you want eshell support, include:
    (conda-env-initialize-eshell)
    ;; if you want auto-activation (see below for details), include:
    (conda-env-autoactivate-mode t)
    ;; To activate conda on start
    (conda-env-activate "python-3.8.3")
    ;; (conda-env-activate "base")
    )
  )

;;; Hydras
;;; -----------------------------------------------------------------------------
;; I copied this from blings emacss config
(defhydra /hydras/paste (:hint nil)
  "
   paste:  _C-j_ → cycle next          _p_ → paste before       pos: %(length kill-ring-yank-pointer)
           _C-k_ → cycle previous      _P_ → paste after        len: %(length kill-ring)
"
  ("C-j" evil-paste-pop-next)
  ("C-k" evil-paste-pop)
  ("p" evil-paste-after)
  ("P" evil-paste-before))
  (map!
   :n "p" #'/hydras/paste/evil-paste-after
   :n "P" #'/hydras/paste/evil-paste-before
   )

;;; Flyspell
;;; ------------------------------------------------------------------------------
(after! flyspell
  (setq flyspell-lazy-idle-seconds 60)
  (setq ispell-dictionary "british")
  )
