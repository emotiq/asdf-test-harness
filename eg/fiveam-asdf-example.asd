;;; An example of using FIVEAM-ASDF
;;; <https://gitlab.common-lisp.net/asdf/asdf/tree/master/contrib/fiveam-asdf>
(defsystem "fiveam-asdf-example"
  :defsystem-depends-on (fiveam-asdf)
  :class :fiveam-tester-system
  :test-names (a-test)
  :test-package "FIVEAM-EXAMPLE"
  :depends-on (fiveam)
  :components ((:file "fiveam-example")))
