;;; ===============================
;;; a, iterative version
;;; ===============================
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))
    )
  )
  (iter a 1)
)

(define (inc x) (+ x 1))
(define (identity x) x)

(define (factorial n)
  (product identity 1 inc n)
)

(define (pi-term n)
  (if (even? n)
      (/ (+ n 2) (+ n 1))
      (/ (+ n 1) (+ n 2))
  )
)

(* (product pi-term 1 inc 10) 4)

;;; ===============================
;;; b, recursive version
;;; ===============================

(define (product1 term a next b)
  (if (> a b)
      1
      (* (term a) (product1 term (next a) next b))
  )
)
