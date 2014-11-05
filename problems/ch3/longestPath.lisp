(setf net '(( a b c) (b c) (c d)))

(defun longest-path (start end net)
  (dfs end (list (list start)) net))

;end: 'd
;queue: '((C A))
;net: '((A B C) (B C) (C D)))
;path: '(C A B)
;node: 'C



(defun dfs (end queue net)
  (if (null queue)
    nil
  (let ((path (car queue)))
    (let ((node (car path)))
      (if (eql node end)
        (reverse path)
        (dfs end
             (append
                     (new-paths path node net)
                     (cdr queue))
             net))))))


(defun new-paths (path node net)
  (mapcar #'(lambda (n)
              (cons n path))
          (cdr (assoc node net))))
