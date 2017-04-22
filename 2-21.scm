(define nil '())

;;; ======================
;;; version 1
;;; ======================
(define (square-list items)
  (if (null? items)
    nil
    (cons (square (car items))
          (square-list (cdr items))
    )
  )
)

;;; ======================
;;; version 2
;;; ======================
(define (square-list items)
  (map square items)
)

(square-list (list 1 2 3 4))
