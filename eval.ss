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

;(define (@list . args)
;  (cond
;    ((@empty? args) @eol)
;    (@else (@cons (@car args) (@apply @list (@cdr args))))))

(define @env-default
  (@list
    (@cons 'car @car)
    (@cons 'cdr @cdr)
    (@cons 'cons @cons)
    (@cons 'eq? @eq?)
    (@cons 'pair? @pair?)
    (@cons 'apply @apply)
    (@cons #t @t)
    (@cons #f @f)
    (@cons '() @eol)))

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

(define (@assoc-put assoc-list key value)
  (@cons (@cons key value) assoc-list))

; @eval -------

;'(define a b)
(define (@eval-mod env expr)
  (cond
    ((@mod? expr) (@mod env expr))
    (@else (@cons env (@eval env expr)))))

(define (@mod? expr)
  (cond
    ((@atom? expr) @f)
    ((@eq? 'define (@car expr)) @t)
    (@else @f)))

(define (@mod env expr)
  (@cons
    (@assoc-put env (@cadr expr) (@eval env (@caddr expr)))
    (@cadr expr)))

(define (@eval env expr)
  (cond
    ((@pair? expr)
       (@eval-pair env (@car expr) (@cdr expr)))
    (@else (@assoc-get env expr))))

(define (@eval-many env exprs)
  (cond
    ((@empty? exprs) @eol)
    (@else
      (@cons (@eval env (@car exprs))
             (@eval-many env (@cdr exprs))))))

(define (@eval-pair env head tail)
  (cond
    ((@eq? head 'quote) (@car tail))
    ; FIXME: convert (env) to be in env
    ((@eq? head 'env) env)
    ((@assoc-has? env head)
       (@apply (@assoc-get env head) (@eval-many env tail)))
    (@else (display "FAIL"))
    ))
