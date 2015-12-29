(load "test/support.ss")
(load "core.ss")

(assert '(eq? @t #t))
(assert '(eq? @f #f))

(assert '(eq? @f (@not @t)))
(assert '(eq? @t (@not @f)))
(assert '(eq? @f (@not @eol)))

(assert '(eq? '() (@list)))
(assert '(equal? '(1 2 3) (@list 1 2 3)))
