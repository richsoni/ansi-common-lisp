(load "fixtures.lisp")
(defun pos+ (lst)
  (setf index 0)
  (mapcar #'(lambda (x)
    (setf index (+ index 1))
    (+ x (- index 1))
  ) lst)
)
