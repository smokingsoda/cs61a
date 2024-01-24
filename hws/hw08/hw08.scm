(define (rle s)
    (define (helper v cnt s)
      (cond
          ((null? s) (cons-stream (list v cnt) nil))
          ((equal? v (car s)) (helper v (+ cnt 1) (cdr-stream s)))
          (else (cons-stream (list v cnt) (helper (car s) 1 (cdr-stream s))))
      )
    )
    (if (null? s) nil (helper (car s) 1 (cdr-stream s)))
)


(define (group-by-nondecreasing s)
    (define (helper lst last s)
        (cond
            ((null? s) (cons-stream lst nil)) ;1
            ((> last (car s))
                (cons-stream lst (helper nil 0 s))) ;2
            (else
                (helper (append lst (list (car s))) (car s) (cdr-stream s)))
            )
        )
    (if (null? s) '()
                  (helper nil 0 s))
    )

(define finite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 3
                (cons-stream 1
                    (cons-stream 2
                        (cons-stream 2
                            (cons-stream 1 nil))))))))

(define infinite-test-stream
    (cons-stream 1
        (cons-stream 2
            (cons-stream 2
                infinite-test-stream))))

