(define (make-mobile left right)
  (list left right)
)

(define (make-branch length structure)
  (list length structure)
)

;;; ========================
;;; a
;;; ========================
(define (left-branch m)
  (car m)
)
(define (right-branch m)
  (car (cdr m))
)

(define (branch-length b)
  (car b)
)

(define (branch-structure b)
  (car (cdr b))
)

(define (is-mobile? m)
  (pair? m)
)

;;; test
(left-branch (make-mobile 2 3))
(right-branch (make-mobile 2 3))
(branch-length (make-branch 4 5))
(branch-structure (make-branch 4 5))

;;; ========================
;;; b
;;; ========================
(define (weight-of-branch b)
  (if (is-mobile? (branch-structure b))
    (total-weight (branch-structure b))
    (branch-structure b)
  )
)
(define (total-weight m)
  (+ (weight-of-branch (left-branch m))
     (weight-of-branch (right-branch m))
  )
)

;;; test
(define level-1-mobile (make-mobile (make-branch 2 1)
                                     (make-branch 1 2)))
(define level-2-mobile (make-mobile (make-branch 3 level-1-mobile)
                                     (make-branch 9 1)))
(define level-3-mobile (make-mobile (make-branch 4 level-2-mobile)
                                     (make-branch 8 2)))

 (total-weight level-1-mobile)
 (total-weight level-2-mobile)
 (total-weight level-3-mobile)

;;; ========================
;;; c
;;; ========================
(define (branch-balanced? b)
  (let ((s (branch-structure b)))
    (if (is-mobile? s)
      (mobile-balanced? s)
      true
    )
  )
)
;;; test
(branch-balanced? (make-branch 1 2))

(define (branch-torque b)
  (* (weight-of-branch b)
     (branch-length b)
  )
)

(define (mobile-balanced? m)
  (let ((left (left-branch m))
        (right (right-branch m)))
    (and (= (branch-torque left)
            (branch-torque right))
         (branch-balanced? left)
         (branch-balanced? right)
    )
  )
)

(mobile-balanced? level-1-mobile)
(mobile-balanced? level-2-mobile)
(mobile-balanced? level-3-mobile)
(mobile-balanced? (make-mobile (make-branch 10 1000)
                        (make-branch 1 level-3-mobile)))

;;; ========================
;;; d
;;; ========================
