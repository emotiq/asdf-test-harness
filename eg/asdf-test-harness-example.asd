(defsystem "asdf-test-harness-example"
  :defsystem-depends-on (asdf-test-harness)
  :class test-harness
  :depends-on ()
  :test-package :lisp-unit-example
  :components ((:file "lisp-unit-example")))


