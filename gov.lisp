(defun amylist (&rest elems) (car elems))
(defun mycons (_cdr _car)
  (cons _car _cdr))

(defun mylist (&rest elems)
  (car elems)
)
  ; (if (eql NIL (car (elems)))
  ;   (mycons NIL elems)
  ;   (mycons (mylist (cdr elems)) (car elems))))