(defun bin-search (obj vec &key (test #'eql) (start 0) (end 0))
  (let* (
        (len (length vec))
        (_start (if (>= start (- len 1)) (- len 1) start))
        (_end   (if (>= end (- len 1)) (- len 1) end))
        )
    (and (not (zerop len))
         (finder obj vec _start (- len 1) test))))

(defun finder (obj vec start end test)
  (let ((range (- end start)))
    (if (zerop range)
      (if (funcall test obj (aref vec start))
        obj
        nil)
      (let ((mid (+ start (round (/ range 2)))))
        (let ((obj2 (aref vec mid)))
          (if (< obj obj2)
            (finder obj vec start (- mid 1) test)
            (if (> obj obj2)
              (finder obj vec (+ mid 1) end test)
              obj)))))))

(setf fixture #(0 1 2 3 4 5 6 7 8 9))
