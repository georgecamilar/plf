;; 4. Sa se construiasca o functie care intoarce suma atomilor numerici
;;    dintr-o lista, de la orice nivel.


(defun suma(current)
    (cond
        ((numberp current) current)
        ((atom current) 0)
        ((listp current)(apply #'+ (mapcar #'suma current)))
    )
)