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
(define @else @t)

(define (@not val)
  (cond
    (val @f)
    (@else @t)))

(define (@atom? val)
  (@not (@pair? val)))

(define (@empty? val)
  (@eq? @eol val))

(define (@list . args) args)

(define (@caar list)
  (@car (@car list)))

(define (@cdar list)
  (@cdr (@car list)))

(define (@cadr list)
  (@car (@cdr list)))

(define (@cddr list)
  (@cdr (@cdr list)))

(define (@caddr list)
  (@car (@cddr list)))
