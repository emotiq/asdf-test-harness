(in-package :harness)

(defgeneric run-tests (harness-type &rest arg-or-args)
  (:documentation "A method specialized on the test HARNESS-TYPE which
  runs a test suite.  

The first value returned whether the test suite passed or not.  The
second value returned contains a HARNESS-TYPE dependent report of test
execution.")

  ;;; For now assume we are passed a package which contains tests in ARG-OR-ARGS
  (:method ((harness-type (eql :lisp-unit)) &rest arg-or-args)
    (let ((results
           (lisp-unit:run-tests :all arg-or-args))) 
      (values
       (or (lisp-unit::fail results)
           (lisp-unit::exerr results)
           (lisp-unit::failed-tests results)
           (lisp-unit::error-tests results))
       results))))

(defgeneric report-results (harness-type &rest arg-or-args)
    (:method ((harness-type t) &rest arg-or-args)
      ;; unimplemented: adapt varying test results into a standardized
      ;; structure that may be used to collect numerical statistics or
      ;; possibly decide on further actions by the condition handler
      (declare (ignore arg-or-args))
      t))


