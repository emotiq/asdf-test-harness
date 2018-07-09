(defsystem asdf-test-harness
  :depends-on (asdf
               alexandria
               ;; TODO: make the test suites we support a deferred dependency?
               lisp-unit) 
  :components ((:module package
                        :pathname "./"
                        :components ((:file "package")))
               (:module harness
                        :pathname "./"
                        :depends-on (package)
                        :components ((:file "harness")))
               (:module asdf
                        :pathname "./"
                        :depends-on (harness)
                        :components ((:file "asdf-test-harness")))))





