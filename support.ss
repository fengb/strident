(load "eval.ss")

(define (display-all . args)
  (for-each display args))

(define (escape expr)
  (list expr
        (if (procedure? (eval expr))
            "<proc>"
            (eval expr))))

(define (assert exprs)
  (if (eval exprs)
      #t
      (display-all
        exprs
        " expected to be true "
        (map escape exprs)
        "\n")))
