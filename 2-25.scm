(define items-1 (list 1 3 (list 5 7) 9))
(car (cdr (car (cdr (cdr items-1)))))

(define items-2 (list (list 7)))
(car (car items-2))

(define items-3 (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr items-3))))))))))))
