; > (intersperse '- '(a b c d))
; (a - b - c - d)

(setf fixture '(a b c d))

(defun intersperse-iterative (delim lst)
  (setf res (list (car lst)))
  (do ((index 1 (+ index 1)))
    (( >= index (- (length lst) 1))
     (setf res
       (append res
          (list delim) (list (nth index lst)))))))
