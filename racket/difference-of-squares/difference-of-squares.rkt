#lang racket

(provide sum-of-squares square-of-sum difference)

(define/contract (first-n-natural-numbers n)
  (-> exact-positive-integer? (listof exact-positive-integer?))

  "The first N natural numbers"

  (range 1 (add1 n)))

(define/contract (square-of n)
  (-> exact-positive-integer? exact-positive-integer?)

  "The square of N"

  (expt n 2))

(define/contract (sum-of l)
  (-> (listof exact-positive-integer?) exact-positive-integer?)

  "The sum of given list"

  (apply + l))

(define/contract (sum-of-squares n)
  (-> exact-positive-integer? exact-positive-integer?)

  "The sum of the squares of the first N natural numbers"

  (sum-of (map square-of (first-n-natural-numbers n))))

(define/contract (square-of-sum n)
  (-> exact-positive-integer? exact-positive-integer?)

  "The square of the sum of the first N natural numbers"

  (square-of (sum-of (first-n-natural-numbers n))))

(define/contract (difference n)
  (-> exact-positive-integer? exact-positive-integer?)

  "The difference between the square of the sum and the sum of the squares of the first N natural numbers"

  (- (square-of-sum n) (sum-of-squares n)))
