(require 'ert)

(ert-deftest are-returns-result-of-last-form ()
  "As `should` returns the result of the test form,
`are` returns the result of the last test form evaluated."
  (are
   (= (are 23) 23)
   (= (are 23 17) 17)))

(ert-deftest are-reports-nil-just-like-should ()
  "On the first form which evaluates to nil,
`are` returns an error."
  (should-error (are nil) :type 'ert-test-failed)
  (should-error (are 23 nil 17) :type 'ert-test-failed))
