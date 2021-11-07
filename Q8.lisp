;;;Q8 (checks if BT is a BST)
(setq x '(8 (3 (1 () ()) (6 (4 () ())(7 () ()))) (10 () (14 (13 () ()) ())))) ; Should return T (true)
(setq y '(8 (9 (1 () ()) (6 (4 () ())(7 () ()))) (10 () (14 (13 () ()) ())))) ; Should return F (false)

(defun BST(lst)
    (and ;checks left and right side, and only if both are true it ret t
         (if (null(car(cdr lst))) t (if(and (<= (car(car(cdr lst)))(car lst)) (BST (car(cdr lst))) ) t));left
         (if (null (car(cdr(cdr lst)))) t (if(and (> (car(car(cdr(cdr lst))))(car lst)) (BST (cdr(cdr lst))) ) t));right
        ))

(print (BST y))
(print (BST x))