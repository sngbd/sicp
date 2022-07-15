;; 3. Define a procedure that takes three numbers as arguments
;; and returns the sum of the squares of the two larger numbers.
(define (func1 x y z)
  (if (and (< x y) (< x z))
      (+ (* y y) (* z z))
      (if (and (< y x) (< y z))
	  (+ (* x x) (* z z))
	  (+ (* x x) (* y y)))))
