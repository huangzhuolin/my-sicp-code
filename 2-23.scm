;;; =======================
;;; `cond` works here but `if` not
;;; use the trick that (cond (<p1> <e1> <e2> ...))
;;; to execute multi line block when condition match
;;; =======================
(define (for-each proc items)
  (cond ((not (null? items))
         (proc (car items))
         (for-each proc (cdr items))
        )
  )
)

(for-each (lambda (x) (newline) (display x)) (list 1 2 3))
