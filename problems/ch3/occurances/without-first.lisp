(load "fixtures.lisp")

;given lst = ((A . 4) (C . 4) (B . 3) (D . 1))
;(without-first lst (cons 'c 4)) => (A.4)
;((A . 4) (B . 3) (D . 1))

(defun without-first (lst elem)
  (without-first-helper NIL lst elem))

(defun without-first-helper (head tail elem)
  (if (eql NIL (car tail))
    head
    (if (equal (car tail) elem)
      (append head (cdr tail))
      (without-first-helper (append head (list (car tail))) (cdr tail) elem)
    )))
