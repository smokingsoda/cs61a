(define (cddr s) (cdr (cdr s)))

(define (cadr s) 
    (car (cdr s)))

(define (caddr s) 
    (car (cdr (cdr s))))

(define (sign num)
  (cond ((< num 0) -1)
        ((> num 0) 1)
        ((= num 0) 0)))

(define (square x) (* x x))

(define (pow x y) 
    (cond
        ((= 0 y) 1)
        ((= 0 (remainder y 2)) (square(pow x (/ y 2))))
        (else (* x (square(pow x (/ (- y 1) 2)))))))

(define (unique s) 
    'YOUR-CODE-HERE
    (if (null? s) nil
        (cons (car s) (unique (filter (lambda (x) (not (eq? x (car s)))) (cdr s)))))
)

(define (replicate x n)
  (define (replicate-iter s n)
    (if (= n 0)
        s
        (replicate-iter (append s (list x)) (- n 1))))
  (replicate-iter '() n))



(define (accumulate combiner start n term)
    (if (= n 0)
        start
    (combiner (term n) (accumulate combiner start (- n 1) term))
))

(define (accumulate-tail combiner start n term)
  (define (accumulate_iter result n)
      (if (= n 0)
          result
          (accumulate_iter (combiner result (term n)) (- n 1))))
      (accumulate_iter start n))

(define-macro
 (list-of map-expr for var in lst if filter-expr)
 (list 'map 
       (list 'lambda
             (list var)
             map-expr)
         (list 'filter
               (list 'lambda
                   (list var)
                   filter-expr)
               lst)
 )
)

(define-macro
    (twice f)
    '(begin f f))

(define-macro
    (twice f)
    (list 'begin f f))