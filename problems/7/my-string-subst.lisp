(load "../../chapters/7/ringbuffer.lisp")
(defun matchp (matcher pos c)
    (cond
      ((stringp matcher) (char= c (char matcher pos)))
      ((eql (nth pos matcher) :any) t)
      ((eql (nth pos matcher) :digit) (digit-char-p c))
      ((eql (nth pos matcher) :alpha-char) (alphanumericp c))
      (t (char= c (nth pos matcher)))))

(defun file-subst (old new file1 file2)
  (with-open-file (in file1 :direction :input)
    (with-open-file (out file2 :direction :output
                         :if-exists :supersede) ;append
      (stream-subst old new in out))))

(defun stream-subst (old new in out)
  (let* ((pos 0)
         (len (length old))
         (buf (new-buf len))
         (from-buf nil))
    (do ((c (read-char in nil :eof)
            (or (setf from-buf (buf-next buf))
                (read-char in nil :eof))))
      ((eql c :eof))
      (cond
        ((matchp old pos c) ;current char matches
          (incf pos)
          (cond
            ((= pos len) ;match is fonud
               (princ new out)
               (setf pos 0)
               (buf-clear buf))
            ((not from-buf) ;push position into buffer to continue match searching
                 (buf-insert c buf))))
        ((zerop pos)
          (princ c out)
          (when from-buf
            (buf-pop buf)
            (buf-reset buf)))
           (t
             (unless from-buf
               (buf-insert c buf))
             (princ (buf-pop buf) out)
             (buf-reset buf)
             (setf pos 0))))
    (buf-flush buf out)))

