(define nil '())
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
    nil
    (cons (accumulate op init (map car seqs))
          (accumulate-n op init (map cdr seqs))
    )
  )
)

(define (dot-product v w)
  (accumulate + 0 (map * v w))
)

(define (matrix-*-vector m v)
  (map (lambda (vi) (accumulate + 0 (map * vi v))) m)
)
;;; =====================
;;; use dot-product
;;; =====================
(define (matrix-*-vector m v)
  (map (lambda (vi) (dot-product vi v)) m)
)

(define (transpose mat)
  (accumulate-n
     cons
     nil
     mat
  )
)

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map
      (lambda (x) (map (lambda (col) (dot-product x col)) cols))
      m
    )
  )
)

;;; =====================
;;; better solution using matrix-*-vector
;;; =====================
(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map
      (lambda (x) (matrix-*-vector cols x))
      m
    )
  )
)

;;; =====================
;;; test
;;; =====================
(dot-product (list 1 2 3) (list 4 5 6))
(matrix-*-vector (list (list 1 2 3) (list 4 5 6)) (list 1 2 3))

(define matrix (list (list 1 2 3 4) (list 5 6 7 8) (list 9 10 11 12)))
(define matrix1 (list (list 1 2) (list 3 4) (list 5 6) (list 7 8)))
(transpose matrix)
(matrix-*-matrix matrix matrix1)
