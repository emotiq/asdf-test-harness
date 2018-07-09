;;;; Adaptors from the test harness abstraction to various test frameworks

(in-package :harness)

(defgeneric run-tests (harness-type &rest arg-or-args)
  (:documentation "A method specialized on the test HARNESS-TYPE which
  runs a test suite.  

The first value returned whether the test suite passed or not.  

The second value returned contains a HARNESS-TYPE dependent report of
test execution.")

  ;;; For now assume we are passed a package which contains tests in ARG-OR-ARGS
  (:method ((harness-type (eql :lisp-unit)) &rest arg-or-args)
    (let ((lisp-unit:*print-errors* t))
      (let ((results
             (lisp-unit:run-tests :all (first arg-or-args))))
      (values
       (and (zerop (lisp-unit::fail results))
            (zerop (lisp-unit::exerr results))
            (not (lisp-unit::failed-tests results))
            (not (lisp-unit::error-tests results)))
       results)))))

(defgeneric report-results (harness-type &rest arg-or-args)
    (:method ((harness-type t) &rest arg-or-args)
      ;; unimplemented: adapt varying test results into a standardized
      ;; structure that may be used to collect numerical statistics or
      ;; possibly decide on further actions by the condition handler
      arg-or-args))

(defun run-suite (suite)
  (ql:quickload suite) ;;; FIXME
  (multiple-value-bind (passed results)
      (run-tests :lisp-unit suite)
    (values passed results)))
