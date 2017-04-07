(define (even? n)
  (= (remainder n 2) 0)
)

(define (square x) (* x x))

(define (fast-expt-iter b n a)
  (cond ((= n 0) a)
        ((even? n) (fast-expt-iter (square b) (/ n 2) a))
        (else (fast-expt-iter b (- n 1) (* a b)))
  )
)

(define (expt b n)
  (fast-expt-iter b n 1)
)

(expt 2 2)
(expt 2 3)
(expt 3 4)
