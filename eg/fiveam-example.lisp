(defpackage :fiveam-example
  (:use :cl))
(in-package :fiveam-example)

(fiveam:test a-test
  (fiveam:is (= t t)))

