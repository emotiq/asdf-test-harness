(in-package :asdf)

(define-condition asdf-test-system-failure (error) ;; We could probably get away with a warning…
  ((failed-asdf-component
    :initarg :failed-asdf-component
    :reader failed-asdf-component))
  (:documentation "Superclass of error conditions that indicate that
  an ASDF test-op has failed."))

(define-condition test-suite-failures (asdf-test-system-failure)
  ((failures
    :initarg :failures
    :reader failures))
  (:report (lambda (circumstances stream)
              (format stream "Tests on system ~a failed: ~{~t~a~%~}"
                      (component-name (failed-asdf-component circumstances))
                      (failures circumstances))))
  (:documentation "The condition signaled when a system under the test
  harness reports wishes to report failures."))

(defclass harness-test (system)
  ((test-framework
    :initarg :test-framework
    :reader test-framework
    :initform :lisp-unit
    :documentation "A keyword specifying which test framework should
    be used to perform tests on this system.  The default is :LISP-UNIT.")
   (test-package
    :initarg :test-package
    :reader test-package
    :documentation "The package containing the tests.")
   (test-args ;; currently unused
    :initarg :test-args
    :documentation "Additional arguments for specifying how to test this system.")))

(defmethod perform ((operation test-op) (system harness-test))
  (let ((framework (test-framework system))
        (for-package (find-package (test-package system))))
    (multiple-value-bind (all-tests-succeeded-p results)
        (harness:run-tests framework for-package)
    (unless all-tests-succeeded-p
      (error 'test-suite-failures
             :failed-asdf-component system
             :failures (harness:report-results framework results)))))
  t)

#+(or)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (export :harness-test :asdf))
