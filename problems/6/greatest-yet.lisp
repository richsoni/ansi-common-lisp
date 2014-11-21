(let ((num-cache nil))
  (defun greatest-yet (num)
    (if (null num-cache)
      (progn
        (setf num-cache num)
        nil)
      (if (> num num-cache)
        (progn
          (setf num-cache num)
          t)
        nil))))
