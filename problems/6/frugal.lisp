(defun compute (num)
  (format t "computing...")
  (+ 1000 num))

(let ((hsh (make-hash-table)))
  (defun frugal (num)
    (if (and (>= num 0) (<= num 100))
      (progn
        (if (not (gethash num hsh))
          (setf (gethash num hsh) (compute num)))
        (values (gethash num hsh)))
      )))
