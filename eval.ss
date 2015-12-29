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
    (@t @t)))

(define (@empty? val)
  (@eq? @eol val))

(define (@map func list)
  (cond
    ((@empty? list) '())
    (@else (@cons (func (car list)) (@map func (cdr list))))))

(define (@list . args) args)

;(define (@list . args)
;  (cond
;    ((@empty? args) @eol)
;    (@else (@cons (@car args) (@apply @list (@cdr args))))))

(define @env
  (@list
    (@cons 'car @car)
    (@cons 'cdr @cdr)
    (@cons 'cons @cons)))

(define (@caar list)
  (@car (@car list)))

(define (@cdar list)
  (@cdr (@car list)))

(define (@assoc-has? assoc-list key)
  (cond
    ((@empty? assoc-list) @f)
    ((@eq? key (@caar assoc-list)) @t)
    (@else (@assoc-has? (@cdr assoc-list) key))))

(define (@assoc-get assoc-list key)
  (cond
    ((@empty? assoc-list) @f)
    ((@eq? key (@caar assoc-list)) (@cdar assoc-list))
    (@else (@assoc-get (@cdr assoc-list) key))))

(define (@eval expr)
  (cond
    ((@pair? expr) (@eval-pair (@car expr) (@cdr expr)))
    (@else expr)))

(define (@eval-pair head tail)
  (cond
    ((@eq? head 'quote) (@car tail))
    ((@assoc-has? @env head)
       (@apply (@assoc-get @env head) (@map @eval tail)))
    (@else (display "FAIL"))
    ))
