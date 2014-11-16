# Global Functions

Test for existance of functions

```lisp
(fboundp '+)
(symbol-function '+)
```

Use ```setf``` and ```symbol-function``` to define a function.

```lisp
> (setf (symbol-function 'add2)
    #'(lambda (x) (+ x 2)))
> (add2 1)
```

\*\*\* Is ```defun``` just a macro???

```lisp
(defun (setf primo) (val lst)
  (setf (car lst) val))
```

## Defining Setter functions

Given the following declarations

```lisp
> (setf fixture '(1 2 3))
> (defun my-car (lst) (car lst))
> (my-car fixture)
1
```

The real car can set elems in a list

```lisp
> (setf (car lst) 5)
> lst
(5 1 2)
```

This does not work for our version of car

```lisp
> (setf (my-car lst) 5)
*** - FUNCTION: undefined function (SETF my-car)
```

A special version of the function needs to be defined to get that functionality

```lisp
> (defun (setf my-car) (new-val my-car-arg1)
     (setf (car lst) val))
> (setf (my-car lst) 5)
(5 1 2)
```

# Documentation String

```lisp
> (defun foo (x)
  "Optional Documentation String"
  x)
> (documentation 'foo 'function)
"Optional Documentation String"
```

# Local Functions

> labels => let for functions
Labels can call eachother and can be recursive (better than JS)

```lisp
> (labels
  ((add10 (x) (+ x 10))
   (consa (x) (cons 'a x)))
  (consa (add10 3)))
(A . 13)
```

Do is like recursion... here are 2 equal statements

```lisp
> (do ((x a (b x))
     (y c (d y)))
    ((test x y) (z x y))
    (y x y))

>(labels ((rec (x y)
           (cond ((test x y)
             (z x y))
           (t
             (f x y)
             (rec (b x) (d y)))))))

```
