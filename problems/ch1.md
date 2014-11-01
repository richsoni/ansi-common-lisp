1.
  a.
    ( + ( - 5 1) (+ 3 7))
    ( + 4 10)
    > 14

  b.
    (list 1 (+ 2 3))
    (list 1 5)
    '(1 5)
  c.
    (if (listp 1) (+ 1 2) (+ 3 4))
    (if (NIL) (+ 1 2) (+ 3 4))
    (+ 3 4)
    7
  d.
    (list (and (listp 3) t) (+ 1 2))
    (list (and NIL t) (+ 1 2))
    (list NIL (+ 1 2))
    (list NIL 3)
    '(NIL, 3)

2.
  >  (cons 'a '(b c))
  >  (cons 'a cons( 'b '(c)))
  >  (cons 'a cons( 'b '( cons ('c ()))))

3.
  (defun fourth (lst)
    (car ( cdr ( cdr (cdr lst))))
  )
4.
  (defun find-greater (a b)
    (if (> a b)
      a
      (if (> b a)
      b
      NIL)))

5.
  a.  returns true if NIL is in a list
  b.  returns x + 1 if x is in the list

6.
  a.  (list 'b)
  b.  or
  c.  apply

7.
  (defun ln-is-one (lst)
    (and (car lst) (not (car (cdr lst))))
  )
8.
