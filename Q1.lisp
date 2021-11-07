(defun sub-list (list from &optional (to (list-length list)))
    (if(and (> from 0) (> to 0) (<= from to) (<= from (list-length list)) (<= to (list-length list)) ) ;if (from <= to && from <= length && to <= length)
    (if (= from 1)
        (if (>= to 1)(cons (car list) (sub-list (cdr list) 1 (- to 1) ))  ) ;if (from == 1) construct list with current head and get head of tail recursivly until index to or end.
            (sub-list (cdr list) (- from 1) (- to 1)) ;else recursion with tail of list with indicies - 1
        )
    )
)





