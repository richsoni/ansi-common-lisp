(load "fixtures.lisp")

;given lst = ((A . 4) (C . 4) (B . 3) (D . 1))
;(find-greatest lst) => (A.4)

(defun find-greatest (lst)
  (find-greatest-helper lst NIL))

(defun find-greatest-helper (lst greatest)
  (if (eql NIL (car lst))
    greatest
    (if (eql NIL greatest)
      (find-greatest-helper (cdr lst) (car lst))
      (if (> (cdar lst) (cdr greatest))
        (find-greatest-helper (cdr lst) (car lst))
        (find-greatest-helper (cdr lst) greatest)))))
