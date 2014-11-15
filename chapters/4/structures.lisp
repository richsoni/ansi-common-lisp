(defstruct polemic
  (type (progn
          (format t "What kind of polemic is it? ")
          (read)))
  (effect nil))

(defstruct ( point
             (:conc-name p) ;The : cone-name argument specifies what should be concatenated to the front of the field names to make access functions for them.
             (:print-function print-point)) ;: pr int-f unct ion is the name of the function that should be used to print a point when it has to be displayed
  (x 0)
  (y 0))

(defun print-point (pnt stream depth)
  (format stream "#<~A,~A>" (px pnt) (py pnt)))
