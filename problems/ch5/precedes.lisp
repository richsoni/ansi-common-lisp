(setf fixture "abracadabra")
; > (precedes #\a fixture)
; "(#\c #\d #\r)

(defun precedes-iterative (object _vector)
  (setf res '())
  (setf start 1)
  (do ((start (position object _vector :start 1) (position object _vector :start start)))
    ((or (eql nil start) (>= start (length _vector))))
    (format t "~A " start)
    (setf res
      (append res
         (list
           (elt _vector (- start 1))
         )
      )
    )
    (setf start (+ 1 start))
  )
  res)

(defun precedes-recursive (object _vector)
  (_precedes-recursive-helper object '() (elt _vector 0) (subseq _vector 1)  (subseq _vector 2))
)

(defun _precedes-recursive-helper (object memo _last _current _rest)
  (if (equal _current "")
    memo
    (if (equal _rest "")
      (if (eql object _current)
        (append memo (list _last))
        memo)
      (if (eql object _current)
        (_precedes-recursive-helper
          object
          (append memo (list _last))
          _current
          (elt _rest 0)
          (subseq _rest 1))
        (_precedes-recursive-helper
          object
          memo
          _current
          (elt _rest 0)
          (subseq _rest 1))))))
