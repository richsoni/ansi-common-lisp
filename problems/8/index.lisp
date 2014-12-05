;1
    (let (( x 'yo)
          ( y :yo))
      (symbol-name x) ; => "YO"
      (symbol-name y) ; => "YO"
      (eql (symbol-name x) (symbol-name y)) ; => NIL
      (equal (symbol-name x) (symbol-name y))) ; => T

    ; strings are not eql.
    ; :symbol and 'symbol yield the same name but are different sturctures
    ; as such the names are different pointers, ergo not eql

;2
    ;"FOO" is probably half the size of 'foo
    (time (length "foo")) ; => Space: 3027048 Bytes
    (time 'foo) ; => Space: 308292 Bytes
    ;however, it is only slightly bigger in this case

    ;in another test, the results yield a different result
    (time (setf foo "foo")) ;=> Space: 22424 bytes
    (time (intern "foo")) ;=> Space: 248 bytes
    ;but, the setf does not grow with the length of the string so it probably is wrong

    ;ultimately I poked around and found the string-time that gives the space accurately
    (time (string-time "foo") ; => Space 152 bytes
    (time (string-time "fooaaaaaaetnsauhestahuasethuasetuhastuhaestuhaaaaa")) ; => space 344 bytes

    (time (intern "foo")) ; => 80 bytes
    (time (intern "foobarbaz")) ; => 88 Bytes

    ; I guess strings are really actually smaller in clisp


;3
  ;found answer here
  ;http://www.cs.northwestern.edu/academics/courses/325/readings/packages.html
  ;basically it boils down to this:
  ;
  ;when the parser sees a symbol it interns it
  ;so defining a package from cl-user will intern the symbol in cl-user
  ;
  ;this can cause naming conflicts because the symbol is included in too many places
  ;strings dont get evaled at read time, so they are safe

;4
   ; ring-package.lisp
   ; file-package.lisp

;5 

    (load "my-henley.lisp")
    (setf _path "")
    (test-text _path "foo bar baz")
    (test-text _path "eua bar baz")

;
    ; my-henley.lisp
    (generate-sentence "foobar")
