;> (new-union '(a b c) '(b a d))
;(A B C D)

(defun new-union (memo lst)
  (let ((node (car lst)))
  (if (eql NIL (car lst))
    memo
    (if (in-list node memo)
      (new-union memo (cdr lst))
      (new-union (append memo (list node)) (cdr lst))))))

(defun in-list (node lst)
  (if (eql NIL (car lst))
    NIL
    (if (eql node (car lst))
      T
      (in-list node (cdr lst)))))
