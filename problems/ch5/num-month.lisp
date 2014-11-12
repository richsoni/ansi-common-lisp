(defun leap? (y)
  (and (zerop (mod y 4))
       (not (zerop (mod y 100)))))

(defun num-month (n y)
  (if (leap? y)
    (cond ((= n 59) (values 2 29))
          ((> n 59) (nmon (- n 1)))
          (t (nmon n)))
    (nmon n)))

(defun nmon (n)
  (let ((m (position n my-month :test #'<)))
    (values m (+ 1 (- n (get-month (- m 1)))))))

(defun get-month (day)
   (case day (0 0) (1 31) (2 59) (3 90) (4 120) (5 151) (6 181) (7 212) (8 243) (9 273) (10 304) (11 334) (12 365)))

