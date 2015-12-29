(load "core.ss")
(load "assoc.ss")

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
