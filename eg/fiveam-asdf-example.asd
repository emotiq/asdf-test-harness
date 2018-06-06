(defsystem "fiveam-asdf-example"
  :defsystem-depends-on (fiveam-asdf)
  :class fiveam-tester-system
  :depends-on (fiveam)
  :test-package :lisp-unit-example
  :components ((:file "lisp-unit-example")))
