
;;;This works partially, because it does not remove duplicates
;;to remove duplicates, i think we have to create another function that removes them,
;;and then we apply composition of functions on the L input to get the flattened, duplicate-free List.
(defun flatten (L)
    (cond 
         ((null L) nil)
         ((atom (car L)) (cons (car L) (flatten (cdr L))))
         (T (append (flatten (car L)) (flatten (cdr L))))
    )
)

 

(print (flatten '(1 b (3) (d (4 4)) h (w))))



