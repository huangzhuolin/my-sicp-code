(define nil '())
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(define (enumerate-interval low high)
  (if (> low high)
    nil
    (cons low (enumerate-interval (+ low 1) high))
  )
)

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define empty-board nil)
(define (safe? k positions)
  (define (recursive-safe? k new-row rest-positions)
    (cond ((null? rest-positions) #t)
          ((or (= new-row (car (cdr (car rest-positions))))
               (= (abs (- k (car (car rest-positions))))
                  (abs (- new-row (car (cdr (car rest-positions))))))
           )
            #f
          )
          (else (recursive-safe? k new-row (cdr rest-positions)))
    )
  )
  (recursive-safe? k (car (cdr (car positions))) (cdr positions))
)

(define (adjoin-position new-row k rest-of-queens)
  (cons (list k new-row) rest-of-queens)
)

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
          (lambda (positions) (safe? k positions))
          (flatmap
            (lambda (rest-of-queens)
              (map (lambda (new-row) (adjoin-position new-row k rest-of-queens))
                   (enumerate-interval 1 board-size))
            )
            (queen-cols (- k 1))
          )
        )
    )
  )
  (queen-cols board-size)
)

;;; ===================
;;; test
;;; ===================
(queens 0)
(queens 5)
