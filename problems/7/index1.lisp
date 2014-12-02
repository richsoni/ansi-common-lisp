(defun each-file-input (path fn &optional (read-type #'read-line))
  (with-open-file (in path :direction :input)
    (do ((input (funcall read-type in nil 'eof)
               (funcall read-type in nil 'eof)))
      ((eql input 'eof))
      (funcall fn input))))



(defun file-lines (path &optional (fn #'read-line))
  (setf lines NIL)
  (each-file-input path
    #'(lambda (line)
        (setf lines (append lines (list line))))
    fn
  )
  lines)



(defun file-lines-expr (path)
  (file-lines path #'read))



(defun strip-comments (src dst) 
  (setf ignoring nil)
  (with-open-file (out dst :direction :output :if-exists :supersede)
    (each-file-input src 
      #'(lambda (_char)
        (cond
          ((eql _char #\
                ) (setf ignoring t))
          ((eql _char #\Newline) (setf ignoring nil)))
          (if (eql ignoring nil)
            (format out "~A" _char)))
      #'read-char)))




