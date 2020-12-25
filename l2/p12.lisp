;;12. Sa se construiasca lista nodurilor unui arbore de tipul (2) parcurs in
;;  preordine.

;; De exemplu arborele
;;   A
;;  / \
;; B   C
;;    / \
;;   D   E
;; se poate reprezenta astfel in cele doua moduri:
;; (A 2 B 0 C 2 D 0 E 0) (1)
;; (A (B) (C (D) (E))) (2)

(defun preordine (L)
    (cond
        ((null L) (list))
        ((listp(car L))(append (preordine (car L)) (preordine (cdr L))))
        (T ( cons (car L) (preordine (cdr L)) ))
    )
)

(defun preorder (L)
    (write L)
    (terpri)
    (cond
        ((null L)(list))
        (T
            (cons ( car L ) ( append (preorder (cadr L)) (preorder (caddr L)) ) )
        )
    )
)

(defun mappreorder(L)
    (write L)
    (terpri)
    (cond 
        ((numberp L) (list L))
        ((atom L) (list L))
        (T (mapcan #'mappreorder L ) )
    )
)

(defun negative(L)
    (cond
        ((null L) 0)
        ((and (numberp (car L)) (< 0 (car L))) (+ 1 (negative(cdr L))))
        (T (negative (cdr L)) )
    )
)