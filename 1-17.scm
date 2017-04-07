(define (even? n)
  (= (remainder n 2) 0)
)
(define (double x) (+ x x))

;;; suppose x is even
(define (halve x) (/ x 2))

(define (fast-multi a b)
        (cond ((= b 0) 0)
              ((even? b) (fast-multi (double a) (halve b)))
              (else (+ a (fast-multi a (- b 1))))
        )
)

(fast-multi 7 8)
(fast-multi 8 7)
