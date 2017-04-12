;;; ================================
;;; a, recursive
;;; ================================
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))
  )
)

(define (identity x) x)
(define (inc x) (+ x 1))

(define (sum term a next b)
  (accumulate + term a next b)
)
(define (product term a next b)
  (accumulate * 1 term a next b)
)

;;; ================================
;;; b, iterative
;;; ================================
(define (accumulate combiner null-value term a next b)
  (define (iter cur result)
    (if (> cur b)
        result
        (iter (next cur) (combiner (term cur) result))
    )
  )
  (iter a null-value)
)
