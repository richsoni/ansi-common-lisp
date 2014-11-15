(defstruct
  (node
    (:print-function
      (lambda (_node _stream _ignore)
        (format _stream "#<~A> #(~A) #(~A) #(~A)" (node-elt _node) (node-left _node) (node-center _node) (node-right _node)))))
  elt (left nil) (center nil) (right nil))

(setf fixture (make-node :elt 1 :left (make-node :elt 2)))

(defun my-copy-tree (_node)
  (if (null _node)
    NIL
    (let ((val (node-elt _node)) (_left (node-left _node)) (_center (node-center _node)) (_right (node-right _node)))
      (make-node
        :elt val
        :left (my-copy-tree _left)
        :center (my-copy-tree _center)
        :right (my-copy-tree _right)))))

(defun find-node-eql (obj _node)
  (if (null _node)
    NIL
    (let ((val (node-elt _node)) (_left (node-left _node)) (_center (node-center _node)) (_right (node-right _node)))
      (if (eql obj val)
        T
        (or
          (find-node-eql obj _left)
          (find-node-eql obj _center)
          (find-node-eql obj _right))))))
