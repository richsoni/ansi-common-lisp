;(load "occurrences.lisp")
;(occurrences '(abadacdea))
;((A .4) (C .2) (D .2) (B .1))
(load "fixtures.lisp")
(load "frq-sort.lisp")
(load "get-unique.lisp")
(load "get-sums.lisp")

(defun occurrences (lst)
  (let ((elems (get-unique lst)))
    (frq-sort
      (get-sums elems lst))))
