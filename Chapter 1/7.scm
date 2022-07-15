;; Exercise 1.7: The good-enough? test used in computing
;; square roots will not be very eﬀective for ﬁnding the square
;; roots of very small numbers. Also, in real computers, arith-
;; metic operations are almost always performed with lim-
;; ited precision. This makes our test inadequate for very large
;; numbers. Explain these statements, with examples showing
;; how the test fails for small and large numbers. An alterna-
;; tive strategy for implementing good-enough? is to watch
;; how guess changes from one iteration to the next and to
;; stop when the change is a very small fraction of the guess.
;; Design a square-root procedure that uses this kind of end
;; test. Does this work better for small and large numbers?
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))

;; Examples of how the tests failed:
;; very large number 10^13
;; (sqrt 10000000000000)
;; infinite recursion

;; very small number 10^-19
;; (sqrt 0.0000000000000000001)
;; 0.03125

(define (better-sqrt-iter guess x)
  (if (better-good-enough? guess x)
      (improve guess x)
      (better-sqrt-iter (improve guess x) x)))

(define (better-good-enough? guess x)
  (< (abs (- (improve guess x) guess)) 0.001))

(define (better-sqrt x)
  (better-sqrt-iter 1.0 x))

;; very large number 10^13
(better-sqrt 10000000000000)
;; 3162277.6601683795

;; very small number 10^-19
(better-sqrt 0.0000000000000000001)
;; 9.76562500000034e-4
