(define (equal? a b)
  (cond ((and (not (pair? a)) (not (pair? b)))
         (eq? a b)
        )
        ((and (pair? a) (pair? b))
         (and (equal? (car a) (car b)) (equal? (cdr a) (cdr b)))
        )
        (else #f)
  )
)

;;; test
(equal? '(1 2 3 (4 5) 6) '(1 2 3 (4 5) 6))
(equal? '(1 2 3 (4 5) 6) '(1 2 3 (4 5 7) 6))
