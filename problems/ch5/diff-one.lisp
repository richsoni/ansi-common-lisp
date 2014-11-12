(setf fixture-a '(1 2 1 2 3 4 3 4 5))
(setf fixture-b '(2 4 5 6))

(defun diff-one-recursive (lst)
  (if (null (cdr lst))
    T
    (if (_diff-one (car lst) (cadr lst))
      (diff-one (cdr lst))
      NIL)))

(defun diff-one-do (lst)
  (setf res t)
  (do ((index 0 (+ index 1)))
    ((>= index (- (length lst) 1)))
      (if (_diff-one (elt lst index) (elt lst (+ index 1)))
        t
        (setf res NIL)))
  res)

(defun diff-one-mapc (lst)
  (block nil
    (not (null
      (mapc
        #'(lambda (a b)
          (if (not (_diff-one a b))
            (return NIL)))
        lst
        (cdr lst))))))

(defun _diff-one (a b)
  (eql 1 (abs (- a b)))
)
