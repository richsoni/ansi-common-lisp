; (quarter-turn #2A((a b) (c d)))
; > 2A(C A) (D B)
(setf fixture #2A((A B) (C D)))

(defun quarter-turn (arr)
  (setf res (make-array '(2 2)))
  (setf (aref res 0 0) (aref arr 1 0))
  (setf (aref res 0 1) (aref arr 0 0))
  (setf (aref res 1 0) (aref arr 1 1))
  (setf (aref res 1 1) (aref arr 0 1))
  res
)

