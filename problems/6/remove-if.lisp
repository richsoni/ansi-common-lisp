(defun filter (fn lst)
  (let ((acc nil))
    (dolist (x lst)
      (let ((val (funcall fn x)))
        (if val (push val acc))))
    (nreverse acc)))

(defun my-remove-if (fn lst)
  (filter #'(lambda (el)
    (if (not (funcall fn el))
      el
      nil)) lst))
