# Paths

there are 6 components to a path:

1. host
2. device
3. directory
4. name
5. type
6. version

name is the only required argument

```lisp
  (setf path (make-pathname :name 'myfile'))
```

# Open a file

```lisp
  (open path)
```

``` :direction ``` tells the stream where to write to.
Choose from:

1.  :input
2.  :output
3.  :io

```:if-exists``` defines how to deal with conflicts.

## Full Example

```lisp
(setf path (make-pathname :name "myfile"))
(setf str (open path :direction :output :if-exists :supersede))
(format str "something ~%")
(close str)
```

## A better approach

```lisp
(with-open-file (str path :direction :output
                          :if-exists :supersede)
                (format str "Something ~%"))
```

# Input (Specifics)

##  read-line

up to \n char. second return is true on last line

### On 2nd and 3rd args

2nd defines what to do at eof.
If 2nd is nil return 3rd arg

## read

Evaluates lisp expressions (kindof like load), but only one expr

## read-from-stream

like read but from a string :/

#read-char, peak-char

only 1 char, same inputs as read
peak does not consume the char


# Output

```lisp
> (prin1 "hello")
"hello"
"hello"
> (princ "hello")
hello
"hello"
> (terpri)

NIL
```

prin1 is used for programs to read

## Format

### 1st arg

* t is \*standard-output\*
* nil outputs a string

### Directives
start with ~

* A, S (sub with var princ print1 respectively)
* % (newline)
* F (float (len, precision, exp shift, ellipse char, prefix))
  ```lisp
  > (format nil ""10,2,0,'*,' F" 26.21875)
  "  26.22"
  > (format nil "~,2,,,F" 26.21875)
  "26.22"
  ```

