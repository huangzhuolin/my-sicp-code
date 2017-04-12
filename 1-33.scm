;;; ================================
;;; a
;;; ================================
(define (filtered-accumulate predicate combiner null-value term a next b)
  (if (> a b)
      null-value
      (if (predicate a)
          (combiner
            (term a)
            (filtered-accumulate predicate combiner null-value term (next a) next b)
          )
          (filtered-accumulate predicate combiner null-value term (next a) next b)
      )
  )
)

(define (square x) (* x x))
(define (inc x) (+ x 1))

(define (sum-of-squares a b)
  (filtered-accumulate prime? + 0 square a inc b)
)

;;; ================================
;;; b
;;; ================================
(define (gcd m n)
  (cond ((< m n) (gcd n m))
        ((= n 0) m)
        (else (gcd n (remainder m n)))
  )
)
(define (relative-prime? m n)
  (= (gcd m n) 1)
)

(define (product-of-positive n)
  (define (filter x) (relative-prime? x n))
  (filtered-accumulate filter * 1 identity 1 inc n)
)
