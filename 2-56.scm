(define (=number? exp num)
  (and (number? exp) (= exp num))
)

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
           (make-product (multiplier exp)
                         (deriv (multiplicand exp) var))
           (make-product (deriv (multiplier exp) var)
                         (multiplicand exp))))
        ((exponentiation? exp)
         (make-product
           (exponent exp) (make-exponentiation (base exp) (make-sum (exponent exp) '-1)))
           (deriv (base exp) var)
         )
        (else  (error "unknown expression type -- DERIV" exp))))

(define (exponentiation? exp)
  (and (pair? exp) (eq? (car exp) '**))
)

(define (base exp)
  (cadr exp)
)

(define (exponent exp)
  (caddr exp)
)

(define (make-exponentiation base n)
  (cond ((=number? base 1) 1)
        ((=number? n 0) 1)
        ((=number? n 1) base)
        (else (list '** base n))
  )
)

;;; =======================
;;; 2.57
;;; =======================
(define (augend s)
  (accumulate make-sum 0 (cddr s))
)
(define (multiplicand p)
  (accumulate make-product 1 (cddr p))
)
