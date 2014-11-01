(load "fixtures.lisp")

(defun pos+ (lst)
  (let ((res '()))
    (do (( index 0 (+ index 1)))
      ((eql NIL (car lst)) 'done)
      (setf res (append-val res (car lst) index))
      (setf lst (cdr lst))
    )
    res
  )
)

(defun append-val (lst num index)
  (append
    lst
    (list (+ index num))))
