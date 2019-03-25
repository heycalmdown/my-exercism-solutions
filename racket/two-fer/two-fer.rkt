#lang racket

(provide two-fer)

(define/contract (two-fer [name "you"])
  (->* () (string?) string?)
  (~a "One for " name ", one for me."))

