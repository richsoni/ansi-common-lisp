(setf fixture '((a b c) (b c) (c d)))

(defun shortest-path (start end net)
  (bfs end (list (list start)) net))

(defun bfs (end queue net)
  (format t "queue: ~A ~%" queue)
  (if (null queue)
    nil
    (let ((path (car queue)))
      (let ((node (car path)))
        (if (eql node end)
          (progn
            (format t "match~%")
            (reverse path)
          )
          (progn
            (format t "bfs~%")
            (bfs end
                 (append (cdr queue)
                         (new-paths path node net))
                 net)))))))

(defun new-paths (path node net)
  (mapcar #'(lambda (n)
              (cons n path))
          (cdr (assoc node net))))


