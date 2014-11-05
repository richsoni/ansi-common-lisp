(defun mycons (_cdr _car)
  (cons _car _cdr))

(defun mylist (&rest elems)
  (if (eql NIL (car elems))
    NIL
    (if (eql NIL (cdr elems))
      (mycons NIL (car elems))
      (mycons  (cdr elems) (car elems)))))

(defun mylength (lst)
  (setf index 0)
  (mapcar #'(lambda (x)
    (setf index (+ index 1))
  ) lst)
  index)

(defun mymember (elem lst)
  (if (eql NIL (car lst))
    NIL
    (if (equal (car lst) elem)
      lst
      (mymember elem (cdr lst)))))
