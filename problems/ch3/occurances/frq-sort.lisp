(load "fixtures.lisp")
(load "without-first.lisp")
(load "find-greatest.lisp")

;> (frq-sort '((A . 4) (B . 3) (C . 4) (D . 1)) '())
;((A . 4) (C . 4) (B . 3) (D . 1))
(defun frq-sort (lst)
  (frq-sort-helper lst '()))

(defun frq-sort-helper (lst memo)
  (if (eql NIL (car lst))
    memo
    (let ((greatest (find-greatest lst)))
      (frq-sort-helper (without-first lst greatest) (append memo (list greatest))))))
