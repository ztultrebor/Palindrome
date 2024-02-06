#lang racket

(require rackunit)

; =====================
; functions




(define (is-palindrome? letters start fin)
""" [ListOf Char] N N -> Boolean
    determines if a given list of letters is a palindrome"""
    (or
        (>= start fin)
        (and
            (equal? (at-index letters start) (at-index letters (sub1 fin)))
            (is-palindrome? letters (add1 start) (sub1 fin)))))      


(define (at-index lst n)
""" [ListOf X] N -> X
    retrieves the nth element of a list"""
    (match n
          [0 (first lst)]
          [_ (at-index (rest lst) (sub1 n))]))



; ======================
; testing


(check-equal? (at-index (string->list "i am ma i") 7) #\space)
(check-equal? (is-palindrome? (string->list "i am ma i") 0 9) #t)
(check-equal? (is-palindrome? (string->list "no i am ma i") 3 12) #t)
(check-equal? (is-palindrome? (string->list "no i am ma i") 0 12) #f)
(check-equal? (is-palindrome? (string->list "i") 0 1) #t)
(check-equal? (is-palindrome? (string->list "") 0 0) #t)
(check-equal? (longest-palindrome "i am ma i") "i am ma i")
(check-equal? (longest-palindrome "") "")
(check-equal? (longest-palindrome "stufs") "s")
(check-equal? (longest-palindrome "maybe a man a p lan a c a nal p a nam a, or something")
                 "a man a p lan a c a nal p a nam a")

; ========================
; action!
