#lang racket

(provide sum-of-squares square-of-sum difference)

(define/contract (sum-of-squares n)
  (-> exact-positive-integer? exact-positive-integer?)

  "The sum of the squares of the first N natural numbers"

  (for/sum
      ([i
        (for/list ([i n]) (sqr (add1 i)))])
    i))

(define/contract (square-of-sum n)
  (-> exact-positive-integer? exact-positive-integer?)

  "The square of the sum of the first N natural numbers"

  (sqr (for/sum ([i n]) (add1 i))))

(define/contract (difference n)
  (-> exact-positive-integer? exact-positive-integer?)

  "The difference between the square of the sum and the sum of the squares of the first N natural numbers"

  (abs (- (square-of-sum n) (sum-of-squares n))))
