;;; ===========================
;;; a, iterative version
;;; ===========================

(define (cont-frac n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1) (/ (n i) (+ (d i) result)))
    )
  )
  (iter k 0)
)


;;; ===========================
;;; b, recursive version
;;; ===========================

(define (cont-frac n d k)
  (define (recursive-cont k1)
    (if (> k1 k)
        0
        (/ (n k1) (+ (d k1) (recursive-cont (+ k1 1))))
    )
  )
  (recursive-cont 1)
)

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           10
)
