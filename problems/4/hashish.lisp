(setf fixture '((+ . "add") (- . "subtract") ))

(defun assoc-to-hash (lst)
  (assoc-to-hashr lst (make-hash-table)))

(defun assoc-to-hashr (lst ht)
  (let ((elem (car lst)))
    (if (null elem)
      ht
      (let ((x nil))
        (setf (gethash (car elem) ht) (cdr elem))
        (assoc-to-hashr (cdr lst) ht)))))

(defun hash-to-assoc (ht)
  (setf res '())
  (maphash
    #'(lambda (k v)
      (setf res (append res (list (cons k v)))))
    ht)
  res)
