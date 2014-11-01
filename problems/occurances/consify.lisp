(load "fixtures.lisp")

;given sums = (4 3 1)
;given elems = (a b d)
;(consify sums elems)
;((A . 4) (B . 3) (D . 1))

(defun consify (elems sums)
  (consify-helper elems sums '()))

(defun consify-helper (elems sums memo)
  (if (eql NIL sums)
    memo
    (consify-helper (cdr elems) (cdr sums) (append NIL memo (list (cons (car elems) (car sums))))))
  )
