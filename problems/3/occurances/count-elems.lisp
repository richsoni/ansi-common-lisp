(load "fixtures.lisp")

;given list = (a a a a b d)
;elem       = a
;4

(defun count-elems (lst elem)
  (count-elems-helper lst elem 0))

(defun count-elems-helper (lst elem cnt)
  (if (eql (car lst) NIL)
    cnt
    (if (equal (car lst) elem)
      (count-elems-helper (cdr lst) elem (+ cnt 1))
      (count-elems-helper (cdr lst) elem cnt))))
