;;8. Sa se construiasca o functie care intoarce maximul atomilor numerici
;;   dintr-o lista, de la orice nivel.

(defun toOneLevel(element)
    (cond 
        ((listp element) (mapcan #'toOneLevel element))
        ((numberp element)(list element))
        (T (list))
    )
)

(defun maxFromList(lista max)
    (cond
        ((null lista) max)
        ( (> (car lista) max) (maxFromList (cdr lista) (car lista)))
        (T (maxFromList (cdr lista) max))
    )
)

(defun mapsolve(lista)
    (setq param (toOneLevel lista) )
    (write param) 
    (maxFromList (cdr (toOneLevel lista)) (car (toOneLevel lista) ))
)
