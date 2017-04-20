(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))
  )
)

(define (div-interval x y)
  (if (= 0 (* (lower-bound y) (upper-bound y)))
      (error "division error 0)")
      (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y))))
  )
)

;;; ===============================
;;; 2.7
;;; ===============================
(define (display-interval i)
  (newline)
  (display "[")
  (display (lower-bound i))
  (display ",")
  (display (upper-bound i))
  (display "]")
)

(define (make-interval a b) (cons a b))

(define upper-bound cdr)
(define lower-bound car)

;;; ===============================
;;; 2.8
;;; ===============================
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))
  )
)

;;; test
(define i1 (make-interval 1 3))
(define i2 (make-interval 0 2))
(display-interval (sub-interval i1 i2))


;;; ===============================
;;; 2.12
;;; ===============================
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2)
)

(define (make-interval-center-percent c pct)
  (let ((width (* c (/ pct 100.0))))
    (make-interval (- c width) (+ c width))
  )
)
