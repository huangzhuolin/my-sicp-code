;;; =========================
;;; iterative
;;; =========================
(define (tan-cf x k)
  (define (iter k1 result)
    (if (= 0 k1)
        result
        (iter (- k1 1)
              (/ (if (= k1 1) x (* x x)) (- (- (* k1 2) 1) result))
        )
    )
  )
  (iter k 0)
)

(tan-cf 1.0 5)
