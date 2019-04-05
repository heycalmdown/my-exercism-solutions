#lang racket

(provide to-roman)

(define (to-roman n)
  (cond
    [(>= n 1000) (~a "M"  (to-roman (- n 1000)))]
    [(>= n  900) (~a "CM" (to-roman (- n  900)))]
    [(>= n  500) (~a "D"  (to-roman (- n  500)))]
    [(>= n  400) (~a "CD" (to-roman (- n  400)))]
    [(>= n  100) (~a "C"  (to-roman (- n  100)))]
    [(>= n   90) (~a "XC" (to-roman (- n   90)))]
    [(>= n   50) (~a "L"  (to-roman (- n   50)))]
    [(>= n   40) (~a "XL" (to-roman (- n   40)))]
    [(>= n   10) (~a "X"  (to-roman (- n   10)))]
    [(>= n    9) (~a "IX" (to-roman (- n    9)))]
    [(>= n    5) (~a "V"  (to-roman (- n    5)))]
    [(>= n    4) (~a "IV" (to-roman (- n    4)))]
    [(>= n    1) (~a "I"  (to-roman (- n    1)))]
    [else ""]))

;; (to-roman 10)
(to-roman 19)
