;;; =========================
;;; Point definition
;;; =========================
(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")")
)

(define (make-point x y)
  (cons x y)
)

(define (x-point p)
  (car p)
)

(define (y-point p)
  (cdr p)
)

;;; test
(define p1 (make-point 1 2))
(print-point p1)

;;; =======================
;;; Segment definition
;;; =======================
(define (make-segment p1 p2)
  (cons p1 p2)
)

(define (start-segment s)
  (car s)
)

(define (end-segment s)
  (cdr s)
)

(define (midpoint-segment s)
  (define (average-point p1 p2)
    (make-point (/ (+ (car p1) (car p2)) 2)
                (/ (+ (cdr p1) (cdr p2)) 2)
    )
  )
  (average-point (start-segment s) (end-segment s))
)

;;; test
(define p1 (make-point 1 2))
(define p2 (make-point 3 4))
(define s1 (make-segment p1 p2))
(define mp (midpoint-segment s1))
(print-point mp)
