; (tokens "ab12 3cde.f" #'alpha-char-p 0)
(setf str "ab12 3cde.f")
(setf test #'alpha-char-p)

(defun tokens (str test start)
  (let (( head (position-if test str :start start)))
    (if head
      (let (( tail (position-if #'(lambda (chr)
                                  (not (funcall test chr)))
                              str :start head)))
        (cons (subseq str head tail)
              (if tail
                (tokens str test tail)
                nil)))
      nil)))

(defun constituent (c)
  (and (graphic-char-p c)
       (not (char= c #\  ))))

(defun parse-date (str)
  (let ((toks (tokens str #'constituent 0)))
    (list ( parse-integer (first toks))
          ( parse-month   (second toks))
          ( parse-integer (third toks)))))

(defconstant month-names
  #("jan" "feb" "mar" "apr" "may" "jun" "jul" "aug" "sep"
    "oct" "nov" "dec"))

(defun parse-month (str)
  (let (( p (position str month-names :test #'string-equal)))
    (if p
      (+ p 1)
      nil)))
