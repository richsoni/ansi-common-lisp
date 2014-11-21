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

## Parameter List

### &rest (splatting)
```lisp
(defun our-funcall (fn &rest args)
  (apply fn args))
```

### &optional (defaulting)

```lisp
> (defun philosph (thing &optional property)
  (list thing 'is property))
> (pholosph 'death)
(DEATH IS NIL)
> (defun philosph (thing &optional (property 'fun))
     (list thing 'is property))
> (philosph 'death)
> (DEATH IS FUN)
```

### Keywords

```lisp
(defun keylist (a &key x y z)
  (list a x y z))
> keylist 1 :y 2)
(1 nil 2 nil)
```

### Apply, and Returning Fns

Return  a function by making a ref to it

```lisp
(defun my-append ()
  #'append
)
```

```lisp
> (apply my-append '(1 2 3))
```

of course returning a lambda is interesting

```
>(setf fn (let ((i 3))
  #'(lambda (x) (+ x i))))
>(funcall fn 2)
```

##??? What is the difference between apply and funcall???

## Closure

1. **Free Variable**: var referred to outside of a function
2. **Closure**: function that referres to a free variable

Here is a sophisticated of closure using shared variables:

```lisp
  (let ((counter 0))
    (defun reset ()
      (setf counter 0))
    (defun stamp ()
      (setf counter (+ counter 1))))
```

# Scoping

## Lexical Scoping

```lisp
> (let ((x 10))
   (defun foo() x))
> (let ((x 20 )) (foo))
```

## Dynamic Scoping
Special is a LISP declaration that tells the compiler how to scope its argument name
(setf on toplevel is implicitly special)
```lisp
> (let ((x 10))
    (defun foo()
      (declare (special x)) x))
> (let ((x 20))
    (declare (special x))
    (foo))
20
```

# Compiling

Compile non scoped functions with `(compile 'fn)`

Compile a whole file with *compile-file*.

Test compilation with *compile-function-p*

# Summary
1. A named function is a function stored as the symbol-function of a symbol. The def un macro hides such details. It also allows you to definedocumentationstrings,andspecifyhowsetf shouldtreatcalls.
2. Itispossibletodefinelocalfunctions,similarinspirittolocalvariables.
3. Functions can have optional, rest, and keyword parameters.
4. Utilities are additions to Lisp. They are an example of bottom-up programming on a small scale.
5. Lexical variables persist as long as something refers to them. Closures are functions that refer to free variables. You can write functions that return closures.
6. Dylan provides functions for building functions. Using closures, it's easy to implement them in Common Lisp.
7. Special variables have dynamic scope.
8. Lisp functions can be compiled individually, or (more usually) by the file.
9. A recursive algorithm solves a problem by dividing it into a finite number of similar, but smaller, problems.
