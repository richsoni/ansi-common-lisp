; > (showdots '(a b c))
; (A . (B . (C . NIL)))
; NIL
(setf fixture '(a b c))

(defun showdots (lst)
  (if (car lst)
    ((lambda ()
      (format t "(~A . " (car lst))
      (showdots (cdr lst))
      (format t ")")))
    (format t "NIL")
  )
)
