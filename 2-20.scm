(define (same-parity . list1)
  (define (iter items result)
    (if (null? items)
      result
      (if (= 0 (remainder (+ (car items) (car list1)) 2))
        (iter (cdr items) (append result (list (car items))))
        (iter (cdr items) result)
      )
    )
  )
  (iter list1 '())
)

(same-parity 1 2 3 4 5 6)
