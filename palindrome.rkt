#lang racket

(require rackunit)

; =====================
; functions


(define (longest-palindrome text)
""" String -> ???
    returns the longest palindrome in a given piece of text"""
    (local ((define sploder (string->list text))
            (define d (length sploder))
            (define (recursor lets st l)
                (cond
                    [(> (+ st l) (length lets)) #f]
                    [(is-palindrome? lets st (+ st l)) `(,st ,(+ st l))]
                    [else (recursor lets (add1 st) l)])))
    ; - IN -
    (match (ormap (lambda (l) 
                (ormap (lambda (a) (recursor sploder a l)) 
                    (build-list d identity)))
                (build-list d (lambda (x) (- d x))))
        [#f '(0 0)]
        [r r])))


(define (is-palindrome? letters start fin)
""" [ListOf Char] N N -> Boolean
    determines if a given list of letters has a palindrome from start to fin"""
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
(check-equal? (longest-palindrome "i am ma i") '(0 9))
(check-equal? (longest-palindrome "") '(0 0))
(check-equal? (longest-palindrome "stufs") '(0 1))
(check-equal? (longest-palindrome "maybe a man a p lan a c a nal p a nam a, or something") '(6 39))


; ========================
; action!
