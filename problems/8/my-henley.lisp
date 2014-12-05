(defparameter *next-words* (make-hash-table :size 10000))
(defparameter *prev-words* (make-hash-table :size 10000))

(defconstant maxword 100)

(defun read-text (pathname)
  (with-open-file (s pathname :direction :input)
    (let ((buffer (make-string maxword))
          (pos 0))
      (do ((c (read-char s nil :eof)
              (read-char s nil :eof)))
          ((eql c :eof))
        (if (or (alpha-char-p c) (char= c #\'))
            (progn
              (setf (aref buffer pos)  c)
              (incf pos))
            (progn
              (unless (zerop pos)
                (see (intern (string-downcase
                              (subseq buffer 0 pos))))
                (setf pos 0))
              (let ((p (punc c)))
                (if p (see p)))))))))

(defun punc (c)
  (case c
    (#\. `|.|) (#\, '|,|) (#\; '|;|)
    (#\! '|!|) (#\? '|?|) ))

(let ((prev '|.|))
  (defun see (curr)
    (let ((pair (assoc curr (gethash prev *next-words*))))
      (if (null pair)
          (push (cons curr 1) (gethash prev *next-words*))
          (incf (cdr pair))))
    (let ((pair (assoc prev (gethash curr *prev-words*))))
      (if (null pair)
          (push (cons prev 1) (gethash curr *prev-words*))
          (incf (cdr pair))))
    (setf prev curr)))

(defun generate-text (n &optional (prev '|.|))
  (if (zerop n)
      (terpri)
      (let ((next (random-entry prev *next-words*)))
        (format t "~A " next)
        (generate-text (1- n) next))))

(defun random-entry (word ht)
  (let* ((choices (gethash word ht))
         (i (random (reduce #'+ choices
                            :key #'cdr))))
    (dolist (pair choices)
      (if (minusp (decf i (cdr pair)))
          (return (car pair))))))

(defun sentence-fragment (word ht)
  (setf lst (list word))
  (setf curr word)
  (dotimes (i 5)
    (let ((next (random-entry curr ht)))
      (setf lst (append lst (list next)))
      (setf curr next)))
  lst)
  
(defun generate-sentence (word)
  (append (reverse (sentence-fragment word *prev-words*)) (cdr (sentence-fragment word *next-words*)))
)

(let ((curr nil))
  (defun henleyp (next)
    (setf failed nil)
    (if curr
      (progn
        (setf wds (assoc next (gethash curr *next-words*)))
        (setf failed (not wds)))
      (progn
      (setf failed (not (gethash next *next-words*)))))
    (setf curr next)
    (not failed))

  (defun test-text (path quote)
    (read-text path)
    (setf pos 0)
    (setf failed nil)
    (do () ((or (>= pos (length quote)) (eql failed t)) 'done)
      (multiple-value-bind
        (word _pos) (read-from-string quote t nil :start pos)
        (setf pos _pos)
        (unless (henleyp (intern (string-downcase word)))
          (setf failed t))
      ))
    (setf curr nil)
    (not failed)))
