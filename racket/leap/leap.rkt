#lang racket

(provide leap-year?)

(define/contract (leap-year? year)
  (-> exact-positive-integer? boolean?)

  "Given a year, report if it is a leap year."

  (define (evenly-div? divider) (zero? (remainder year divider)))
  (and (evenly-div? 4)
       (or (not (evenly-div? 100))
           (evenly-div? 400))))
