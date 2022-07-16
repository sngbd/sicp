;; Exercises 1.5: Ben Bitdiddle has invented a test to determine whether the
;; interpreter he is faced with is using applicative-order evaluation
;; or normal-order evaluation. He defines the following two procedures:
(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))
;; Then he evaluates the expression
;; (test 0 (p))
;; What behavior will Ben observe with an interpreter that
;; uses applicative-order evaluation? What behavior will he
;; observe with an interpreter that uses normal-order evaluation?
;; Explain your answer.
;; (Assume that the evaluation rule for the special form if is
;; the same whether the interpreter is using normal or applicative order:
;; the predicate expression is evaluated first, and the result determines
;; whether to evaluate the consequent or the alternative expression.)
;; Answer: Behavior of an interpreter with applicative-order evaluation that
;; evaluates that expression is that of an infinite recursion, since it will
;; first evaluate the second argument that is p procedure, which is
;; infinitely recursive, then it will evaluate the test procedure (unreachable).
;; While with normal-order evaluation, it doesn't evaluate the second argument
;; that is p procedure, it will expand on the test procedure instead,
;; followed by evaluating if expression that returns 0.
