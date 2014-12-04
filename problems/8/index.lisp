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
  ;tk, tbd
  ;Still Not 100% on this one

;4
   ; ring-package.lisp
   ; file-package.lisp

;5 

; I dont know what this means
; tk, tbd

;
    ; my-henley.lisp
