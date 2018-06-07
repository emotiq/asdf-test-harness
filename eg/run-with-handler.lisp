;;; How to run from the test harness

(handler-case
    (asdf:test-system :asdf-test-harness-example)
  (asdf:test-suite-failures (condition)
    (format t "Test suite invocation signaled ~a" condition)))
