(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))
  )
)

(define (adjoin-set x set)
  (if (element-of-set? x set)
    set
    (cons x set)
  )
)

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
        ((element-of-set? (car set1) set2) (cons (car set1) (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))
  )
)

(define (union-set set1 set2)
  (define (join s result)
    (if (null? s) result (join (cdr s) (adjoin-set (car s) result)))
  )
  (join set2 set1)
)

;;; test
(union-set '(1 2 3) '(2 4))

;;; =========================
;;; 2.60
;;; =========================

;;; `element-of-set` and `intersection-set` are the same as previous one

(define adjoin-set cons)
(define union-set append)
