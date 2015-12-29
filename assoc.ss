(load "core.ss")

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
