(define (fast-multi_iter a b prod)
  (define (even? n)
    (= (remainder n 2) 0)
  )
  (define (double x) (+ x x))

  ;;; suppose x is even
  (define (halve x) (/ x 2))

  (cond ((= 0 b) prod)
        ((even? b) (fast-multi_iter (double a) (halve b)  prod))
        (else (fast-multi_iter a (- b 1) (+ a prod)))
  )
)

(define (fast-multi a b)
  (fast-multi_iter a b 0)
)

(fast-multi 3 0)
(fast-multi 3 2)
(fast-multi 3 3)
