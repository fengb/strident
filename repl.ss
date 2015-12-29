(load "eval.ss")

; (@eval @env '(expr)) -> (@env . val)

(define (@repl-process eval-pair)
  (display (@cdr eval-pair))
  (newline)
  (@repl (@car eval-pair)))

(define (@repl @env)
  (display "strident> ")
  (@repl-process (@eval-mod @env (read))))

(@repl @env-default)
