; define
; cond
; quote

; eq?
; cons
; car
; cdr
; atom? // pair?
; apply

(define @eq? eq?)
(define @cons cons)
(define @car car)
(define @cdr cdr)
(define @pair? pair?)
(define @apply apply)

(define @eol '())

(define @t (@eq? @eol @eol))
(define @f (@eq? @eol @t))

(define (@not val)
  (cond
    (val @f)
    (@t @t)))

(define (@eval-pair head tail)
  (cond
    ((@eq? head 'quote) (@car tail))
    ((@eq? head 'car) (@car (@eval (@car tail))))
    ((@eq? head 'cdr) (@cdr (@eval (@car tail))))
    ;((@eq? head 'cons) (@cons (@eval (@car tail))))
    (@t (display "FAIL"))
    ))

(define (@eval expr)
  (cond
    ((@pair? expr) (@eval-pair (@car expr) (@cdr expr)))
    (@t expr)))
