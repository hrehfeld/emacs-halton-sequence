;;; halton-sequence.el --- Generate Halton sequence numbers -*- lexical-binding: t; -*-

;; Author: Your Name <your.email@example.com>
;; Maintainer: Your Name <your.email@example.com>
;; Version: 1.0
;; Package-Requires: ((emacs "24.3"))
;; Keywords: math, sequences
;; URL: https://example.com/halton-sequence

;; This file is not part of GNU Emacs.

;;; Commentary:

;; This package provides functions to generate Halton sequence numbers.
;; The Halton sequence is a low-discrepancy sequence used for
;; quasi-random number generation.

;;; Code:

(defun corput (n base)
  "Generate the nth element of the Van der Corput sequence in a given BASE."
  (let ((q 0.0)
        (bk (/ 1.0 base)))
    (while (> n 0)
      (setq q (+ q (* (mod n base) bk)))
      (setq n (/ n base))
      (setq bk (/ bk base)))
    q))

(defun halton-sequence (count base)
  "Generate a list of COUNT numbers in the Halton sequence for a given BASE."
  (let ((sequence ()))
    (dotimes (i count)
      (setq sequence (append sequence (list (corput i base)))))
    sequence))

;; (halton-sequence 10 2)

(provide 'halton-sequence)

;;; halton-sequence.el ends here
