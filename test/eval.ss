(load "test/support.ss")
(load "eval.ss")

(define (@eval-default expr)
  (@eval @env-default expr))

(assert '(eq? @t (@eval-default #t)))
(assert '(eq? @f (@eval-default #f)))

(assert '(eq? @eol (@eval-default '(quote ()))))
(assert '(eq? @t (@eval-default '(quote #t))))
(assert '(equal? '(#t) (@eval-default '(quote (#t)))))

(assert '(eq? @t (@eval-default '(car '(#t)))))
(assert '(eq? @eol (@eval-default '(cdr '(#t)))))

(assert '(equal? '(#t . #f) (@eval-default '(cons #t #f))))
