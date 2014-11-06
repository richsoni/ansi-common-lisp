(defun my-reverse (lst)
  (reduce
    #'(lambda (memo elem)
      (cons elem memo)
    )
    lst
    :initial-value NIL))

(defun my-copy-list (lst)
  (reduce
    #'(lambda (memo elem)
     (cons elem memo))
   (reverse lst)
   :initial-value NIL))
