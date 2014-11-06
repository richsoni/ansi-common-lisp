; figure out what happens when you remove 8
(defstruct
  (node
    (:print-function
      (lambda (nnode sstream ignr)
        (format sstream "#<~A>" (node-elt nnode)))))
  elt (l nil) (r nil))

;(node-elt (make-node :elt 1)) => 1


(defun bst-adjoin (obj bst <)
  (bst-insert obj bst <)
)

(defun bst-insert (obj bst <)
  (if (null bst)
    (make-node :elt obj)
    (let ((elt (node-elt bst)))
      (if (eql obj elt)
         bst
         (if (funcall < obj elt)
           (make-node
             :elt elt
             :l (bst-insert obj (node-l bst) <)
             :r (node-r bst))
           (make-node
             :elt elt
             :l (node-l bst)
             :r (bst-insert obj (node-r bst) <)))))))

(defun bst-find (obj bst <)
  (if (null bst)
    NIL
    (let ((elt (node-elt bst)))
      (if (eql obj elt)
        bst
        (if (funcall < obj elt)
          (bst-find obj (node-l bst) <)
          (bst-find obj (node-r bst) <))))))

(defun bst-min (bst)
  (and bst
       (or (bst-min (node-l bst)) bst)))

(defun bst-max (bst)
  (and bst
       (or (bst-max (node-r bst)) bst)))


(defun bst-remove (obj bst <)
  (if (null bst)
    nil
    (let ((elt (node-elt bst)))
      (if (eql obj elt)
        (percolate bst)
        (if (funcall < obj elt)
          (make-node
            :elt elt
            :l (bst-remove obj (node-l bst) <)
            :r (node-r bst))
          (make-node
            :elt elt
            :r (bst-remove obj (node-r bst) <)
            :l (node-l bst)))))))

(defun percolate (bst)
  (cond
    ((null (node-l bst))
      (if (null (node-r bst))
        nil
        (rperc bst)))
    ((null (node-r bst)) (lperc bst))
    (t (if (zerop (random 2))
         (lperc bst)
         (rperc bst)))))

(defun rperc (bst)
  (make-node
    :elt (node-elt (node-r bst))
    :l (node-l bst)
    :r (percolate (node-r bst))))

(defun lperc (bst)
  (make-node
    :elt (node-elt (node-l bst))
    :l (percolate (node-l bst))
    :r (node-r bst)))

(defun bst-traverse (fn bst)
  (when bst
    (bst-traverse fn (node-l bst))
    (funcall fn (node-elt bst))
    (bst-traverse fn (node-r bst))))

(defun bst-reverse-traverse (bst)
  (when bst
    (append
      (bst-reverse-traverse (node-r bst))
      (list (node-elt bst))
      (bst-reverse-traverse (node-l bst)))))

(setf fixture NIL)
(dolist (x'(5 8 4 2 1 9 6 7 3))
  (setf fixture (bst-insert x fixture #'<)))

