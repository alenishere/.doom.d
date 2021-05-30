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
(setq doom-theme 'doom-one)
(after! doom-theme
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/Org")
(setq org-agenda-files (quote ("~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/Org/todo.org" "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/Org/projects.org" "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/Org/trickler.org" "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/Org/dates.org")))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)
(map! :leader
      :desc "Comment or uncomment lines" "TAB TAB" #'comment-line
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

;; Window switch - ace window face
(after! ace-window
  (custom-set-faces
   '(aw-leading-char-face
     ((t (:inherit ace-jump-face-foreground :height 5.0)))))
  )

;; Org mode
;; Org ellipsis
(setq org-ellipsis " ▼")
(setq org-superstar-headline-bullets-list '("●" "○" "▷" "▸" "◆" "◇" "◉" "◎"))
;; Enabling inline images by default
(setq org-display-inline-images t)
(setq org-redisplay-inline-images t)
(setq org-startup-with-inline-images "inlineimages")
(setq org-hide-emphasis-markers t)


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
  (setq org-passwords-file "~/.doom.d/extras/personal/passwords.org")

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
  ;; '("l" "Link" entry
  ;;   (file+headline +org-capture-todo-file "Website")
  ;;   "* %a\n %?\n %T\n %i")

  ;; Custom org capture
  (require 'org-protocol)
  ;; (add-to-list 'org-capture-templates
  ;;              '("l" "A link, for reading later." entry
  ;;                (file+headline "notes.org" "Reading List")
  ;;                "* %:description\n%u\n\n%c\n\n%i"
  ;;                :empty-lines 1)
  ;;              )
  (defvar +org-capture-review-file "review/review.org"
    "Default target for storing review files.
Is relative to `org-directory', unless it is absolute")
  (setq +org-capture-review-file
        (expand-file-name +org-capture-review-file org-directory))
  (add-to-list 'org-capture-templates
               '("r" "Review"))
  (add-to-list 'org-capture-templates
               '("rw" "Weekly review" entry
                 (file+headline +org-capture-review-file "Weekly")
                 (file "~/.doom.d/org_capture_templates/weekly_review.txt")
                 )
               )
  (add-to-list 'org-capture-templates
               '("rm" "Monthly review" entry
                 (file+headline +org-capture-review-file "Monthly")
                 (file "~/.doom.d/org_capture_templates/monthly_review.txt")
                 )
               )
  (add-to-list 'org-capture-templates
               '("c" "Checklists"))

  ;; Setting default capture template
  ;; (setq org-protocol-default-template-key "l")

  ;; Popup window size
  (set-popup-rule! "^CAPTURE-.*\\.org$" :size 0.5 :quit nil :select t :autosave t)

  ;; Additiona babel languages
  (add-to-list 'org-structure-template-alist '("p" . "src jupyter-python :session python_default :kernal python3 :async yes\n"))
  ;; (add-to-list 'org-structure-template-alist '("i" . "src ipython :results raw drawer :session"))
  (add-to-list 'org-structure-template-alist '("d" . "src dot :file %?.png :async yes :cmdline -Kdot -Tpng"))
  ;; :file ./fig_1?

   ;; Additional Org modules
  ;; (require 'org-habit)
  (add-to-list 'org-modules 'org-checklist)
  (add-to-list 'org-modules 'org-habit)

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

  ;; Complete org config completed
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
  (setq org-roam-directory "~/pCloud Drive/Org-Roam")

  (setq org-roam-dailies-capture-templates '(("d" "daily" plain (function org-roam-capture--get-point) ""
                                              :immediate-finish t
                                              :file-name "Dailies/%<%Y-%m-%d>"
                                              :head "#+TITLE: %<%Y-%m-%d>")))
  (setq org-roam-ref-capture-templates
        '(("r" "ref" plain (function org-roam-capture--get-point)
           "%?"
           :file-name "websites/${slug}"
           :head "#+TITLE: ${title}
    #+ROAM_KEY: ${ref}
    - source :: ${ref}"
           :unnarrowed t)))

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

;; https://github.com/org-roam/org-roam/issues/1221
;; (defun org-roam-db-query (sql &rest args)
;;   "Run SQL query on Org-roam database with ARGS.
;;  SQL can be either the emacsql vector representation, or a string."
;;   (sleep-for 0 1)
;;   (if  (stringp sql)
;;       (emacsql (org-roam-db) (apply #'format sql args))
;;     (apply #'emacsql (org-roam-db) sql args))
  )
(map! :after org
      :map org-mode-map
      :localleader
      :prefix ("m")
      "l" #'org-roam-store-link
      "n" #'org-roam-jump-to-index
      "z" #'org-roam-random-note
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


;; Company
(use-package! company-posframe
  :after company
  :init
  (company-posframe-mode 1)
  (setq company-show-numbers t)
  )
(after! company-box
  (setq company-show-numbers t)
  )

;; Org server
;; (server-start)

;; Time-stamp hook
;; ------------------------------------------------------------------------------
(add-hook! 'before-save-hook #'time-stamp)

;;; Ispell personal dictionary
;;; -----------------------------------------------------------------------------
(setq ispell-personal-dictionary "~/.doom.d/extras/personal/personal_dict.txt")


;; Doom emacs start maximized
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
