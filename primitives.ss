(load "support.ss")

(assert '(eq? @t #t))
(assert '(eq? @f #f))

(assert '(eq? @f (@not @t)))
(assert '(eq? @t (@not @f)))
(assert '(eq? @f (@not @eol)))
