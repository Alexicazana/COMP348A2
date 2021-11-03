(defun sub-list(list a &optional (z NIL))


   (cond
        ;;if last index is not passed as an argument, consider it to be the length of the whole list
        ((null z)(sub-list list a (list-length list)))
        ;;if the list is null, return an empty list as the sublist
        ((null list)'())
        ;;return if first index a is greater than last index z, return an empty list
        ((> a z)'())
        ;;if a is smaller than 1 (so the index is out of bounds), return an empty list
        ((< a 1)'())
        ;;if z is greater than the list length, return empty list
        ((> z(list-length list))'())
        ;;if a index is greater than 1, call sub-list with the TAIL (cdr) of the list
        ((> a 1)(sub-list(cdr list)(- a 1)(- z 1)))
        ;;else construct a list with car of the list, resulting of call to 
        (t(cons(car list)(sub-list(cdr list)a(- z 1))))
        ))

(print (sub-list '(1 4 1 10 2 3) 2 5)) 











