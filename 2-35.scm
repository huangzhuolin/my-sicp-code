;;; ====================
;;; count-leaves in 2.2.2
;;; ====================
(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))

(define nil '())
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (enumerate-tree tree)
   (cond ((null? tree) nil)
         ((not (pair? tree)) (list tree))
         (else (append (enumerate-tree (car tree))
                       (enumerate-tree (cdr tree))))))

(define (count-leaves t)
  (accumulate +
              0
              (map (lambda (x) 1) (enumerate-tree t)))
)

;;; Usage
(define tree (list 1 2 3 (list 4 5 (list 6 7))))
(count-leaves tree)  ;; => 7 
