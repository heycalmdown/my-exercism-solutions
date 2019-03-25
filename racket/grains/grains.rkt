#lang racket

(provide square total)
(define (square offset) (expt 2 (sub1 offset)))
(define (total) (sub1 (expt 2 64)))
