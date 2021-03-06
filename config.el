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

;; Variable pitch for text edits
;; (add-hook 'text-mode-hook
;;            (lambda ()
;;             (variable-pitch-mode 1)))

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
      ;; ivy-posframe-font (font-spec :family "JetBrainsMono" :size 15)
      )

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
(setq truncate-string-ellipsis "???")
(map! :leader
      (:prefix ("t" . "toggle")
       :desc "Toggle line highlight in frame" "h" #'hl-line-mode
       :desc "Toggle line highlight globally" "H" #'global-hl-line-mode
       :desc "Toggle truncate lines" "t" #'toggle-truncate-lines))
;; Better image for doom dashboard
(setq fancy-splash-image "~/.doom.d/icon.png")

;; Doom themes
;; ------------------------------------------------------------------------------

;; (use-package! modus-themes
;;   :init
;;   ;; Add all your customizations prior to loading the themes
;;   (setq modus-themes-italic-constructs t
;;         modus-themes-completions 'opinionated
;;         ;; modus-themes-variable-pitch-headings t
;;         modus-themes-scale-headings t
;;         ;; modus-themes-variable-pitch-ui t
;;         modus-themes-org-agenda
;;         '((header-block . (variable-pitch scale-title))
;;           (header-date . (grayscale bold-all)))
;;         modus-themes-org-blocks
;;         '(grayscale)
;;         modus-themes-mode-line
;;         '(borderless)
;;         modus-themes-region '(bg-only no-extend))

;;   ;; Load the theme files before enabling a theme
;;   (modus-themes-load-themes)
;;   :config
;;   (modus-themes-load-operandi)
;;   :bind ("<f5>" . modus-themes-toggle))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-xcode)
;; (setq doom-theme 'modus-vivendi)
;; (setq doom-theme 'modus-operandi)
;; (setq doom-theme 'doom-Iosvkem)
;; (setq doom-theme 'doom-plain-dark)
;; (setq doom-theme 'doom-spacegrey)
;; (setq doom-theme 'doom-solarized-dark-high-contrast)
;; (setq doom-theme 'doom-monokai-octagon)
;; (setq doom-theme 'doom-miramare)
;; (setq doom-theme 'doom-gruvbox-light)
;; (setq doom-theme 'doom-wilmersdorf)
(setq doom-theme 'doom-monokai-ristretto)
;; (setq doom-theme 'doom-nord-light)
;; (setq doom-theme 'doom-homage-white)
;; (setq doom-theme 'doom-city-lights)
;; (setq doom-theme 'doom-homage-black)

;; Better doom theme for black picture borders
;; (setq doom-theme 'doom-ephemeral)

;; Better theme for orgmode and text edits
;; (setq doom-theme 'poet)

;; Windows Path configuration
;; ------------------------------------------------------------------------------
;; (when IS-WINDOWS
;;   (let (
;;         (mypaths
;;          '(;; Emacs
;;            "c:/Program Files/emax64-27.1/bin"

;;            ;; Git
;;            "C:/Program Files/Git/bin"
;;            ;; "C:/Program Files/Git/cmd"
;;            ;; "C:/Program Files/Git"
;;            ;; "C:/Program Files/Git/mingw64/bin"
;;            ;; "C:/Program Files/Git/usr/bin"

;;            ;; Mingwin tools
;;            ;; "c:/Users/alenalexninan/Home/.doom.d/extras/mingw64/bin"
;;            "C:/msys64/mingw64/bin"
;;            "C:/msys64"
;;            "C:/msys64/usr/bin"


;;            ;; Java runtime
;;            "C:/Program Files (x86)/Java/jre1.8.0_251/bin"

;;            ;; Anaconda path
;;            "c:/Users/alenalexninan/Home/miniconda3"
;;            "c:/Users/alenalexninan/Home/miniconda3/condabin"

;;            ;; Searchtools
;;            "C:/Users/alenalexninan/Home/.doom.d/extras/fd"
;;            "c:/Users/alenalexninan/Home/.doom.d/extras/ripgrep"
;;            "C:/Users/alenalexninan/Home/.doom.d/extras/ag"
;;            "c:/Users/alenalexninan/Home/.doom.d/extras/languagetool"

;;            ;; Rust
;;            "C:/Users/alenalexninan/.cargo/bin"
;;            "C:/Users/alenalexninan/.rustup/toolchains/stable-x86_64-pc-windows-msvc/bin"

;;            ;; Graphviz
;;            "c:/Users/alenalexninan/Home/.doom.d/extras/graphviz/bin"

;;            ;; Firefox
;;            "C:/Program Files/Mozilla Firefox"
;;            "C:/Program Files (x86)/Mozilla Firefox/"

;;            ;; Miketex
;;            "c:/Users/alenalexninan/AppData/Local/Programs/MiKTeX 2.9/miktex/bin/x64/"

;;            ;; Music
;;            "C:/Program Files (x86)/LilyPond/usr/bin"
;;            ) )
;;         )
;;     (setenv "PATH" (mapconcat 'identity mypaths ";") )
;;     (setq exec-path (append mypaths (list "." exec-directory)) )
;;     )
;;   )

;; Page breaks display in emacs
(use-package! page-break-lines
  :commands page-break-lines-mode
  :init
  (autoload 'turn-on-page-break-lines-mode "page-break-lines")
  :config
  (setq page-break-lines-max-width fill-column)
  (map! :prefix "g"
        :desc "Prev page break" :nv "[" #'backward-page
        :desc "Next page break" :nv "]" #'forward-page))
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
   '(("" . "\\`+?evil[-:]?\\(?:a-\\)?\\(.*\\)") . (nil . "???\\1"))
   '(("\\`g s" . "\\`evilem--?motion-\\(.*\\)") . (nil . "???\\1"))
   ))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(when IS-MAC
  (setq org-roam-directory (file-truename "~/roam/")
        org-directory "~/Org")
  )
(when IS-LINUX
  (setq org-roam-directory (file-truename "~/roam/")
        org-directory "~/Org")
  )
(when IS-WINDOWS
  (setq org-roam-directory (file-truename "~/roam/")
        org-directory "~/Org")
  )
;; Org ellipsis
;; (setq org-ellipsis " ???")
(setq org-ellipsis " ???")

;; Org superstar symbols
;; (setq org-superstar-headline-bullets-list '("???" "???" "???" "???" "???" "???" "???" "???" "???"))
(setq org-superstar-headline-bullets-list '("???" "???"))

;; Better markdown
(setq org-hide-emphasis-markers t)
;; (setq org-indent-indentation-per-level 2)

;; Enabling inline images by default
;; Other settings for Inline Images.
(after! org
  (setq org-display-inline-images t)
  (setq org-redisplay-inline-images t)
  (setq org-startup-with-inline-images "inlineimages")
  (setq +org-startup-with-animated-gifs "at-point")

  ;; Add option to resize image in Org mode
  (setq org-image-actual-width nil)
  ;; Custom function to set backgroud colour of the inline images.
  (load! "./lisp/my-inline-image-background.el")

  ;; Using above defined "org-inline-image-background". Use code Below to set the image colour.
  (setq my-inline-image-background "white")
  )

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
  (setq org-attach-dir-relative t)
  ;; Link type to use
  (setq org-link-file-path-type 'relative)
  ;; Enabling image scaling for linked image
  (setq org-image-actual-width nil)
  )

(after! org
  (setq org-capture-templates
        '(("t" "Personal todo" entry
           (file+headline +org-capture-todo-file "Inbox")
           "* TODO %?\n%i\n%a" :prepend t)
          ("n" "Personal notes" entry
           (file+headline +org-capture-notes-file "Inbox")
           "* %u %?\n%i\n%a" :prepend t)
          ("j" "Journal" entry
           (file+olp+datetree +org-capture-journal-file)
           "* %U %?\n%i\n%a" :prepend t)

          ;; Will use {project-root}/{todo,notes,changelog}.org, unless a
          ;; {todo,notes,changelog}.org file is found in a parent directory.
          ;; Uses the basename from `+org-capture-todo-file',
          ;; `+org-capture-changelog-file' and `+org-capture-notes-file'.
          ("o" "Templates for projects")
          ("ot" "Project-local todo" entry  ; {project-root}/todo.org
           (file+headline +org-capture-project-todo-file "Inbox")
           "* TODO %?\n%i\n%a" :prepend t)
          ("on" "Project-local notes" entry  ; {project-root}/notes.org
           (file+headline +org-capture-project-notes-file "Inbox")
           "* %U %?\n%i\n%a" :prepend t)
          ("oc" "Project-local changelog" entry  ; {project-root}/changelog.org
           (file+headline +org-capture-project-changelog-file "Unreleased")
           "* %U %?\n%i\n%a" :prepend t)

          ;; Will use {org-directory}/{+org-capture-projects-file} and store
          ;; these under {ProjectName}/{Tasks,Notes,Changelog} headings. They
          ;; support `:parents' to specify what headings to put them under, e.g.
          ;; :parents ("Projects")
          ("p" "Centralized templates for projects")
          ("pt" "Project todo" entry
           (function +org-capture-central-project-todo-file)
           "* TODO %?\n %i\n %a"
           :heading "Inbox"
           :prepend nil)
          ("pn" "Project notes" entry
           (function +org-capture-central-project-notes-file)
           "* %U %?\n %i\n %a"
           :heading "Notes"
           :prepend t)
          ("pc" "Project changelog" entry
           (function +org-capture-central-project-changelog-file)
           "* %U %?\n %i\n %a"
           :heading "Changelog"
           :prepend t)))
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
  (add-to-list 'org-structure-template-alist '("p" . "src jupyter-python :session python_default :kernal python :async yes\n"))
  (add-to-list 'org-structure-template-alist '("i" . "src emacs-lisp"))
  (add-to-list 'org-structure-template-alist '("d" . "src dot :file ?.png :async no :cmdline -Kdot -Tpng"))
  (add-to-list 'org-structure-template-alist '("r" . "src rust :tangle ?.rs"))
  (add-to-list 'org-structure-template-alist '("f" . "src fortran :tangle ./Fortran/?.f95\n"))
  ;; Todo Keywords to use
  (setq org-todo-keywords
        '((sequence
           "TODO(t)"   ; A task that needs doing
           "NOW(n)"   ; Task is in progress
           "WAIT(w)"   ; Task is being held up or paused
           "DELEGATE(d)"   ; Task delegated
           "PROJECT(P)"   ; Project
           "|"
           "DONE(d)"   ; Task was completed
           "KILL(k)"   ; Task was cancelled, aborted or is no longer applicable
           )
          (sequence
           "|"
           "OKAY(o)"
           "YES(y)"
           "NO(n)")
          )
        org-todo-keyword-faces
        '(("TODO"  . +org-todo-active)
          ("NOW"  . +org-todo-active)
          ("WAIT"  . +org-todo-onhold)
          ("PROJECT" . +org-todo-project)
          ("KILL"   . +org-todo-cancel)
          ("NO" . +org-todo-onhold)
          ))
  ;; Tags for org mode
  (setq org-tag-alist '((:startgrouptag)
                        (:grouptags)
                        ("enLO" . ?l)
                        ("enMD" . ?m)
                        ("enHI" . ?i)
                        (:endgrouptag)
                        (:startgrouptag)
                        (:grouptags)
                        ("BIG" . ?b)
                        ("DO" . ?o)
                        ("DECIDE" . ?e)
                        ("DELEGATE" . ?g)
                        ("DELETE" . ?d)
                        (:endgrouptag)
                        (:startgrouptag)
                        (:grouptags)
                        ("PLANNED" . ?0)
                        ("STRUCTURE" . ?1)
                        ("SOURCE" . ?2)
                        ("FLEETING" . ?3)
                        ("LITERATURE" . ?4)
                        ("REVIEWING" . ?5)
                        ("EVERGREEN" . ?6)
                        ("ZETTEL" . ?7)
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
          ("ZETTEL" . (:foreground "LimeGreen" :weight bold))
          ("STRUCTURE" . (:foreground "LimeGreen" :weight bold))
          ("SOURCE" . (:foreground "Blue" :weight bold))
          ("FLEETING" . (:foreground "Blue" :weight bold))
          ("LITERATURE" . (:foreground "Blue" :weight bold))
          ("REVIEWING" . (:foreground "Blue" :weight bold))
          ("EVERGREEN" . (:foreground "Blue" :weight bold))
          ("PLANNED" . (:foreground "OrangeRed" :weight bold))
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
(when IS-MAC
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
   org-noter-notes-search-path (list (concat org-roam-directory "/notes"))

   )
  )

(use-package! nov
  :hook (nov-mode . variable-pitch-mode)
  :mode ("\\.\\(epub\\|mobi\\)\\'" . nov-mode))

;;; Ispell personal dictionary
;;; -----------------------------------------------------------------------------
(after! flyspell
  (setq ispell-personal-dictionary (expand-file-name "~/.doom.d/extras/personal/personal_dict.txt"))
  (setq ispell-dictionary "en_GB")
  )
(after! spell-fu
  (setq spell-fu-idle-delay 0.5 ; default is 0.25
        ispell-personal-dictionary (expand-file-name "~/.doom.d/extras/personal/personal_dict.txt")
        ispell-dictionary "en_GB" ; needed for Macs in particular
        )
  )

;;; Python programming
;;; -----------------------------------------------------------------------------
(when IS-MAC
(after! conda
  ;; (setq conda-anaconda-home "C:/Users/alenalexninan/Home/miniconda3")
  (setq conda-anaconda-home (expand-file-name "~/opt/miniconda3"))
  (setq conda-env-home-directory (expand-file-name "~/opt/miniconda3"))
  (conda-env-initialize-interactive-shells)
  ;; if you want eshell support, include:
  (conda-env-initialize-eshell)
  ;; if you want auto-activation (see below for details), include:
  (conda-env-autoactivate-mode t)
  ;; To activate conda on start
  (conda-env-activate "myenv")
  ;; (conda-env-activate "base")
  )
)
(unless IS-MAC
(after! conda
  ;; (setq conda-anaconda-home "C:/Users/alenalexninan/Home/miniconda3")
  (setq conda-anaconda-home (expand-file-name "~/miniconda3"))
  (setq conda-env-home-directory (expand-file-name "~/miniconda3"))
  (conda-env-initialize-interactive-shells)
  ;; if you want eshell support, include:
  (conda-env-initialize-eshell)
  ;; if you want auto-activation (see below for details), include:
  (conda-env-autoactivate-mode t)
  ;; To activate conda on start
  (conda-env-activate "myenv")
  ;; (conda-env-activate "base")
  )
  )
;; Company completion
(after! company-box
  (setq company-show-numbers t)
  )

;; (use-package! company-posframe
;;   :hook (company-mode . company-posframe-mode))

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

;; Bibtex and Org-ref config
;; -------------------------------------------------------------------------------
(after! org
  (when IS-WINDOWS
    (defvar my/bibs (file-truename (concat org-directory "/MyLibrary-windows.bib"))))
  (when IS-MAC
    (defvar my/bibs (file-truename (concat org-directory "/MyLibrary-mac.bib"))))
  (when IS-LINUX
    (defvar my/bibs (file-truename (concat org-directory "/MyLibrary-linux.bib"))))

  ;; Bibtex completion configuration
  ;;-----------------------------------------------------------------------------
  (use-package! bibtex-completion
    :defer t
    :config
    (map! :map org-mode-map :localleader :desc "Insert citation" :n "]" #'org-ref-insert-link)
    (setq bibtex-completion-notes-path (file-truename (concat org-roam-directory "/notes"))
          bibtex-completion-bibliography my/bibs
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
	  bibtex-completion-library-path (file-truename (concat org-roam-directory "/notes"))
	  bibtex-completion-additional-search-fields '(keywords)
          bibtex-completion-pdf-field "file"
	  bibtex-completion-display-formats
	  '((article       . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${journal:40}")
	    (inbook        . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} Chapter ${chapter:32}")
	    (incollection  . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
	    (inproceedings . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
	    (t             . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*}"))
          )
    ;; This is specific for a Mac I think
    (when IS-MAC
      (setq bibtex-completion-pdf-open-function (lambda (fpath)
                                                  (call-process "open" nil 0 nil fpath))
            )
      )
    )
  )

(use-package! ivy-bibtex
  :when (featurep! :completion ivy)
  :defer t
  :config
  ;; (ivy-mode +1)
  (add-to-list 'ivy-re-builders-alist '(ivy-bibtex . ivy--regex-plus))
  :init
  )
(use-package! citeproc)

(use-package! org-ref
  )


  ;; (setq org-cite-csl-styles-dir "~/Zotero/styles")

  ;; Set bibliography paths so they are the same.
  ;; (use-package! oc
  ;;   :config
  ;;   (require 'oc-csl))
  ;; (use-package! org-ref-cite
  ;;   :config
  ;;   ;; I like green links
  ;;   (set-face-attribute 'org-cite nil :foreground "DarkSeaGreen4")
  ;;   (set-face-attribute 'org-cite-key nil :foreground "forest green")
  ;;   (setq
  ;;    org-cite-global-bibliography bibtex-completion-bibliography
  ;;    ;; https://github.com/citation-style-language/styles
  ;;    ;; or https://www.zotero.org/styles
  ;;    org-cite-csl-styles-dir "~/Zotero/styles"
  ;;    org-cite-insert-processor 'org-ref-cite
  ;;    org-cite-follow-processor 'org-ref-cite
  ;;    org-cite-activate-processor 'org-ref-cite
  ;;    ;; Need to install the style belwo in Zotero
  ;;    org-cite-export-processors '((html csl "elsevier-with-titles-alphabetical.csl")
  ;;       		          (latex org-ref-cite)
  ;;       		          (t basic))))
  ;; )
;; Org-roam
;; ------------------------------------------------------------------------------
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
  (map! (:map org-mode-map
         :localleader
         :prefix ("m" . "org-roam")
         "D" #'org-roam-demote-entire-buffer
         (:prefix ("b" . "database")
          :desc "Datbase clear" "C" #'org-roam-db-clear-all
          :desc "Database clear file" "F" #'org-roam-db-clear-file
          :desc "Database sync" "s" #'org-roam-db-sync
          :desc "Database update file" "f" #'org-roam-db-update-file
          )
         "f" #'org-roam-node-find
         "F" #'org-roam-ref-find
         "g" #'org-roam-graph
         "i" #'org-roam-node-insert
         "I" #'org-id-get-create
         "m" #'org-roam-buffer-toggle
         "M" #'org-roam-buffer-display-dedicated
         "c" #'org-roam-capture
         "r" #'org-roam-refile
         "R" #'org-roam-link-replace-all
         (:prefix ("d" . "by date")
          :desc "Goto previous note" "b" #'org-roam-dailies-goto-previous-note
          :desc "Goto date"          "d" #'org-roam-dailies-goto-date
          :desc "Capture date"       "D" #'org-roam-dailies-capture-date
          :desc "Goto next note"     "f" #'org-roam-dailies-goto-next-note
          :desc "Goto tomorrow"      "m" #'org-roam-dailies-goto-tomorrow
          :desc "Capture tomorrow"   "M" #'org-roam-dailies-capture-tomorrow
          :desc "Capture today"      "n" #'org-roam-dailies-capture-today
          :desc "Goto today"         "t" #'org-roam-dailies-goto-today
          :desc "Capture today"      "T" #'org-roam-dailies-capture-today
          :desc "Goto yesterday"     "y" #'org-roam-dailies-goto-yesterday
          :desc "Capture yesterday"  "Y" #'org-roam-dailies-capture-yesterday
          :desc "Find directory"     "-" #'org-roam-dailies-find-directory)
         (:prefix ("o" . "node properties")
          "a" #'org-roam-alias-add
          "A" #'org-roam-alias-remove
          "t" #'org-roam-tag-add
          "T" #'org-roam-tag-remove
          "r" #'org-roam-ref-add
          "R" #'org-roam-ref-remove)
         ))
  (setq org-roam-db-gc-threshold most-positive-fixnum
        org-id-link-to-org-use-id t)
  (setq org-roam-v2-ack t)
  :config
  (setq org-roam-dailies-directory "daily/")
  ;; (setq org-roam-node-display-template "${title:*} ${tags:50}")
  (setq org-roam-node-display-template
        "${doom-hierarchy:*} ${todo:8} ${doom-tags:45}")
  (setq org-roam-db-location
        (concat doom-etc-dir "org-roam.db"))
  (setq org-roam-mode-sections
        (list #'org-roam-backlinks-insert-section
              #'org-roam-reflinks-insert-section
              #'org-roam-unlinked-references-insert-section
              ))
  (org-roam-setup)
  (setq org-roam-completion-everywhere t)
  (use-package! org-roam-protocol
    :after org-protocol)

  (set-popup-rules!
    `((,(regexp-quote org-roam-buffer) ; persistent org-roam buffer
       :side right :width .33 :height .5 :ttl nil :modeline nil :quit nil :slot 1)
      ("^\\*org-roam: " ; node dedicated org-roam buffer
       :side right :width .33 :height .5 :ttl nil :modeline nil :quit nil :slot 2)))

  (add-hook 'org-roam-mode-hook #'turn-on-visual-line-mode)
  :config
  (setq org-roam-capture-templates
        ;; Default capture template
        '(("d" "default" plain
           (file "~/.doom.d/org_capture_templates/roam_default-template.org")
           :target (file+head "${slug}.org"
                              "#+title: ${title}\n")
           :immediate-finish t
           :unnarrowed t)
          ("x" "bibliography reference" plain
           (file "~/.doom.d/org_capture_templates/biblio-template.org") ; <-- template store in a separate file
           :target (file+head "notes/${citekey}.org" "#+title: ${title}\n")
           :unnarrowed t
           :jump-to-captured t)
          ("e" "Engineering" plain
           (file "~/.doom.d/org_capture_templates/roam_default-template.org")
           :target (file+head "engineering/${slug}.org"
                              "#+title: ${title}\n")
           :immediate-finish t
           :unnarrowed t)
          ("c" "Computer" plain
           (file "~/.doom.d/org_capture_templates/roam_default-template.org")
           :target (file+head "computer/${slug}.org"
                              "#+title: ${title}\n")
           :immediate-finish t
           :unnarrowed t)
          ("m" "maths" plain
           (file "~/.doom.d/org_capture_templates/roam_default-template.org")
           :target (file+head "maths/${slug}.org"
                              "#+title: ${title}\n")
           :immediate-finish t
           :unnarrowed t)
          ("h" "health" plain
           (file "~/.doom.d/org_capture_templates/roam_default-template.org")
           :target (file+head "medical/${slug}.org"
                              "#+title: ${title}\n")
           :immediate-finish t
           :unnarrowed t)
          ("p" "Personal Development" plain
           (file "~/.doom.d/org_capture_templates/roam_default-template.org")
           :target (file+head "PD/${slug}.org"
                              "#+title: ${title}\n")
           :immediate-finish t
           :unnarrowed t)
          ("l" "Language" plain
           (file "~/.doom.d/org_capture_templates/roam_default-template.org")
           :target (file+head "language/${slug}.org"
                              "#+title: ${title}\n")
           :immediate-finish t
           :unnarrowed t)
          ("b" "Business" plain
           (file "~/.doom.d/org_capture_templates/roam_default-template.org")
           :target (file+head "business/${slug}.org"
                              "#+title: ${title}\n")
           :immediate-finish t
           :unnarrowed t)
          )
        )
  (setq org-roam-capture-ref-templates
        '(("r" "ref" plain
           (file "~/.doom.d/org_capture_templates/roam_ref_template.org")
           :target (file+head "capture/${slug}.org"
                              "#+title: ${title}\n")
           :immediate-finish t
           :unnarrowed t)))
  (setq org-roam-dailies-capture-templates
        '(("d" "default" entry
           "* TODO Gratitude\n %?\n* TODO Daily Review"
           :target (file+head "%<%Y-%m-%d>.org"
                              "#+title: %<%Y-%m-%d>\n"))))
  )
;;; Custom node accessors
;;;###autoload
  (cl-defmethod org-roam-node-doom-filetitle ((node org-roam-node))
    "Return the value of \"#+title:\" (if any) from file that NODE resides in.
If there's no file-level title in the file, return empty string."
    (or (if (= (org-roam-node-level node) 0)
            (org-roam-node-title node)
          (org-roam-get-keyword "TITLE" (org-roam-node-file node)))
        ""))

;;;###autoload
  (cl-defmethod org-roam-node-doom-hierarchy ((node org-roam-node))
    "Return hierarchy for NODE, constructed of its file title, OLP and direct title.
If some elements are missing, they will be stripped out."
    (let ((title     (org-roam-node-title node))
          (olp       (org-roam-node-olp   node))
          (level     (org-roam-node-level node))
          (filetitle (org-roam-node-doom-filetitle node))
          (separator (propertize " > " 'face 'shadow)))
      (cl-case level
        ;; node is a top-level file
        (0 filetitle)
        ;; node is a level 1 heading
        (1 (concat (propertize filetitle 'face '(shadow italic))
                   separator title))
        ;; node is a heading with an arbitrary outline path
        (t (concat (propertize filetitle 'face '(shadow italic))
                   separator (propertize (string-join olp " > ") 'face '(shadow italic))
                   separator title)))))

;;;###autoload
  (cl-defmethod org-roam-node-doom-subdirs ((node org-roam-node))
    "Return subdirectories of `org-roam-directory' in which NODE resides in.
If there's none, return an empty string."
    (if-let ((dirs (thread-first node
                     (org-roam-node-file)
                     (file-relative-name org-roam-directory)
                     (file-name-directory))))
        dirs
      ""))

;;;###autoload
  (cl-defmethod org-roam-node-doom-tags ((node org-roam-node))
    "Return tags formatted in the same way how they appear in org files.
Treat subdirectories as tags too. If there's no elements to build
the tags of, return an empty string."
    (let ((tags (org-roam-node-tags node))
          (subdirs (org-roam-node-doom-subdirs node)))
      (when tags
        (setq tags (propertize (concat (mapconcat (lambda (s) (concat ":" s)) tags nil) ":")
                               'face 'shadow)))
      (unless (string-empty-p subdirs)
        (setq subdirs (propertize (concat ":" (replace-regexp-in-string "/\\|\\\\" ":" subdirs))
                                  'face '(shadow italic))))
      (replace-regexp-in-string ":+" (propertize ":" 'face 'shadow) (concat subdirs tags))))

  ;; Custom org-agenda based on "PLANNED" tags in org-roam
  ;; The buffer you put this code in must have lexical-binding set to t!
  ;; See the final configuration at the end for more details.
  (defun my/org-roam-filter-by-tag (tag-name)
    (lambda (node)
      (member tag-name (org-roam-node-tags node))))
  (defun my/org-roam-list-notes-by-tag (tag-name)
    (delete-duplicates (mapcar #'org-roam-node-file
            (seq-filter
             (my/org-roam-filter-by-tag tag-name)
             (org-roam-node-list))) :test #'string-equal))
  (defun my/org-roam-refresh-agenda-list ()
    (interactive)
    (setq org-agenda-files (append (directory-files-recursively org-directory "\.org$") (my/org-roam-list-notes-by-tag "PLANNED"))))
  ;; Build the agenda list the firt time for the session
  (add-hook 'org-agenda-mode-hook 'my/org-roam-refresh-agenda-list)

  ;; Copy done to dailies for the day
  (defun my/org-roam-copy-todo-to-today ()
    (interactive)
    (let ((org-refile-keep t) ;; Set this to nil to delete the original!
          (org-roam-dailies-capture-templates
           '(("t" "tasks" entry "%?"
              :if-new (file+head+olp "%<%Y-%m-%d>.org" "#+title: %<%Y-%m-%d>\n" ("Tasks")))))
          (org-after-refile-insert-hook #'save-buffer)
          today-file
          pos)
      (save-window-excursion
        (org-roam-dailies--capture (current-time) t)
        (setq today-file (buffer-file-name))
        (setq pos (point)))
      ;; Only refile if the target file is different than the current file
      (unless (equal (file-truename today-file)
                     (file-truename (buffer-file-name)))
        (org-refile nil nil (list "Tasks" today-file nil pos)))))
  (add-to-list 'org-after-todo-state-change-hook
               (lambda ()
                 (when (equal org-state "DONE")
                   (my/org-roam-copy-todo-to-today))))

;; Org-roam-ui
;; ------------------------------------------------------------------------------
(use-package! org-roam-ui
  :after org-roam
  ;; or :after org
  ;;    :hook
  ;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
  ;;         a hookable mode anymore, you're advised to pick something yourself
  ;;         if you don't care about startup time, use
  ;;  :hook (after-init . org-roam-ui-mode)
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t)
  (map! (:map org-mode-map
         :localleader
         :prefix ("mu" . "UI")
         "o" #'org-roam-ui-mode
         "f" #'org-roam-ui-follow-mode
         ))
  )

;; Org-roam-bibtex
;; ------------------------------------------------------------------------------
;; Need to migrate to :target once org-roam-bibtex support it
(use-package! org-roam-bibtex
  :after (:all org-roam org-ref)
  :config
  (setq orb-preformat-keywords '("citekey" "title" "url" "author-or-editor" "keywords" "file" "year" "doi" "entry-type" "date"))
  (setq orb-process-file-keyword t
        orb-file-field-extensions '("pdf")
        orb-note-actions-interface 'ivy
        orb-insert-interface 'ivy-bibtex)
  (org-roam-bibtex-mode)
  )

;;; Org-transclusion
;;; ------------------------------------------------------------------------------------------


;;; Time-stamp hook
;; ------------------------------------------------------------------------------
(add-hook! 'before-save-hook #'time-stamp)

;;; Doom emacs start maximised
;;; -----------------------------------------------------------------------------
;; (add-to-list 'initial-frame-alist '(fullscreen . maximized))
;; Start all frames maximized in windows OS
;; (when IS-WINDOWS
;;   (add-to-list 'default-frame-alist '(fullscreen . maximized))
;;   )

;;; Hydras
;;; -----------------------------------------------------------------------------
;; I copied this from blings emacss config
(defhydra /hydras/paste (:hint nil)
  "
   paste:  _C-j_ ??? cycle next          _p_ ??? paste before       pos: %(length kill-ring-yank-pointer)
           _C-k_ ??? cycle previous      _P_ ??? paste after        len: %(length kill-ring)
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
                                                                       ?????????????????????????????????
     Move to      Size    Scroll        Split                    Do    ??? Windows ???
  ????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????
        ^_k_^           ^_K_^       ^_p_^    ???????????????^ ^        ???????????????^ ^         ??? [_u_] undo layout
        ^^???^^           ^^???^^       ^^???^^    ??? ??? ???_v_ertical ???????????????_b_alance   ??? [_r_] restore layout
    _h_ ???   ??? _l_   _H_ ???   ??? _L_   ^^ ^^    ???????????????^ ^        ???????????????^ ^         ??? [_d_] close window
        ^^???^^           ^^???^^       ^^???^^    ???????????????^ ^        ???????????????^ ^         ??? [_w_] cycle window
        ^_j_^           ^_J_^       ^_n_^    ???????????????_s_tack    ???   ???_z_oom      ??? [_S_] swap windows
        ^^ ^^           ^^ ^^       ^^ ^^    ???????????????^ ^        ???????????????^ ^
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

;; (after! helm
;;   (define-key helm-map (kbd "<backtab") #'helm-previous-line)
;;   )
;; (use-package! helm-ag
;;   :config
;;   (map! :leader
;;         :prefix ("sA" . "Silver searcher")
;;         :desc "AG" "a" #'helm-ag
;;         :desc "AG do" "d" #'helm-do-ag
;;         :desc "AG current file" "f" #'helm-ag-this-file
;;         :desc "AG project" "r" #'helm-ag-project-root
;;         :desc "AG buffers" "b" #'helm-ag-buffers
;;         )
;;   (map! :leader
;;         :prefix ("s")
;;         :desc "Silver search directory" "a" #'helm-ag
;;         )
;;   :init
;;   )
;; (after! counsel
;;   (map! :leader
;;         :prefix ("s")
;;         :desc "AG directory" "a" #'counsel-ag
;;         )
;;   )

;;------------------------------------------------------------------------------
;; Olivetti mode
;;------------------------------------------------------------------------------
(use-package! olivetti
  :config
  (setq olivetti-body-width 0.80)
  (setq olivetti-minimum-body-width 72)
  (setq olivetti-recall-visual-line-mode-entry-state t)
  (setq olivetti-style 'fancy)
  (defun +my/olivetti-mode-on()
    "My custom configuration for 'org-mode'."
    (interactive)
    (olivetti-mode)
    (olivetti-set-width 100)
    )
  ;; (add-hook! 'org-mode-hook #'+my/olivetti-mode-on)
  )


(defmacro bind (&rest commands)
  "Convenience macro which creates a lambda interactive command."
  `(lambda (arg)
     (interactive "P")
     ,@commands))

(global-set-key (kbd "C-x C-c") (bind (message "Thou shall not quit!")))
(after! evil
  (defadvice evil-quit (around dotemacs activate)
    (message "Thou shall not quit!"))
  (defadvice evil-quit-all (around dotemacs activate)
    (message "Thou shall not quit!")))

;; Org to Ipython export
;; -----------------------------------------------------------------------
(use-package! ox-ipynb
  :after org
  :config
  )

;; Evil cursor
;; -----------------------------------------------------------------------
;; Disable the system cursor caused by screen reader etc.
(when IS-WINDOWS 
  (setq w32-use-visible-system-caret nil)
  )

(setq evil-normal-state-cursor '(box "light blue")
      evil-insert-state-cursor '(bar "medium sea green")
      evil-visual-state-cursor '(hollow "orange"))

;; Latex configuration
;; ------------------------------------------------------------------------
;; Set after the default-packages list anyway
(setq org-latex-packages-alist 'nil)
(setq org-latex-default-packages-alist
  '(("AUTO" "inputenc"  t ("pdflatex"))
    ("T1"   "fontenc"   t ("pdflatex"))
    (""     "graphicx"  t)
    (""     "grffile"   t)
    (""     "minted"   t)
    ;; ("dvipsnames,svgnames*,x11names*,table"     "xcolor"   t)
    (""     "longtable" nil)
    (""     "wrapfig"   nil)
    (""     "rotating"  nil)
    ("normalem" "ulem"  t)
    (""     "amsmath"   t)
    (""     "amssymb"   t)
    (""     "unicode-math"   t)
    (""     "mathtools"   t)
    (""     "textcomp"  t)
    (""     "capt-of"   nil)
    (""     "hyperref"  nil)))
;; (add-to-list 'org-latex-default-packages-alist '("" "fontspec" t))
;; (setq org-latex-inputenc-alist '(("utf8" . "utf8x")))
;; (add-to-list 'org-latex-packages-alist '("" "unicode-math"))
(plist-put org-format-latex-options :scale 2.2)
(add-to-list 'org-preview-latex-process-alist '(dvixelatex :programs
         ("xetex" "convert")
         :description "pdf > png" :message "you need to install the programs: xetex and imagemagick." :image-input-type "pdf" :image-output-type "png" :image-size-adjust
         (1.0 . 1.0)
         :latex-compiler
         ("xelatex -no-pdf -interaction nonstopmode -output-directory %o %f")
         :image-converter
         ("dvisvgm %f -n -b min -c %S -o %O")))
(add-to-list 'org-preview-latex-process-alist '(imagexetex :programs
         ("xelatex" "convert")
         :description "pdf > png" :message "you need to install the programs: xelatex and imagemagick." :image-input-type "pdf" :image-output-type "png" :image-size-adjust
         (1.0 . 1.0)
         :latex-compiler
         ("xelatex -interaction nonstopmode -output-directory %o %f")
         :image-converter
         ("convert -density %D -trim -antialias %f -quality 100 %O")))
(setq reftex-default-bibliography my/bibs)

;; Fortran
;; -----------------------------------------------------------------------------
(add-hook 'f90-mode-hook 'eglot-ensure)

;; Scimax
;; -----------------------------------------------------------------------------
;; (use-package! org-db
;;   :after (:all org hydra org-roam emacsql)
;;   :config)
