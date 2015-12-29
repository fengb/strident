(load "support.ss")

(assert '(eq? @t (@eval #t)))
(assert '(eq? @f (@eval #f)))

(assert '(eq? @eol (@eval '(quote ()))))
(assert '(eq? @t (@eval '(quote #t))))
(assert '(equal? '(#t) (@eval '(quote (#t)))))

(assert '(eq? @t (@eval '(car '(#t)))))
(assert '(eq? @eol (@eval '(cdr '(#t)))))

(assert '(equal? '(#t . #f) (@eval '(cons #t #f))))
