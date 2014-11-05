(load "fixtures.lisp")

; given lst = '( a a a b b b c c d)
; (get-unique lst)
; '(a b c d)
(defun get-unique (lst)
  (get-unique-helper lst '())
)

(defun get-unique-helper (lst memo)
  (if (eql NIL (car lst))
    memo
    (if (in-list (car lst) memo)
      (get-unique-helper (cdr lst) memo)
      (get-unique-helper (cdr lst) (append memo (list (car lst)))))))

(defun in-list (elem lst)
  (if (eql NIL (car lst))
    NIL
    (if (equal (car lst) elem)
      T
      (in-list elem (cdr lst)))))
