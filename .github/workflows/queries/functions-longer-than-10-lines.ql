/**
 * @description Find functions that are longer than 10 lines.
 * @kind problem
 * @id javascript/functions-longer-than-10-lines
 * @problem.severity recommendation
 */
import javascript

/**
* Holds if the function 'func' is longer than 10 lines.
*/
predicate isLongerThan10(Function func) {
  exists(CallExpr call |
    call.getNumLines() > 10
  )
}

from Function fuction
where isLongerThan10(function)
select function, "is longer than 10 lines"
