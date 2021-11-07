;We must get rid of reverse (I think)
;;;NOT DONE YET; NEED REVERSE
(defun sub-list3 (list from &optional (to (list-length list)))
    (if (>= from to) 
        (if (or (> to (list-length list) ) (= to 0) )
            (if(and (< from (list-length list)) (> from 0) ) 
                (sub-list3 list 1 from)
                (reverse (sub-list list 1 (list-length list)))
            )
            
            (if(and (<= from (list-length list)) (> from 0))
                (reverse (sub-list list to from))
                (reverse (sub-list list to))
            )    
        )
        (sub-list2 list from to)
    )
)




(print (sub-list '(1 2 3 4 5 6 7 8) 2))

(print  (sub-list '(1 4 10) 2 3) )
(print  (sub-list '(1 4 10) 2) )
(print  (sub-list '(1 7 12) 1 4) )
(print  (sub-list '(1 7 12) 0 1) )
(print  (sub-list '(1 6 12) 4 2) )
(print  (sub-list '(1 6 12)) )