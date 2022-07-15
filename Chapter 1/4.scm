;; 4. Observe that our model of evaluation allows for combinations
;; whose operators are compound expressions. Use this observation to
;; describe the behavior of the following procedure:
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
;; Answer: This procedure will return the addition of the two arguments,
;; but if the second argument is not a positive number then it will return the
;; addition of absolute value of second argument and first argument.
