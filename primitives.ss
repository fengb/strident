(load "support.ss")

(assert '(eq? @t #t))
(assert '(eq? @f #f))

(assert '(eq? @f (@not @t)))
(assert '(eq? @t (@not @f)))
(assert '(eq? @f (@not @eol)))

(assert '(eq? '() (@map @car '())))
(assert '(equal? '(#f #t) (@map @car '((#f) (#t)))))

(assert '(eq? '() (@list)))
(assert '(equal? '(1 2 3) (@list 1 2 3)))
