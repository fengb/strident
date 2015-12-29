(load "eval.ss")

(define (@repl)
  (display "strident> ")
  (display (@eval (read)))
  (newline)
  (@repl))

(@repl)
