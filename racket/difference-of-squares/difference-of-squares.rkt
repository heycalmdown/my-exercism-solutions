#lang racket

(provide sum-of-squares square-of-sum difference)

(define/contract (first-n-natural-numbers n)
  (-> exact-positive-integer? (stream/c exact-positive-integer?))

  "The first N natural numbers"

  (in-range 1 (add1 n)))

(define/contract (sum-of l)
  (-> (stream/c exact-positive-integer?) exact-positive-integer?)

  "The sum of given list"

  (for/sum ([i l]) i))

(define/contract (squares-of seq-of-n)
  (-> (stream/c exact-positive-integer?) (stream/c exact-positive-integer?))

  "The squares of sequence of natural numbers"

  (for/list ([i seq-of-n]) (sqr i)))

(define/contract (sum-of-squares n)
  (-> exact-positive-integer? exact-positive-integer?)

  "The sum of the squares of the first N natural numbers"

  (sum-of (squares-of (first-n-natural-numbers n))))

(define/contract (square-of-sum n)
  (-> exact-positive-integer? exact-positive-integer?)

  "The square of the sum of the first N natural numbers"

  (sqr (sum-of (first-n-natural-numbers n))))

(define/contract (difference n)
  (-> exact-positive-integer? exact-positive-integer?)

  "The difference between the square of the sum and the sum of the squares of the first N natural numbers"

  (abs (- (square-of-sum n) (sum-of-squares n))))
