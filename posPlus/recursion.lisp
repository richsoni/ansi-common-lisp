(load "fixtures.lisp")

(defun pos+ (lst)
  (poshelper lst '() 0)
)

(defun poshelper (lst memo index)
  (if (eql NIL (car lst))
    memo
    (poshelper
      (cdr lst)
      (append memo (list (+ (car lst) index)))
      (+ index 1))))
