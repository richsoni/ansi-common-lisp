(let (( x 'a ))
  (do
    ;; variables
    (
     ;; name initial each time...
     ;; first pass x=1
     ;; nth pass x= x+1
     (x 1 (+ x 1))
     ;; first pass y=x
     ;; nth pass y=x
     (y x x)
    )
    ;; control (if not here infinate
    ((> x 5))
    ;; body
    (format t "(~A ~A) " x y)
  )
)
; (1 A) (2 1) (3 2) (4 3) (5 4)

(let (( x 'a ))
  (do
    (
     (x 1 (+ x 1))
     (y x x) ;inherits new x
    )
    ((> x 5))
    (format t "(~A ~A) " x y)
  )
)
; (1 1) (2 2) (3 3) (4 4) (5 5)

;;       var list      return val
(dolist (x '(a b c d) 'done)
  (format t "~A " x))
; A B C D
; DONE

(dotimes (x 5 x)
  (format t "~A " x))
; 0 1 2 3 4
; 5
