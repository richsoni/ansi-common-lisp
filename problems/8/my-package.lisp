(defpackage "MY-APPLICATION"
  (:use "COMMON-LISP")
  (:nicknames "APP")
  (:export "WIN"))

(in-package my-application)
(defun win ()
  (format t "in my application"))
