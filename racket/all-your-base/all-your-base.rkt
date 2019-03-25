#lang racket

(provide rebase)

(define (rebase list-digits in-base out-base)
  (if (or (< in-base 2) (< out-base 2)
          (ormap negative? list-digits)
          (ormap (curry <= in-base) list-digits))
      #f
      (to (from list-digits in-base) out-base)))

(define (zip l1 l2) (map list l1 l2))
(define (powers len) (reverse (range len)))
(define (_from in-base item)
  (* (first item) (expt in-base (second item))))

(define (from list-digits in-base)
  (let ([len (length list-digits)]
        [from-in-base ((curry _from) in-base)])
    (apply +
           (map from-in-base
                (zip list-digits (powers len))))))

(define (_to num out-base)
  (if (< num out-base) num
      (list (to (quotient num out-base) out-base)
            (remainder num out-base))))

(define (to num out-base)
  (flatten (_to num out-base)))

