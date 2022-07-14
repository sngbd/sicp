;; 1. Below is a sequence of expressions. What is the result printed
;; by the interpreter in response to each expression? Assume that the
;; sequence is to be evaluated in the order in which it is presented.
10
;; 10
(+ 5 3 4)
;; 12
(- 9 1)
;; 8
(/ 6 2)
;; 3
(+ (* 2 4) (- 4 6))
;; 6
(define a 3)
;; a
(define b (+ a 1))
;; b
(+ a b (* a b))
;; 19
(= a b)
;; #f
(if (and (> b a) (< b (* a b)))
    b
    a)
;; b
(cond ((= a 4) 6)
      ((= b 4) (+ 6 7 a))
      (else 25))
;; 16
(+ 2 (if (> b a) b a))
;; 6
(* (cond ((> a b) a)
	 ((< a b) b)
	 (else -1))
   (+ a 1))
;; 16

;; 2. Translate the following expression into prefix form:
;; 5 + 4 + (2 - (3 - (6 + 4/5)))
;; -----------------------------
;;       3 (6 -2) (2 - 7)
(/ (+ 5 4
      (- 2
	 (- 3
	    (+ 6
	       (/ 4 5)))))
   (* 3
      (- 6 2)
      (- 2 7)))

;; 3. Define a procedure that takes three numbers as arguments
;; and returns the sum of the squares of the two larger numbers.
(define (func1 x y z)
  (if (and (< x y) (< x z))
      (+ (* y y) (* z z))
      (if (and (< y x) (< y z))
	  (+ (* x x) (* z z))
	  (+ (* x x) (* y y)))))

;; 4. Observe that our model of evaluation allows for combinations
;; whose operators are compound expressions. Use this observation to
;; describe the behavior of the following procedure:
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
;; Answer: This procedure will return the addition of the two arguments,
;; but if the second argument is not a positive number then it will return the
;; addition of absolute value of second argument and first argument.

;; 5. Ben Bitdiddle has invented a test to determine whether the
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
;; infinitely recursive, then it will evaluates the test procedure (unreachable).
;; While with normal-order evaluation, it doesn't evaluate the second argument
;; that is p procedure, it will expand on the test procedure instead,
;; followed by evaluating if expression that returns 0.
