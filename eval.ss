; define
; cond
; quote

; eq?
; cons
; car
; cdr
; atom?
; apply

(define @eq? eq?)
(define @cons cons)
(define @car car)
(define @cdr cdr)
(define @atom? atom?)
(define @apply apply)

(define @eol '())

(define @t (@eq? @eol @eol))
(define @f (@eq? @eol @t))

(define (@not val)
  (cond
    (val @f)
    (@t @t)))
