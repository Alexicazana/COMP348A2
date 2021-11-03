
;;;Q2 (works, but a little weird)
(defun sub-list2(list a &optional (z NIL))

    (cond
         ;;if last index is not passed as an argument, consider it to be the length of the whole list
        ((null z)(sub-list2 list a (list-length list)))
        ;;if the list is null, return an empty list as the sublist
        ((null list)'())
        ;;return if first index a is greater than last index z, return an empty list
        ((> a z)'())
       
        ;;if a index is greater than 1, call sub-list with the TAIL (cdr) of the list
        ((> a 1)(sub-list2(cdr list)(- a 1)(- z 1)))
        
         ;;if a is smaller than 1 (so the index is out of bounds), initilize a to be 1 temporarily
        ((< a 1)(cons(car list)(sub-list2(cdr list)1(- z 1))))
        
        ;;else construct a list with car of the list, resulting of call to 
        (t(cons(car list)(sub-list2(cdr list)a(- z 1))))
       


        )


    )

(print (sub-list2 '(1 4 7 10 2 3) 1 4)) 