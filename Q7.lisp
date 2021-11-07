
;;weight function to compute the total number of "weights" (elements) attached at each position of i (namely, ni)
(defun weight (lst) ;weight function takes a lst as an argument (lst can be a list or an atom)
    (if (null lst) 0 ;if lst is empty (has no elements, not even an atom, so is null), it returns 0 (since no weight is given to it)
        (if (listp lst) ;else if lst is a list (listp)
            (+ (weight (car lst)) (weight (cdr lst))) ;calls for weight of head of lst (1st element) and weight of tail of lst, and sums weight elements
            1
        )
    )
)


;;I will create another function, namely inner_cog (because it relates to the cog of each position, but not yet the whole cog of the whole entire list)
;inner_cog basically takes care of finding the cog of each position by multiplying the index we are at with the cog at that index
;this will obviously require recursion for two things: 1) traversing through each position recursively using (inner_cog (cdr lst)(+ idx 1)cg)
;                                                      2) recursively getting the weight of each element at the position we are currently evaluating
(defun inner_cog (lst idx cg)
    (if (null lst) 0.0 ;if list is empty (null) ret 0
        (if (listp (car lst)) ;else if list isn't empty
             (+ 
              (* (weight (car lst)) (- idx cg)) ;current term is the head of the list of position (1, 2, 3, 4 etc) we are looking at; ie: we start w the 1st index. We look at the weight of this index/position,
                ;aka the weight of the 1st element of this positions  * (the index we are at - the center of gravity) 
              (inner_cog (cdr lst) (+ idx 1) cg) ;this basically computes the weight of each element of the list of the current position we are at
             ) 
             (+ 
              (- idx cg) ;this represents the cog as a constant of the bar of positions
              (inner_cog (cdr lst) (+ idx 1) cg) ;then, we call recursively for the function to do this at each respective index/position of the bar (2, 3, 4...) by calling the tail of the list
             )
        )
    )
)


;;I will create another function that will basically just find the total number of nested and unested elements in the bar
;;This is important, because a position in the bar may have no nested elements, or may have a list of nested elements, in which case we will have to use recursion
(defun total_elements (lst)
    (if (null lst) 0 ;checks if the position has any elements (if not, it returns 0; we do not use it to find total number of elements)
        (if (listp (car lst)) ;if the position has a list attached to it, then
            (+ (weight (car lst)) (total_elements (cdr lst))) ;calls for the weight of the head first, and then recursively calls for weight of each subsequent element of the nested list
            (+ 1 (total_elements (cdr lst))) ;incremements for each call
        )
    )
)

;;Finally, function cog will take a list as its argument, and will compute the inner_cog of it before dividing that by the total number of elements
(defun cog (lst) 
    (/
        (inner_cog ;;calls inner_cog to be performed on lst
             lst
             1
             (/ (+ (length lst) 1) 2.0) ;finds the constant cog of the whole bar, which is the N+1/2 term
        )
         (total_elements lst) ;divides the inner_cog by the total number of elements
     )
)