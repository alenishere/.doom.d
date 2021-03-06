;;; lisp/touchtyping.el -*- lexical-binding: t; -*-

(require 'cl-lib)
(random t) ;seed random with time

(defun rand (min max)
  (+ min (random (+ 1 (- max min)))))

(defun my-type-tutor-insert-buffer (chars lines groups-per-line group-size)
  (save-excursion
    (cl-loop with chars-len = (1- (length chars))
             for l from 0 to (1- lines) do
             (cl-loop for gpl from 0 to (1- groups-per-line) do
                      (cl-loop for gs from 0 to (1- group-size) do
                               (insert (nth (rand 0 chars-len)
                                            chars)))
                      ;; skip space on last one
                      (unless (= gpl (1- groups-per-line))
                        (insert " ")))
             (insert "\n\n\n")))
  (print 'forward-line)
  (forward-line))

(defun my-type-tutor ()
  (interactive)
  (let ((lines 7)
        (groups-per-line 7)
        (group-size 9)
        (char-lst
         (list
          "`" "1" "2" "3" "4" "5" "6" "7" "8" "9" "0" "-" "=" ;top row
          "~" "!" "@" "#" "$" "%" "^" "&" "*" "(" ")" "_" "+" ;Shift top row
          "[" "]" "{" "}")))
    ;; new buff in text-mode
    (switch-to-buffer (get-buffer-create "*type-tutor*"))
    (text-mode)
    ;; insert text
    (my-type-tutor-insert-buffer char-lst lines groups-per-line group-size)))
