(define (split op1 op2)
  (define (recursive-split painter n)
    (if (= n 0)
      painter
      (let ((smaller (recursive-split painter (- n 1))))
        (op1 painter (op2 smaller smaller))
      )
    )
  )
  recursive-split
)

(define right-split (split beside below))
(define up-split (split below beside))
