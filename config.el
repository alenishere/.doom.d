;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
;; (setq user-full-name "John Doe"
;;      user-mail-address "john@doe.com")
(load! "~/.doom.d/personal.el")
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

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-xcode)
;; (setq doom-theme 'modus-vivendi)
(setq doom-theme 'doom-Iosvkem)
;; (setq doom-theme 'doom-plain-dark)
;; (setq doom-theme 'doom-spacegrey)
;; (setq doom-theme 'doom-solarized-dark-high-contrast)
;; (setq doom-theme 'doom-wilmersdorf)
;; (setq doom-theme 'doom-monokai-ristretto)
;; (setq doom-theme 'doom-nord-light)
(setq doom-theme 'doom-homage-black)
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
;;(setq doom-font (font-spec :family "cascadia code" :size 16 :weight 'light))

(setq doom-font (font-spec :family "JetBrains Mono" :size 15 :weight 'light)
      doom-variable-pitch-font (font-spec :family "Noto Serif" :size 15)
      ivy-posframe-font (font-spec :family "JetBrainsMono" :size 15))

;; (setq doom-font (font-spec :family "Iosevka" :size 15 :weight 'light)
;;       doom-variable-pitch-font (font-spec :family "Noto Serif" :size 15)
;;       ivy-posframe-font (font-spec :family "Iosevka" :size 15))


(after! doom-theme
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

(custom-set-faces!
  '(font-lock-comment-face :slant italic)
  '(font-lock-keyword-face :slant italic))
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)
;; Truncate line
(setq truncate-string-ellipsis "…")
(map! :leader
      (:prefix ("t" . "toggle")
       :desc "Toggle line highlight in frame" "h" #'hl-line-mode
       :desc "Toggle line highlight globally" "H" #'global-hl-line-mode
       :desc "Toggle truncate lines" "t" #'toggle-truncate-lines))
;; Better image for doom dashboard
(setq fancy-splash-image "~/.doom.d/icon_128x128@2.png")
(use-package! page-break-lines
  :commands page-break-lines-mode
  :init
  (autoload 'turn-on-page-break-lines-mode "page-break-lines")
  :config
  (setq page-break-lines-max-width fill-column)
  (map! :prefix "g"
        :desc "Prev page break" :nv "[" #'backward-page
        :desc "Next page break" :nv "]" #'forward-page))
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
(setq which-key-idle-delay 0.5)

(setq which-key-allow-multiple-replacements t)
(after! which-key
  (pushnew!
   which-key-replacement-alist
   '(("" . "\\`+?evil[-:]?\\(?:a-\\)?\\(.*\\)") . (nil . "◂\\1"))
   '(("\\`g s" . "\\`evilem--?motion-\\(.*\\)") . (nil . "◃\\1"))
   ))
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(when IS-MAC
  (setq org-roam-directory (file-truename "~/Org/roam/")
        org-directory "~/Org")
  )
(when IS-LINUX
  (setq org-roam-directory (file-truename "~/Org/roam/")
        org-directory "~/Org")
  )
;; Org ellipsis
(setq org-ellipsis " ▼")
;; (setq org-ellipsis " ⤵")

;; Org superstar symbols
;; (setq org-superstar-headline-bullets-list '("⁖" "●" "○" "▷" "▸" "◆" "◇" "◉" "◎"))
(setq org-superstar-headline-bullets-list '("▶" "▷"))

;; Better markdown
(setq org-hide-emphasis-markers t)
(setq org-indent-indentation-per-level 2)
;; Enabling inline images by default
(setq org-display-inline-images t)
(setq org-redisplay-inline-images t)
(setq org-startup-with-inline-images "inlineimages")
(after! org
  ;; Drawer use
  (setq org-clock-into-drawer t)
  (setq org-log-done t)
  (setq org-log-into-drawer t)
  (setq org-clock-persist t)

  (defun +my/org-hide-properties ()
    "Hide all org-mode headline property drawers in buffer. Could be slow if buffer has a lot of overlays."
    (interactive)
    (save-excursion
      (goto-char (point-min))
      (while (re-search-forward
              "^ *:properties:\n\\( *:.+?:.*\n\\)+ *:end:\n" nil t)
        (let ((ov_this (make-overlay (match-beginning 0) (match-end 0))))
          (overlay-put ov_this 'invisible t) ;<<<<<<<<<<<<<<<<< This is replaced
          (overlay-put ov_this 'hidden-prop-drawer t)))))
  )
(after! org
  ;; Org-attach
  (setq org-attach-id-dir ".attach/")

  ;; Link type to use
  (setq org-link-file-path-type 'relative)

  ;; Enabling image scaling for linked image
  (setq org-image-actual-width nil)
  )
(after! org
  ;; Fix some link issues
  (defun transform-square-brackets-to-round-ones(string-to-transform)
    "Transforms [ into ( and ] into ), other chars left unchanged."
    (concat
     (mapcar #'(lambda (c) (if (equal c ?\[) ?\( (if (equal c ?\]) ?\) c))) string-to-transform))
    )
  )
(after! org
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
                 "* TODO %a\n%U\n%:initial\n\n"
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

  ;; Additional Org modules
  (add-to-list 'org-modules 'org-checklist)
  (add-to-list 'org-modules 'org-habit)
  (add-to-list 'org-modules 'org-crypt)
  ;; (require 'org-habit)

  ;; Additional babel languages
  (add-to-list 'org-structure-template-alist '("p" . "src jupyter-python :session python_default :kernal python :async yes"))
  (add-to-list 'org-structure-template-alist '("i" . "src emacs-lisp"))
  (add-to-list 'org-structure-template-alist '("d" . "src dot :file ?.png :async no :cmdline -Kdot -Tpng"))
  (add-to-list 'org-structure-template-alist '("r" . "src rust :tangle ?.rs"))

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
                        (:startgrouptag)
                        ("ROAM")
                        (:grouptags)
                        ("SLIPBOXED" . ?0)
                        ("SOURCE" .?1)
                        ("FLEETING" . ?2)
                        ("CAPTURE" . ?3)
                        ("LITERATURE" . ?4)
                        ("REVIEWING" . ?5)
                        ("EVERGREEN" . ?6)
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
          ("SLIPBOXED" . (:foreground "LimeGreen" :weight bold))
          ("SOURCE" . (:foreground "Blue" :weight bold))
          ("FLEETING" . (:foreground "Blue" :weight bold))
          ("CAPTURE" . (:foreground "Blue" :weight bold))
          ("LITERATURE" . (:foreground "Blue" :weight bold))
          ("REVIEWING" . (:foreground "Blue" :weight bold))
          ("EVERGREEN" . (:foreground "Blue" :weight bold))
          ))

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
  )

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
;; Can be used to add an org file to agenda. Saves in Custom.el. To reset org-agenda remove the custom.el code for agenda files
(map! :localleader
      :map org-mode-map
      :prefix ("y" . "Edit agenda files")
      :desc "Org agenda add file" "a" #'org-agenda-file-to-front
      :desc "Org agends remove file" "r" #'org-remove-file
      )
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
;; Write all org buffers
(map! :localleader
      :map org-mode-map
      :prefix ("w" ."Org-buffers")
      :desc "Org write all org" "w" 'org-save-all-org-buffers
      :desc "Org revert all buffers" "i" 'org-revert-all-org-buffers
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
;
;; My personal calendar setting are in the Personal file. Nt part of this git project.
(setq cfw:org-overwrite-default-keybinding t)
(map! :leader
      :prefix "oa"
      :desc "Calendar view" "c" #'my-open-calendar
      )

;;; Org mode map to file extensions
(after! org
  (add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|org_done\\)$" . org-mode))
  )

;; Org-capture settings - For external capture
;; Modification for doom emacs configs to cater to my system config
;; Modification for doom emacs configs to cater to my system config
(setq +org-capture-frame-parameters '((name . "doom-capture") (height . 20) (width . 80) (left . 400) (top . 252) (user-position . t) (transient . t) nil (menu-bar-lines . 1)))
(defun +my/org-capture-open-frame (&optional initial-input key)
  "Opens the org-capture window in a floating frame that cleans itself up once
you're done. This can be called from an external shell script."
  (interactive)
  (when (and initial-input (string-empty-p initial-input))
    (setq initial-input nil))
  (when (and key (string-empty-p key))
    (setq key nil))
  (let* ((frame-title-format "")
         (frame (if (+org-capture-frame-p)
                    (selected-frame)
                  (make-frame +org-capture-frame-parameters))))
    (select-frame-set-input-focus frame)  ; fix MacOS not focusing new frames
    (with-selected-frame frame
      (require 'org-capture)
      (condition-case ex
          (letf! ((#'pop-to-buffer #'switch-to-buffer))
            (switch-to-buffer (doom-fallback-buffer))
            (let ((org-capture-initial initial-input)
                  org-capture-entry)
              (when (and key (not (string-empty-p key)))
                (setq org-capture-entry (org-capture-select-template key)))
              (funcall +org-capture-fn)))
        ('error
         (message "org-capture: %s" (error-message-string ex))
         (delete-frame frame)
         ))))
  (if (equal "org-capture" (frame-parameter nil 'name))
      (delete-frame))
  )
(defun +my/delete-capture-frame (&rest _)
  "Delete frame with its name frame-parameter set to \"org-capture\"."
  (if (equal "org-capture" (frame-parameter nil 'name))
      (delete-frame)))
(advice-add 'org-capture-finalize :after #'+my/delete-capture-frame)

;;; Org roam directory settings
(use-package! org-roam
  :init
  (map! :leader
        :prefix ("nr" . "roam")
        :desc "org-roam" "m" #'org-roam-buffer-toggle
        :desc "org-roam-node-insert" "i" #'org-roam-node-insert
        :desc "org-roam-node-find" "f" #'org-roam-node-find
        :desc "org-roam-ref-find" "r" #'org-roam-ref-find
        :desc "org-roam-show-graph" "g" #'org-roam-show-graph
        :desc "org-roam-capture" "c" #'org-roam-capture
        :desc "org-roam-dailies-capture-today" "j" #'org-roam-dailies-capture-today)
  (map! :localleader
        :map org-mode-map
        :prefix ("m" . "roam")
        :desc "org-roam" "m" #'org-roam-buffer-toggle
        :desc "org-roam-node-insert" "i" #'org-roam-node-insert
        :desc "org-roam-node-find" "f" #'org-roam-node-find
        :desc "org-roam-ref-find" "r" #'org-roam-ref-find
        :desc "org-roam-show-graph" "g" #'org-roam-show-graph
        :desc "org-roam-capture" "c" #'org-roam-capture
        :desc "org-roam-dailies-capture-today" "j" #'org-roam-dailies-capture-today
        :desc "toggle properties" "h" #'+my/org-hide-properties
        :desc "Org-roam alias add" "a" #'org-roam-alias-add
        :desc "Org-roam alias remove" "A" #'org-roam-alias-remove
        :desc "Org-roam tag add" "t" #'org-roam-tag-add
        :desc "Org-roam tag delete" "T" #'org-roam-tag-remove
        )
  (map! :localleader
        :map org-mode-map
        :prefix ("mo" . "backlink orientation")
        :desc "Org-roam buffer right" "r" #'+my/org-roam-display-right
        :desc "Org-roam buffer left" "l" #'+my/org-roam-display-left
        )
  (defun +my/org-roam-display-left ()
    (interactive)
    (setq display-buffer-alist
          '(;; Left side window
            (".org-roam.*"
             (display-buffer-in-side-window)
             (window-width . 0.40)
             (side . left)
             (slot . 0))))

    )
  (defun +my/org-roam-display-right ()
    (interactive)
    (setq display-buffer-alist
          '(;; Right side window
            (".org-roam.*"
             (display-buffer-in-side-window)
             (window-width . 0.40)
             (side . right)
             (slot . 0)))))
  (setq org-roam-db-gc-threshold most-positive-fixnum
        org-id-link-to-org-use-id t)
  (setq org-roam-v2-ack t)
  :config
  (setq org-roam-mode-sections
        (list #'org-roam-backlinks-insert-section
              #'org-roam-reflinks-insert-section
              #'org-roam-unlinked-references-insert-section
              ))
  (org-roam-setup)
  (setq org-roam-completion-everywhere t)
  (use-package! org-roam-protocol
    :after org-protocol)
  )
;; PDF view
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
   )
  )

(use-package! org-noter
  :after (:any org pdf-view)
  :config
  (setq
   ;; The WM can handle splits. Unable to get code blocks to execute when enabling this.
   org-noter-notes-window-location 'other-frame

   ;; Please stop opening frames
   org-noter-always-create-frame nil

   ;; I want to see the whole file
   org-noter-hide-other nil

   ;; Org noter default file path
   org-noter-notes-search-path (list (concat org-roam-directory "/Notes"))

   )
  )

;;; Ispell personal dictionary
;;; -----------------------------------------------------------------------------
(setq ispell-personal-dictionary "~/.doom.d/extras/personal/personal_dict.txt")
(after! spell-fu
  (setq spell-fu-idle-delay 0.5 ; default is 0.25
        ;;ispell-dictionary "british" ; needed for Macs in particular
        ispell-dictionary "en_GB"
        )
)

;;; Python programming
;;; -----------------------------------------------------------------------------
(when IS-WINDOWS
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

;; Company completion
(after! company-box
  (setq company-show-numbers t)
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
(use-package! org-ref
  :config
  (setq
   org-ref-completion-library 'org-ref-ivy-cite
   org-ref-get-pdf-filename-function 'org-ref-get-pdf-filename-helm-bibtex
   org-ref-default-bibliography (list (concat org-directory "/MyLibrary.bib"))
   org-ref-bibliography-notes (concat org-directory "/Notes/Notes.org")
   org-ref-notes-directory (concat org-directory "/Notes/")
   org-ref-notes-function 'orb-edit-notes
   )
  )
(after! org-ref
  (setq
   bibtex-completion-notes-path (concat org-roam-directory "/Notes/")
   bibtex-completion-bibliography (concat org-directory "/MyLibrary.bib")
   bibtex-completion-pdf-field "file"
   bibtex-completion-notes-template-multiple-files
   (concat
    "${title}\n"
    "#+Time-stamp: <>\n"
    "#+AUTHOR: Alen Alex Ninan\n"
    "#+PROPERTY: ANKI_DECK Default\n"
    "#+STARTUP: content\n"
    "#+STARTUP: indent\n"
    "#+STARTUP: align\n"
    "#+STARTUP: inlineimages\n"
    "#+OPTIONS: num:0 toc:nil\n"
    "#+STARTUP: hidebloacks\n"
    "#+STARTUP: hidestars\n"
    "#+STARTUP: latexpreview\n"
    "#+EXPORT_FILE_NAME: Notes\n\n"
    "- keywords :: ${keywords}\n\n"
    "* ${title} :LITERATURE:REVIEWING:${=type=}:\n"
    ":PROPERTIES:\n"
    ":ID: %<%Y%m%dT%H%M%S>\n"
    ":ROAM_ALIASES: cite:${=key=}\n"
    ":NOTER_DOCUMENT: %(orb-process-file-field \"${=key=}\")\n"
    ":AUTHOR: ${author-or-editor}\n"
    ":TYPE: ${=type=}\n"
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
(after! org-ref
  (map! :localleader
        :map org-mode-map
        :prefix ("l")
        :desc "helm-bibtex" "r" #'helm-bibtex
        )
  (use-package! ivy-bibtex
    :config
    (map! :leader
          :prefix ("ox" . "Bibtex")
          :desc "ivy-bibtex" "i" #'ivy-bibtex
          :desc "helm-bibtex" "h" #'helm-bibtex
          )
    )
  )

(use-package! org-roam-bibtex
  :after org-roam
  :config
  (setq orb-preformat-keywords '("citekey" "title" "url" "author-or-editor" "keywords" "file" "year" "doi" "entry-type" "date"))
  (setq orb-process-file-keyword t)
  (setq orb-file-field-extensions '("pdf"))
  (setq orb-note-actions-interface 'ivy)
  (setq orb-insert-interface 'ivy-bibtex)
  (org-roam-bibtex-mode)
  (setq org-roam-capture-templates
        ;; Default capture template
        '(("d" "default" plain
           "%?"
           :if-new (file+head "${slug}.org"
                              "#+title: ${title}\n#+filetags: FLEETING\n")
           :immediate-finish t
           :unnarrowed t)
          ("b" "bibliography reference" plain
           (file "~/.doom.d/org_capture_templates/biblio-template.org") ; <-- template store in a separate file
           :if-new
           (file+head "Notes/${citekey}.org" "#+title: ${title}\n")
           :unnarrowed t
           :jump-to-captured t)
          )
        )
  (setq org-roam-capture-ref-templates
        '(("r" "ref" plain
           "%?"
           :if-new (file+head "${slug}.org"
                              "#+title: ${title}\n#+filetags: SOURCE CAPTURE WEBSITE\n")
           :unnarrowed t)))
  )

;;; Time-stamp hook
;; ------------------------------------------------------------------------------
(add-hook! 'before-save-hook #'time-stamp)

;;; Doom emacs start maximised
;;; -----------------------------------------------------------------------------
(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(use-package! try
  :config
  :init
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
(defhydra hydra-window (:color blue :hint nil)
  "
                                                                       ╭─────────┐
     Move to      Size    Scroll        Split                    Do    │ Windows │
  ╭────────────────────────────────────────────────────────────────────┴─────────╯
        ^_k_^           ^_K_^       ^_p_^    ╭─┬─┐^ ^        ╭─┬─┐^ ^         ↺ [_u_] undo layout
        ^^↑^^           ^^↑^^       ^^↑^^    │ │ │_v_ertical ├─┼─┤_b_alance   ↻ [_r_] restore layout
    _h_ ←   → _l_   _H_ ←   → _L_   ^^ ^^    ╰─┴─╯^ ^        ╰─┴─╯^ ^         ✗ [_d_] close window
        ^^↓^^           ^^↓^^       ^^↓^^    ╭───┐^ ^        ╭───┐^ ^         ⇋ [_w_] cycle window
        ^_j_^           ^_J_^       ^_n_^    ├───┤_s_tack    │   │_z_oom      ↔ [_S_] swap windows
        ^^ ^^           ^^ ^^       ^^ ^^    ╰───╯^ ^        ╰───╯^ ^
  --------------------------------------------------------------------------------
            "
  ("<tab>" hydra-master/body "back")
  ("<ESC>" nil "quit")
  ("n" scroll-other-window :color red)
  ("p" scroll-other-window-down :color red)
  ("b" balance-windows)
  ("d" delete-window)
  ("H" shrink-window-horizontally :color red)
  ("h" windmove-left :color red)
  ("J" shrink-window :color red)
  ("j" windmove-down :color red)
  ("K" enlarge-window :color red)
  ("k" windmove-up :color red)
  ("L" enlarge-window-horizontally :color red)
  ("l" windmove-right :color red)
  ("r" winner-redo :color red)
  ("s" split-window-vertically :color red)
  ("u" winner-undo :color red)
  ("v" split-window-horizontally :color red)
  ("w" other-window)
  ("z" delete-other-windows)
  ("S" ace-swap-window))
(after! hydra
  (map! :leader
        :prefix ("w")
        :desc "Hydra window" "z" #'hydra-window/body
        )
  )

(after! helm
  (define-key helm-map (kbd "<backtab") #'helm-previous-line)
  )
(use-package! helm-ag
  :config
  (map! :leader
        :prefix ("sA" . "Silver searcher")
        :desc "AG" "a" #'helm-ag
        :desc "AG do" "d" #'helm-do-ag
        :desc "AG current file" "f" #'helm-ag-this-file
        :desc "AG project" "r" #'helm-ag-project-root
        :desc "AG buffers" "b" #'helm-ag-buffers
        )
  (map! :leader
        :prefix ("s")
        :desc "Silver search directory" "a" #'helm-ag
        )
  :init
  )
(after! counsel
  (map! :leader
        :prefix ("s")
        :desc "AG directory" "a" #'counsel-ag
        )
  )


(defmacro bind (&rest commands)
  "Convenience macro which creates a lambda interactive command."
  `(lambda (arg)
     (interactive "P")
     ,@commands))

(global-set-key (kbd "C-x C-c") (bind (message "Thou shall not quit!")))
;; (after! evil
;;   (defadvice evil-quit (around dotemacs activate)
;;     (message "Thou shall not quit!"))
;;   (defadvice evil-quit-all (around dotemacs activate)
;;     (message "Thou shall not quit!")))
;; (load! ~/.doom.d/lisp/touchtyping.el)

;;; Dendroam
;;; -------------------------------------------------------------------------------------
;; (use-package! dendroam
;;   :after org-roam)
