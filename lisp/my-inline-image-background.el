;;; lisp/my-inline-image-background.el -*- lexical-binding: t; -*-

;; Background colour for inline images - Mainly in org
;; ----------------------------------------------------------------------------------
(defcustom my-inline-image-background nil
  "The color used as the default background for inline images.
When nil, use the default face background."
  :group 'org
  :type '(choice color (const nil))
  :safe #'stringp
  )

(defun create-image-with-background-color (args)
  "Specify background color of inline image through modify `ARGS'."
  (let* ((file (car args))
         (type (cadr args))
         (data-p (caddr args))
         (props (cdddr args)))
    ;; Get this return result style from `create-image'.
    (append (list file type data-p)
            (list :background (or my-inline-image-background (face-background 'default)))
            props)))

(advice-add 'create-image :filter-args
            #'create-image-with-background-color)

