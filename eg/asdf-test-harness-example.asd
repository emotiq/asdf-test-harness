(defsystem "asdf-test-harness-example"
  :defsystem-depends-on (asdf-test-harness)
  :class test-harness
  :depends-on ()
  :test-package :lisp-unit-example
  :components ((:file "lisp-unit-example")))

(defsystem "asdf-test-harness-example/fiveam-asdf"
  :defsystem-depends-on (fiveam-asdf)
  :class fiveam-tester-system
  :depends-on (fiveam)
  :test-package :lisp-unit-example
  :components ((:file "lisp-unit-example")))
