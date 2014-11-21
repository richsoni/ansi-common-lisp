(defun my-most (fn lst)
  (if (null lst)
    (values nil nil)
    (let* ((winner (car lst))
           (runner-up (cadr lst))
           (winner-score (funcall fn winner)))
      (dolist (obj (cdr lst))
        (let ((current-score (funcall fn obj)))
          (when (>= current-score winner-score)
            (setf
              runner-up winner
              winner obj
              winner-score current-score)
            )))
      (values winner runner-up))))
