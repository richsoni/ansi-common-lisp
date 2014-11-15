(load "fixtures.lisp")
(load "count-elems.lisp")
;> (get-sums '(a b c d) '(a a a a b b b b c c c d) '())
;(4 4 3 1)
(defun get-sums (elems lst)
  (get-sums-helper elems lst '()))

(defun get-sums-helper (elems lst memo)
  (if (eql NIL (car elems))
    memo
    (get-sums-helper
      (cdr elems)
      lst
      (new-memo elems lst memo))))


(defun new-memo (elems lst memo)
  (append
    memo
    (list
      (cons
        (car elems)
        (count-elems lst (car elems))))))
