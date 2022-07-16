;; Exercise 1.11: A function f is deﬁned by the rule that
;; f(n) = n if n < 3; f(n - 1) + 2f(n - 2) + 3f(n - 3) if n >= 3
;; Write a procedure that computes f by means of a recursive
;; process. Write a procedure that computes f by means of an
;; iterative process.
;; Recursive:
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
	 (* 2 (f (- n 2)))
	 (* 3 (f (- n 3))))))
;; Iterative:
(define (f n)
  (define (f-iter cnt a b c)
    (if (= (+ cnt 2) n)
	c
	(f-iter (+ cnt 1)
	   (if (< cnt 2)
	       (+ cnt 1)
	       b)
	   (if (< cnt 1)
	       (+ cnt 2)
	       c)
	   (+ (* 3 a) (* 2 b) c))))
  (if (< n 3)
      n
      (f-iter 0 0 1 2)))
