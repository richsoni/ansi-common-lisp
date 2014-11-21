(let ((*print-base* 8))
  (defun my-apply (fn lst)
    (apply fn lst)
  )
)

(defun fn (&rest args)
  (princ (car args))
  args
)
