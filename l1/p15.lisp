;; a) Sa se scrie o functie care intoarce reuniunea a doua multimi.

(defun reuniune (K L)
  ( cond 
    ((null K) L)
    (t (cons (car K) (reuniune (cdr K) L)) )
  )
)

;;b) Sa se construiasca o functie care intoarce produsul atomilor numerici dintr-o lista, de la orice nivel.

(defun produsnr (L)
  ( cond
    ( (null L) 1)
    ( ( numberp (car L) ) ( * (car L) ( produsnr (cdr L) ) ))
    ( ( listp (car L) ) ( *  (produsnr (car L) ) (produsnr (cdr L))  ) )
    (t (produsnr (cdr L)) )
  )
)


;;c) Definiti o functie care sorteaza cu pastrarea dublurilor o lista liniara.


(defun sorteaza (L)
  (cond
    ((null L) nil)
    (t ( insertSorted (sorteaza (cdr L)) (car L) ) )
  )
)

(defun insertSorted (L el)
  (cond
    ( (null L) (list el))
    ( (< el (car L))  (cons el L))
    ( T (cons (car L) (insertSorted (cdr L) el) ))
  )
)

;;d) Definiti o functie care construiește o listă cu pozițiile elementului minim dintr-o listă liniară numerică.

(defun elementMinim(L minim)
  ( cond
      ( (null L) minim)
      ( ( < (car L) minim ) (elementMinim (cdr L) (car L) ) )
      (t (elementMinim (cdr L) minim))
  )
)

(defun build (L minim c)
  (cond
    ((null L) (list))
    (( = minim (car L)) ( cons c ( build (cdr L) minim (+ c 1) )) )
    (t ( build (cdr L) minim (+ c 1) ) )
  )
)

(defun buildList(L)
  ( build L (elementMinim (cdr L) (car L) ) 0)
)

;;(buildList '(1 1 1 1 1))