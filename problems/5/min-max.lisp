(defun min-max(lst)
  (_min-max (cdr lst) (car lst) (car lst)))

(defun _min-max(lst _min _max)
  (if (null (car lst))
    (values _min _max)
    (let (( val (car lst)))
      (if (< val _min)
        (_min-max (cdr lst) val _max)
        (_min-max (cdr lst) _min val)))))
