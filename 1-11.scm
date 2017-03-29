;;; recursive
(define (f n)
  (cond ((< n 3) n)
        (else (+ (f (- n 1) )
              (* 2 (f (- n 2)))
              (* 3 (f (- n 3)))
        ))
  )
)

;;; iterative
(define (f1 n)
  (define (iter count a b c)
    (if (= count 0)
        a
        (iter (- count 1) b c (+ (* 3 a) (* 2 b) c))
    )
  )
  (iter n 0 1 2)
)

(f 3)
(f 4)
(f 5)
(f1 3)
(f1 4)
(f1 5)
