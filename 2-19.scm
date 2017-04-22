(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define (no-more? coins)
  (null? coins)
)

(define (except-first-denomination coins)
  (cdr coins)
)

(define (first-denomination coins)
  (car coins)
)

;;; ========================
;;; simpler solution
;;; ========================
(define no-more? null?)
(define except-first-denomination cdr)
(define first-denomination car) 
