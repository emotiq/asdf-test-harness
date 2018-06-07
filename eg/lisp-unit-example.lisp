(defpackage lisp-unit-example
  (:use :cl))

(in-package :lisp-unit-example)

(lisp-unit:define-test a-test
  (lisp-unit:assert-equal t t))



