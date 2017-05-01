;;; ======================
;;; version 1
;;; ======================
(define nil '())
(define (square-tree t)
  (cond ((null? t) nil)
        ((not (pair? t)) (square t))
        (else (cons (square-tree (car t))
                    (square-tree (cdr t))
              )
        )
  )
)

(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))

;;; ======================
;;; version 2: using map
;;; ======================
(define (square-tree-map t)
  (map (lambda (x)
         (if (pair? x)
           (square-tree-map x)
           (square x)
         )
       )
  t
  )
)

(square-tree-map
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))
