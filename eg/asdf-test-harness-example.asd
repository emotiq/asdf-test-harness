(defsystem "asdf-test-harness-example"
  :defsystem-depends-on (asdf-test-harness)
  :class :harness-test
  :test-package :lisp-unit-example
  :components ((:file "lisp-unit-example")))

