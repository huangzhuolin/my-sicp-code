(define nil '())
(define (reverse list1)
  (if (null? (cdr list1))
      list1
      (append (reverse (cdr list1))
              (cons (car list1) nil))
  )
)

(define l1 (list 1 2 3 4))
(reverse l1)
