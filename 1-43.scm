(define (repeated foo n)
  (lambda (x)
    (define (iter k result)
      (if (= k 0)
          result
          (iter (- k 1) (foo result))
      )
    )
    (iter n x)
  )
)

((repeated square 2) 5)
