(defun each-file-input (path fn &optional (read-type #'read-line))
  (with-open-file (in path :direction :input)
    (do ((input (funcall read-type in nil 'eof)
               (funcall read-type in nil 'eof)))
      ((eql input 'eof))
      (funcall fn input))))

;1.

(defun file-lines (path &optional (fn #'read-line))
  (setf lines NIL)
  (each-file-input path
    #'(lambda (line)
        (setf lines (append lines (list line))))
    fn
  )
  lines)

;2

(defun file-lines-expr (path)
  (file-lines path #'read))

;3

(defun strip-comments (src dst) ;here
  (setf ignoring nil)
  (with-open-file (out dst :direction :output :if-exists :supersede)
    (each-file-input src ;here
      #'(lambda (_char)
        (cond
          ((eql _char #\;
                ) (setf ignoring t))
          ((eql _char #\Newline) (setf ignoring nil)))
          (if (eql ignoring nil)
            (format out "~A" _char)))
      #'read-char)))

;4.

(setf fixture4 #(
      #(1.0 2.0001 3.1111 4.1112 5.022933)
      #(10.123 11.111 12.11 13.0)
      #(100.1 10.1 1.11 2.1)))

(defun print-float-table (arr)
  (do
    ((major-index 0 (1+ major-index)))
    ((< (1- (car (array-dimensions arr))) major-index) 'done)
    (let ((minor-arr (aref arr major-index)))
      (do
        ((minor-index 0 (1+ minor-index)))
        ((< (1- (car (array-dimensions minor-arr))) minor-index) 'done)
        (format t "~10,2F" (aref minor-arr minor-index)))
      (format t "~%")
      )))
;5.
;Modify stream-subst to allow wildcards in the pattern. If the character + occurs in old, it should match any input character.
; "./my-string-subst"

;6.
;Modify stream-subst so that the pattern can include an element that matches any digit character, an element that matches any alphanumeric character, or an element that matches any character. The pattern must also be able to match any specific input character. (Hint: old can no longer be a string.
;(e.g. \d \a *)
; "./my-string-subst"
