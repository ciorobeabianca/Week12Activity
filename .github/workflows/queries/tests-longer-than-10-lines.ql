/**
 * @description Find tests that are longer than 10 lines.
 * @kind problem
 * @id javascript/tests-longer-than-10-lines
 * @problem.severity recommendation
 */
import javascript

/**
 * Holds if a function is a test.
 */
predicate isTest(Function test) {
  exists(CallExpr describe, CallExpr it |
    describe.getCalleeName() = "describe" and
    it.getCalleeName() = "it" and
    it.getParent*() = describe and
    test = it.getArgument(1)
  )
}

/**
* Holds if the function 'test' is longer than 10 lines.
*/
predicate isLongerThan10(Function test) {
  exists(CallExpr call |
    call.getNumLines() > 10
  )
}

from Function test
where isTest(test) and
      isLongerThan10(test)
select test, "is longer than 10 lines"
